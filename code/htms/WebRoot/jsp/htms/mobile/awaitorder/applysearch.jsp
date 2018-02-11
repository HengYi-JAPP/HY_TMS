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
//Test
//request.getSession().setAttribute("UserId", "1");
//request.getSession().setAttribute("user_sales_no", "015");

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");

String corderCodeSH=(String)request.getParameter("corderCodeSH");

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
String pageHtml = pageCtl.getPaginationHtml("applyForm");
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>搜索</title>
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
</head>
<script type="text/javascript" src="<%=path %>/js/common/common.js"></script>
<link rel="stylesheet" href="jsp/htms/mobile/css/order.css" type="text/css"></link>
  <body>
   
    <form  id="applyForm"   action="contoller.do"  method="GET">
    <input id="operation" name="operation" value="applySearch" type="hidden"/>
    <input type="hidden" id="userId" name="usreId" value="<%=userId %>"/>
  	<input type="hidden" id="salesNo" name="salesNo" value="<%=salesNo %>"/>
  	<input type="hidden" id="customerId" name="customerId" value="<%=customerId %>"/>
  	<input type="hidden" id="customerName" name="customerName" value="<%=customerName %>"/>
  	
		<div class="top">
   			<div class="top-left"><a href="contoller.do?operation=customerOrderList&customerId=<%=customerId%>&customerName=<%=customerName %>&userId=<%=userId %>&salesNo=<%=salesNo %>"><img src="jsp/htms/mobile/image/button/return.jpg" style=" width: 25px"/></a></div>
   			<%if(corderCodeSH==null||corderCodeSH==""){ %>
   			<div class="top-center"style="margin: 5px 21% 1px;" ><input type="text" placeholder="输入订单号" id="corderCodeSH" name="corderCodeSH" style="width: 85%;height: 24px;"/></div>
   			<%}else{ %>
   			<div class="top-center"style="margin: 5px 21% 1px;" ><input type="text" placeholder="输入订单号" id="corderCodeSH" name="corderCodeSH" value="<%=corderCodeSH %>" style="width: 85%;height: 24px;"/></div>
   			<%} %>
   			<div class="top-right" ><a href="javascript:submit('applyForm')" ><img src="jsp/htms/mobile/image/button/search.png" style="width: 25px;"/></a></div> 
    	</div>
    	<div class="content" >
    	
    	<!-- 没有搜索结果 -->
    	<%
    		if(customerOrderListMap == null  || applyKeyList == null){
    	%>
    	 	<div style="margin-top:60px;text-align:center;background:#f0f1f3;" >没有找到相关结果</div>
    	<% } %>
    	
    	<!-- 有搜索结果 -->
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
	   	<div style="border-bottom: 10px solid #e8e8e8;" > 
			<div  class="ordercontent">
				<span class="order">订单:<%=custOrderBean.getCorderCode() %></span>&nbsp&nbsp
				<span class="factory"><%=custOrderBean.getFactoryName() %></span>&nbsp&nbsp
				<span class="time"><%=custOrderBean.getCreateTime()%></span>&nbsp&nbsp
				<span ><a href="contoller.do?operation=applyOrder&userId=<%=userId %>&salesNo=<%=salesNo %>&corderCode=<%=custOrderBean.getCorderCode() %>&corderId=<%=custOrderBean.getCorderId() %>&customerCode=<%=custOrderBean.getCustomerCode() %>&codetailId=<%=custOrderBean.getCodetailId() %>&customerId=<%=custOrderBean.getCustomerId() %>&customerName=<%=custOrderBean.getCustomerName() %>"><span class="applybtn">申请</span></a></span>
			 </div>
			 <%
			 	for(int i=0;i<detailList.size();i++){
					custOrderBean=(CustOrderBean)detailList.get(i);
					float appliableAmount =  Float.parseFloat(custOrderBean.getAppliableAmount());
					float appliedAmout = Float.parseFloat(custOrderBean.getAppliedAmount());
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
			<%} }
				
			%>
		</div>
		
		<% if(total>=perPageCount){%>
			<input	type="hidden" name="perPageCount" id="perPageCount" value=<%=perPageCount %>>                   
			<%=pageHtml %>
		<%} %>
   	</form>
  </body>
</html>
