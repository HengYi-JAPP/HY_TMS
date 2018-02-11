function selectAsync(dataHiddenLoader,dataSetName,selectValue,asyncClass,asyncLabel,asyncValue){
	var implClass = "com.mobilecn.taglibs.html.formelements.tags.SelectAsyncLoader";
	var params ="&businessImplClass="+implClass;
	params=params+"&dataSetName="+dataSetName;
	params=params+"&selectValue="+selectValue;
	params=params+"&asyncClass="+asyncClass;
	params=params+"&asyncLabel="+asyncLabel;
	params=params+"&asyncValue="+asyncValue;
	
	var ajax = new Ajax();

	 ajax.setUrl("tagCommonServlet"); 
	// alert(params);
	 ajax.setMethod("post");
	 ajax.setCallBackObject(new SelectAsyncLoader(dataHiddenLoader));	
	 ajax.setParameters(params); 
	 ajax.invokeAjax(); 
	
	var ajax = new Ajax();

	 ajax.setUrl("tagCommonServlet"); 
	 //alert(params);
	 ajax.setMethod("post");
	 ajax.setCallBackObject(new SelectAsyncLoader(dataHiddenLoader));	
	 ajax.setParameters(params); 
	 ajax.invokeAjax(); 
}

function SelectAsyncLoader(dataHiddenLoader){
	var __responseText;	
	this.ajaxCallBack= function(httpText){
		__responseText = httpText;
		//alert("[SelectAsyncLoader]httpText="+httpText);
		$('#'+dataHiddenLoader).html(httpText);
	}
}