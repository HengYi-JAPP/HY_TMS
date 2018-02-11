<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.zzy.htms.sales.custorder.CustOrderBean,com.mobilecn.utils.random.IntRandom"%>
<%@page import="com.mobilecn.utils.PageCtl" %>
<%@page import="com.mobilecn.utils.JTypeUtils" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<String> applyKeyList = (List<String>)request.getAttribute("applyKeyList");
Map<String, List<CustOrderBean>> customerOrderListMap=(Map<String, List<CustOrderBean>>)request.getAttribute("applyListMap");
List<CustOrderBean> detailList=null;
String customerName=(String)request.getParameter("customerName");
String customerId=(String)request.getParameter("customerId");

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");


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
String pageHtml = pageCtl.getPaginationHtml("custOrderForm");
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
	
	<link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">
  	<link rel="stylesheet" href="jsp/htms/mobile/css/order.css" type="text/css"></link>
  	<link rel="stylesheet" href="jsp/htms/mobile/css/zdialog.css" type="text/css">
  </head>
  
  <body onload="testLogin()">
  <div class="container">
  <form id="custOrderForm"   action="contoller.do"  method="GET">
  <input type="hidden" id="operation" name="operation" value="customerOrderList"/>
  <input type="hidden" id="userId" name="userId" value="<%=userId %>"/>
    <input type="hidden" id="salesNo" name="salesNo" value="<%=salesNo %>"/>
 	<div class="top">
  		<div class="top-left" ><a href="contoller.do?operation=customerList&userId=<%=userId %>&salesNo=<%=salesNo %>"><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div> 
		<div class="top-center" style="width: 65%" ><%=customerName %></div> 
		<div class="top-right" ><a href="contoller.do?operation=applySearch&customerId=<%=customerId%>&customerName=<%=customerName %>&userId=<%=userId %>&salesNo=<%=salesNo %>"><img src="jsp/htms/mobile/image/button/search.png" style="width: 25px;"/></a></div> 
	</div>
 	<div class="content" >
   <%
        CustOrderBean custOrderBean=null;
		
		if(customerOrderListMap!=null  && applyKeyList != null){
		
			for (int j = 0; j < applyKeyList.size(); j++) {
	
			detailList = customerOrderListMap.get(applyKeyList.get(j));
			
			if (detailList.size() == 0) {
				continue;
			}
			
			custOrderBean=(CustOrderBean)detailList.get(0);
    %>
   	<div  style="border-bottom: 10px solid #e8e8e8;"> 
   	<input type="hidden" id="customerId" name="customerId" value="<%=custOrderBean.getCustomerId() %>"/>
   		<input type="hidden" id="customerName" name="customerName" value="<%=custOrderBean.getCustomerName() %>"/>
		<div  class="ordercontent">
			<span class="order">订单:<%=custOrderBean.getCorderCode() %></span>&nbsp&nbsp
			<span class="factory"><%=custOrderBean.getFactoryName() %></span>&nbsp&nbsp
			<span class="time"><%=custOrderBean.getCreateTime()%></span>&nbsp&nbsp
			<span ><a href="contoller.do?operation=applyOrder&userId=<%=userId %>&salesNo=<%=salesNo %>&corderCode=<%=custOrderBean.getCorderCode() %>&corderId=<%=custOrderBean.getCorderId() %>&customerCode=<%=custOrderBean.getCustomerCode() %>&codetailId=<%=custOrderBean.getCodetailId() %>&customerId=<%=custOrderBean.getCustomerId() %>&customerName=<%=custOrderBean.getCustomerName() %>"><span class="applybtn">申请</pan></a></span>
		 </div>
		 <%
		 	for(int i=0;i<detailList.size();i++){
				custOrderBean=(CustOrderBean)detailList.get(i);
				float appliableAmount = 0;
				if (custOrderBean.getAppliableAmount() != null&& custOrderBean.getAppliableAmount().length() > 0) {
				 	appliableAmount = Float.parseFloat(custOrderBean.getAppliableAmount());
				 }
				 
				float appliedAmout = 0;
				if (custOrderBean.getAppliedAmount() != null &&custOrderBean.getAppliedAmount().length()> 0) {
				 	appliedAmout = Float.parseFloat(custOrderBean.getAppliedAmount());
				 }
				 
				float percent = (appliableAmount / (appliableAmount + appliedAmout)) * 100;
				
				String applySum=(appliableAmount+appliedAmout)+"";
			    if(applySum.indexOf(".") > 0){
			        applySum = applySum.replaceAll("0+?$", "");//去掉多余的0
			        applySum = applySum.replaceAll("[.]$", "");//如最后一位是.则去掉
			    }
			    
			    String appliableNum = custOrderBean.getAppliableAmount();
			    if(appliableNum.indexOf(".") > 0){
			        appliableNum = appliableNum.replaceAll("0+?$", "");//去掉多余的0
			        appliableNum = appliableNum.replaceAll("[.]$", "");//如最后一位是.则去掉
			    }
			  

		  %>
		  <div class="orderlist">
			<div class="desc">物料:<span style="color: #333333;"><%=custOrderBean.getCodetailCertificateDesc()%> </span> </div>
			<div>
				<span class="price">单价：<span class="unitprice"><%=custOrderBean.getUnitPrice() %></span> </span>
				<span class="applyamount"> 
				<div><span style="color: #26a5c8;"><%=appliableNum %></span>/<%=applySum %></div>
				<div class="graphbox" >
					<div class="graph" style="width:<%=percent %>%"></div>
				</div>
				</span>
			</div>
			</div>
			<%} %>
		</div>
		<%} }%>
		</div>
		<%if(total>=perPageCount){ %>
		<input	type="hidden" name="perPageCount" id="perPageCount" value=<%=perPageCount %>>                   
		<%=pageHtml %>
		<%} %>
   	</form>
   	</div>
   	
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
   	<%
	String SAP_INVOKE_MESSAGE=(String)request.getAttribute("INVOKE_MESSAGE"); 
	SAP_INVOKE_MESSAGE=SAP_INVOKE_MESSAGE==null||"".equals(SAP_INVOKE_MESSAGE.trim())?"":SAP_INVOKE_MESSAGE;
	SAP_INVOKE_MESSAGE=SAP_INVOKE_MESSAGE.replaceAll("'","\"");
	//System.out.println("SAP_INVOKE_MESSAGESAP_INVOKE_MESSAGESAP_INVOKE_MESSAGESAP_INVOKE_MESSAGESAP_INVOKE_MESSAGE===:"+SAP_INVOKE_MESSAGE);
	%>
	<script type="text/javascript"> 	
	var SAP_INVOKE_MESSAGE='<%=SAP_INVOKE_MESSAGE%>';
	if(SAP_INVOKE_MESSAGE!=null&&SAP_INVOKE_MESSAGE!='null'&&SAP_INVOKE_MESSAGE!=''){
	    //alertTip(SAP_INVOKE_MESSAGE);
	    $.DialogByZ.Alert({Title: "提示", Content: SAP_INVOKE_MESSAGE, BtnL:"确定"});
	}
	</script>
   	
  </body>
</html>
