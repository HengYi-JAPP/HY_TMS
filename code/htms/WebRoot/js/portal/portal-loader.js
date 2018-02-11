var __system_switch=true;
var __channel_switch=true;
var __layout_switch=true;
var __column_switch=true;
var __current_layout_id=null;
/**
 * 通过ajax更新系统后重新加载页面
 * @return
 */
function SystemReloader(){
	var __responseText;	
	this.ajaxCallBack= function(httpText){
		__responseText = httpText;
		//confirm("window.location.reload();");
		//alert("__responseText:"+__responseText);
		window.location.href=__responseText;			
	}
}
var __systemReloader = new SystemReloader();
/**
 * 选择频道后，记录用户当前查看的频道
 * 用户再次登录时，可以查看到退出时所选择的频道
 * @param channelId
 * @return
 */
function selectChannel(channelId){
	var operation = "updateChannel_of_commonSystem";
	var implClass = "com.mobilecn.portal.updater.ChannelUpdater";
	var params = "&operation="+operation+"&channelId="+channelId+"&ajaxImplClass="+implClass;
	var ajax = new Ajax();
	ajax.setUrl("ajax/portal"); 
	ajax.setMethod("post");
 	//ajax.setCallBackObject(null);	
	//ajax.setParameters(params); 
	//ajax.invokeAjax(); 
}

/**
 * 选择布局后，记录用户当前查看的布局
 * 用户再次登录时，可以查看到退出时所选择的布局
 * @param channelId
 * @return
 */
function selectLayout(layoutId,currentSysId,currentSysCode,currentChannelId){
	__current_layout_id=layoutId;
	var operation = "updateLayout_of_commonSystem";
	var implClass = "com.mobilecn.portal.updater.LayoutUpdater";
	var params = "&operation="+operation+"&currentSysId="+currentSysId+"&currentSysCode="+currentSysCode+"&currentChannelId="+currentChannelId+"&layoutId="+layoutId+"&ajaxImplClass="+implClass;
	var ajax = new Ajax();
	 ajax.setUrl("ajax/portal"); 
	 ajax.setMethod("post");
 	 ajax.setCallBackObject(null);	
	 ajax.setParameters(params); 
	 ajax.invokeAjax(); 
	 reloadLayout(layoutId,currentSysId,currentSysCode,currentChannelId);
}

function reloadLayout(layoutId,currentSysId,currentSysCode,currentChannelId){
	 var selectableLayout=document.getElementsByName("__selectableLayout");
	 if(selectableLayout!=null){
		 var layout=null;
		 for(var i=0;i<selectableLayout.length;i++){
			 layout=selectableLayout[i];
			 layout.className="layout-list-box-layout-box-layout";
			 if(layout.id==layoutId){
				 layout.className="layout-list-box-layout-box-layout-selected";
			 }
		 }
	 }
	 if(layoutId){
		 parent.document.getElementById("__layoutLoader").src="layoutLoader.jsp?layoutId="+layoutId+"&currentChannelId="+currentChannelId+"&currentSysId="+currentSysId+"&currentSysCode="+currentSysCode;
	 }else{
		 parent.document.getElementById("__layoutLoader").src=parent.document.getElementById("__layoutLoader").src;
	 }
}

function resetLayoutColumn(){
	var operation = "cleanUserLayoutColumn";
	var implClass = "com.mobilecn.portal.updater.ColumnUpdater";
	var params = "&operation="+operation;
	var ajax = new Ajax();
	ajax.setMethod("post");
	ajax.setParameters(params); 
	ajax.invokeAjax(); 
	reloadLayout(__current_layout_id);
}
/**
 * 更新用户选中的主题类型
 * @param tdtId
 * @return
 * 
 */
function updateThemesType(themesId,tdtId){
	var operation = "defineUserDefineType";
	var implClass = "com.mobilecn.portal.updater.ChannelUpdater";
	var params = "&operation="+operation+"&themesId="+themesId+"&tdtId="+tdtId;
	var ajax = new Ajax();
	 //ajax.setUrl(null); 
	 ajax.setMethod("post");
 	 //ajax.setCallBackObject(__ThemesTypeReloader);	
	 ajax.setParameters(params); 
	 ajax.invokeAjax(); 
}

function ThemesTypeReloader(){
	var __responseText;	
	this.ajaxCallBack= function(httpText){
		__responseText = httpText;
		//confirm("window.location.reload();");
		
		parent.window.location.reload();			
	}
}
var __ThemesTypeReloader = new ThemesTypeReloader();

function doKeywordSearch(keyword,currentSysCode){
	if(!currentSysCode||!document.getElementById(keyword)||!document.getElementById(keyword).value){
		alert("Please Enter Keyword to Search!");
		return;
	}
	var searchURL="contoller.do?operation=searchWebSiteNewsList&currentSysCode="+currentSysCode+"&keyword="+document.getElementById(keyword).value;
	searchURL=BASE64.encoder(searchURL);  
	document.getElementById("newPageContentUrl").value=searchURL;
	//document.getElementById("searchButton").href=document.getElementById("newPageLoader4SearchURL").value+"?newPageContentUrl="+searchURL+"&currentSysCode="+currentSysCode;
	//document.getElementById("searchButton").click();
	document.getElementById("searchForm").submit();
}
