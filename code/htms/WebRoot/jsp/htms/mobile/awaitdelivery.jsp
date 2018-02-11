<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.zzy.htms.sales.custorder.CustOrderBean"%>
<%@page import="com.mobilecn.utils.PageCtl" %>
<%@page import="com.mobilecn.utils.JTypeUtils" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

Map<String, List<CustOrderBean>> applyListMap=(Map<String, List<CustOrderBean>>)request.getAttribute("applyListMap");
List<CustOrderBean> detailList=null;

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
String pageHtml = pageCtl.getPaginationHtml("custOrderForm");
//Test
request.getSession().setAttribute("UserId", "1");
request.getSession().setAttribute("user_sales_no", "015");

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");
%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>待发货订单</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css"></link>
  </head>
  <script type="text/javascript" src="../../htms/js/common/common.js"></script>
  <body >
   <form  id="custOrderForm"   action="contoller.do"  method="GET">
   <input id="operation"name="operation" value="applylist" type="hidden"/>
  <input type="hidden" id="userId" name="userId" value="<%=userId %>"/>
  <input type="hidden" id="salesNo" name="salesNo" value="<%=salesNo %>"/>
  <div class="container">
  	<div class="top">
	  	<div class="top-left" id="back" ><a href="controll.do?operation=listMobile" ><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 30px;"  /></a></div> 
		<div id="return"><div class="top-center" >待发货订单</div> </div>
	  <div class="top-right" ><a href="controll.do?operation=applySearch&userId=<%=userId %>&salesNo=<%=salesNo %>" ><img src="jsp/htms/mobile/image/button/search.png" style="width: 30px;"/></a></div> 
   	</div>
   	<div class="content" >	
   	<%  		
		CustOrderBean nestBean=null;
		
		if(applyListMap!=null){
			Set keySet = applyListMap.keySet();
			Iterator keyIterator = keySet.iterator();
			
			while(keyIterator.hasNext()) {
			
			detailList = applyListMap.get(keyIterator.next());
			
			if (detailList.size() == 0) {
				continue;
			}
			
			nestBean=(CustOrderBean)detailList.get(0);
		%>
			<div  style="border-bottom: 1px #545353 solid;padding: 2% 6px 4% 2%; margin-top:10px"> 
				<div>客户：<%=nestBean.getCustomerName()%> </div>
				<div>订单：<%=nestBean.getCorderCode()%></div>
				<div>提货工厂：<%=nestBean.getFetchFactory() %> </div>
				<div>时间：<%=nestBean.getCreateTime()%>  
				<%if(nestBean.getAppliableAmount().equals("0.00")){ %>
				<a href="contoller.do?operation=applyMobile&corderId=<%=nestBean.getCorderId() %>&customerCode=<%=nestBean.getCustomerCode() %>&codetailId=<%=nestBean.getCodetailId() %>"><input type="button"  style="float: right; border-radius: .5em;" disabled="disabled" value="申请" /></a>
				<%}else{ %>
				<a href="contoller.do?operation=applyMobile&corderId=<%=nestBean.getCorderId() %>&customerCode=<%=nestBean.getCustomerCode() %>&codetailId=<%=nestBean.getCodetailId() %>"><input type="button"  style="float: right; border-radius: .5em;" value="申请" /></a>
				<%} %>
				</div>
		<%	
			for(int i=0;i<detailList.size();i++){
				nestBean=(CustOrderBean)detailList.get(i);
		%>
				<div>细项号：<%=nestBean.getCodetailCertificate()%> </div>
				<div>物料： <%=nestBean.getCodetailCertificateDesc()%> </div>
				<%if(nestBean.getAppliableAmount().equals("0.00")){ %>
				<div>可申请数：<%=nestBean.getOrderAmount() %>/已申请数：<%=nestBean.getAppliedAmount() %> </div>
				<%}else{ %>
					<div>可申请数：<%=nestBean.getAppliableAmount() %>/已申请数：<%=nestBean.getAppliedAmount() %> </div>
				<%} %>
				<div>单价：￥<%=nestBean.getUnitPrice() %> </div>
			<%} %>
		</div>
		<%}} %>
  	</div>
   </div>
   <input	type="hidden" name="perPageCount" id="perPageCount" value=<%=perPageCount %>>                   
	<%=pageHtml %>
</form>
  </body>
</html>
