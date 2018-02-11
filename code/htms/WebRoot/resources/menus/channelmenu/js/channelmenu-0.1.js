

function MenuItem(code,name,linkURL,target,style,selectStyle){
	var item = this;
	item.code = code;
	item.name = name;
	item.linkURL = linkURL;//?"#":linkURL;
	item.target =target==undefined||target==null||target==''||target=='null'?"":target;
	item.style = style==undefined||style==null||style==''||style=='null'?"channel-menu-item":style;
	item.selectStyle = selectStyle==undefined||selectStyle==null||selectStyle==''||selectStyle=='null'?"channel-menu-item-selected":selectStyle;
}

function ChannelMenu(){
	var channelMenu = this;
	channelMenu.items = [];
	
	channelMenu.loader="";
	
	channelMenu.selectCode=null;
	
	channelMenu.add=function(code,name,linkURL,target,style,selectStyle){
		channelMenu.items[channelMenu.items.length]=new MenuItem(code,name,linkURL,target,style,selectStyle);
	};
	channelMenu.reSelect=function(){
		channelMenu.select(channelMenu.selectCode);
	};
	
	channelMenu.select=function(code){
		if(code==undefined ||code==null ||code==""||code=="null"){
			return ;
		}
		channelMenu.selectCode=code;
		var tempItem = null,tempObject;
		for(var i=0;i<channelMenu.items.length;i++){
			tempItem = channelMenu.items[i];
			tempObject= document.getElementById(tempItem.code);
			if(tempObject==undefined ||tempObject==null ||tempObject==""){
				continue ;
			}
			tempObject.className=tempItem.style;
			if(tempItem.code==code){
				tempObject.className=tempItem.selectStyle;
				channelMenu.load(tempItem);
			}
		}
	};
	
	channelMenu.load=function(item){
		if(channelMenu.loader==undefined ||channelMenu.loader==null ||channelMenu.loader==""){
			return;
		}
		
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
		
		//var random = channelMenu.attacRandomChar(16);
		//var url = item.linkURL;
		//if(url!=null&&url!=""&&url.indexOf("?")!=-1){
		///	url=url+"&__random="+random;
		//}
		//if(url!=null&&url!=""&&url.indexOf("?")==-1){
		//	url=url+"?__random="+random;
		//}
		//confirm("item.linkURL="+item.linkURL);
		loader.src=item.linkURL;
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