/**
 * 要增加排序、搜索和与树形互动结合功能 *********************************
 */
function LorBox(leftBoxId,rightBoxId){
	var lorbox = this;
	lorbox.leftBoxId = leftBoxId?leftBoxId:"LEFT_SELECT_ID";// ID要替换
	lorbox.rightBoxId = rightBoxId?rightBoxId:"RIGHT_SELECT_ID";
	lorbox.leftBox = document.getElementById(lorbox.leftBoxId);
	lorbox.rightBox = document.getElementById(lorbox.rightBoxId);
	lorbox.getBox = function(isLeft){
		if(!lorbox.leftBox){
			lorbox.leftBox = document.getElementById(lorbox.leftBoxId);
		}
		if(!lorbox.rightBox){
			lorbox.rightBox = document.getElementById(lorbox.rightBoxId);
		}
		
		return isLeft?lorbox.leftBox:lorbox.rightBox
	}
	/**
	 * 添加全部
	 */
	lorbox.selectAll=function(){
		var optionText,optionValue,newoption ,postionOption,insertIndex,index;
		var leftBox = lorbox.getBox(true);
		var rightBox = lorbox.getBox();
		for( var i = 0; i < leftBox.options.length; i++ ){
			lorbox.lorSelect(leftBox,rightBox,i);			
		}// for
		
		// 清空左边的选项
		leftBox.options.length = 0;
	};
	
	/**
	 * 从源框选择指定的选项到目标框
	 */
	lorbox.lorSelect=function(sourceBox,targetBox,index){		
		/* 把源选框中的指定选项，加入到目标选项中 */
		var newOption =	new Option(sourceBox.options[index].text,sourceBox.options[index].value);
		newOption.id = sourceBox.options[index].id;
		targetBox.add(newOption);
		/* 从源选框中删除选项 */
		// sourceBox.options.remove(index);
		
		/*
		 * 判断是否从左到右选择
		 */
		var leftBox = lorbox.getBox(true);		
		var isLeft2Right = sourceBox==leftBox?true:false;
		lorbox.changeCache(newOption,isLeft2Right);
		/* 调用搜索缓存，确保状态一致 */
	};
	/*
	 * lorbox.leftBoxCache=[]; lorbox.rightBoxCache=[]; lorbox.isCacheLeftBox =
	 * false; lorbox.isCacheRightBox = false;
	 */
	lorbox.changeCache=function(option,isLeft2Right){
		if(lorbox.isCacheLeftBox==false&&lorbox.isCacheRightBox==false){
			return;
		}
		
		/* 从左到右选择 */		
		if(isLeft2Right){			
			/* 左边有缓存，则删除对应位置的元素，并生成新的元素，将加入元素 */
			if(lorbox.isCacheLeftBox){
				var tempCache=null;
				for(var i=0;i<lorbox.leftBoxCache.length;i++){
					tempCache=lorbox.leftBoxCache[i];
					if(tempCache.id==option.id&&tempCache.value==option.value&&tempCache.text==option.text){
						lorbox.leftBoxCache.splice(i,1);
						break;
					}
				}
				
			}
			
			if(lorbox.isCacheRightBox){	
				lorbox.rightBoxCache[lorbox.rightBoxCache.length]={id:option.id,text:option.text,value:option.value};
			}
		}else{
		/* 从右到左选择 */
			if(lorbox.isCacheRightBox){	
				var tempCache=null;
				for(var i=0;i<lorbox.rightBoxCache.length;i++){
					tempCache=lorbox.rightBoxCache[i];
					if(tempCache.id==option.id&&tempCache.value==option.value&&tempCache.text==option.text){
						lorbox.rightBoxCache.splice(i,1);
						break;
					}
				}
				// lorbox.rightBoxCache.remove(position);
			}
			
			if(lorbox.isCacheLeftBox){
				lorbox.leftBoxCache[lorbox.rightBoxCache.length]={id:option.id,text:option.text,value:option.value};				
			}
		}
	};
	
	/**
	 * 从选框中获取选项的下标
	 */
	lorbox.getIndex=function(selectBox,optionId){
		var oid = parseInt(optionId);
		var nid = 0;
		for( var i = 0; i < selectBox.options.length; i++ ){	
			nid = parseInt(selectBox.options[i].id);		
			if(nid<=oid) continue;
			return i;
		}
		
		return selectBox.options.length;	
	};
	/**
	 * 判断是否重复选择
	 */
	lorbox.isDuplicatedOption=function(optionValue,optionText){	
		for(var j=0;j<lorbox.rightBox.options.length;j++)
				if(optionValue == lorbox.rightBox.options[j].value &&optionText == lorbox.rightBox.options[j].text) return true;
				
		return false;
	};
	
	/**
	 * 把右边的已选项，全部清空
	 */
	lorbox.deleteAll=function(){
		var optionText,optionValue,newoption ,postionOption,insertIndex,index;
		var leftBox = lorbox.getBox(true);
		var rightBox = lorbox.getBox();
		for( var i = 0; i < rightBox.options.length; i++ ){	
			lorbox.lorSelect(rightBox,leftBox,i);							
		}// for
		
		// 清空右边的选项
		rightBox.options.length = 0;
	};
	
	/**
	 * 
	 * 把左边选择框中的选项 插入到 右边选择框中
	 */
	lorbox.select = function (){		
		var leftBox = lorbox.getBox(true);
		var rightBox = lorbox.getBox();
		var index = leftBox.selectedIndex;
		
		while(index!=-1){
			lorbox.lorSelect(leftBox,rightBox,index);
			leftBox.options.remove(index); 
			
			index=leftBox.selectedIndex;
		}
	};

	/**
	 * 从右边选择框中移除选项
	 */
	lorbox.del =function (){	
		var leftBox = lorbox.getBox(true);
		var rightBox = lorbox.getBox();
		var index = rightBox.selectedIndex;
		while(index!=-1){
			lorbox.lorSelect(rightBox,leftBox,index);
			rightBox.options.remove(index); 
			
			index=rightBox.selectedIndex;
		}
	}

	/**
	 * 处理选择的光标
	 */
	lorbox.doSelected=function(selectBox,index){
		if(selectBox.options.length<1)return;
		if(selectBox.options.length <= index){
			selectBox.options[selectBox.options.length-1].selected=true;
		}else	
			selectBox.options[index].selected=true;
	};


/* 节点的“置顶”、“上移”、“下移”、“置低” */
	// 置顶操作
   lorbox.moveTop=function (isLeft){   　 
		/*
		 * var obj = document.getElementById(boxId); if(!obj){ return; }
		 */
	   var leftBox = lorbox.getBox(true);
		var rightBox = lorbox.getBox();
	var obj=isLeft?leftBox:rightBox;
		var opts = []; 
	    var objLen = obj.options.length -1;
	    for(var i = objLen; i >= 0; i--){
	     if(obj.options[i].selected){
	      opts.push(obj.options[i]);
	      obj.remove(i);
	     }
	    }
	    var index = 0 ;
	    var optsLen = opts.length-1;
	    for(var t =optsLen; t>=0 ; t--){
	     var opt = new Option(opts[t].text,opts[t].value);
	     opt.selected = true;
	     obj.options.add(opt, index++);
	    }
		lorbox.changeBoxCache(opts,"top",isLeft);
   };
   // 上移
   // function moveUp(obj){
   lorbox.moveUp=function (isLeft){   　 
		/*
		 * var obj = document.getElementById(boxId); if(!obj){ return; }
		 */
	   var leftBox = lorbox.getBox(true);
		var rightBox = lorbox.getBox();
	var obj=isLeft?leftBox:rightBox;
	  var objLen = obj.length;
　　　for(var i=1; i < objLen; i++){
	  // 最上面的一个不需要移动，所以直接从i=1开始
　　　　if(obj.options[i].selected){
　　　　　if(!obj.options.item(i-1).selected){
　　　　　　  var selText = obj.options[i].text;
　　　　　　  var selValue = obj.options[i].value;
			  var selId = obj.options[i].id;
			obj.options[i].id = obj.options[i-1].id;
	        obj.options[i].text = obj.options[i-1].text;
	        obj.options[i].value = obj.options[i-1].value;
	        obj.options[i].selected = false;
			obj.options[i-1].id = selId;
	        obj.options[i-1].text = selText;
	        obj.options[i-1].value = selValue;
	        obj.options[i-1].selected=true;
			lorbox.changeBoxCache(obj.options[i-1],"up",isLeft);
　　　　　　}
　　　　　}
　　　　}
　　};
  // 下移操作
  // function moveDown(obj){
  lorbox.moveDown=function (isLeft){   　 
		/*
		 * var obj = document.getElementById(boxId); if(!obj){ return; }
		 */
	  var leftBox = lorbox.getBox(true);
		var rightBox = lorbox.getBox();
	var obj=isLeft?leftBox:rightBox;
	  var objLen = obj.length -2;
　　　for(var i = objLen; i >= 0; i--){
		// 向下移动，最后一个不需要处理，所以直接从倒数第二个开始
　　　　if(obj.options[i].selected){
　　　　　　if(!obj.options[i+1].selected){
　　　　　　　　var selText = obj.options[i].text;
　　　　　　　　var selValue = obj.options[i].value;
				var selId = obj.options[i].id;
				obj.options[i].id = obj.options[i+1].id;
     		   obj.options[i].text = obj.options[i+1].text;
			   obj.options[i].value = obj.options[i+1].value;
			   obj.options[i].selected = false;
			   obj.options[i+1].id = selId;
			   obj.options[i+1].text = selText;
			   obj.options[i+1].value = selValue;
			   obj.options[i+1].selected=true;
			   
			   lorbox.changeBoxCache(obj.options[i+1],"down",isLeft);
　　　　　　　　　}
　　　　　　　}
　　　　　}
　　　}
  // 置底操作
  // function moveBottom(obj) {
  lorbox.moveBottom=function (isLeft){   　 
		/*
		 * var obj = document.getElementById(boxId); if(!obj){ return; }
		 */
	  var leftBox = lorbox.getBox(true);
		var rightBox = lorbox.getBox();
	var obj=isLeft?leftBox:rightBox;
    var opts = []; 
    var objLen = obj.options.length -1;
    for(var i = objLen; i >= 0; i--){
     if(obj.options[i].selected){
      opts.push(obj.options[i]);
      obj.remove(i);
     }
    }
    var optsLen = opts.length-1;
    for(var t = optsLen; t>=0 ; t--){
     var opt = new Option(opts[t].text,opts[t].value);
     opt.selected = true;
     obj.options.add(opt);
    }
	lorbox.changeBoxCache(opts,"bottom",isLeft);
   };
   /**
	 * 在排序操作后，调整选择缓存中的位置避免重置操作引起排序错乱或排序结果丢失的问题 type
	 * 有：1)top(置顶)，2）up(向上），3）down（向下），4）bottom（置底）
	 */
  lorbox.changeBoxCache=function(options,type,isLeft){
		if(lorbox.isCacheLeftBox==false&&lorbox.isCacheRightBox==false){
			return;
		}
		
		if(lorbox.isCacheLeftBox&&isLeft){
			lorbox.moveLeftCache(options,type);
		}
		
		if(lorbox.isCacheRightBox&&!isLeft){
			lorbox.moveRightCache(options,type);
		}
   };
   lorbox.moveLeftCache=function(options,type){
		if(type=="up"){
			var tempCache,temp,tempOption;
			// confirm("type="+type+",options.text="+options.text+",lorbox.leftBoxCache.length="+lorbox.leftBoxCache.length);
			for(var i=1;i<lorbox.leftBoxCache.length;i++){
				tempCache = lorbox.leftBoxCache[i];
				// confirm("id="+tempCache.id+"\n
				// cond1="+(tempCache.id==options.id)+",cond2="+(tempCache.value==options.value)+",cond3="+(tempCache.text==options.text)+",\ntempCache.text="+tempCache.text+",options.text="+options.text);
				if(tempCache.id==options.id&&tempCache.value==options.value&&tempCache.text==options.text){
					// confirm("true");
					temp=lorbox.leftBoxCache[i-1];
					
					tempOption={id:temp.id,text:temp.text,value:temp.value};
					lorbox.leftBoxCache[i-1]={id:tempCache.id,text:tempCache.text,value:tempCache.value};;
					lorbox.leftBoxCache[i]=tempOption;
					// confirm("i-1-text"+temp.text+"i-text"+tempCache.text);
					break;
				}
			}
		}
		
		if(type=="down"){
			var tempCache,temp;
			for(var i=0;i<lorbox.leftBoxCache.length-1;i++){
				tempCache = lorbox.leftBoxCache[i];
				if(tempCache.id==options.id&&tempCache.value==options.value&&tempCache.text==options.text){
					temp=lorbox.leftBoxCache[i+1];
					lorbox.leftBoxCache[i+1]=tempCache;
					lorbox.leftBoxCache[i]=temp;
					break;
				}
			}
		}
		
		if(type=="top"){
			var tempOption=null;
			for(var j=0;j<options.length;j++){
				tempOption=options[j];
				for(var i=1;i<lorbox.leftBoxCache.length;i++){
					tempCache = lorbox.leftBoxCache[i];
					if(tempCache.id==tempOption.id&&tempCache.value==tempOption.value&&tempCache.text==tempOption.text){
						lorbox.leftBoxCache.splice(i,1);
						break;
					}
				}
			}
			var newCache=[];
			// confirm("options.length="+options.length);
			for(var j=0;j<options.length;j++){
				newCache[newCache.length]={id:options[j].id,text:options[j].text,value:options[j].value};				
			}
			// confirm("cache.length="+lorbox.leftBoxCache.length);
			for(var j=0;j<lorbox.leftBoxCache.length;j++){				
				newCache[newCache.length]=lorbox.leftBoxCache[j];				
			}
			
			lorbox.leftBoxCache=newCache;
			// confirm("cache.length="+lorbox.leftBoxCache.length);
			// confirm("lorbox.leftBoxCache.length="+lorbox.leftBoxCache.length);
		}
		
		if(type=="bottom"){
			var tempOption=null;
			for(var j=0;j<options.length;j++){
				tempOption=options[j];
				for(var i=0;i<lorbox.leftBoxCache.length-1;i++){
					tempCache = lorbox.leftBoxCache[i];
					if(tempCache.id==tempOption.id&&tempCache.value==tempOption.value&&tempCache.text==tempOption.text){
						lorbox.leftBoxCache.splice(i,1);
						break;
					}
				}
			}
			
			for(var j=0;j<options.length;j++){
				lorbox.leftBoxCache[lorbox.leftBoxCache.length]={id:options[j].id,text:options[j].text,value:options[j].value};				
			}
		}
   };
   
   lorbox.moveRightCache=function(options,type){
		if(type=="up"){
			var tempCache,temp;
			for(var i=1;i<lorbox.rightBoxCache.length;i++){
				tempCache = lorbox.rightBoxCache[i];
				if(tempCache.id==options.id&&tempCache.value==options.value&&tempCache.text==options.text){
					temp=lorbox.rightBoxCache[i-1];
					lorbox.rightBoxCache[i-1]=tempCache;
					lorbox.rightBoxCache[i]=temp;
					break;
				}
			}
		}
		
		if(type=="down"){
			var tempCache,temp;
			for(var i=0;i<lorbox.rightBoxCache.length-1;i++){
				tempCache = lorbox.rightBoxCache[i];
				if(tempCache.id==options.id&&tempCache.value==options.value&&tempCache.text==options.text){
					temp=lorbox.rightBoxCache[i+1];
					lorbox.rightBoxCache[i+1]=tempCache;
					lorbox.rightBoxCache[i]=temp;
					break;
				}
			}
		}
		
		if(type=="top"){
			var tempOption=null;
			for(var j=0;j<options.length;j++){
				tempOption=options[j];
				for(var i=1;i<lorbox.rightBoxCache.length;i++){
					tempCache = lorbox.rightBoxCache[i];
					if(tempCache.id==tempOption.id&&tempCache.value==tempOption.value&&tempCache.text==tempOption.text){
						lorbox.rightBoxCache.splice(i,1);
						break;
					}
				}
			}
			var newCache=[];
			// confirm("options.length="+options.length);
			for(var j=0;j<options.length;j++){
				newCache[newCache.length]={id:options[j].id,text:options[j].text,value:options[j].value};				
			}
			// confirm("cache.length="+lorbox.rightBoxCache.length);
			for(var j=0;j<lorbox.rightBoxCache.length;j++){				
				newCache[newCache.length]=lorbox.rightBoxCache[j];				
			}
			
			lorbox.rightBoxCache=newCache;
			// confirm("cache.length="+lorbox.rightBoxCache.length);
			// confirm("lorbox.rightBoxCache.length="+lorbox.rightBoxCache.length);
		}
		
		if(type=="bottom"){
			var tempOption=null;
			for(var j=0;j<options.length;j++){
				tempOption=options[j];
				for(var i=0;i<lorbox.rightBoxCache.length-1;i++){
					tempCache = lorbox.rightBoxCache[i];
					if(tempCache.id==tempOption.id&&tempCache.value==tempOption.value&&tempCache.text==tempOption.text){
						lorbox.rightBoxCache.splice(i,1);
						break;
					}
				}
			}
			
			for(var j=0;j<options.length;j++){
				lorbox.rightBoxCache[lorbox.rightBoxCache.length]={id:options[j].id,text:options[j].text,value:options[j].value};				
			}
		}
   };
   lorbox.leftBoxCache=[];
   lorbox.rightBoxCache=[];
   lorbox.isCacheLeftBox = false;
   lorbox.isCacheRightBox = false;
   lorbox.search=function(keywordId,isLeft){
		
		var keyword = document.getElementById(keywordId);
		if(!keyword){
			return;
		}
		keyword=keyword.value;
		keyword=keyword.replace(/(^\s*)|(\s*$)/g, ""); 
		if(keyword==null||keyword==''){
			return;
		}
		
		var newOption = null,optionText=null,tempOption=null,cacheElement;
		/**
		 * 把所有的选项统一加入到缓存数据中
		 */
		var leftBox = lorbox.getBox(true);
		var rightBox = lorbox.getBox();
		var box = isLeft?leftBox:rightBox;
		var isCache = isLeft? lorbox.isCacheLeftBox:lorbox.isCacheRightBox;
		for(var i =0;isCache==false&&i<box.options.length;i++){	
			tempOption = box.options[i];
			cacheElement={id:tempOption.id,text:tempOption.text,value:tempOption.value};
			if(isLeft){
				lorbox.leftBoxCache[lorbox.leftBoxCache.length]=cacheElement;
			}else{
				lorbox.rightBoxCache[lorbox.rightBoxCache.length]=cacheElement;
			}
		}
		
		if(isLeft){
			lorbox.isCacheLeftBox = true;   
		}else{
			lorbox.isCacheRightBox = true;
		}
		
		/**
		 * 先清空所有项
		 */		
		box.options.length=0
		
		/**
		 * 从缓存查看匹配项，并加入到选项中
		 */
		
		var cacheOptioins = isLeft?lorbox.leftBoxCache:lorbox.rightBoxCache;
		// confirm(cacheOptioins.length);
		for(var i =0;i<cacheOptioins.length;i++){
			optionText = cacheOptioins[i].text;
			if(optionText.indexOf(keyword)==-1){
				continue;
			}
			// optionText = optionText.replace(new RegExp(keyword,"gm"),"<font
			// color='red'>"+keyword+"</font>");
			// cacheOptioins[i].text = optionText;
			newOption =	new Option(optionText,cacheOptioins[i].value);
			newOption.id = cacheOptioins[i].id;			
			box.options.add(newOption);		
		}		
	};
	lorbox.reset = function(keywordId,isLeft){
		var keyword = document.getElementById(keywordId);
		if(keyword){
			keyword.value="";
		}
		
		var isCache = isLeft? lorbox.isCacheLeftBox:lorbox.isCacheRightBox;
		if(!isCache){
			return;
		}
		var leftBox = lorbox.getBox(true);
		var rightBox = lorbox.getBox();
		var box = isLeft?leftBox:rightBox;
		/**
		 * 先清空所有项
		 */		
		box.options.length=0
		
		var cacheOptioins = isLeft?lorbox.leftBoxCache:lorbox.rightBoxCache;
		for(var i =0;i<cacheOptioins.length;i++){	
			newOption =	new Option(cacheOptioins[i].text,cacheOptioins[i].value);
			newOption.id = cacheOptioins[i].id;			
			box.options.add(newOption);		
		}
		/*
		 * 存在大批量数据时，需要注意操作方法，即搜索之后，选择（搜索尽可以准确，不要批量选择，要不然仍可能很慢），然后，重置
		 * 通过重置，在大批量数据时，搜索可能变慢，但选择会变快
		 */
		if(isLeft){
			lorbox.isCacheLeftBox = false;  
			lorbox.leftBoxCache=[];
		}else{
			lorbox.isCacheRightBox = false;
			lorbox.rightBoxCache=[];
		}
	};
	lorbox.submit = function(){
		var leftBox = lorbox.getBox(true);
		var rightBox = lorbox.getBox();
		var option = null;
		for( var i = 0; i < rightBox.options.length; i++ ){	
			option=rightBox.options[i];
			option.selected = true;
			//lorbox.lorSelect(rightBox,leftBox,i);							
		}// for
	};
}