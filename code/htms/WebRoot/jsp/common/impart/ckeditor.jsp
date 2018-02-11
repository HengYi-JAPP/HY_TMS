<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String name=request.getParameter("name");
name=name==null?"contents":name;

String value=request.getParameter("value");
value=value==null?"":value;
%>
<script type="text/javascript" src="<%=basePath %>ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=basePath %>ckfinder/ckfinder.js"></script>
<html:textarea id="<%=name %>" name="<%=name %>" cols="30" rows="8" value="<%=value %>"></html:textarea>

<script type="text/javascript">
//<![CDATA[
if ( typeof CKEDITOR == 'undefined' ){
	document.write('<strong><span style="color: #ff0000">Error！</span>: CKEditor no exist</strong>.' ) ;
											
}else{

	 var editor = CKEDITOR.replace('<%=name %>',
	 	{  
		filebrowserBrowseUrl:'<%=basePath %>ckfinder/ckfinder.html', 
	  filebrowserImageBrowseUrl:'<%=basePath %>ckfinder/ckfinder.html?type=Images', 
	  filebrowserFlashBrowseUrl:'<%=basePath %>ckfinder/ckfinder.html?type=Flash', 
	  filebrowserUploadUrl:'<%=basePath %>ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files', 
	  filebrowserImageUploadUrl:'<%=basePath %>ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images', 
	  filebrowserFlashUploadUrl:'<%=basePath %>ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
	
	}
	 );
	
	//CKFinder.SetupCKEditor(editor,{basePath:"/",rememberLastFolder:true});
}

//]]>
</script>

