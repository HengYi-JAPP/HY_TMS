<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zzy.htms.login.HtmsLoginBusiness"%>
<%@page import="com.zzy.htms.user.HtmsUserBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>手机助手</title>
     <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css"></link>
  </head>
  
  <body>
   <form id="custLoginForm"   action="contoller.do"  method="GET">
  	<input type="hidden" id="operation" name="operation" value="Mobile-Login_of_myportal"/>
    
		<div class="top">
		  <div class="top-center">登录</div> 
		</div>
		<div class="content main_page_top">
			<div class="main-content" align="center">
					<div class="main_page_text">账号:<input type="text" value="admin" name="account" id="account"/></div>
					<div class="main_page_text">密码:<input type="password" value="111" name="pwd" id="pwd"/></div>
		   			<a href=""><input type="submit" value="登录" style="margin-top: 10px;" onclick="submit('custLoginForm')" /></a>
		   	</div>
		   
		</div>		
	   	
   	</form>
   	
  </body>
</html>
