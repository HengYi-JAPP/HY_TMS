

function MenuItem(code,parentCode,groupCode,name,linkURL,target,style,selectStyle,showHeight){
	var item = this;
	item.code = code;
	item.parentCode = parentCode;
	item.groupCode = groupCode;
	item.name = name;
	item.linkURL = linkURL;//?"#":linkURL;
	item.target =target==undefined||target==null||target==''||target=='null'?"":target;
	item.style = style==undefined||style==null||style==''||style=='null'?"":style;
	item.selectStyle = selectStyle==undefined||selectStyle==null||selectStyle==''||selectStyle=='null'?"":selectStyle;
	item.showHeight=showHeight;
}

function ChannelMenu(){
	var channelMenu = this;
	channelMenu.navigation=[];
	channelMenu.items = [];
	
	channelMenu.loader="";
	
	channelMenu.selectCode=null;
	channelMenu.lastGroupCode=null;
	channelMenu.hover="cm-item-hover";
	channelMenu.add=function(code,parentCode,groupCode,name,linkURL,target,style,selectStyle,showHeight){
		channelMenu.items[channelMenu.items.length]=new MenuItem(code,parentCode,groupCode,name,linkURL,target,style,selectStyle,showHeight);
	};
	channelMenu.reSelect=function(){
		channelMenu.select(channelMenu.selectCode);
	};
/** 
	 * 获取元素绝对位置
	 * @param object 元素对象，不可空
	 * 
	 * @return 返回(x,y)坐标表示的元素绝对位置
	 **/
	channelMenu.getPosition=function (object) {
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
	};
	channelMenu.reNavigate=function(){
		channelMenu.navigation=[];
		var index=0;
		var tempItem = null,parentCode;
		for(var i=0;i<channelMenu.items.length;i++){
			tempItem=channelMenu.items[i];
			if(tempItem.code==channelMenu.selectCode){
				channelMenu.navigation[index]=tempItem.name;
				parentCode=tempItem.parentCode;
				break;
			}
		}
		//channelMenu.navigation[index]=name;
		var isContinue= true;
		
		do{
			isContinue=false;
			for(var i=0;i<channelMenu.items.length&&isContinue==false;i++){
				tempItem=channelMenu.items[i];
				if(tempItem.code==parentCode){
					index++;
					channelMenu.navigation[index]=tempItem.name;
					parentCode=tempItem.parentCode;
					isContinue=true;
					//break;
				}
			}
			
		}while(isContinue==true)
		/*var nav ="";
		for(var i=0;i<channelMenu.navigation.length;i++){
			nav=nav+">"+channelMenu.navigation[i];
		}*/
		//alert( "navnavnav: " + nav);
	};
	channelMenu.select=function(code){
		if(code==undefined ||code==null ||code==""||code=="null"){
			return ;
		}
		channelMenu.selectCode=code;
		
		var tempItem = null,tempObject,currentObject,boxObject;
		/*先获取子菜单，如果有子菜单对象，即显示该对象*/
		//tempObject= document.getElementById(code+"_SUBBOX");
		//var haxSubMenus = tempObject?true:false;
		
		for(var i=0;i<channelMenu.items.length;i++){
			tempItem = channelMenu.items[i];
			tempObject =document.getElementById(tempItem.code);
			if(!tempObject){
				continue ;
			}
			tempObject.className=tempItem.style;
			
			boxObject= document.getElementById(tempItem.code+"_SUBBOX");
			if(boxObject){
				boxObject.style.display="none";
			}
			
			if(tempItem.code==code){
				tempObject.className=tempItem.style+" "+tempItem.selectStyle;
				channelObject= document.getElementById(tempItem.groupCode);
				channelItem = channelMenu.getItem(tempItem.groupCode);
				if(channelObject&&channelItem){
					channelObject.className=channelItem.selectStyle+" "+channelMenu.hover;
				}
				if(!boxObject){
					
					channelMenu.load(tempItem);
				}else{
					boxObject.style.display="block";
				}//else{
				
				//boxObject= document.getElementById(tempItem.groupCode+"_SUBBOX");
				//alert(channelObject.id);
				//var position= channelMenu.getPosition(channelObject);	
				//if(position){
					//boxObject.style.display="block";
					//position.x=position.x-channelObject.offsetWidth;
					//boxObject.style.left=position.x+"px";
					//position.y =position.y+channelObject.offsetHeight;
					//boxObject.style.top=position.y+"px";
				//}
				//}
			}
			
			
		}
	};
	channelMenu.getItem=function(code){
		if(code==undefined ||code==null ||code==""||code=="null"){
			return null;
		}
		var tempItem = null;
		for(var i=0;i<channelMenu.items.length;i++){
			tempItem = channelMenu.items[i];
			
			if(tempItem.code==code){
				return tempItem;
			}
		}
		return null;
	};
	channelMenu.moveHover=function(code){
		if(code==undefined ||code==null ||code==""||code=="null"){
			return ;
		}
		//channelMenu.selectCode=code;
		
		var currentItem = channelMenu.getItem(code);
		var boxObject = null, channelObject =null,position=null,channelItem=null;
		//
		if(channelMenu.lastGroupCode!=currentItem.groupCode){
			//alert("channelMenu.lastGroupCode="+channelMenu.lastGroupCode+", currentItem.groupCode="+currentItem.groupCode);
			boxObject= document.getElementById(channelMenu.lastGroupCode+"_SUBBOX");			
			if(boxObject){
				boxObject.style.display="none";
			}
			channelObject = document.getElementById(channelMenu.lastGroupCode);
			if(channelObject){
				channelItem = channelMenu.getItem(channelMenu.lastGroupCode);
				if(channelItem){
					channelObject.className=channelItem.style;
				}
			}
			
			boxObject= document.getElementById(currentItem.groupCode+"_SUBBOX");
			channelObject = document.getElementById(currentItem.groupCode);
			if(boxObject&&channelObject){
				position= channelMenu.getPosition(channelObject);	
				if(position){
					boxObject.style.display="block";
					boxObject.style.left=position.x+"px";
					position.y =position.y+channelObject.offsetHeight-4;
					boxObject.style.top=position.y+"px";
				}
			}
			
			channelItem = channelMenu.getItem(currentItem.groupCode);
			if(channelItem&&channelObject){
				channelObject.className=channelItem.selectStyle+" "+channelMenu.hover;
				//alert("channelObject.className="+channelObject.className);
			}
			
			channelMenu.lastGroupCode=currentItem.groupCode;
		}
		//if(currentItem.groupCode==currentItem.code){
		//	return;
		//}
		
		
		for(var i=0;i<channelMenu.items.length;i++){
			tempItem = channelMenu.items[i];
			if(tempItem.code==tempItem.groupCode){/*频道菜单直接跳过*/
				continue;
			}
			
			tempObject =document.getElementById(tempItem.code);
			if(tempObject==undefined ||tempObject==null ||tempObject==""){
				continue ;
			}
			
			if(tempItem.code==code){
				tempObject.className=tempItem.selectStyle+" "+channelMenu.hover;
			}else{
				tempObject.className=tempItem.style;
			}			
		}
	};
	channelMenu.load=function(item){
		if(channelMenu.loader==undefined ||channelMenu.loader==null ||channelMenu.loader==""){
			return;
		}
		//alert(item.linkURL);
		if(item.target=='_self'){
			var currentWindow =channelMenu.getWindow();
			currentWindow.location.href = item.linkURL;
			return;
		}
		
		if(item.target=='_blank'){
			var currentWindow =channelMenu.getWindow();
			currentWindow.open(item.linkURL);
			return;
		}
		
		var loader = document.getElementById(channelMenu.loader);
		if(loader==undefined ||loader==null ||loader==""||loader.tagName!="IFRAME"){
			return;
		}
		
		var random = channelMenu.attacRandomChar(16);
		var url = item.linkURL;
		if(url!=null&&url!=""&&url.indexOf("?")!=-1){
			url=url+"&__random="+random;
		}
		if(url!=null&&url!=""&&url.indexOf("?")==-1){
			url=url+"?__random="+random;
		}
		//confirm("item.linkURL="+item.linkURL);
		//resize to default height
		//loader.style.height="680px";
		//alert("loader.style.height="+loader.style.height);
		//confirm("item.showHeight===="+item.showHeight);
		if(item.showHeight){
			loader.height=item.showHeight;
		}
		loader.src=url;
	};
	
	channelMenu.getWindow=function(){
		var currentWindow = window;
		while(currentWindow.parent&&currentWindow.parent!=currentWindow.self){
			currentWindow =currentWindow.parent;
		}
		return currentWindow;
	};
	channelMenu.attacRandomChar=function(len)  {
		var  x="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
		var  tmp="";
		var slen = len?len:64;
		for(var  i=0;i<slen;i++)  {
			tmp  +=  x.charAt(Math.ceil(Math.random()*100000000)%x.length);
		}

		return  tmp
	};
	
}

var __channelMenu = new ChannelMenu();