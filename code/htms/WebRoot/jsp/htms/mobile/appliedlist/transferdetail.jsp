<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="com.zzy.htms.sales.ship.ShipBean" %>
<%@page import="com.mobilecn.utils.PageCtl" %>
<%@page import="com.mobilecn.utils.JTypeUtils" %>
<%@page import="com.zzy.htms.mobile.ShipTransferBean"%>
<%@page import="com.zzy.htms.sales.shipdetail.ShipDetailBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ShipTransferBean selectedTransBean = (ShipTransferBean)request.getAttribute("selectedTransBean");


List<ShipDetailBean> detailList=null;
List<ShipTransferBean> transportList = null;

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户已申请列表</title>
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
  	
   <form  id="shipForm"   action="contoller.do"  method="GET">
    	<input id="operation"name="operation" value="appliedMobileList" type="hidden"/>
  		<input type="hidden" id="userId" name="userId" value="<%=userId %>"/>
  		<input type="hidden" id="salesNo" name="salesNo" value="<%=salesNo %>"/>
  <div class="container">
  <div class="top">
	  <div class="top-left"><a href="javascript:goBack();"><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div>
	  <div class="top-center" >调拨单明细</div>
   	</div>
		<div class="content" >
   	<%  	
		ShipDetailBean shipBean=null;
	
		if(selectedTransBean!=null) {
			
			detailList = selectedTransBean.getDetailList();
			transportList = selectedTransBean.getTransportList();
		%>
		<div style=" border-bottom: 10px solid #eef0f2;" > 
		<div  class="appliedcon">
			<div style="padding: 0 0 12px 0;"><%=selectedTransBean.getCustomerName()%></div>
			<span class="order"><%=selectedTransBean.getCorderCode() %></span>
			<span style="margin-left: 10px;"><%=selectedTransBean.getFactoryName() %></span>
			<% if(selectedTransBean.getIsUrgent()==1){%>
			<span style="color:red;margin-left: 10px;">加急</span>
			<%}%>
			
			<span class="time" style="float: right;"><%=selectedTransBean.getCreateTime()%></span>&nbsp&nbsp
		 </div>
			<div class="appliedaddr">
				<div class="custaddr">
					<div class="customer">收货人:<%=selectedTransBean.getCaddrContactor() %> 
						<span class="appliedphone" ><%=selectedTransBean.getCaddrTelephone() %></span>
					</div>
					<div class="appliedaddress"><%=selectedTransBean.getAreaName() %><%=selectedTransBean.getCaddrDetail() %> </div>
				</div>
			</div>
			<%if(selectedTransBean.getShipNotice()!=null&&selectedTransBean.getShipNotice().length()>0){ %>
			<div style="padding:0px 12px 5px;font-size: 14px;color:#333333;">申请单备注:<%=selectedTransBean.getShipNotice() %></div>
			<%} %>
		</div>
		
		<%
			for(int i=0;i<transportList.size();i++){
				ShipTransferBean transBean=(ShipTransferBean)transportList.get(i);
				//System.out.print("============="+transBean.getTotalFreight());
				List<ShipDetailBean> detailBeanList = transBean.getDetailList();
				if (detailBeanList == null) {
					continue;
				}
				
				for (int j = 0; j < detailBeanList.size(); j++) {
					ShipDetailBean detailBean = (ShipDetailBean)detailBeanList.get(j);
		%>
			<div class="appliednum" style="margin-left: 6px;">
	 			<%if(j==0){ %>
	 				<div>调拨单<%=i+1 %>
	 					<%if(transBean.getSendStatus()==1&&transBean.getTotalFreight()!=null&&transBean.getTotalFreight().length()>0){ %>
	 						<span style="margin-left: 10px;">运费:<span style="color:red;">￥<%=transBean.getTotalFreight() %></span></span>
	 					<%} %>
	 				</div>
		 			<div class="applieddesc"><%=detailBean.getCodetailCertificateDesc()%> 
		 				<% if(transBean.getSendStatus()==1) {%>
		 					<span style="float: right;color:#007aff;">已派车</span>
		 				<%}else if(transBean.getSendStatus()==0){ %>
		 					<span style="float: right;color:#17cfef;">未派车</span>
		 				<%} %>
		 			</div>
	 				<%} %>
					<div >
						<span class="appliedprice">￥<%=detailBean.getUnitPrice() %></span>
						<span class="appliedamount">
						<span class="number" >数量:<%=detailBean.getApplyTonNum() %></span>
						<span>包数:<%=detailBean.getApplyPackNum() %> </span>
						</span>
					</div>
			</div>
			<%}%>
				<% 
					if(transBean.getFetchDriver()!=null && transBean.getFetchDriver().length() > 0){
				 %>
				<div class="appliedaddr">
					<div class="custaddr">
						<div class="customer">司机:<%=transBean.getFetchDriver() %> 
							<span class="appliedphone" ><%=transBean.getFetchMobile() %></span>
						</div>
						<div class="appliedaddress"><%=transBean.getFetchCar() %> </div>
					</div>
				</div>
				<%} %>
				<div style=" border: 1px solid #eef0f2;margin-top: 10px;"></div>
			<%  } %>
		
		<% }  %> 
		
		</div>
   	</div>
   	
	</form>
	
	<script src="jsp/htms/mobile/js/Ajax.js" ></script>
   	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
  	<script src="jsp/htms/mobile/js/selectaddr.js" ></script>
	<script type="text/javascript">

		function goBack() {	
			history.back(-1);
		}
	</script>
	
  </body>
</html>
