Mover = Class.create();
/************************************
模块控制操作的定义
*************************************/
Mover.prototype = {	
	initialize : function (layout,isReSize) {
	//初始化成员
		var mover = this;
	    /**
		 * 页面布局对象，每个页面布局在加载时会创建一个新的页面布局对象，通过该对象记录布局单元信息和栏目信息
		**/	
		mover.layout = layout;//parent.layout;
		
		/**
		 * iFunc为正处理在移动过程，即duringMove正在处理
		 * eFunc 为正在处理移动数据，即endMove正在处理
		 **/
		mover.iFunc = mover.eFunc = null;
		
		/**
		 * 下在移动开关，整个布局中只有能一个对象在移，
		 * 在选择的对象移动未结束之前，其他移动事件被屏蔽
		 **/
		mover.isMoving = false;
		mover.isMoved = false;
		mover.maxHeight=0;
		
		/**记录栏目的开始位置**/
		mover.position = null;
		
		/** 移动阴影HTML对象 **/
		mover.positionShadow = document.createElement("div");
		mover.positionShadow.id="__portalPositionShadowId";
		mover.positionShadow.style.cssText="width:100%;height:30px;border:3px dotted red;margin:5px;";
		
		/** 移动阴影HTML对象，是否已经插入到布局的标识 **/
		mover.isInsertShadow = false;
		
		/** 
		 * 移动阴影HTML对象，插入到布局中的对象，目前有三种：
		 * A）_unit类型，鼠标所在布局单元中没有栏目对象时为该类型，阴影直接加入到该布局单元中
		 * B）_up类型，鼠标在某一栏目的上半部分时为该类型，阴影插入到该栏目对象的前面
		 * C）_down类型，鼠标在某一栏目的下半部分时，为该类型，阴影插入到该栏目对象的后面
		 * 移动阴影根据鼠标与栏目或布局单元中的位置关系来决定当前状态，并根据前一状态来添加或删除移动阴影
		 **/
		mover.currentShadowStatus = null;
				
		/** 移动时，鼠标的X坐标 **/
		mover.mouseX = null;
		
		/** 移动时，鼠标的Y坐标 **/
		mover.mouseY = null;
		
		/** 移动成功标识，暂未使用 **/
		mover.isSuccess = true;
		
		/**
		 * 拖动栏目新加入的位置
		 * 
		 */
		mover.PLACE={UP:0,ADD:1,DOWN:2};
		
		/** 
		 * 移动对象
		 * onMover：正在移动的对象；其中：
		 * A）onMoveObject为正在移动的栏目对象；
		 * B）status为当前移动状态，有向上(up)、向下(down)、原位(me)、新增(new)四种状态，通过布局容器和栏目位置与鼠标位置之间的关系来决定其中一种状态；该状态主要用来控制layout中栏目数据的变化。
		 * C）moveInObject 栏目移动入的布局单元对象，该对象可能是布局单元容器，也可能是其他栏目对象。
		 * D）place为栏目HTML对象插入到布局单元HTML对象中的位置，相对于moveInObject之前或向上（place=0）、之后或向下（place=2）、新加入或插入（place=1），通过布局容器和栏目位置与鼠标位置之间的关系来决定其中一种位置关系，该状态主要用来控制页面上HTML元素的变化。
		 * E）isSuccess,移动成功标识，暂未使用。
		 * portlet 当前正在移动的栏目的数据对象
		 * left 当前正在移动栏目相对页面的左边距
		 * top 当前正在移动栏目相对页面的上边距
		 **/
		mover.object = { 
						onMover : { onMoveObject : null, status : "",moveInObject:null, place:0 ,isSuccess:true}, 
						portlet : null, 
						left : 0, 
						top : 0 
					};
		
		mover.movingPortlet = null;
		mover.movingPortletPosition = {left : 0, top : 0 };
		//mover.movingPortletStatus = "";
		mover.movingPortletCssText = "";
		
		/** 
		 * 移动对象容器
		 * colnePortletElement：正在移动的栏目的HTML对象的复制克隆对象
		 * placeHolderElement 占位元素，主要作用是在拖动过程即进行插入位置的占位，等处理完成之后最后才将拖动栏目的元素代码占位元素
		 **/
		mover.colnePortletElement = null;
		mover.placeHolderElement = document.createElement("div");
		mover.placeHolderElement.innerHTML = " ";
		mover.isReSize = isReSize==undefined||isReSize!=false?true:false;
		//confirm("initialize mover.isReSize="+mover.isReSize+"      ,isReSize="+isReSize);
		
	
	},
	
	/** 
	 * 重新定位鼠标位置或获取鼠标位置
	 * @param ev 窗口鼠标事件对象，可空
	 * 
	 * @return 返回(x,y)坐标表示的鼠标位置
	 **/
	reMouse : function (ev) {
		ev= ev || window.event; 
		ev= ev || Object.reEvent();
		if(ev.pageX || ev.pageY){ 
			return {x:ev.pageX, y:ev.pageY}; 
		} 
		
		return { 
			x:ev.clientX + document.body.scrollLeft - document.body.clientLeft, 
			y:ev.clientY + document.body.scrollTop - document.body.clientTop 
		};
		
	 },
	
	/** 
	 * 获取元素绝对位置
	 * @param object 元素对象，不可空
	 * 
	 * @return 返回(x,y)坐标表示的元素绝对位置
	 **/
	rePosition : function (object) {
		if(object==null)return { x : 0, y : 0 };
		var $x = $y = 0;
		try{
			do {
				$x += object.offsetLeft;
				$y += object.offsetTop;
			} while ((object = object.offsetParent)); // && o.tagName != "BODY"
	
		}
		catch (e) {
			alert(e.name + ": " + e.message+",object="+object);
		}
		return { x : $x, y : $y };
	},
	

	/**
	 *  栏目拖动的入口方法，该方法记录栏目的开始状态，同时所有需要拖动的栏目需要在拖动位置嵌套该方法，嵌套事件建议为onmousedown事件。
	 * @param portletId，拖动栏目HTML对象的ID
	 * @return 无
	 **/
	startMove : function (portletId) {
		
		var mover = this;
		//判断是否有拖动，有则返回，因整个布局内容，默认只允许有一个栏目在拖动
		if(mover.isMoving==true){
			return;
		}else{
			mover.isMoving=true;
		}
		//当拖动开始时设置参数	
		
		//从性能考虑，此处可以只初始化一次。
		mover.layout.initElement();	
		
		var movingPortlet = mover.layout.findPortlet(portletId);
		
		if(movingPortlet==null){
			mover.isMoving= false;
			return;
		}
		
		if (movingPortlet.isMove=="0"|| mover.iFunc!=null || mover.eFunc!=null){
			mover.isMoving= false;		
		 	return;
		 }
		
		var mouse = mover.reMouse(), obj = mover.object;
		if(movingPortlet.element==null){
			movingPortlet.element=document.getElementById(portletId);
		}
		var  movingPortletElement = movingPortlet.element,elementPosition = mover.rePosition(movingPortletElement);
		
		mover.position = elementPosition;		
		mover.movingPortlet =  movingPortlet;
		mover.movingPortletPosition.left =  mouse.x - elementPosition.x;
		mover.movingPortletPosition.top =  mouse.y - elementPosition.y;
		mover.movingPortletCssText = movingPortletElement.style.cssText;
	
		mover.colnePortletElement = movingPortletElement.cloneNode(true); //复制预拖拽对象	
		document.body.appendChild(mover.colnePortletElement);
		mover.colnePortletElement.style.width = movingPortletElement.clientWidth + "px";
		mover.colnePortletElement.style.height =movingPortletElement.clientHeight+"px";
		with (mover.colnePortletElement.style) {
		//设置复制对象
			position = "absolute";
			left = mouse.x - mover.movingPortletPosition.left + "px";
			top = mouse.y - mover.movingPortletPosition.top + "px";
			zIndex = 100;
			opacity = "0.3";
			filter = "alpha(opacity:30)";
		}
		
		with (mover.placeHolderElement.style) {
		//设置站位对象
			height = movingPortletElement.clientHeight + "px";
			width = movingPortletElement.clientWidth + "px";
		}		

		//将旧对象置为空的（占位）对象，以便在移动位置不能确定（移到区域外去时），栏目可通过占位对象归位（复原）
		movingPortletElement.parentNode.replaceChild(mover.placeHolderElement, movingPortletElement);
		
		//对象事件与方法绑定
		mover.iFunc = Object.addEvent(document, ["onmousemove"], mover.duringMove.bind(mover));
		mover.eFunc = Object.addEvent(document, ["onmouseup"], mover.endMove.bind(mover));
		document.onselectstart = new Function("return false");
		//document.onclick = new Function("return false");
	},
	
	/**
	 * 在移动过程中，修改克隆栏目位置及记录鼠标位置，来显示拖动的效果
	 * @return 无	 
	 **/
	duringMove : function () {
	//当鼠标移动时设置参数
		var mover = this, mouse = mover.reMouse(),colnePortletElement = mover.colnePortletElement;		
		
		var pleft= mouse.x- mover.movingPortletPosition.left;
		var ptop = mouse.y - mover.movingPortletPosition.top;
		
		 pleft = ";left:"+pleft+"px;";
		 ptop = ";top:"+ptop+"px;";
	
		try{
		    //修改拖动栏目HTML元素的位置
			//colnePortletElement.style.cssText = pleft+ptop;
			colnePortletElement.style.cssText = colnePortletElement.style.cssText+pleft+ptop;
		}
		catch (e) {
			alert(e.name + ": " + e.message+",colnePortletElement.style.cssText:"+colnePortletElement.style.cssText);
		}
		
		//记录移动过程中的鼠标位置
		mover.mouseX =mouse.x;
		mover.mouseY =mouse.y;	
		mover.isMoved = true;
	},
	
	/**
	 * 拖曳结束之后，根据元素位置来修改页面元素的关联和位置关系
	 * @param targetUnit 拖曳栏目的目标单元
	 * @param movingPortlet 正在拖曳的栏目
	 * @param relativePortlet 正在拖曳栏目将放置位置的参考相对栏目
	 * @param place 栏目在目标单元中的位置，0）相对于参考栏目向上插入；1）目标单元中的栏目数为0，拖曳栏目新加入目标单元中；2）相对于参考栏目向下插入
	 * @param status
	 * @return
	 */
	execMove : function (targetUnit,movingPortlet,relativePortlet, place) {
		var mover = this,  px;		
		//处理拖拽过程细节
		
		if(targetUnit.element==null||targetUnit.element==null){
			targetUnit.element =  document.getElementById(targetUnit.unitId);
		}
		if(targetUnit.element==undefined||targetUnit.element==null){
			return;
		}
		
		if(movingPortlet.element==undefined||movingPortlet.element==null){
			movingPortlet.element =  document.getElementById(movingPortlet.portletId);
		}
		
		if(movingPortlet.element==undefined||movingPortlet.element==null){
			return;
		}		
		
		mover.movingPortlet = movingPortlet;
		
		var portletNewIndex=0;
		if(place == mover.PLACE.UP){			
			//向上 ，相对于relativePortlet是向上插入，即拖曳栏目应该放在relativePortlet栏目之前
			portletNewIndex = relativePortlet.portletIndex;
			px = relativePortlet.element.clientWidth;
			targetUnit.element.insertBefore(mover.placeHolderElement, relativePortlet.element);
		} 
		if(place == mover.PLACE.ADD){			//新加入	所在单元，当前单元中栏目为空时
			portletNewIndex = targetUnit.portletList.length;
			px = targetUnit.element.clientWidth;
			targetUnit.element.appendChild(mover.placeHolderElement);
		} 
		
		if(place == mover.PLACE.DOWN){//if (place == 2)新增加判断			
			//由于HTML元素没有insertAfter方法，因此，此处有两种情况：1）参考的栏目relativePortlet是最后一个栏目时，只需要加入即可；；2）relativePortlet是最后一个栏目时，则相对于后下人栏目插入
			portletNewIndex = relativePortlet.portletIndex+1;
			px = relativePortlet.element.clientWidth;
			
			if(relativePortlet.element.nextSibling){				
				targetUnit.element.insertBefore(mover.placeHolderElement, relativePortlet.element.nextSibling);
			}else{
				targetUnit.element.appendChild(mover.placeHolderElement);
			}
		}
		
		//处理拖拽换行后宽度变化，鼠标距离拖拽物的距离的误差.		
		mover.movingPortletPosition.left = Math.ceil(px / mover.placeHolderElement.offsetWidth * mover.movingPortletPosition.left); 
		//处理换列后对象宽度变化
		mover.colnePortletElement.style.width = mover.placeHolderElement.style.width = px + "px"; 
		
	
		var sourceUnit = movingPortlet.parent;
		sourceUnit.deletePortlet(movingPortlet.portletIndex);
		targetUnit.insertPortlet(portletNewIndex, movingPortlet);//tempPlt==movingPortlet
	
		
		//保存变更后的对应关系数据
		//saveUnitPortletChanged(mover.layout.portalId,mover.layout.pageId,mover.layout.layoutId,mover.layout.layoutTmpl,mover.layout.getPersistentData());
		mover.layout.saveColumn();
		//mover.reSize();
	},
	
	cleanMove : function (){
		var mover = this;
		if(mover.isMoving==false){
			return;
		}
		if(mover.colnePortletElement&&mover.colnePortletElement.parentNode){
				mover.colnePortletElement.parentNode.removeChild(mover.colnePortletElement);
		}
		/*真正进行栏目移动，即用拖动的栏目去替换页面上的占位符元素，这里可以考虑一下，占位符是否必要?*/
		var portletElement = mover.movingPortlet.element;
		if(portletElement==null){
			portletElement = document.getElementById(mover.movingPortlet.portletId);
		}
		if(portletElement&& mover.placeHolderElement&&mover.placeHolderElement.parentNode){
			var left = portletElement.style.left;
			var top = portletElement.style.top;
			var width = portletElement.style.width;
			var height = portletElement.style.height;
			portletElement.style.cssText=mover.movingPortletCssText;
			portletElement.style.left = left;
			portletElement.style.top = top;
			portletElement.style.width = width;
			portletElement.style.height = height;
			
			mover.placeHolderElement.parentNode.replaceChild(portletElement, mover.placeHolderElement);
		}
		
		if(mover.isInsertShadow==true){
			mover.positionShadow.parentNode.removeChild(mover.positionShadow);
			mover.isInsertShadow=false;
		}	
		
		//修改移动标识及调整页面窗口高度；
		mover.isMoving=false;
		mover.reSize();
		
		//清除移动过程中产生的对象，和释放事件
		delete mover.colnePortletElement;
		Object.delEvent(document, ["onmousemove"], mover.iFunc);
		Object.delEvent(document, ["onmouseup"], mover.eFunc);
		document.onselectstart = mover.iFunc = mover.eFunc = null;
	},

	/**
	 * 在移动结束之后，进行：
	 * 1）修改拖动后的HTML元素，即页面视角；
	 * 2）修改拖动后的数据记录；
	 * 3）对新的个性化信息进行持久化处理；
	 * 4）修改移动标识及调整页面窗口高度；
	 * 5）清除移动过程中产生的对象，和释放事件
	 * 
	 * 当一个栏目拖曳过来时，需要判断：1）是新加入还是原来的，2）如果是新加入则加入的位置在哪里？3）如果是原来则，是在原位，还是上移或下移？
	 * 改变一个栏目时，需要三个要素：1）栏目将加入单元;2）栏目编号；3）栏目在单元中的位置。
	 * 所以，栏目对于单元来说只有四种情况：1）原位不动；2）新加入单元；3）上移；4）下移；但是，栏目在新加入中单元的位置是通过通过相对单元中已有栏目的位置来确定的
	 * 
	 * 
	 * 在移动结束之后，根据各个栏目之间的相对位置，各个容器中栏目数量，和栏目在容器中的顺序，还有鼠标与栏目位置对比，
	 * 来判断:栏目是在新的容器中是上移、下移、新加入、还是原位不动，判断出之后，最后通过execMove来修改页面位置（即视觉页面）
	 * 
	 * -------------------------------------------
	 * 该程序必须确保栏目的单元区域的高度不为零，如果为零，则需要重新设计布局或修改样式
	 * 1）首先判断鼠标是否在单元区域内，不在则跳过；
	 * 2）再判断所在单元区域内是否有单元，无，则直接加入；
	 * 3）所在单元区域内内有1个栏目，且是正在拖动栏目，则不作处理；
	 * 4）根据所在单元区域内，不等自身的栏目的位置来决断拖动栏目的位置
	 * 5）其他情况不处理。
	 * @return 无	 
	 **/
	endMove : function () {
		//当鼠标释放时设置参数	
		var mover = this;
		if(mover.isMoved ==false){
			return;
		}		
		mover.isMoved = false;
		
		var unitsList = mover.layout.unitsList, tempUnit,unitPoistion, portletList,tempPortlet,portletPosition,
		movingPortlet = mover.movingPortlet, relativePortlet =null,
		mouseX = mover.mouseX,
		mouseY = mover.mouseY;		
		
		var offsetHeight=0,offsetWidth;
		var top ,left,right,bottom,portletLen,halfHeight;
		var appendUnit = null;
		
		for(var i =0;i<unitsList.length;i++){
			tempUnit = unitsList[i];	
			if(tempUnit.element==null){
				tempUnit.element = document.getElementById(tempUnit.unitId);
			}
			if(tempUnit.element==null){
				continue;
			}
			unitPoistion = mover.rePosition(tempUnit.element);
			
			offsetHeight = tempUnit.element.offsetHeight;			
			offsetWidth = tempUnit.element.offsetWidth;
			
			left = unitPoistion.x;
			top = unitPoistion.y;			
			right = unitPoistion.x + offsetWidth;
			bottom = unitPoistion.y+offsetHeight;			
			
			portletList = tempUnit.portletList;
			//容器定位
			if ((left < mouseX && mouseX < right)&&(top < mouseY && mouseY<bottom )) {//在单元区域内。
				portletLen = portletList.length;
				//confirm("portletLen="+portletLen);
				if(portletLen==0){
					//此列无内容添加新行
					relativePortlet =null;
					//confirm("mover.PLACE.ADD");
					mover.execMove(tempUnit,movingPortlet,relativePortlet, mover.PLACE.ADD);
					break;
				}
				
				//单元内只有一个栏目，且是拖动栏目，则不做变动
				if(portletLen==1){
					if(portletList[0].portletId == movingPortlet.portletId){
						break;
					}
				}
				
				
				//单元内有多个栏目，且是拖动栏目，则不做变动
				var isExecMove = false;
				for(var j=0;j<portletLen;j++){
					tempPortlet = portletList[j];
					//如果当前栏目为正在拖动的栏目的位置，则不处理
					if(tempPortlet.portletId == movingPortlet.portletId){
						continue;
					}
					
					if(tempPortlet.element==undefined||tempPortlet.element==null){
						tempPortlet.element=document.getElementById(tempPortlet.portletId);
					}
					
					if(tempPortlet.element==undefined||tempPortlet.element==null){
						continue;
					}
					
					portletPosition = mover.rePosition(tempPortlet.element);
					
					top = portletPosition.y-40;
					bottom = portletPosition.y+tempPortlet.element.offsetHeight+40;
					halfHeight = (top+bottom)/2;
					//
					//找到鼠标所在的栏目位置，即将拖放的位置
					if(top < mouseY && mouseY < bottom){	
						//鼠标在栏目的前半部分，则插入到该栏目前面					
						if(top < mouseY && mouseY <= halfHeight){															
							relativePortlet = tempPortlet;
							//confirm("mover.PLACE.----->UP");
							mover.execMove(tempUnit,movingPortlet,relativePortlet, mover.PLACE.UP);
							isExecMove = true;
							break;
						}
						if(halfHeight < mouseY && mouseY <  bottom){
							relativePortlet = tempPortlet;
							//confirm("mover.PLACE.----->DOWN");
							mover.execMove(tempUnit,movingPortlet,relativePortlet, mover.PLACE.DOWN);
							isExecMove = true;
							break;//不能用return 最后还有执行cleanMove
						}//
					}
				}//for
				
				if(isExecMove==false){
					relativePortlet =null;
					//confirm("mover.PLACE.----->ADD");
					mover.execMove(tempUnit,movingPortlet,relativePortlet, mover.PLACE.ADD);
					break;					
				}
			}		
		}//for unit
		
		/*所有操作，最后都要做元素变更和变更清理*/
		
		mover.cleanMove();
		
	},
	
	/**
	 * 调整窗口高度，每次调整从所有栏目中查找到高度最高的栏目高度作为当前窗口的高度
	 * 调整时需要同时调整页面加载iframe和布局加载iframe的高度
	 * --------------------------------------------------
	 * 在布局设计中，如果要对上层的元素调整高度，可以做成配置的，即是否自动调整页面窗口高度；如果是，则按层级关系，进行调整；（从当前层开始查找元素，逐层向上查，找到则停止）
	 * @return 无	 
	 **/	
	reSize : function () {
		//return;
		var mover = this;
		//confirm("mover.isReSize="+mover.isReSize);
		if(mover.isReSize==false){
			return;
		}
		
		//confirm("mover.maxHeight1="+mover.maxHeight);
		if(mover.layout==null||mover.layout.unitsList==null){
			return;
		}
		
		
		mover.layout.initElement();	
		//confirm("mover.maxHeight2="+mover.maxHeight);
		var  unitsList = mover.layout.unitsList, t_position, tempUnit, i,portletList,j,tempPortlet,eHeight;
		var tempHeight=0,maxHeight=0;
		for(i =0;i<unitsList.length;i++){
			portletList = unitsList[i].portletList;	
			for(j=0;j<portletList.length;j++){
				tempPortlet = portletList[j];
				if(tempPortlet.element==null)continue;
				t_position = mover.rePosition(tempPortlet.element);
				eHeight = tempPortlet.element.offsetHeight;
				if(eHeight==0){
					eHeight = tempPortlet.element.parentNode.offsetHeight;
				}
				tempHeight =t_position.y + eHeight;//+10;
				if(tempHeight>maxHeight){
					maxHeight = tempHeight;
				}
			}
		}
		var spanHeight= 0;
		//confirm("mover.maxHeight3="+mover.maxHeight);
		if(mover.maxHeight==maxHeight){
			return;
		}
		//confirm();		
		var layout = mover.layout;
		maxHeight=maxHeight;//+spanHeight;
		mover.maxHeight=maxHeight;
		var layoutSpan=10,channelSpan=10,systemSpan=340;
		var layoutHeight =maxHeight + layoutSpan;
		var channelHeight =maxHeight + channelSpan;
		var systemHeight =maxHeight + systemSpan;
		//confirm("mover.maxHeightx="+mover.maxHeight);
		parent.document.getElementById("__layoutLoader").style.height=layoutHeight+"px";
		parent.parent.document.getElementById("__channelLoader").style.height=channelHeight+"px";
		//parent.parent.parent.document.getElementById("__systemLoader").style.height=systemHeight+"px";
		
		parent.document.getElementById("__layoutLoader").height=layoutHeight+"px";
		parent.parent.document.getElementById("__channelLoader").height=channelHeight+"px";
		//parent.parent.parent.document.getElementById("__systemLoader").height=systemHeight+"px";
		/**
		//没有布局分组情况下使用，用来调整外框高度
		if(layout.isLayoutGroup==false){
			//tempHeight = maxHeight + spanHeight;
			parent.document.getElementById("__portalPageLayoutLoader").height=tempHeight+"px";
			parent.parent.document.getElementById("pageLoader").height=tempHeight+"px";
			
		}else{
		//在有布局分组的情况，用来调整外框高度
			parent.document.getElementById("__portalPageLayoutLoader_"+layout.layoutId).height=tempHeight+"px";
			parent.document.getElementById("__groupLayoutLoader_"+layout.layoutId).height=tempHeight+"px";
			//confirm("..layoutGroupName="+layout.layoutGroupName+",__groupLayoutLoader="+parent.document.getElementById("__groupLayoutLoader_"+layout.layoutId).height)
			
			var layouts= parent.document.getElementsByName ("__portalPageLayoutLoader");
			var tempHeight =220;
			for(var i =0;i<layouts.length;i++){				
				tempHeight=tempHeight+parseInt(layouts[i].height);//+ spanHeight;
				
			}
			//confirm("..tempHeight="+tempHeight);
			tempHeight = tempHeight;
			parent.parent.document.getElementById("__portalPageLayoutLoader").style.height=tempHeight+"px";
			parent.parent.parent.document.getElementById("pageLoader").style.height=tempHeight+"px";
			//layout.layoutHeight = tempHeight;
			//confirm("tempHeight="+tempHeight);
		}
		//tempHeight = maxHeight + spanHeight+100;
		//parent.parent.document.getElementById("content").style.height=tempHeight+"px";
		//maxHeight=0;
		*/
	},
	
	/**
	 * 显示插入位置阴影框
	 * 方法须在布局模板的body标签的onmousemove事件中调用，当鼠标在布局中移动时：
	 * 1）没有选择拖动对象，该方法直接返回；选择了拖动对象，按下述方式插入阴影框：
	 * 2）先根据所有栏目的位置和鼠标的位置，确定是否在栏目区域内；
	 * 3）如果不在栏目区域内；再根据所有布局单元的位置和鼠标的位置，确定是否在布局单元区域内，如果是即为_unit类型，阴影框直接加入到面目单元区域内；
	 * 4）如果在栏目区域内；再根据栏目高度和鼠标位置，确定是在栏目域之上还是在栏目区域之后插入阴影框；_up为在栏目区域之上插入，_down为在栏目区域之下插入。
	 * 5）在插入之前先判断前一状态与当前状态是否一致，如一致内不做插入，如不一致内插入并清除上一次插入的阴影框
	 * @return 无	 
	 **/	
	showPositionShadow : function(){		
		var mover = this;
		//没有选择拖动对象，直接返回
		if(mover.isMoving==false)return;				
		//mover.isMoving==true;
		var unitsList = mover.layout.unitsList,unit=null, portletList, mouse = mover.reMouse();
		var isPortlet = false,portlet,oElement,unitElemnt,portletElement;
		var left=0,top=0,right=0,bottom=0;
		var  status,type = "",haftOffsetHeight;
		var __control_definer = null;
		
		
		//先根据所有栏目的位置和鼠标的位置，确定是否在 栏目单元区域内；
		for(var i = 0; i< unitsList.length;i++){
			unit = unitsList[i];
			__control_definer= document.getElementById("__control_definer");
			//__control_definer.innerHTML =__control_definer.innerHTML + "<br>unitId="+unit.unitId+"<br>,  I="+i+"<br>,length="+unitsList.length;
			//confirm("\n showPositionShadow unit.unitId="+unit.unitId);
			unitElemnt = unit.element;
			if(unitElemnt==null){
				unitElemnt = document.getElementById(unit.unitId);
			}
			if(unitElemnt==null){					
				continue;
			}
			
			position = mover.rePosition(unitElemnt);
			left = position.x;
			right = position.x + unitElemnt.offsetWidth;
			
			top = position.y;
			bottom = position.y +unitElemnt.offsetHeight;
			/*如果通过div做栏目单元容器，下面的需要，因为在DIV中没有元素时，高度可能为0
			  if(oElement.offsetHeight==0){
				bottom = position.y +oElement.parentNode.offsetHeight;	
			}			
			*/
				
			if(mouse.x>left&&mouse.x<right&&mouse.y>top&&mouse.y<bottom){//鼠标在栏目单元区域内
				portletList = unit.portletList;
				if(portletList.length==0){//在栏目单元区域内没有栏目，即为空
					status = unitElemnt.id+"_unit";//2013-12-16
					if(mover.currentShadowStatus!=null&&mover.currentShadowStatus== status){
						return;
					}
					
					if(mover.currentShadowStatus!=null&&mover.currentShadowStatus!= status&&mover.isInsertShadow ==true){
						mover.positionShadow.parentNode.removeChild(mover.positionShadow);
					}
					mover.currentShadowStatus = status;
					unitElemnt.appendChild(mover.positionShadow); 
					mover.isInsertShadow =true;
					return;					
				}else{////在栏目单元区域内有栏目，即为不空
					
					for(var j =0;j< portletList.length;j++){
						portlet = portletList[j];
						if(portlet.portletId==mover.movingPortlet.portletId||portlet.isShow==0){//当前移动中的栏目和关闭的栏目不显示
							continue;
						}						
						
						portletElement = portlet.element;
						if(portletElement==null){
							portletElement = document.getElementById(portlet.portletId);
						}
						if(portletElement==null){					
							continue;
						}
						position = mover.rePosition(portletElement);
						left = position.x;
						right = position.x + portletElement.offsetWidth;
						top = position.y-40;
						bottom = position.y +portletElement.offsetHeight+40;	
						haftOffsetHeight =portletElement.offsetHeight/2;	
						if(mouse.x>left&&mouse.x<right&&mouse.y>top&&mouse.y<bottom){
							if(top<mouse.y&&mouse.y<position.y+haftOffsetHeight){//栏目上半部分
								status = portletElement.id + "_up";
								if(mover.currentShadowStatus!=null&&mover.currentShadowStatus== status){
									return;
								}
								if(mover.currentShadowStatus!=null&&mover.currentShadowStatus!= status&&mover.isInsertShadow ==true){
									mover.positionShadow.parentNode.removeChild(mover.positionShadow);
								}
								mover.currentShadowStatus = status;
								portletElement.parentNode.insertBefore(mover.positionShadow, portletElement);						
							}else{//栏目下半部分
								status = portletElement.id + "_down";
								if(mover.currentShadowStatus!=null&&mover.currentShadowStatus== status){
									return;
								}
								if(mover.currentShadowStatus!=null&&mover.currentShadowStatus!= status&&mover.isInsertShadow ==true){
									mover.positionShadow.parentNode.removeChild(mover.positionShadow);
								}
								mover.currentShadowStatus = status;
								
								if(portletElement.parentNode.lastChild== portletElement) {							
									portletElement.parentNode.appendChild(mover.positionShadow); 						  
								 }else{						 	
									 portletElement.parentNode.insertBefore(mover.positionShadow,portletElement.nextSibling);
								 }
							}
							mover.isInsertShadow =true;
							return;
						}
					}
				}
				
				
				status = unitElemnt.id+"_unit";//2013-12-16
				if(mover.currentShadowStatus!=null&&mover.currentShadowStatus== status){
					return;
				}
				
				if(mover.currentShadowStatus!=null&&mover.currentShadowStatus!= status&&mover.isInsertShadow ==true){
					mover.positionShadow.parentNode.removeChild(mover.positionShadow);
				}
				mover.currentShadowStatus = status;
				unitElemnt.appendChild(mover.positionShadow); 
				mover.isInsertShadow =true;
				return;
			}
			
		}//for
		
	}
}

//全局portel移动对象;
//由于创建对象时用到__portalPageLayout全局布局对象，所以该文件要在pdrag-layout.js文件之后导入
//	var __protalPortletMover = new Mover(__portalPageLayout);
