function UploadOperation(uploadSetting){
	this.operationSettings = uploadSetting;
	this.isShowInfoList = uploadSetting?uploadSetting.show_info_list:false; 
	this.show_element_id =this.isShowInfoList ? uploadSetting.show_element_id:null;
	
	this.operation ={
			SAVE:"save",
			LIST:"list",
			REMOVE:"remove",
			CLEAN:"clean",
			LOAD:"load"
	}
	this.load = function (loadFileIds){
		if(!loadFileIds){
			return;
		}
		cleanUploadCache();
		//alert("loadFileIds.length="+loadFileIds.length);
		var params = this.getAjaxRequest();
		for(var i=0;i<loadFileIds.length;i++){
			params = params+"&loadFileId="+loadFileIds[i];
		}
		var callBackObject = new ListCallBack(this.operationSettings.uploader,this.show_element_id,this.operationSettings.upload_url,this.operationSettings.loadSettings);
		this.ajaxInvoke(this.operation.LOAD, params, callBackObject);	
	};
	/**
	 * 返回上传文件的列表
	 * 数据为JS数据，数据结构为
	 * fileId,fileSize,fileFormat,diskPath,createTime,modifyTime
	 */
	this.list = function () {
		if(!this.isShowInfoList){
			return;
		}
		//var listElementId="listElementId";
		var callBackObject = new ListCallBack(this.operationSettings.uploader,this.show_element_id,this.operationSettings.upload_url,this.operationSettings.loadSettings);
		this.ajaxInvoke(this.operation.LIST, this.getAjaxRequest(), callBackObject);		
	};
	/**
	 * 删除指定的文件
	 * 删除包括：
	 * 1）清除对应的缓存记录；
	 * 2）删除服务器上的文件；
	 */
	this.remove= function(fileId){
		if(!this.isShowInfoList){
			return;
		}
		//var listElementId="listElementId";
		
		var callBackObject = new ListCallBack(this.operationSettings.uploader,this.show_element_id,this.operationSettings.upload_url,this.operationSettings.loadSettings);
		var params ="&removeFileIdValue="+fileId
		params = params+this.getAjaxRequest();
		this.ajaxInvoke(this.operation.REMOVE, params, callBackObject);
	};
	/**
	 * 上传的文件没有起到实际作用，上传了，但没有进行保存操作，就退出；
	 * 清除缓存中的记录
	 * 同时删除服务器上的文件；
	 */
	this.clean = function(){
		//var callBackObject = new ListCallBack();
		this.ajaxInvoke(this.operation.CLEAN, this.getAjaxRequest(), null);	
	};
	
	/**
	 * 将文件保存到文件库中
	 */
	this.saveFileStore = function(){
		this.ajaxInvoke(this.operation.SAVE, this.getAjaxRequest(), null);	
	}
	
	/**
	 * 获取请求参数
	 */
	this.getAjaxRequest = function (){
		if(!this.operationSettings){
			alert("this.operationSettings is null.");
			return "";
		}
		//alert("this.operationSettings.uploader="+this.operationSettings.uploader);
		var params = "&uploader="+this.operationSettings.uploader;
		params = params + "&fileStroeImplClass="+this.operationSettings.post_params.fileStroeImplClass;
		params = params + "&fileId="+this.operationSettings.post_params.fileId;
		params = params + "&fileName="+this.operationSettings.post_params.fileName;
		params = params + "&fileFormat="+this.operationSettings.post_params.fileFormat;
		params = params + "&fileSize="+this.operationSettings.post_params.fileSize;
		params = params + "&diskPath="+this.operationSettings.post_params.diskPath;
		params = params + "&createTime="+this.operationSettings.post_params.createTime;
		params = params + "&cacheScope="+this.operationSettings.post_params.cacheScope;
		return params;
	}
	/**
	 * 
	 */
	this.ajaxInvoke = function (operation,params,callBackObject){
		if(params){
			params="&operation="+operation+"&uploader="+this.operationSettings.uploader+params;
		}else{
			params="&operation="+operation+"&uploader="+this.operationSettings.uploader;
		}
		//alert("params="+params);
		var ajax = new Ajax();
		 ajax.setUrl(this.operationSettings.upload_url); 
		 ajax.setMethod("post");
	 	 ajax.setCallBackObject(callBackObject);	
		 ajax.setParameters(params); 
		 ajax.invokeAjax(); 
	}

}

function ListCallBack(uploder,listElementId,upload_url,showSetting){
	var __responseText;	
	this.ajaxCallBack= function(httpText){
		
		__responseText = httpText;
		var fileList = eval(httpText);
		if(fileList&&showSetting.loaderView=="image"){
			showUploadPicture(uploder,listElementId,fileList,upload_url,showSetting);		
			}else	if(fileList&&(showSetting.loaderView=="file"||showSetting.loaderView=="list")){
			showUploadFileList(uploder,listElementId,fileList,upload_url,showSetting);		
		}else if(fileList){
			showUploadDefaultList(uploder,listElementId,fileList,upload_url,showSetting)
		}
	}
}
function showUploadFileList(uploder,listElementId,fileList,upload_url,showSetting){
	if(!document.getElementById(listElementId)){
		return;
	}
	if(!showSetting){
		return;
	}
	if(fileList&&(showSetting.loaderView=="file"||showSetting.loaderView=="list")){

		
		if(fileList.length==0){
			document.getElementById(listElementId).innerHTML="";
			return;
		}
		var content = "",elemTb,elemTr,elemTd;
		
		//elemTb = "<table border='1'><tr><td>名称</td><td>格式</td><td>大小</td><td>操作</td></tr>";
		elemTb = "<table border='1'><tr>";
		if(showSetting.showName==true){
			elemTb = elemTb + "<td>名称</td>";
		}
		
		if(showSetting.showFormat==true){
			elemTb = elemTb + "<td>格式</td>";
		}
		
		if(showSetting.showSize==true){
			elemTb = elemTb + "<td>大小</td>";
		}
		
		if(showSetting.showOperation==true){
			elemTb = elemTb + "<td>操作</td>";
		}
		
		elemTb = elemTb + "</tr>";
		for(var i=0;i<fileList.length;i++){
			elemTr="<tr>"
			
				if(showSetting.showName==true){
					if(showSetting.isView==true){
						elemTd="<td><a href=\""+upload_url+"?operation=view&fileId=" +fileList[i].fileId+"\" target=\"_blank\">" +fileList[i].fileName+"</a></td>";
					}else{
						elemTd="<td>" +fileList[i].fileName+"</td>";
					}
					elemTr=elemTr+elemTd;
				}
				if(showSetting.showFormat==true){
					elemTd="<td>" +fileList[i].fileFormat+"</td>";
					elemTr=elemTr+elemTd;
				}
				if(showSetting.showSize==true){
					elemTd="<td>" +fileList[i].fileSize+"</td>";
					elemTr=elemTr+elemTd;
				}
				if(showSetting.showOperation==true){
					elemTd="<td>";
					if(showSetting.isDelete==true){
						elemTd=elemTd+ "<a href=\"javascript:"+uploder+".uploadOperation.remove('" +fileList[i].fileId+"');\">删除</a>";
					}
					if(showSetting.isDownload==true){
						elemTd=elemTd+ "&nbsp;&nbsp;<a href=\""+upload_url+"?operation=download&fileId=" +fileList[i].fileId+"\" target=\"_blank\">下载</a>";
					}
					elemTd=elemTd+ "</td>";
					
					elemTr=elemTr+elemTd;
				}
				
				elemTr=elemTr+"</tr>";
				elemTb = elemTb+ elemTr;
		}
		elemTb = elemTb+ "</table>";
		
		document.getElementById(listElementId).innerHTML=elemTb;
	}else{
		document.getElementById(listElementId).innerHTML="";
	}
}

function showUploadDefaultList(uploder,listElementId,fileList,upload_url,showSetting){
	if(!document.getElementById(listElementId)){
		
		return;
	}
	if(fileList){
		if(fileList.length==0){
			document.getElementById(listElementId).innerHTML="";
			return;
		}
		var content = "",elemTb,elemTr,elemTd;
		//elemTb = "<table border='1'><tr><td>fileId</td><td>fileName</td><td>fileFormat</td><td>fileSize</td><td>diskPatd</td><td>createTime</td></tr>";
		elemTb = "<table border='1'><tr><td>名称</td><td>格式</td><td>大小</td><td>操作</td></tr>";
		for(var i=0;i<fileList.length;i++){
			elemTr="<tr>"
			
			elemTd="<td><a href=\""+upload_url+"?operation=view&fileId=" +fileList[i].fileId+"\" target=\"_blank\">" +fileList[i].fileName+"</td>";
			elemTr=elemTr+elemTd;
			
			elemTd="<td>" +fileList[i].fileFormat+"</td>";
			elemTr=elemTr+elemTd;
			
			elemTd="<td>" +fileList[i].fileSize+"</td>";
			elemTr=elemTr+elemTd;
			
			elemTd="<td><a href=\"javascript:"+uploder+".uploadOperation.remove('" +fileList[i].fileId+"');\">删除</a>";
			elemTr=elemTr+elemTd;
			
			elemTd="&nbsp;&nbsp;<a href=\""+upload_url+"?operation=download&fileId=" +fileList[i].fileId+"\" target=\"_blank\">下载</a></td>";
			elemTr=elemTr+elemTd;
			
			elemTr=elemTr+"</tr>";
			
			elemTb = elemTb+ elemTr;
			//content="fileName="+fileList[i].fileName+",fileSize="+fileList[i].fileSize+",fileFormat="+fileList[i].fileName;
			//confirm("content["+i+"]="+content);
		}
		elemTb = elemTb+ "</table>";
		
		document.getElementById(listElementId).innerHTML=elemTb;
	}else{
		document.getElementById(listElementId).innerHTML="";
	}
}
function showUploadPicture(uploder,listElementId,fileList,upload_url,showSetting){
	if(!document.getElementById(listElementId)){
		return;
	}
	if(!showSetting){
		return;
	}
	if(fileList&&showSetting.loaderView=="image"){
		if(fileList.length==0){
			document.getElementById(listElementId).innerHTML="";
			return;
		}
		var content = "",elemTb,elemTr,elemTd;
		
		//elemTb = "<table border='1'><tr><td>名称</td><td>格式</td><td>大小</td><td>操作</td></tr>";
		elemTb = "<table border='1'><tr>";
		if(showSetting.showName==true){
			elemTb = elemTb + "<td>名称</td>";
		}
		if(showSetting.showFormat==true){
			elemTb = elemTb + "<td>格式</td>";
		}
		if(showSetting.showSize==true){
			elemTb = elemTb + "<td>大小</td>";
		}
		if(showSetting.showOperation==true){
			elemTb = elemTb + "<td>操作</td>";
		}
		elemTb = elemTb + "</tr>";
		for(var i=0;i<fileList.length;i++){
			elemTr="<tr>"
			
				if(showSetting.showName==true){
					if(showSetting.isView==true){
						elemTd="<td><a href=\""+upload_url+"?operation=view&fileId=" +fileList[i].fileId+"\" target=\"_blank\">" +fileList[i].fileName+"</a></td>";
						elemTd="<td><p><a href=\""+upload_url+"?operation=viewImage&fileId=" +fileList[i].fileId+"\" target=\"_blank\"><img src=\"" +upload_url+"?operation=viewImage&fileId=" +fileList[i].fileId+"\" width=\""+showSetting.elementWidth+"\" height"+showSetting.elementHeight+"\" border=\"0\"/></a></p><p><a href=\""+upload_url+"?operation=viewImage&fileId=" +fileList[i].fileId+"\" target=\"_blank\">"+fileList[i].fileName+"</a></p></td>";
					}else{
						elemTd="<td><p><img src=\"" +upload_url+"?operation=viewImage&fileId=" +fileList[i].fileId+"\" width=\""+showSetting.elementWidth+"\" height"+showSetting.elementHeight+"\"/></p><p>"+fileList[i].fileName+"</p></td>";
					}
					elemTr=elemTr+elemTd;
				}
				if(showSetting.showFormat==true){
					elemTd="<td>" +fileList[i].fileFormat+"</td>";
					elemTr=elemTr+elemTd;
				}
				if(showSetting.showSize==true){
					elemTd="<td>" +fileList[i].fileSize+"</td>";
					elemTr=elemTr+elemTd;
				}
				if(showSetting.showOperation==true){
					elemTd="<td>";
					if(showSetting.isDelete==true){
						elemTd=elemTd+ "<a href=\"javascript:"+uploder+".uploadOperation.remove('" +fileList[i].fileId+"');\">删除</a>";
					}
					if(showSetting.isDownload==true){
						elemTd=elemTd+ "&nbsp;&nbsp;<a href=\""+upload_url+"?operation=download&fileId=" +fileList[i].fileId+"\" target=\"_blank\">下载</a>";
					}
					elemTd=elemTd+ "</td>";
					
					elemTr=elemTr+elemTd;
				}
				
				elemTr=elemTr+"</tr>";
				elemTb = elemTb+ elemTr;
		}
		elemTb = elemTb+ "</table>";
		
		document.getElementById(listElementId).innerHTML=elemTb;
	}else{
		document.getElementById(listElementId).innerHTML="";
	}
}

function RemoveCallBack(uploder,listElementId,fileList,upload_url,showSetting){
	var __responseText;	
	this.ajaxCallBack= function(httpText){
		__responseText = httpText;
		__responseText = httpText;
		var fileList = eval(httpText);
		if(fileList&&showSetting.loaderView=="image"){
			showUploadPicture(uploder,listElementId,fileList,upload_url,showSetting);		
			}else	if(fileList&&(showSetting.loaderView=="file"||showSetting.loaderView=="list")){
			showUploadFileList(uploder,listElementId,fileList,upload_url,showSetting);		
		}else if(fileList){
			showUploadDefaultList(uploder,listElementId,fileList,upload_url,showSetting)
		}
	}
}

/*缓存当前页面的上传实例*/
var __uploaderCache=[];
/*是否上传标识，如果有多个上传实例，按由左到右由上到下顺序数，数到页面上的最后一个上传实例配置为准,默认情况将提示*/
var __isWarn = true;
/*提示信息，如果有多个上传实例，按由左到右由上到下顺序数，数到页面上的最后一个上传实例配置为准,默认提示:<注意：您离开当前页面时，所上传的文件可能被清除。>*/
var __promptMessage = "您已经上传了文件，您离开的话，之前上前上传的文件将被清除。";

function Warn()
{
	
	if(window.attachEvent){
		//window.attachEvent("onbeforeunload",  WarnUser);
		//window.attachEvent("onunload",  function(){cleanUploadCache();/*clean()*/});
	}else{
		//window.addEventListener("beforeunload",WarnUser, true);
	}
}
//chrome和firefox可能会拦截这个事件，你改成用cookie记录
function WarnUser()
{
	if(__isWarn){
		if(window.attachEvent){
			event.returnValue =__promptMessage;
		}else{
			if ( /Firefox[\/\s](\d+)/.test(navigator.userAgent) && new Number(RegExp.$1) >= 4) {
				if(confirm(__promptMessage)){
					history.go();
					//wellcome();
					//clean();
					cleanUploadCache();
				} else{
					window.setTimeout(function() { window.stop(); }, 1);
				}
			}else{
				return __promptMessage;
			}
		}
	}else{
		__isWarn = true;
	}
}

function cleanUploadCache(){
	noWarn();
	if(__uploaderCache)
	for(var i=0;i<__uploaderCache.length;i++){
		__uploaderCache[i].uploadOperation.clean();
	}
}

function saveFileStore(){
	noWarn();
	
	if(__uploaderCache){
		for(var i=0;i<__uploaderCache.length;i++){
			
			__uploaderCache[i].uploadOperation.saveFileStore();
		}
	}
	//cleanUploadCache();
}
/**
 * 在适当处调用noWarn()方法，进行页面跳时才不会提示信息
 * @return
 */
function noWarn(){
	__isWarn = false;
}