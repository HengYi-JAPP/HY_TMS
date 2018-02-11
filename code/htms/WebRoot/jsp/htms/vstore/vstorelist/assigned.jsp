<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.mobilecn.utils.PageCtl" %>
<%@page import="com.mobilecn.utils.JTypeUtils" %>
<%@page import="com.zzy.htms.logistic.send.SendBean" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<SendBean> waitForSendList = (List<SendBean>)request.getAttribute("sendList");
if(waitForSendList == null){
	waitForSendList = new ArrayList();
}

String totalCount = (String)request.getAttribute("totalCount");
if (totalCount == null) {
	totalCount = "0";
}
String curpage = (String)request.getAttribute("curpage");
int intCurPage = tools.tool.toInt(curpage);
intCurPage = intCurPage<1?1:intCurPage;
PageCtl pageCtl=new PageCtl(request);
pageCtl.setCurPage(intCurPage);
int curPage = pageCtl.getCurPage();
int perPageCount = pageCtl.getPerPageCount();
int total=Integer.parseInt(totalCount);
pageCtl.getBeginRow();
pageCtl.getEndRow();
pageCtl.setTotalCount(JTypeUtils.parserInt(totalCount));
pageCtl.setTemplName("mobile.pagectl.tmpl");
String pageHtml = pageCtl.getPaginationHtml("listSendedForm");
String wxOpenId = (String)request.getParameter("wxOpenId");
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>已配送列表</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">
	<link rel="stylesheet" href="jsp/htms/mobile/css/order.css" type="text/css">
	<link rel="stylesheet" href="jsp/htms/mobile/css/zdialog.css" type="text/css">
  </head>
  
  <body>
  	
  <div class="container">
   <form  id="listSendedForm"   action="contoller.do"  method="GET">
    	<input id="operation"name="operation" value="listSended" type="hidden"/>
  <div class="top">
	  <div class="top-left"><a href="jsp/htms/vstore/list.jsp?wxOpenId=<%=wxOpenId %>"><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div>
	  <div class="top-center" >已配送列表</div>
   	</div>
		<div class="content" >
   		<%
   			SendBean sendBean=null;
   			for(int i=0;i<waitForSendList.size();i++){
				sendBean=(SendBean)waitForSendList.get(i);   			
   			
   		 %>
		<div style=" border-bottom: 10px solid #eef0f2;" > 
		<div  class="appliedcon">
			<div style="padding: 0 0 12px 0;">运单号：<%=sendBean.getTransportCode() %>
				<span style="float: right;" ><a href="contoller.do?operation=viewImgList&transportId=<%=sendBean.getTransportId() %>&transportCode=<%=sendBean.getTransportCode() %>&applyTonNum=<%=sendBean.getApplyTonNum() %>&caddrContactor=<%=sendBean.getCaddrContactor() %>&caddrTelephone=<%=sendBean.getCaddrTelephone() %>&areaName=<%=sendBean.getAreaName() %>&wxOpenId=<%=wxOpenId %>"><div style="width: 46px; float: right;border-radius: 10px;color: white;background-color: #2daed3;border-color: #2daed3;border: 1px solid;font-size: 12px;text-align: center;padding:5px 0 5px 0;">查看</div></a></span>
			</div>
			<span class="order">总数：<%=sendBean.getApplyTonNum() %></span>
		 </div>
			<div class="appliedaddr">
				<div class="custaddr">
					<div class="customer">收货人:<%=sendBean.getCaddrContactor() %> 
						<span class="appliedphone" >电话:<%=sendBean.getCaddrTelephone() %></span>
					</div>
					<div class="appliedaddress">地址:<%=sendBean.getAreaName() %></div>
				</div>
			</div>
		</div>
		<%} %>
		</div>
   	<% if(total>=perPageCount){%>
			<input	type="hidden" name="perPageCount" id="perPageCount" value=<%=perPageCount %>>                   
			<%=pageHtml %>
	<%} %>
   	
	</form>
   	</div>
	
	<script src="jsp/htms/mobile/js/Ajax.js" ></script>
   	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
	
  </body>
</html>
