<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.zzy.htms.vstore.SignBean"%>
<%@page import="com.zzy.htms.logistic.send.SendBean"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SignBean signBean = (SignBean)request.getAttribute("signBean");

String transportCode= (String)request.getParameter("transportCode");


String applyTonNum= (String)request.getParameter("applyTonNum");
String caddrContactor= (String)request.getParameter("caddrContactor");
String caddrTelephone= (String)request.getParameter("caddrTelephone");
String areaName= (String)request.getParameter("areaName");
String wxOpenId = (String)request.getParameter("wxOpenId");

%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看图片</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">
	<link rel="stylesheet" href="jsp/htms/mobile/css/order.css" type="text/css">
  </head>
  <body>
  	
   <form  id=""   action="contoller.do"  method="GET">
    	<input id="operation"name="operation" value="" type="hidden"/>
  <div class="container">
  <div class="top">
	  <div class="top-left"><a href="contoller.do?operation=listSended&wxOpenId=<%=wxOpenId %>"><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div>
	  <div class="top-center" >查看图片</div>
   	</div>
		<div class="content" >
		
		<div style=" border-bottom: 10px solid #eef0f2;" > 
		<div  class="appliedcon">
			<div style="padding: 0 0 12px 0;">运单号：<%=transportCode %>
			</div>
			<span class="order">总数：<%=applyTonNum %></span>
		 </div>
			<div class="appliedaddr">
				<div class="custaddr">
					<div class="customer">收货人:<%=caddrContactor %> 
						<span class="appliedphone" >电话:<%=caddrTelephone%></span>
					</div>
					<div class="appliedaddress">地址:<%=areaName %></div>
				</div>
			</div>
		<div style="padding:0 12px;">
		<%
			String picList = "";
			if(signBean != null && signBean.getPicListArray() != null && signBean.getPicListArray().length > 0){
				String[] picListArray = signBean.getPicListArray();
				String pic = "";
				for(int i = 0;i < picListArray.length;i++){
					pic = picListArray[i];
					if(pic.length() == 0){
						continue;
					}
					picList = basePath+"/simpleupload/"+picListArray[i];
		 %>
		
   			<img alt="" src="<%=picList %>"  width="100%"  />
		<%		}	
			} 
		%>
		</div>
		</div>
		</div>
   	</div>
 
	</form>

  </body>
</html>
