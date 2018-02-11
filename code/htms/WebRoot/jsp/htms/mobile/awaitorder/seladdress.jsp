<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean"%>
<%@page import="com.mobilecn.utils.PageCtl" %>
<%@page import="com.mobilecn.utils.JTypeUtils" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List <CustomerAddrBean> addrList = (List <CustomerAddrBean>)request.getAttribute("addrLists");

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
String pageHtml = pageCtl.getPaginationHtml("CustomerAddrForm");

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");


String customerId=(String)request.getParameter("customerId");
String customerName=(String)request.getParameter("customerName");
String customerCode=(String)request.getParameter("customerCode");
String codetailId=(String)request.getParameter("codetailId");
String corderId=(String)request.getParameter("corderId");

%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户收货地址</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">
 <link rel="stylesheet" href="jsp/htms/mobile/css/order.css" type="text/css"></link>
  <link rel="stylesheet" href="jsp/htms/mobile/css/zdialog.css" type="text/css">
  
  <body>
   <form  id="CustomerAddrForm"   action="contoller.do"  method="GET">
    <input id="operation"name="operation" value="listCustMobileAddr" type="hidden"/>
    <input type="hidden" id="userId" name="userId" value="<%=userId %>"/>
  	<input type="hidden" id="salesNo" name="salesNo" value="<%=salesNo %>"/>
  	<input type="hidden" id="customerName" name="customerName" value="<%=customerName %>"/>
  	<input type="hidden" id="customerCode" name="customerCode" value="<%=customerCode %>"/>
  	<input type="hidden" id="codetailId" name="codetailId" value="<%=codetailId %>"/>
  	<input type="hidden" id="corderId" name="corderId" value="<%=corderId %>"/>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
  
  	<div class="container">
  		<div class="top">
   				<div class="top-left"><a href="contoller.do?operation=applyOrder&corderId=<%=corderId %>&customerCode=<%=customerCode %>&customerId=<%=customerId %>&codetailId=<%=codetailId %>&customerName=<%=customerName %>&userId=<%=userId %>"><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div>
   				<div class="top-center" >客户收货地址</div>	
   				<div class="top-right"><a href="contoller.do?operation=addCustAddress&isModify=1&corderId=<%=corderId %>&customerCode=<%=customerCode %>&customerId=<%=customerId %>&codetailId=<%=codetailId %>&userId=<%=userId %>&customerName=<%=customerName %>"><img src="jsp/htms/mobile/image/button/add.jpg" style="width: 25px;"/></a></div>	
   		</div>
   	
   		<div class="content" >
   			<%
   			if (addrList != null && addrList.size() > 0) {
   				for (int i = 0; i < addrList.size(); i++) {
   					CustomerAddrBean addrBean = addrList.get(i);
   					
   					
   			%>
   			<input type="hidden" id="customerId" name="customerId" value="<%=addrBean.getCustomerId() %>"/>
   		<a href="contoller.do?operation=applyOrder&corderId=<%=corderId %>&customerName=<%=customerName %>&customerCode=<%=customerCode %>&customerId=<%=customerId %>&codetailId=<%=codetailId %>&userId=<%=userId %>&addrId=<%=addrBean.getCaddrId() %>&contactName=<%=addrBean.getCaddrContactor() %>&contactPhone=<%=addrBean.getCaddrTelephone()%>&detailAddr=<%=addrBean.getAreaName()+addrBean.getCaddrDetail() %>&areaId=<%=addrBean.getAreaId() %>" style="display: block;">
   				<div class="addrcontent" >
					<div class="custname" ><%=addrBean.getCaddrContactor() %>
						<span class="custphone" ><%=addrBean.getCaddrTelephone() %></span>
					</div>
					<div class="address" >地址:<%=addrBean.getAreaName() %><%=addrBean.getCaddrDetail() %></div>
   				
   					<div  align="right" class="edita">
	   					<span>
	   						<a href="contoller.do?operation=modifyCustAddress&addrId=<%=addrBean.getCaddrId() %>&areaId=<%=addrBean.getAreaId() %>&addrContactor=<%=addrBean.getCaddrContactor() %>&addrTelephone=<%=addrBean.getCaddrTelephone() %>&addrDetail=<%=addrBean.getCaddrDetail() %>&corderId=<%=corderId %>&customerCode=<%=customerCode %>&customerId=<%=customerId %>&codetailId=<%=codetailId %>&userId=<%=userId %>&customerName=<%=customerName %>">
	   						<button style="border: none;"  type="button"  ><img src="jsp/htms/mobile/image/button/edita.png" width="11px" ></img>&nbsp编辑</button>
	   						</a><!--
	   						
							<a href="javascript:deleteConfirm(<%=addrBean.getCaddrId() %>)">
								<button style="border: none;"  type="button"  >删除</button>
							</a> 
						--></span>  						
   					</div>
   				</div>
   		</a>
   			<%
   				}
   			} %>
   		
   		</div>
   		
   		<%	
   			if(total>=perPageCount){
   		 %>	 
  	 <input	type="hidden" name="perPageCount" id="perPageCount" value=<%=perPageCount %>>                   
		<%=pageHtml %>
	<%} %>
	
	</div>
	
	</form>
  </body>
</html>
