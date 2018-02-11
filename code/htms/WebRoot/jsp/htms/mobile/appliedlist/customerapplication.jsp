<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="com.zzy.htms.sales.ship.ShipBean" %>
<%@page import="com.mobilecn.utils.PageCtl" %>
<%@page import="com.mobilecn.utils.JTypeUtils" %>
<%@page import="com.zzy.htms.mobile.ShipTransferBean"%>
<%@page import="com.zzy.htms.sales.shipdetail.ShipDetailBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<Integer> appliedKeyList = (List<Integer>)request.getAttribute("appliedKeyList");
Map<Integer, ShipTransferBean> appliedListMap=(Map<Integer, ShipTransferBean>)request.getAttribute("appliedListMap");

List detailList = null;

/*
String totalCount = (String)request.getAttribute("totalCount");
String curpage = (String)request.getAttribute("curpage");
int intCurPage = tools.tool.toInt(curpage);
intCurPage = intCurPage<1?1:intCurPage;
PageCtl pageCtl=new PageCtl(request);
pageCtl.setCurPage(intCurPage);
int curPage = pageCtl.getCurPage();
int perPageCount = pageCtl.getPerPageCount();
pageCtl.getBeginRow();
pageCtl.getEndRow();
pageCtl.setTotalCount(JTypeUtils.parserInt(totalCount));
pageCtl.setTemplName("mobile.pagectl.tmpl");
String pageHtml = pageCtl.getPaginationHtml("shipForm");*/

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
	  <div class="top-left"><a href="contoller.do?operation=listMobile"><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div>
	  <div class="top-center" >已申请列表</div>
	  <div class="top-right"><a href="contoller.do?operation=appliedSearch&userId=<%=userId %>&salesNo=<%=salesNo %>"><img src="jsp/htms/mobile/image/button/search.png" style="width: 25px;"/></a></div>
   	</div>
		<div class="content" >
   	<%  	
   		
		ShipTransferBean shipTransferBean = null;
		ShipDetailBean detailBean = null;
	
		if(appliedListMap!=null && appliedKeyList != null){
			int applyStatus=0,transStatus=0;
			String statusDesc="",statusClass="";
			for (int j = 0; j < appliedKeyList.size(); j++) {
			shipTransferBean = appliedListMap.get(appliedKeyList.get(j));
			detailList = shipTransferBean.getDetailList();
			//System.out.print("====>"+shipTransferBean.getTotalFreight());
				applyStatus=shipTransferBean.getApplyStatus();
				if(applyStatus==1){//待物流分配
					statusDesc="待物流分配";
					statusClass="#26ec40";
				}
				if(applyStatus==2){//待排车
					statusDesc="待排车";
					statusClass="#17cfef";
				}
				transStatus=shipTransferBean.getTransStatus();
				if(applyStatus==3){
					if(transStatus==0){//未派车
						statusDesc="未派车";
						statusClass="#17cfef";
					}else if(transStatus==1){//已派车
						statusDesc="已派车";
						statusClass="#17cfef";
					}else{//已排车
						statusDesc="已排车";
						statusClass="#17cfef";
					}
				}
				
				
				if(applyStatus==901){//未通过 
					statusDesc="未通过 ";
					statusClass="red";
				}
				
				if(applyStatus==902){//已撤销
					statusDesc="已撤销";
					statusClass="#ea8b25";
				}
				
				if(applyStatus==903){//物流拒绝
					statusDesc="物流拒绝";
					statusClass="#17cfef";
				}
				
			
		%>
		<div style=" border-bottom: 10px solid #eef0f2;" > 
		<div  class="appliedcon">
			<div style="padding: 0 0 12px 0;"><%=shipTransferBean.getCustomerName()%>	
				<%if (shipTransferBean.getTransCount() > 1) {%>
					<span style="float: right;" ><a href="javascript:gotoTransport(<%=shipTransferBean.getShipId() %>)"><div style="width: 64px; float: right;border-radius: 10px;color: white;background-color: #2daed3;border-color: #2daed3;border: 1px solid;font-size: 12px;text-align: center;padding:5px 0 5px 0;">查看调拨单</div></a></span> 
				<%
				}else{ 
					if(applyStatus==0){
				%>
					<span style="float: right;" ><a href="javascript:cancleApplyConfirm(<%=shipTransferBean.getShipId() %>)"><div style="width: 64px; float: right;border-radius: 10px;color: white;background-color: #2daed3;border-color: #2daed3;border: 1px solid;font-size: 12px;text-align: center;padding:5px 0 5px 0;">撤销申请</div></a></span>
				<% 
					}else{
					%>
					<span style="color:<%=statusClass %>;float: right;"><%=statusDesc %></span>
					<%
					}
				}//else
				%>
				<%-- 
				<%if (shipTransferBean.getTransCount() > 1) {%>
					<span style="float: right;" ><a href="javascript:gotoTransport(<%=shipTransferBean.getShipId() %>)"><div style="width: 64px; float: right;border-radius: 10px;color: white;background-color: #2daed3;border-color: #2daed3;border: 1px solid;font-size: 12px;text-align: center;padding:5px 0 5px 0;">查看调拨单</div></a></span> 
				<%}else if(shipTransferBean.getApplyStatus()==1){ %>
					<span style="float: right;color:#26ec40;">待物流分配 </span>
				<%}else if(shipTransferBean.getApplyStatus()==2){ %>
				<span style="float: right;color:#17cfef ;">待排车</span>
				<%}else if(shipTransferBean.getApplyStatus()==3){ 
					if(shipTransferBean.getTransStatus()==1){
				%>
					<span style="float: right;color:#17cfef ;">已派车</span>
					<%}else if(shipTransferBean.getTransStatus()==0){ %>
					<span style="float: right;color:#17cfef ;">未派车</span>
					<%}else{ %>
					<span style="float: right;color:#17cfef ;">已排车</span>
				<%}}else if(shipTransferBean.getApplyStatus()==903) {%>
					<span style="float: right;color:#17cfef ;">物流拒绝</span>
				<%}else if(shipTransferBean.getApplyStatus()==0){ %>
					<span style="float: right;" ><a href="javascript:cancleApplyConfirm(<%=shipTransferBean.getShipId() %>)"><div style="width: 64px; float: right;border-radius: 10px;color: white;background-color: #2daed3;border-color: #2daed3;border: 1px solid;font-size: 12px;text-align: center;padding:5px 0 5px 0;">撤销申请</div></a></span>
				<!--<span style="float: right;color:#333333;">审批中 </span>-->
				<%}else if(shipTransferBean.getApplyStatus()==901){ %>
					<span style="float: right;color:red;">未通过 </span>
				<%}else if(shipTransferBean.getApplyStatus()==902){ %>
					<span style="float: right;color:#ea8b25;">已撤销</span>
				<%} %>
			--%>
			 </div>
			<span class="order"><%=shipTransferBean.getCorderCode() %></span>
			<span style="margin-left: 10px;"><%=shipTransferBean.getFactoryName() %></span>
			<% if(shipTransferBean.getIsUrgent()==1){%>
			<span style="color:red;margin-left: 10px;">加急</span>
			<%}%>
			<span class="time" style="float: right;"><%=shipTransferBean.getCreateTime()%></span>&nbsp&nbsp
			<div style="font-size: 14px;color:#333333;padding-bottom: 12px;">
				<%if(applyStatus==3 && transStatus==1 && shipTransferBean.getTotalFreight()!=null&&shipTransferBean.getTotalFreight().length()>0){ %>
					<span style="margin-left: 10px;float:right;">运费:<span style="color:red;">￥<%=shipTransferBean.getTotalFreight() %></span></span>
				<%}else if(shipTransferBean.getFreightPrice()==null||shipTransferBean.getFreightPrice().equals("")) {%>
					<%if(shipTransferBean.getFreight() != null && !shipTransferBean.getFreight().equals("")) {%>
						<span style="float:right;">一口价:<span style="color:red;">￥<%=shipTransferBean.getFreight() %></span></span>
					<%} %>
				<%}else{ %>
					<%if(shipTransferBean.getFreight() != null && !shipTransferBean.getFreight().equals("")) {%>
						<span style="margin-left: 10px;float:right;"> 预估运费:<span style="color:red;">￥<%=shipTransferBean.getFreight() %></span></span>
					<%} %>					
					<span style="float:right;">单价:<span style="color:red;">￥<%=shipTransferBean.getFreightPrice() %></span></span>
				<%} %>
			</div>
		 </div>
			<div class="appliedaddr">
				<div class="custaddr">
					<div class="customer">收货人:<%=shipTransferBean.getCaddrContactor() %> 
						<span class="appliedphone" ><%=shipTransferBean.getCaddrTelephone() %></span>
					</div>
					<div class="appliedaddress"><%=shipTransferBean.getAreaName() %><%=shipTransferBean.getCaddrDetail() %> </div>
				</div>
				<% 
					if(shipTransferBean.getTransCount() <= 1 && shipTransferBean.getFetchDriver()!=null && shipTransferBean.getFetchDriver().length() > 0){
				 %>
				<div class="custaddr">
					<div class="customer">司机:<%=shipTransferBean.getFetchDriver() %> 
						<span class="appliedphone" ><%=shipTransferBean.getFetchMobile() %></span>
					</div>
					<div class="appliedaddress"><%=shipTransferBean.getFetchCar() %> </div>
				</div>
				<%} %>
			</div>
			<div class="applied">
			<%
			for(int i=0;i<detailList.size();i++){
				detailBean=(ShipDetailBean)detailList.get(i);
			%>
			<div class="appliednum">
	 			<div class="applieddesc"><%=detailBean.getCodetailCertificateDesc()%> </div>
				<div >
					<span class="appliedprice">￥<%=detailBean.getUnitPrice() %></span>
					<span class="appliedamount">
					<span class="number" >数量:<%=detailBean.getApplyTonNum() %></span>
					<span>包数:<%=detailBean.getApplyPackNum() %> </span>
					</span>
				</div>
			</div>
			<%} %>
			</div>
			<%if(shipTransferBean.getShipNotice()!=null&&shipTransferBean.getShipNotice().length()>0){ %>
			<div style="padding:0px 12px 5px;font-size: 14px;color:#333333;">申请单备注:<%=shipTransferBean.getShipNotice() %></div>
			<%} %>
		</div>
		<%} } %> 
		</div>
   	</div>
   	
	</form>
	
	<script src="jsp/htms/mobile/js/Ajax.js" ></script>
   	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
  	<script src="jsp/htms/mobile/js/selectaddr.js" ></script>
	<script type="text/javascript">
	
		var that = this;
		function alerts(){
	  		$.DialogByZ.Close();
   		}
   		
		function cancleApplyConfirm(shipId) {
		
			$.DialogByZ.Confirm({Title: "提示", Content: "确定要撤销这个申请吗？",FunL:function() {
  				$.DialogByZ.Close();
  				
  				//that.cancleApply(shipId);		
  				that.getApplyStatus(shipId);
  			},FunR:function(){
  				$.DialogByZ.Close();
  			}}); 
 			
		}
		
		function getApplyStatus(shipId) {
			var basePath = "<%=basePath %>" + "contoller.do";
				
  			var params = {operation:'viewApplyStatus',shipId:shipId};
  			
  			Ajax.get(basePath, params, function(msg){	
   	 					console.log("getApplyStatus.msg=====" + msg);
                  		var msgObj = JSON.parse(msg);
                  		if ( parseInt(msgObj.code) != 0) {
                  			$.DialogByZ.Alert({Title: "提示", Content: msgObj.msgg,BtnL:"确定",FunL:alerts});
                  		}else {
                  			var applyStatus = parseInt(msgObj.applyStatus);
                  			if (applyStatus != 0) {
                  				if (applyStatus == 902) {
                  					$.DialogByZ.Alert({Title: "提示", Content: "申请已经撤消，请刷新页面",BtnL:"确定",FunL:alerts});
                  				}else {
                  					$.DialogByZ.Alert({Title: "提示", Content: "申请已经通过，不能撤消",BtnL:"确定",FunL:alerts});
                  				}
                  			}else {
                  				that.cancleApply(shipId);
                  			}
                  		}					   	 
                 });
		}
		
		function cancleApply(shipId) {
			var curTime = getNowFormatDate();
			
			var basePath = "<%=basePath %>" + "contoller.do";
				
			console.log("cancleApply====" + basePath);	
				
  			var params = {operation:'cancelMobileShipApply',shipId:shipId,userId:<%=userId %>,modifyTime:curTime};
   	 		Ajax.get(basePath, params, function(msg){	
   	 					console.log("msg=====" + msg);
                  		var msgObj = JSON.parse(msg);
                  		if ( parseInt(msgObj.isSuccess) == 1) {
                  			//window.location.href = basePath + "?operation=listMineAddr&userId=<%=userId %>";
               				//updateApplyStatus(shipId);
               				window.location.reload();
                  		}else {
                  			$.DialogByZ.Alert({Title: "提示", Content: "撤销失败，请稍后再试",BtnL:"确定",FunL:alerts});
                  		}					   	 
                 });
   	 	}
		
		function updateApplyStatus(shipId) {
			
		}
		
		function gotoTransport(shipId) {
			var basePath = "<%=basePath %>" + '/controller.do';
 			var path = basePath + "?operation=mobileTransportList&" + "shipId=" + shipId;
 			
 			window.location.href = path;
		}
	</script>
	
  </body>
</html>
