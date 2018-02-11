<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="../../common/impart/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
     
  <body>
 
     <iframe id="changePassword" style="width:100%;height:780px;" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" src="http://cas.hengyi.com:8080/hengyi/casChangePassword.jsp?uid=<html:value value='$[userBean.employNo]' />">
	     <!-- 
	         http://cas.hengyi.com:8080/hengyi/casChangePassword.jsp?uid= 
	         http://cas.hengyi.com:8080/hengyi/casChangePassword.jsp?uid=$[userBean.employNo]
	      -->
     </iframe>
  </body>
</html>
