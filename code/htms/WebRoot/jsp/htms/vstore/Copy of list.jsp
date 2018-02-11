<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.zzy.htms.mobile.ShipBusiness"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String wxOpenId = (String)request.getAttribute("wxOpenId");
if(wxOpenId == null){
	wxOpenId = (String)request.getParameter("wxOpenId");
}

%>

<!DOCTYPE HTML >


<html>
  <head>
    <base href="<%=basePath%>">
    <title>车辆配送系统</title>
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
  <link rel="stylesheet" href="jsp/htms/mobile/css/zdialog.css" type="text/css">
  </head>
  
  <body onload="testLogin()">
  
     <form  action="">
     	
		<div class="top">
		  <div class="top-center">首页</div> 
		</div>

		<div class="content main_page_top">
			<div class="main-content">
		   		<a  href="contoller.do?operation=listWaitForSend&wxOpenId=<%=wxOpenId %>" style="display: block;">
					<div style="text-align: center;">
					<div class="main_page_text">未配送列表</div>
					</div>
				</a>
		   	</div>
		   	<div class="main-content">
		   		<a href="contoller.do?operation=listSended&wxOpenId=<%=wxOpenId %>"style="display: block;">
		   			<div style="text-align: center;">
					<div class="main_page_text">已配送列表</div>
					</div>
		   		</a>
		   	</div >
		   	<div class="main-content">
		   		<a href="contoller.do?operation=myMessage&wxOpenId=<%=wxOpenId %>"style="display: block;">
		   			<div style="text-align: center;">
					<div class="main_page_text">我的信息</div>
					</div>
		   		</a>
		   	</div >
		</div>		
	   	
   	</form>
   	
   	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
   	<script type="text/javascript">
   		var wxOpenId = "<%=wxOpenId%>";
   		
   		function alerts(){
	  		$.DialogByZ.Close();
   		};
   		function testLogin() {
   			if (wxOpenId == null || wxOpenId == "null") {
   				$.DialogByZ.Alert({Title: "提示", Content: "登录超时，请重新登录",BtnL:"确定",FunL:alerts});
   			}
   		}
   	</script>
  </body>
</html>
