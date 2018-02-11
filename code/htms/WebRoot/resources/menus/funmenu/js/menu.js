var _systemMenus = [];

function MenuItem(id,parentId,name,showOrder,url,level){
	var item = this;
	item.id=id;
	item.name=name;
	item.parentId=parentId;
	item.showOrder=showOrder==undefined||showOrder==null?0:showOrder;
	item.url=url;
	
	item.icons="";
	
	item.level=level==undefined||level==null?0:level;
	item.isRoot=false;
	item.isLeaf=false;
	item.isAppend=false;
	item.htmlElement=null;
	item.childContainer=null;
}

function OuterIds(){
	var outerIds = this;
	outerIds.menuBoxId = "menuDiv";//包含左边菜单的标签ID
	outerIds.menuBoxTitle = "Function Menus";//左边菜单的总称
	outerIds.contenFrameId = "mainContent";//加载内容的iframe的ID
}
var _outerIds = new OuterIds();
function MenuStyle(){
	var menuStyle = this;
	menuStyle.leafNodeTrClass = "system-menu-list-line";
	menuStyle.leafNodeTdClass = "system-menu-list-tr-td";
	menuStyle.leafNodeImgClass = "";
	menuStyle.leafNodeImgSrc = "";
	
	menuStyle.middleNodeTrClass = "system-menu-lvl2";
	menuStyle.middleNodeTdClass = "";
	menuStyle.middleNodeImgClass = "";
	menuStyle.middleNodeImgSrc = "";
	
	menuStyle.rootNodeTrClass = "system-menu-lvl1 system-menu-lvl1-current";
	menuStyle.rootNodeTdClass = "";
	menuStyle.rootNodeImgClass = "";
	menuStyle.rootNodeImgSrc = "resources/menus/funmenu/images/edit.gif";
	
	menuStyle.rootNodeChildContainerTableClass = "system-menu-lvl2-table";
	menuStyle.rootNodeChildContainerTrClass = "";
	menuStyle.rootNodeChildContainerTdClass = "system-menu-content-warpper";
	menuStyle.rootNodeChildContainerDivClass = "system-menu-inner-scoller";
	
	menuStyle.middleNodeChildContainerTableClass = "system-menu-list";
	menuStyle.middleNodeChildContainerTrClass = "";
	menuStyle.middleNodeChildContainerTdClass = "";
	menuStyle.middleNodeChildContainerDivClass = "";
	
	menuStyle.menuContainerTableClass ="system-menu-table";
	menuStyle.menuContainerTheadClass ="";
	menuStyle.menuContainerTrClass ="";
	menuStyle.menuContainerTdClass ="";
	menuStyle.menuContainerImgClass ="";
	menuStyle.menuContainerImgSrc ="resources/menus/funmenu/images/menu.gif";
	
	menuStyle.selectedClass = "system-menu-list-current-td";
}	


var _rootMenus = new Array();
var _menuStyle = new MenuStyle();

function Menu(){
	var menu = this;
	menu.paddingUint =20;
	menu.createMenuItem = function(){
		var menuItem=null,htmlElement;
		for(var i=0;i<_systemMenus.length;i++){
			menuItem = _systemMenus[i];	
			
			if(menuItem.isRoot==false&&menuItem.isLeaf==false){//创建中间结点
				htmlElement = menu.getMiddleNodeHtmlElement(menuItem);
			}else if(menuItem.isLeaf){//创建叶子结点		
				htmlElement =menu.getLeafHtmlElement(menuItem);	
			}else if(menuItem.isRoot==true){//创建第一级结点				
				htmlElement = menu.getRootHtmlElement(menuItem);			
			}
			
			_systemMenus[i].htmlElement=htmlElement;
		}
	};
	/*
	menu.getRootHtmlElement =function(menuItem){//获得第一层结点的HTML元素
			var htmlTd,htmlTr,htmlImg;
			
			htmlTd = document.createElement("td");
			htmlTd.className =  _menuStyle.rootNodeTdClass;//设置第一级结点文字样式	
			
			if( _menuStyle.rootNodeImgSrc!=null&& _menuStyle.rootNodeImgSrc!=""){
				htmlImg = document.createElement("img");
				htmlImg.className = _menuStyle.rootNodeImgClass;;
				htmlImg.src = _menuStyle.rootNodeImgSrc;
				htmlTd.appendChild(htmlImg);
			}
			
			htmlTd.innerHTML = htmlTd.innerHTML + menuItem.name;
			
			htmlTr = document.createElement("tr");					
			htmlTr.className = _menuStyle.rootNodeTrClass;//设置第一级结点整体样式
			
			htmlTr.setAttribute("onclick","onMenuClick('"+menuItem.id+"',null,false);");
			htmlTr.appendChild(htmlTd);
		
			return htmlTr;
	};
	menu.getLeafHtmlElement =function(menuItem){//获得叶子结点的HTML元素
			var htmlTd,htmlTr,htmlImg;
						
			htmlTd = document.createElement("td");			
			htmlTd.className = _menuStyle.leafNodeTdClass;//设置叶子结点文字样式
			
			if( _menuStyle.leafNodeImgSrc!=null&& _menuStyle.leafNodeImgSrc!=""){
				htmlImg = document.createElement("img");
				htmlImg.className = _menuStyle.leafNodeImgClass;
				htmlImg.src = _menuStyle.leafNodeImgSrc;
				htmlTd.appendChild(htmlImg);
			}
			htmlTd.style.paddingLeft =(menuItem.level-1)* menu.paddingUint;
			htmlTd.innerHTML = htmlTd.innerHTML + menuItem.name;
			
			htmlTr = document.createElement("tr");
			htmlTr.className = _menuStyle.leafNodeTrClass;//设置叶子结点整体样式			
 
			//htmlTr.setAttribute("onclick","onMenuClick('"+menuItem.id+"','"+menuItem.url+"',true);");	
			htmlTr.setAttribute("onclick","DataGridClick_SetColor(this),onMenuClick('"+menuItem.id+"','"+menuItem.url+"',true);");
			//htmlTr.setAttribute("onmouseover","DataGridClick_SetColor(this);");
			htmlTr.appendChild(htmlTd);
			
			return htmlTr;
	};
	menu.getMiddleNodeHtmlElement =function(menuItem){//获得中间层结点的HTML元素
			var htmlTd,htmlTr,htmlImg;
			
			htmlTd = document.createElement("td");			
			htmlTd.className = _menuStyle.middleNodeTdClass;//设置第一级结点文字样式
			if( _menuStyle.middleNodeImgSrc!=null&& _menuStyle.middleNodeImgSrc!=""){
				 htmlImg = document.createElement("img");
				 htmlImg.className = _menuStyle.middleNodeImgClass;
				 htmlImg.src = _menuStyle.middleNodeImgSrc;
				 htmlTd.appendChild(htmlImg);
			}
			htmlTd.style.paddingLeft =(menuItem.level-1)* menu.paddingUint;
			htmlTd.innerHTML = htmlTd.innerHTML + menuItem.name;
			
			htmlTr = document.createElement("tr");
			htmlTr.className = _menuStyle.middleNodeTrClass;//设置第一级结点整体样式
						
			htmlTr.appendChild(htmlTd);			
			htmlTr.setAttribute("onclick","onMenuClick('"+menuItem.id+"',null,false);");
			
			
			return htmlTr;
	};*/
	menu.getRootHtmlElement =function(menuItem){//获得第一层结点的HTML元素
		var htmlTd,htmlTr,htmlImg;
		
		htmlTd = document.createElement("td");
		htmlTd.className =  _menuStyle.rootNodeTdClass;//设置第一级结点文字样式	
		
		if( _menuStyle.rootNodeImgSrc!=null&& _menuStyle.rootNodeImgSrc!=""){
			htmlImg = document.createElement("img");
			htmlImg.className = _menuStyle.rootNodeImgClass;;
			htmlImg.src = _menuStyle.rootNodeImgSrc;
			htmlTd.appendChild(htmlImg);
		}
		
		htmlTd.innerHTML = htmlTd.innerHTML + menuItem.name;
		
		htmlTr = document.createElement("tr");					
		htmlTr.className = _menuStyle.rootNodeTrClass;//设置第一级结点整体样式
		
		htmlTr.setAttribute("onclick","onMenuClick(this,'"+menuItem.id+"',null,false);");
		htmlTr.appendChild(htmlTd);
	
		return htmlTr;
	};
	menu.getLeafHtmlElement =function(menuItem){//获得叶子结点的HTML元素
			var htmlTd,htmlTr,htmlImg;
						
			htmlTd = document.createElement("td");			
			htmlTd.className = _menuStyle.leafNodeTdClass;//设置叶子结点文字样式
			
			if( _menuStyle.leafNodeImgSrc!=null&& _menuStyle.leafNodeImgSrc!=""){
				htmlImg = document.createElement("img");
				htmlImg.className = _menuStyle.leafNodeImgClass;
				htmlImg.src = _menuStyle.leafNodeImgSrc;
				htmlTd.appendChild(htmlImg);
			}
			htmlTd.style.paddingLeft =(menuItem.level-1)* menu.paddingUint;
			htmlTd.innerHTML = htmlTd.innerHTML + menuItem.name;
			
			htmlTr = document.createElement("tr");
			htmlTr.className = _menuStyle.leafNodeTrClass;//设置叶子结点整体样式			
	
			//htmlTr.setAttribute("onclick","onMenuClick('"+menuItem.id+"','"+menuItem.url+"',true);");	
			htmlTr.setAttribute("onclick","DataGridClick_SetColor(this),onMenuClick(this,'"+menuItem.id+"','"+menuItem.url+"',true);");
			//htmlTr.setAttribute("onmouseover","DataGridClick_SetColor(this);");
			htmlTr.appendChild(htmlTd);
			
			return htmlTr;
	};
	menu.getMiddleNodeHtmlElement =function(menuItem){//获得中间层结点的HTML元素
		var htmlTd,htmlTr,htmlImg;
		
		htmlTd = document.createElement("td");			
		htmlTd.className = _menuStyle.middleNodeTdClass;//设置第一级结点文字样式
		if( _menuStyle.middleNodeImgSrc!=null&& _menuStyle.middleNodeImgSrc!=""){
			 htmlImg = document.createElement("img");
			 htmlImg.className = _menuStyle.middleNodeImgClass;
			 htmlImg.src = _menuStyle.middleNodeImgSrc;
			 htmlTd.appendChild(htmlImg);
		}
		htmlTd.style.paddingLeft =(menuItem.level-1)* menu.paddingUint;
		htmlTd.innerHTML = htmlTd.innerHTML + menuItem.name;
		
		htmlTr = document.createElement("tr");
		htmlTr.className = _menuStyle.middleNodeTrClass;//设置第一级结点整体样式
					
		htmlTr.appendChild(htmlTd);			
		htmlTr.setAttribute("onclick","onMenuClick(this,'"+menuItem.id+"',null,false);");
		
		
		return htmlTr;
};
	
	menu.getRootChildContainer =function(menuItem,childArray){//获得中间层结点所包含的所有子结点的HTML元素
			var htmlContainer= document.createElement("table");
			htmlContainer.className=_menuStyle.rootNodeChildContainerTableClass;//设置根结点子菜单样式
			
			//拼接所有子结点
			for(var j = 0;j<childArray.length;j++){						
				htmlContainer.appendChild(childArray[j].htmlElement);
				if(childArray[j].isLeaf==false){//对于非叶子结点，除了拼接结点本身之外，还要拼接相关的子结点
					htmlContainer.appendChild(childArray[j].childContainer);
				}
			}
			var rootMenuBox = document.createElement("div");
			rootMenuBox.className=_menuStyle.rootNodeChildContainerDivClass;
			rootMenuBox.appendChild(htmlContainer);
			
			var htmlTd =  document.createElement("td");
			htmlTd.className=_menuStyle.rootNodeChildContainerTdClass;
			htmlTd.appendChild(rootMenuBox);
			
			var htmlTr =  document.createElement("tr");
			htmlTr.className=_menuStyle.rootNodeChildContainerTrClass;
			htmlTr.id = menuItem.id;
			htmlTr.appendChild(htmlTd);
			
			return htmlTr;
	};
	
	menu.getMiddleNodeChildContainer =function(menuItem,childArray){//获得中间层结点所包含的所有子结点的HTML元素
		var htmlContainer= document.createElement("table");
		htmlContainer.className=_menuStyle.middleNodeChildContainerTableClass;//设置中间点子菜单样式
		
		//拼接所有子结点
		for(var j = 0;j<childArray.length;j++){
			htmlContainer.appendChild(childArray[j].htmlElement);
			if(childArray[j].isLeaf==false){//对于非叶子结点，除了拼接结点本身之外，还要拼接相关的子结点
				htmlContainer.appendChild(childArray[j].childContainer);
			}
		}
		
		var htmlTd =  document.createElement("td");
		htmlTd.className=_menuStyle.middleNodeChildContainerTdClass;
		htmlTd.appendChild(htmlContainer);
		
		var htmlTr =  document.createElement("tr");
		htmlTr.className=_menuStyle.middleNodeChildContainerTdClass;
		htmlTr.id = menuItem.id;
		htmlTr.appendChild(htmlTd);
		
		return htmlTr;
	};
	
	menu.isRoot = function(parentId){
		for(var i=0;i<_systemMenus.length;i++){
			if(parentId == _systemMenus[i].id){
				return false;
			}
		}
		return true;
	};
	
	menu.isLeaf = function(id){
		for(var i=0;i<_systemMenus.length;i++){
			if(id == _systemMenus[i].parentId){
				return false;
			}
		}
		return true;
	};
	
		
	menu.getChildren = function(id){
		var childArray = new Array();
		for(var j=0;j<_systemMenus.length;j++){
			if(id==_systemMenus[j].parentId){	
				childArray[childArray.length]= _systemMenus[j];	
			}
		}
		return childArray;
	};
	
	menu.ascOrder=function (sourceArray) {
		for (var i = sourceArray.length - 2; i >= 0  ; i--) {
	  		for (var j = sourceArray.length - 1; j >=  sourceArray.length - 1 - i; j--) {
	    		if (sourceArray[j].showOrder > sourceArray[j - 1].showOrder) {
					var temp = sourceArray[j];
		    		sourceArray[j] = sourceArray[j - 1];
		    		sourceArray[j - 1] = temp;
	    		}
	   		}   
	 	}
	  
	 	var targetArray = new Array();
	  	for (var i = sourceArray.length - 1,j=0; i >=0;i--,j++) {
	  		targetArray[j] =sourceArray[i];
	  	}
	  
	 	return targetArray
	};
	
	menu.getLevel = function(parentId){//按当前结点的父ID确定当前结点到根结点的层数
		var level = 1,isStop = false;
		while(isStop==false){
			isStop = true;
			for(var j=0;j<_systemMenus.length;j++){
				if(parentId==_systemMenus[j].id){	
					parentId = _systemMenus[j].parentId;
					isStop = false;
					level=level+1;	
					break;
				}//有父结点，层次加1，进入下一循环
			}//for			
		}//while
		
		return level;
	};
	menu.nodeAnalyze = function(){
		var isRoot=true,isLeaf;
		for(var i=0;i<_systemMenus.length;i++){			
			_systemMenus[i].isRoot = isRoot = menu.isRoot(_systemMenus[i].parentId);
			if(isRoot==true){				
				_rootMenus[_rootMenus.length]=_systemMenus[i];//记录根结点	
				_systemMenus[i].level=1;//标记根结点的层次为1		
			}else{
				_systemMenus[i].level=menu.getLevel(_systemMenus[i].parentId);
			}
			_systemMenus[i].isLeaf=menu.isLeaf(_systemMenus[i].id);
		}
	};
	
	menu.appendChild = function(){
		var isStop = false;var childArray,isAllowAppend=true,menuItem=null;
		while(isStop==false){//
			isStop = true;//假设停止
			
			for(var i=0; i< _systemMenus.length;i++){
				menuItem =_systemMenus[i];
				if(menuItem.isLeaf==true){//检测存在有没有拼接的结点，叶子结点跳过
					continue;
				}else{
					if(menuItem.isAppend==true){//检测存在有没有拼接的结点，已经拼接的结点跳过
						continue;
					}
				}
				
				isStop = false;//存在有没有拼接的结点，则需要继续检测后续结点				
				
				childArray = menu.getChildren(menuItem.id);//获取当前结点的所有子结点
				if(childArray.length==0)continue;//子结点长度为空，此步逻辑上可以不判断，因childArray.length==0意味着是叶子结点
				//检测是否子结点都是叶子结点，或者说是已经拼接过的结点，如果存在非叶子结点且未接拼接，则跳过该结点。
				isAllowAppend=true;//默认允许拼接该结点
				for(var j = 0;j<childArray.length;j++){
					if(childArray[j].isLeaf==false&&childArray[j].isAppend==false){//判断是否存在非叶子结点且未接拼接
						isAllowAppend = false;//不允许拼接该结点
						break;
					}
				}
				
				if(isAllowAppend==false)continue;//跳过该结点
				
				childArray = menu.ascOrder(childArray);//对需要拼接的结点进行顺序排序
				
				if(menuItem.isRoot==true){//根结点					
					//_systemMenus[i]不能用menuItem代替
					_systemMenus[i].childContainer = menu.getRootChildContainer(menuItem,childArray);
						
				}else{//中间结点					
					//_systemMenus[i]不能用menuItem代替
					_systemMenus[i].childContainer = menu.getMiddleNodeChildContainer(menuItem,childArray);
				}
				
				_systemMenus[i].isAppend=true;//_systemMenus[i]不能用menuItem代替				
				
			}//for
		}//while		
	};
	menu.getMenuContainer = function(){
		//--------------------------------------------------------
		//创建功能菜单头
		
		
		var td =  document.createElement("td");
		td.className=_menuStyle.menuContainerTdClass;
		if(_menuStyle.menuContainerImgSrc!=null&&_menuStyle.menuContainerImgSrc!=""){
			var img =  document.createElement("img");
			img.className=_menuStyle.menuContainerImgClass;
			img.src = _menuStyle.menuContainerImgSrc;
			td.appendChild(img);
		}
		td.innerHTML = td.innerHTML+_outerIds.menuBoxTitle;
		
		var tr =  document.createElement("tr");	
		tr.className=_menuStyle.menuContainerTrClass;
		tr.appendChild(td);
		
		var thead =  document.createElement("thead");
		thead.className=_menuStyle.menuContainerTheadClass;
		thead.appendChild(tr);
		
    	var menuContainer = document.createElement("table");
		menuContainer.className = _menuStyle.menuContainerTableClass;
		menuContainer.appendChild(thead);
		
		return menuContainer;
	};
	menu.createMenus = function(){
    	var menuContainer =menu.getMenuContainer();
		
		menu.nodeAnalyze();
		menu.createMenuItem();
		
		menu.appendChild();	
			
		_rootMenus=menu.ascOrder(_rootMenus);
		for(var i=0;i<_rootMenus.length;i++){
			menuContainer.appendChild(_rootMenus[i].htmlElement);
			if(_rootMenus[i].childContainer!=null)
			menuContainer.appendChild(_rootMenus[i].childContainer);
		}
		
		return menuContainer;
	};
	
	/**
	 展现菜单。
	 @return 无。
	**/
	menu.display = function(){
		var menuElement = document.getElementById(_outerIds.menuBoxId);
		if(menuElement==undefined||menuElement==null){
			confirm("menuElement==undefined||menuElement==null");
			return;
		}
		
		//--------------------------------------------------------
		//创建功能菜单		
    	var menuContainer =menu.createMenus();
    	
		//--------------------------------------------------------
    	//增加一行，确保菜单项比较少时，不下沉
		td =  document.createElement("td");
		td.setAttribute("style","height:100%");
		
		tr = document.createElement("tr");	
		tr.appendChild(td);
		menuContainer.appendChild(tr);
		
		var tmp = document.createElement("div");
		tmp.appendChild(menuContainer);
		menuElement.innerHTML = tmp.innerHTML;
	}
}

function attacRandomChar(len)  {
	var  x="ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
	var  tmp="";
	var slen = len?len:64;
	for(var  i=0;i<slen;i++)  {
		tmp  +=  x.charAt(Math.ceil(Math.random()*100000000)%x.length);
	}

	return  tmp
}
var __attachRandom=false;
var __randomLen=64;
var __random="rid";
/**
 菜单点击事件，isLeaf=true时，按菜单的url地址加载页面；isLeaf=false时，按菜单id展开或收起子菜单项。
 @param，isLeaf=true时，不菜单的url地址；isLeaf=false时，菜单id。
 @isLeaf，是否是叶子结点标识
 @return 无。
**/
var lastClickTr;
/*function onMenuClick(id,url,isLeaf){
	var item = document.getElementById(id);
	
	//confirm(item.innerHTML);
	if(isLeaf==false){			
		if(item.style.display.toLowerCase()=="none"){
			item.style.display='';
			
		}else{	
			item.style.display='none';
		}
	}else{
		//system-menu-list-tr-td
		 //obj.color = "#dddddd";
		if(__attachRandom==true){
			if(url!=null&&url!=""&&url.indexOf("?")!=-1){
				url=url+"&"+__random+"="+attacRandomChar(__randomLen);
			}
			if(url!=null&&url!=""&&url.indexOf("?")==-1){
				url=url+"?"+__random+"="+attacRandomChar(__randomLen);
			}
		}
		 document.getElementById(_outerIds.contenFrameId).src=url;
		
		 
	     if (lastClickTr != null && lastClickTr != item) {
	        lastClickTr.childNodes[0].className = "system-menu-list-tr-td";
	     }
	     lastClickTr = item;
		
		//item.childNodes[0].className = _menuStyle.selectedClass;
		// alert("叶子");
	}
};*/

function onMenuClick(obj,id,url,isLeaf){
	var item = document.getElementById(id);
	
	//confirm(item.innerHTML);
	if(isLeaf==false){			
		if(item.style.display.toLowerCase()=="none"){
			item.style.display='';
			obj.style.background="url(resources/menus/funmenu/images/arrow-down.png) no-repeat 196px center #eff3f7";
		}else{	
			item.style.display='none';
			obj.style.background="url(resources/menus/funmenu/images/arrow-right.png) no-repeat 196px center #eff3f7";
		}
	}else{
		//system-menu-list-tr-td
		 //obj.color = "#dddddd";
		if(__attachRandom==true){
			if(url!=null&&url!=""&&url.indexOf("?")!=-1){
				url=url+"&"+__random+"="+attacRandomChar(__randomLen);
			}
			if(url!=null&&url!=""&&url.indexOf("?")==-1){
				url=url+"?"+__random+"="+attacRandomChar(__randomLen);
			}
		}
		 document.getElementById(_outerIds.contenFrameId).src=url;
		
		 
	     if (lastClickTr != null && lastClickTr != item) {
	        lastClickTr.childNodes[0].className = "system-menu-list-tr-td";
	     }
	     lastClickTr = item;
		
		//item.childNodes[0].className = _menuStyle.selectedClass;
		// alert("叶子");
	}
};

var lastClickRow = undefined;
/*function DataGridClick_SetColor(obj) {

    if (lastClickRow == undefined) {

        SetDridRowColor(obj, "#f0f5fd", "#000000");
        lastClickRow = obj;
    }
    else if (obj != lastClickRow) {

        SetDridRowColor(lastClickRow, lastClickRow.style.backgroundColor, lastClickRow.style.color);
        SetDridRowColor(obj, "#f0f5fd", "#000000");
        lastClickRow = obj;
    }
}*/
/*function SetDridRowColor(rowObj, bgcolor, color) {
for (var i = 0; i < rowObj.childNodes.length; i++) {
    rowObj.childNodes[i].style.backgroundColor = bgcolor;

}
}*/

function DataGridClick_SetColor(obj) {

    if (lastClickRow == undefined) {

        SetDridRowColor(obj, "", "#2889c4","url(resources/menus/funmenu/images/sub-menu-on.png) no-repeat 15px #f9fafb");
        lastClickRow = obj;
    }
    else if (obj != lastClickRow) {

        SetDridRowColor(lastClickRow, lastClickRow.style.backgroundColor, lastClickRow.style.color,lastClickRow.style.background);
        SetDridRowColor(obj, "", "#2889c4","url(resources/menus/funmenu/images/sub-menu-on.png) no-repeat 15px #f9fafb");
        lastClickRow = obj;
    }
}
function SetDridRowColor(rowObj, bgcolor, color,background) {
    for (var i = 0; i < rowObj.childNodes.length; i++) {
        //rowObj.childNodes[i].style.backgroundColor = bgcolor;
        rowObj.childNodes[i].style.color = color;
        rowObj.childNodes[i].style.background = background;
    }
}


function addMenuItem(id,parentId,name,showOrder,url){
	var item = new MenuItem(id,parentId,name,showOrder,url);
	_systemMenus[_systemMenus.length]=item;
} 

function showMenu(){
	var m = new Menu();
	m.display();
}

