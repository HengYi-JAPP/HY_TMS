/**
 *
 *布局数据定义
 * 该对象需要在页面一层导入，保证一个页面只有一个Layout对象
 **/
Layout = Class.create();

Layout.prototype = {
	//列的拖拽暂时不考虑
	initialize : function () {
	//初始化
		var layout = this;
		layout.unitsList = []; //创建列组
		layout.portalId = "";
		layout.channelId = "";
		layout.layoutId = "";
		layout.layoutTmpl = "";
		layout.isLayoutGroup = false;
		layout.layoutGroupName = "";
		//layout.layoutHeight = 0;
		//layout.notShowPortlet=[];//不显示栏目的数据缓存
	},
	
	
	/**
	 * 在布局加载时，动态地加入布局单元，该方法将动态地记录各个布局单元的信息
	 * @param unitId，布局单元的唯一编号
	 * @param unitIntId，布局单元在数据中的唯一ID，JAVA程序和数据库记录数据时通过该ID记录
	 * @return 返回布局单元对象
	 **/
	addUnit : function (unitId) {
	//添加列
		var layout = this,unit=null;
		for(var i=0;i<layout.unitsList.length;i++){
			unit =layout.unitsList[i];
			if(unit.unitId==unitId){			
				return unit;
			}
		}
		var unitIndex = layout.unitsList.length, arg = arguments;
		var element=document.getElementById(unitId);
		return layout.unitsList[unitIndex] = new LayoutUnit(unitId,unitIndex, layout, element);
	},
	deleteUnit: function(unitId){
		var layout = this,unit=null;
		for(var i=0;i<layout.unitsList.length;i++){
			unit =layout.unitsList[i];
			if(unit.unitId==unitId){				
				return layout.unitsList.splice(i, 1)[0];
			}
		}
	},
	mergeUnit:function(sourceUnitId,targetUnitId){
		var layout = this,unit=null;
		var sourceUnit,targetUnit;
		for(var i =0;i<layout.unitsList.length;i++){
			sourceUnit =layout.unitsList[i];
			if(sourceUnit.unitId==sourceUnitId){				
				break;
			}
			sourceUnit = null;
		}
		if(sourceUnit==null){
			return;
		}
		for(var i =0;i<layout.unitsList.length;i++){
			targetUnit =layout.unitsList[i];
			if(targetUnit.unitId==targetUnitId){				
				break;
			}
			targetUnit = null;
		}
		if(targetUnit==null){
			targetUnit = layout.addUnit(targetUnitId);
		}
			
		var portletList=sourceUnit.portletList;	
		//confirm("targetUnit.id="+targetUnitId+", portletList.length="+portletList.length);
		var tempPortlet = null,tempPortletElement;
		var targetUnitElement = document.getElementById(targetUnitId);
		//confirm("111 targetUnitElement.innerHTML="+targetUnitElement.innerHTML);
		for(var j=0;j<portletList.length;j++){
			tempPortlet = portletList[j];
			tempPortlet.parent = targetUnit;
			targetUnit.appendPortlet(tempPortlet);
			//元素移动
			tempPortletElement= document.getElementById(tempPortlet.portletId);
			//confirm("222 targetUnitElement.innerHTML="+targetUnitElement.innerHTML);
			if(targetUnitElement&&tempPortletElement){
				//confirm("333 targetUnitElement.innerHTML="+targetUnitElement.innerHTML);
				targetUnitElement.appendChild(tempPortletElement);
			}
			
		}//for
		portletList=[];
	},
	
	/**
	 * 把栏目增加到对应的布局单元
	 * @param unitId
	 * @param portletId
	 * @param title
	 * @param isShow
	 * @param isOpen
	 * @param isMove
	 * @return
	 */
	addPortlet : function (unitId,portletId,title,isShow,isOpen, isMove){
		var layout = this,unit=null,targetUnit=null;
		for(var i=0;i<layout.unitsList.length;i++){
			unit =layout.unitsList[i];
			if(unit.unitId==unitId){
				targetUnit=unit;
				break;
			}
		}
		
		if(targetUnit==null){
			targetUnit =layout.addUnit(unitId);
		}
		targetUnit.addPortlet(unitId, portletId, title, isShow, isOpen, isMove);
	},
	
	/**
	 * 在选中栏目，准备拖动时，该方法将获取当前布局中的所有布局单元（容器）及所有栏目的HTML对象，进行HTML元素初始
	 * @return 无
	 **/
	initElement : function () {
	//添加列
		var layout = this;
		var unitsList = layout.unitsList;
		var portletList = [];
		for(var i=0;unitsList!=null&&i<unitsList.length;i++){
			
			unitsList[i].element=document.getElementById(unitsList[i].unitId);
			portletList=unitsList[i].portletList;				
				for(var j=0;portletList!=null&&j<portletList.length;j++){
					//confirm('portletList[j].portletId='+portletList[j].portletId);
					//portletList[j].element=document.getElementById(portletList[j].portletId+'_'+unitsList[i].unitId);
					//注意拖动之后对应的unitId可能发生变化，所以查找元素时，要根据初始时生成的唯一ID
					portletList[j].element=document.getElementById(portletList[j].portletId);
				}//for
		}//for
	},

	/**
	 * 在选中栏目，准备拖动时，通过该方法查找到拖动对象的相关数据信息
	 * @param portletId，拖动栏目对象的HTML的唯一栏目编号，规则是：portletId_luCode
	 * 
	 * @return 返回拖动对象的相关数据信息
	 **/	
	findPortlet : function (portletId){
		var layout = this;
		var unitsList = layout.unitsList;
		var portletList = [];
		var unit,portletUnitId;
		//confirm('unitsList.length='+unitsList.length);
		for(var i=0;i<unitsList.length;i++){
			portletList=unitsList[i].portletList;	
			
			for(var j=0;j<portletList.length;j++){	
				//confirm('portletList[j].portletId='+portletList[j].portletId+",portletId="+portletId);
				if(portletList[j].portletId==portletId){
					return portletList[j];
				}//if
			}//for
		}//for
	},
	deletePortlet : function (portletId){
		var layout = this;
		var unitsList = layout.unitsList;
		var unit=null,portlet=null;
		var portletList = [];
		for(var i=0;i<unitsList.length;i++){
			unit = unitsList[i];
			portletList=unit.portletList;
			for(var j=0;j<portletList.length;j++){	
				portlet=portletList[j];
				if(portlet.portletId==portletId){
					return unit.deletePortlet(j);
				}//if
			}//for
		}//for
	},
	/**
	 * 在拖动结束时，或在进行个性化控制（展开/缩小，移动/锁定，关闭等操作）后，获取布局中需要进行持久化的数据
	 * 持久化时，使用规则是：将该门户当前页面布局中原有的个性化数据全部清空，然后再插入新的个性化数据
	 * 每个栏目个性化数据包括：门户编号、页面编号、布局编号、布局单元编号、栏目编号、栏目序号、是否显示标识、是否展开标识、是否移动标识，同一栏目各个数据项通过逗号分隔
	 * 多个栏目之间的个性化数据通过分号分隔
	 *
	 * @return 当前门户当前页面当前布局中，需要保存的新的个性化数据
	 **/	
	saveColumn : function(){
		var layout = this;
		var unitList =layout.unitsList,portletList=null,unit,column;
		var temp="";
		var operation = "updateColumn_of_commonSystem";
		var implClass = "com.mobilecn.portal.updater.ColumnUpdater";
		var params = "&operation="+operation+"&ajaxImplClass="+implClass;
		var order = 0;
		for(var i=0;i<unitList.length;i++){
			unit = unitList[i];
			if(unit.unitId=="__layoutSandBox_SystemColumn"){
				continue;
			}
			portletList=unit.portletList;
			params = params + "&_delUnit="+unit.unitId;
			
			if(portletList==null||portletList.length<1){
				continue;
			}
			temp="";
			for(var j=0;j<portletList.length;j++){
				column = portletList[j];
				//confirm("unit.unitId="+unit.unitId);
				temp = temp + "&_unitId="+unit.unitId;
				temp = temp + "&_layoutId="+layout.layoutId;
				temp = temp + "&_columnId=" + column.portletId;
				temp = temp + "&_isShow=" + column.isShow;
				temp = temp + "&_isOpen=" + column.isOpen;
				temp = temp + "&_isMove=" + column.isMove;
				order =  column.portletIndex>=j+1?column.portletIndex:j+1;
				//alert("&_showOrder=" + order);
				temp = temp + "&_showOrder=" + order;				
			}
			
			
			params = params + temp;
		}
		//confirm("params="+params);
		/*var ajax = new Ajax();
		 ajax.setUrl("ajax/portal"); 
		 ajax.setMethod("post");
	 	 //ajax.setCallBackObject(null);	
		 ajax.setParameters(params); 
		 ajax.invokeAjax(); */
		layout.invokeAjax(params);
		
	},
	updateOpenStatus : function(portletId,status,hasPersonalized){
		var layout = this;
		if(!hasPersonalized){
			//更改状态后，保存
			layout.initUserDefineColumn(portletId,true,status);
			return;
		}
		var portlet =layout.findPortlet(portletId)
		if(!portlet){
			return;
		}
		
		var operation = "updateColumnOpenStatus";
		var implClass = "com.mobilecn.portal.updater.ColumnUpdater";
		var params = "&operation="+operation+"&ajaxImplClass="+implClass;
		var temp="";
		//alert("portlet.parent.unitId="+portlet.parent.unitId);
		temp = temp + "&_currUnitId="+portlet.parent.unitId;
		temp = temp + "&_columnId=" + portletId;
		temp = temp + "&_statusValue=" + status;
		
		portlet.isOpen=status;
		
		params = params + temp;
		//alert("params="+params);
		layout.invokeAjax(params);
	},
	closePortlet: function(portletId,status,hasPersonalized){
		var layout = this;
		if(!hasPersonalized){
			//更改状态后，保存
			layout.initUserDefineColumn(portletId,false,status);
			return;
		}
		var portlet =layout.deletePortlet(portletId)
		if(!portlet){			
			return;
		}
		var operation = "updateColumnShowStatus";
		var implClass = "com.mobilecn.portal.updater.ColumnUpdater";
		var params = "&operation="+operation+"&ajaxImplClass="+implClass;
		var temp="";
		//alert("portlet.parent.unitId="+portlet.parent.unitId);
		temp = temp + "&_currUnitId="+portlet.parent.unitId;
		temp = temp + "&_columnId=" + portletId;
		temp = temp + "&_statusValue=" + status;
		
		portlet.isOpen=status;
		
		params = params + temp;
		//alert("params="+params);
		layout.invokeAjax(params);
	},
	updatePortletStatus : function(targetPortletId,isOpen,statusValue){
		var layout = this;
		var unitList =layout.unitsList,portletList=null,unit,column;
		var temp="";
		var operation = "updateColumn_of_commonSystem";
		var implClass = "com.mobilecn.portal.updater.ColumnUpdater";
		var params = "&operation="+operation+"&ajaxImplClass="+implClass;
		var order = 0;
		//alert("layout.layoutId:"+layout.layoutId);
		for(var i=0;i<unitList.length;i++){
			unit = unitList[i];
			portletList=unit.portletList;
			params = params + "&_delUnit="+unit.unitId;
			
			if(portletList==null||portletList.length<1){
				continue;
			}
			temp="";
			for(var j=0;j<portletList.length;j++){
				column = portletList[j];
				//confirm("unit.unitId="+unit.unitId);
				temp = temp + "&_unitId="+unit.unitId;
				temp = temp + "&_layoutId="+layout.layoutId;
				temp = temp + "&_columnId=" + column.portletId;
				if(targetPortletId== column.portletId){
					if(isOpen){
						temp = temp + "&_isShow=" + column.isShow;
						temp = temp + "&_isOpen=" + statusValue;
					}else{
						temp = temp + "&_isShow=" + statusValue;
						temp = temp + "&_isOpen=" + column.isOpen;
						unit.deletePortlet(j);
					}
				}else{
					temp = temp + "&_isShow=" + column.isShow;
					temp = temp + "&_isOpen=" + column.isOpen;
				}
				
				temp = temp + "&_isMove=" + column.isMove;
				order =  column.portletIndex>=j+1?column.portletIndex:j+1;
				//alert("&_showOrder=" + order);
				temp = temp + "&_showOrder=" + order;				
			}
			
			
			params = params + temp;
		}
		//confirm("params="+params);
		/*var ajax = new Ajax();
		 ajax.setUrl("ajax/portal"); 
		 ajax.setMethod("post");
	 	 //ajax.setCallBackObject(null);	
		 ajax.setParameters(params); 
		 ajax.invokeAjax(); */
		layout.invokeAjax(params);
		
	},
	
	setPortletStatus : function(targetPortletId,statusType,statusValue){
		var layout = this;
		var unitList =layout.unitsList,portletList=null,unit,column;
		var temp="";
		var operation = "updateColumn_of_commonSystem";
		var implClass = "com.mobilecn.portal.updater.ColumnUpdater";
		var params = "&operation="+operation+"&ajaxImplClass="+implClass;
		var order = 0;
		var isSave = false;
		//alert("layout.layoutId:"+layout.layoutId);
		for(var i=0;i<unitList.length;i++){
			unit = unitList[i];
			portletList=unit.portletList;
			if(unit.unitId=='__layoutSandBox_SystemColumn'){
				continue;
			}
			params = params + "&_delUnit="+unit.unitId;
			
			if(portletList==null||portletList.length<1){
				continue;
			}
			temp="";
			for(var j=0;j<portletList.length;j++){
				column = portletList[j];
				if(column.unitId=='__layoutSandBox_SystemColumn'){
					continue;
				}
				//confirm("unit.unitId="+unit.unitId);
				temp = temp + "&_unitId="+unit.unitId;
				temp = temp + "&_layoutId="+layout.layoutId;
				temp = temp + "&_columnId=" + column.portletId;
				if(targetPortletId== column.portletId){
					if(statusType=='open'){
						temp = temp + "&_isShow=" + column.isShow;
						temp = temp + "&_isOpen=" + statusValue;
						temp = temp + "&_isMove=" + column.isMove;
						column.isOpen=statusValue;
						isSave = true;
					}
					if(statusType=='move'){
						temp = temp + "&_isShow=" + column.isShow;
						temp = temp + "&_isOpen=" + column.isOpen;
						temp = temp + "&_isMove=" + statusValue;
						column.isMove=statusValue;
						isSave = true;
					}
					if(statusType=='show'){
						temp = temp + "&_isShow=" + statusValue;
						temp = temp + "&_isOpen=" + column.isOpen;
						temp = temp + "&_isMove=" + column.isMove;
						column.isShow=statusValue;
						//unit.deletePortlet(j);
						isSave = true;
					}
				}else{
					temp = temp + "&_isShow=" + column.isShow;
					temp = temp + "&_isOpen=" + column.isOpen;
					temp = temp + "&_isMove=" + column.isMove;
				}
				
				
				order =  column.portletIndex>=j+1?column.portletIndex:j+1;
				//alert("&_showOrder=" + order);
				temp = temp + "&_showOrder=" + order;				
			}
			
			
			params = params + temp;
		}
		
		if(!isSave){
			return;
		}
		layout.invokeAjax(params);
		
	},
	invokeAjax : function(params){
		var ajax = new Ajax();
		 ajax.setUrl("ajax/portal"); 
		 ajax.setMethod("post");
	 	 //ajax.setCallBackObject(null);	
		 ajax.setParameters(params); 
		 ajax.invokeAjax(); 
	}
	
};

/**
 * 页面布局对象，每个页面布局在加载时会创建一个新的页面布局对象，通过该对象记录布局单元信息和栏目信息
**/
var __portalPageLayout = new Layout();
