/**
 * 定义ajax默认的结构返回函数
 * 
 * 如果有其他实现，可以模仿该实现进行进行重写或扩展
 * 但 setResult(httpText) 必须实现，因为AJAX调用结束之后，该方法会被默认调用
 * @return
 */
function AjaxResult(){
	var __responseText;	
	this.ajaxCallBack= function(httpText){
		__responseText = httpText;	
	}
}

var __ajax_url="contoller.do";
var __ajaxResult = new AjaxResult();
function Ajax() {
	var _xmlHttp = null;
	var ajax = this;
	
	ajax.parameters = null;
	ajax.setParameters=function(parameter){
		if(parameter==undefined||parameter==null||parameter==""){
			return;
		}
		ajax.parameters=parameter;
	};
	
	ajax.url=__ajax_url;
	ajax.setUrl = function(url){
		ajax.url=url;
	};
	
	ajax.method="GET";
	ajax.setMethod=function(method){
		ajax.method=method;
	}
	
	ajax.callBackObject = null;
	ajax.setCallBackObject=function(callBackObject){
		ajax.callBackObject = callBackObject;
	};
	
	ajax.setParams=function(pname,pvalue){
		ajax.params[ajax.params.length]=[pname,pvalue];
	};
	
	ajax.params=[];
	ajax.getParams=function(){
		var temp ,params="";
		for(var i=0;i<ajax.params.length;i++){
			temp=ajax.params[i];
			params=params+"&"+temp[0]+"="+temp[1];
		}
	};
	ajax.createXMLHttpRequest = function () {
		try {		
			if (window.ActiveXObject) {
				_xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} else {
				if (window.XMLHttpRequest) {
					_xmlHttp = new XMLHttpRequest();
				}
			}
		}
		catch (e) {
			alert(e.name + " [createXMLHttpRequest]: " + e.message);
		}
	};
	
	ajax.backFunction = function (callBackFunc) {
		if (_xmlHttp.readyState == 4) {
			if (_xmlHttp.status == 200) {
				if(callBackFunc==undefined||callBackFunc==null){
					callBackFunc = __ajaxResult;
				}else{
					__ajaxResult = callBackFunc;
				}
				
				callBackFunc.ajaxCallBack(_xmlHttp.responseText);
			}
		}
		//_xmlHttp.onreadystatechange = null;
	};
	
	ajax.doPost = function (_url, _parameter,callBackFunc) {
		try {
			//confirm("_url="+_url);
			_xmlHttp.open("POST", _url, false);			
			_xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			_xmlHttp.onreadystatechange =  function () {
				ajax.backFunction(callBackFunc);
			};
			
			_xmlHttp.send(_parameter);
		}
		catch (e) {
			alert(e.name + "[doPost] : " + e.message);
		}
	};
	
	ajax.doGet = function (_url, _parameter,callBackFunc) {
		try {
			var _random = Math.round(Math.random() * 10000);	
			//confirm("http://localhost:8080/lwsync/"+_url );			
			_xmlHttp.open("GET", _url + "?random=" + _random + "&" + _parameter, true);
			_xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			
			_xmlHttp.onreadystatechange =  function () {
				ajax.backFunction(callBackFunc);
			};
			_xmlHttp.send(null);
		}
		catch (e) {
			alert(e.name + "[doGet] : " + e.message);
		}
	};
	
	ajax.ajaxRequest = function (_url, _parameter, _method,callBackFunc) {
		try {			
			ajax.createXMLHttpRequest();
			if (_method.toLowerCase() == "post") {
				ajax.doPost(_url, _parameter,callBackFunc);
			} else {
				ajax.doGet(_url, _parameter,callBackFunc);
			}			
		}catch (e) {
			alert(e.name + " [ajaxRequest_2]: " + e.message);
		}
	};
	
	ajax.invokeAjax = function(){
		var url = __contxt_path + ajax.url;
		if(__contxt_path==undefined||__contxt_path==null||__contxt_path==''||__contxt_path=='null'){
			url = ajax.url;
		}
		
		var params = ajax.parameters;
		var method = ajax.method;
		var callBack = ajax.callBackObject;
		//alert("url="+url);
		ajax.ajaxRequest(url,params,method,callBack);
	}
	
	ajax.jQueryAjaxRequest = function (_url, datas,_method) {
		try {
			//var datas = {};
			var json={
					url:_url,//_url +"?"+_parameter,
					data :datas, 
					type:_method//,
					//datatype:"json"
			 	};
			//alert(_url );
			jQuery.ajax(json);
		}
		catch (e) {
			alert(e.name + " [ajaxRequest_2]: " + e.message);
		}
	};

}




