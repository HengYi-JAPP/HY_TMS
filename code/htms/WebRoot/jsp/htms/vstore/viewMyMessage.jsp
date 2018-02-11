<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.zzy.htms.location.User"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<User> myMessageList = (List<User>)request.getAttribute("myMessageList");
if(myMessageList == null){
	myMessageList = new ArrayList();
}
String wxOpenId = (String)request.getParameter("wxOpenId");

%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的信息</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="jsp/htms/vstore/css/register.css" type="text/css"></link>
	<link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">
  </head>
  
  <body>
  	
   <form  id=""   action="contoller.do"  method="GET">
      <input id="operation"name="operation" value="" type="hidden"/>
	  <div class="container">
	  <div class="top">
		  <div class="top-left"><a href="jsp/htms/vstore/list.jsp?wxOpenId=<%=wxOpenId %>"><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div>
		  <div class="top-center" >我的信息</div>
	  </div>
	  <div class="content" >
	  <%
	  User wxUser = null;
	  	if(myMessageList.size()>0){
			wxUser = (User) myMessageList.get(0);	  	
	   %>
		<div class="register">
			<span style="margin-left: 19px;">姓名:<%=wxUser.getDriverName() %></span>
			<span style="margin-left: 30px;">电话:<%=wxUser.getDriverMobile() %></span>
		</div>
		<div class="register" style="margin-left: 19px;">物流公司:<%=wxUser.getCarrierName() %></div>
		<div style="border-top: 1px  solid #bbbbbb;"></div>
		<%}
			for(int i = 0;i < myMessageList.size();i++){
	  		wxUser = (User) myMessageList.get(i);
		 %>
	    <div class="register"><span style="margin-left: 18px;">车牌号:<%=wxUser.getVehicleNo() %></span></div>
	 <%} %>
	  </div>
	  </div>
	</form>
	
  </body>
</html>
