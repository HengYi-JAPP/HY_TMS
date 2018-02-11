/**
 * 更新用户选中的主题类型
 * @param tdtId
 * @return
 * -------------------------------------
 * 获取数据的参数名称或加载数据的方法；
 * 加载数据的当前结点ID
 * 数据转换的映射关系
 * 实现类
 * 
 */
function treeNodesAsyncLoader(treeName,treeNodeId,nodeLevel,dataMapDefined,dataLodaerClass,asyncTreeBeanId){
	
	var implClass = "com.mobilecn.taglibs.webcomps.tree.AsyncLoader";
	//var dataLodaerClass = dataLodaerClass;
	var params ="&treeName="+treeName+ "&treeNodeId="+treeNodeId+ "&nodeLevel="+nodeLevel+"&dataMapDefined="+dataMapDefined+"&businessImplClass="+implClass+"&dataLodaerClass="+dataLodaerClass+"&asyncTreeBeanId="+asyncTreeBeanId;
	var ajax = new Ajax();

	 ajax.setUrl("tagCommonServlet"); 
	 //alert(params);
	 ajax.setMethod("post");
	 ajax.setCallBackObject(new TreeAsyncLoader(asyncTreeBeanId));	
	 ajax.setParameters(params); 
	 ajax.invokeAjax(); 
}

function TreeAsyncLoader(asyncTreeBeanId){
	var __responseText;	
	this.ajaxCallBack= function(httpText){
		__responseText = httpText;
		//confirm("window.location.reload();");
		//alert("[TreeAsyncLoader]httpText="+httpText);
		//document.getElementById("treeChild").innerHTML="<script>"+httpText+"</script>";
		//executeScript("<script>"+httpText+"</script>"); 
		$('#'+asyncTreeBeanId).html(httpText);
		//document.write(httpText);
		//eval("document.getElementById('_E_001').innerHTML=currentNodeDivContent;");
		//parent.window.location.reload();			
	}
}
