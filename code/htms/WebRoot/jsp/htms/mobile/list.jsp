<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.zzy.htms.mobile.ShipBusiness"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String appliedStartDate = ShipBusiness.getPastDate(8);

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");
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
  <link rel="stylesheet" href="jsp/htms/mobile/css/zdialog.css" type="text/css">
  </head>
  
  <body onload="testLogin()">
  
     <form  action="">
     	
		<div class="top">
		  <div class="top-center">首页</div> 
		</div>

		<div class="content main_page_top">
			<div class="main-content">
		   		<a  href="contoller.do?operation=customerList&userId=<%=userId %>&salesNo=<%=salesNo %>" style="display: block;">
					<div style="text-align: center;">
					<img src="jsp/htms/mobile/image/awaitorder.png" style="width: 5em;"></img>
					<div class="main_page_text">待发货订单</div>
					</div>
				</a>
		   	</div>
		   	<div class="main-content">
		   		<a href="contoller.do?operation=listMineAddr&userId=<%=userId %>"style="display: block;">
		   			<div style="text-align: center;">
					<img src="jsp/htms/mobile/image/customeraddress.png" style="width: 5em;"></img>
					<div class="main_page_text">客户地址</div>
					</div>
		   		</a>
		   	</div >
		   	<div class="main-content">
		   		<a href="contoller.do?operation=appliedMobileList&userId=<%=userId %>&salesNo=<%=salesNo %>&startDate=<%=appliedStartDate %>"style="display: block;">
		   			<div style="text-align: center;">
					<img src="jsp/htms/mobile/image/appliedlist.png" style="width: 5em;"></img>
					<div class="main_page_text">已申请列表</div>
					</div>
		   		</a>
		   	</div>
		</div>		
	   	
   	</form>
   	
   	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
   	<script type="text/javascript">
   		var userId = <%=userId%>;
   		var salesNo = "<%=salesNo%>";
   		
   		function alerts(){
	  		$.DialogByZ.Close();
   		};
   		function testLogin() {
   			if (userId == null || salesNo == null || salesNo == "null") {
   				$.DialogByZ.Alert({Title: "提示", Content: "登录超时，请重新登录",BtnL:"确定",FunL:alerts});
   			}
   		}
   	</script>
   	
  </body>
</html>
