<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.zzy.htms.sales.custorder.CustOrderBean,com.mobilecn.utils.random.IntRandom"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<CustOrderBean> applyList=(List<CustOrderBean>)request.getAttribute("custOrderList");
List<CustomerAddrBean> addrLists=(List<CustomerAddrBean>)request.getAttribute("addrLists");
String shipCode = tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(10,99); 

String codetailIdArray = "[";
for (int i = 0; i < applyList.size(); i++) {
	CustOrderBean orderBean = applyList.get(i);
	if (codetailIdArray.length() > 1) {
		codetailIdArray += ",";
	}
	
	codetailIdArray += "\"";
	String codetailId = (String)orderBean.getCodetailCertificate();
	
	codetailIdArray += codetailId;
	codetailIdArray += "\"";
}
codetailIdArray += "]";

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>申请</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">
	<link rel="stylesheet" href="jsp/htms/mobile/css/zdialog.css" type="text/css">
  </head>
  <script type="text/javascript" src="jsp/htms/mobile/js/apply.js"></script>  
  <script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  <script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
   <script type="text/javascript" src="../../htms/js/MathCalculator.js"></script>
  <body>
  <div class="container">
  <form id="custOrderForm"   action="contoller.do"  method="GET">
  <input type="hidden" id="operation" name="operation" value="addapplyMobile"/>
  <input type="hidden" id="userId" name="userId" value="<%=userId %>"/>
    <input type="hidden" id="salesNo" name="salesNo" value="<%=salesNo %>"/>
 	<div class="top">
  		<div class="top-left" ><a href="contoller.do?operation=applylist&userId=<%=userId %>&salesNo=<%=salesNo %>"><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 30px;"/></a></div> 
		<div class="top-center" >申请</div> 
		<div class="top-right"  ></div> 
	</div>
 	<div class="content" >
   	<% CustOrderBean custOrderBean=null;
   			if(applyList!=null){
   			
   			custOrderBean=(CustOrderBean)applyList.get(0);
   			
   	%>
   	<div style="margin-left: 2%" > 
		<input type="hidden" id="corderId" name="corderId" value="<%=custOrderBean.getCorderId() %>"/>
			<div>客户：<%=custOrderBean.getCustomerName()%> </div>
			<div>订单：<%=custOrderBean.getCorderCode()%></div>
			<div>提货工厂：<%=custOrderBean.getFetchFactory() %> </div>
			<div>时间：<%=custOrderBean.getCreateTime()%>  </div>
			
			<div >客户地址：
				<select id="caddrId" name="caddrId" style="width: 25%">
				<%	if(addrLists!=null){
			   		CustomerAddrBean nextBean=null;
			   		for(int j=0;j<addrLists.size();j++){
			   			nextBean=(CustomerAddrBean)addrLists.get(j);
		   		 %>
					<option value="<%=nextBean.getCaddrId() %>"><%=nextBean.getAreaName()%><%=nextBean.getCaddrDetail() %></option>
				<%} }%>
				</select>
				<div style="float: right;margin-right: 40%;"><a href="contoller.do?operation=addAddress&isModify=0&corderId=<%=custOrderBean.getCorderId() %>&customerCode=<%=custOrderBean.getCustomerCode() %>&customerId=<%=custOrderBean.getCustomerId() %>&codetailId=<%=custOrderBean.getCodetailId() %>">新增</a></div>
			</div>
			<%
			for(int i=0;i<applyList.size();i++){
   				custOrderBean=(CustOrderBean)applyList.get(i); 
   			%>
   			<!--applyStatus -2为已撤销、-1为未通过、0为初始状态  审批中、1为通过、2为已经分配 -->
			<div style="border-top:1px #c5c5c5 dashed;">细项号：<%=custOrderBean.getCodetailCertificate()%> </div>
			<div>物料： <%=custOrderBean.getCodetailCertificateDesc()%> </div>
			<div>单价：￥<%=custOrderBean.getUnitPrice() %> </div>
			<input type="hidden" id="codetailId" name="codetailId" value="<%=custOrderBean.getCodetailId() %>"/>
			<input id="shipDetailStatus" name="shipDetailStatus" value="0" type="hidden"/>
			<input id="applyStatus" name="applyStatus" value="0" type="hidden"/>
			<input id="shipCode" name="shipCode" value="<%=shipCode %>" type="hidden"/>
			<input id="itemCode" name="itemCode" value="<%=custOrderBean.getCodetailCertificate() %>" type="hidden"/>
			<input id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>" type="hidden"/>
			<input id="orderAmount<%=i %>"name="orderAmount" value="<%=custOrderBean.getOrderAmount() %>"  type="hidden"/>
			<input id="applyTotalTonNum" name="applyTotalTonNum" type="hidden" />
			<input id="applyTotalPackNum" name="applyTotalPackNum" type="hidden" />
			<div >可申请数：<input id="showAppliableAmount"name="showAppliableAmount" value="<%=custOrderBean.getAppliableAmount() %>"  readonly="true" disabled="disabled" style="border:0px;background-color: #ffffff;color: black;width: 80px; "/>
				<input id="appliableAmount<%=i %>" name="appliableAmount" value="<%=custOrderBean.getAppliableAmount() %>" type="hidden"/>
				<span >已申请数：
				<input id="showAppliedAmount"name="showAppliedAmount" value="<%=custOrderBean.getAppliedAmount() %>"  readonly="true" disabled="disabled" style="border:0px;background-color: #ffffff;color: black;width: 80px;"/>
				<input id="appliedAmount<%=i %>" name="appliedAmount" value="<%=custOrderBean.getAppliedAmount() %>" type="hidden"/>
				</span> 
			</div>
			<div >申请吨数：<input id="applyTonNum<%=i %>" name="applyTonNum" type="text"  style="width: 25%" />
			<span >申请包数：<input id="applyPackNum<%=i %>" name="applyPackNum"  type="text" style="width: 25%"/>
			</span>
			</div>
			<%} %>
		<div style="position: fixed;bottom: 4px;width: 97%;" ><input type="button" onclick="applyConfirm();" id="_save" value="保存" style="width: 100%;border-radius: 7px;"/></div>
		</div>
		</div>
   	<% }%>
   	</form>
   	</div>
   	
   	<script type="text/javascript">
   	
   		var codetailIdArray = <%=codetailIdArray %>
   		
   		function alerts(){
	  		$.DialogByZ.Close();
   		}
   	
   		function applyConfirm() {
   			var retValue = validateForm();
   			
   			if (retValue.code != SUCCESS) {
   				var msg = retValue.msg;
   				$.DialogByZ.Alert({Title: "提示", Content: msg,BtnL:"确定",FunL:alerts});
   				
   				return;
   			}
   			 			
   			submitForm();
   		}
   		
   		
   	</script>
   	
  </body>
</html>
