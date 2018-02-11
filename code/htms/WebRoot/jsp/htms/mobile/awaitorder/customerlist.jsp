<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.zzy.htms.sales.customer.CustomerBean"%>
<%@page import="com.mobilecn.utils.PageCtl" %>
<%@page import="com.mobilecn.utils.JTypeUtils" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<CustomerBean> customerList=(List<CustomerBean>)request.getAttribute("customerList");
if (customerList == null) {
	customerList = new ArrayList();
}
//Test
//request.getSession().setAttribute("UserId", "1");
//request.getSession().setAttribute("user_sales_no", "015");

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
String pageHtml = pageCtl.getPaginationHtml("customerForm");
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>手机助手</title>
     <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css"></link>
  <link rel="stylesheet" href="jsp/htms/mobile/css/zdialog.css" type="text/css">
  
  <style>
*{margin: 0; padding: 0;}

.ta_c{text-align: center;
margin-top: 100px;}

@-webkit-keyframes rotation{
from {-webkit-transform: rotate(0deg);}
to {-webkit-transform: rotate(360deg);}
}

.Rotation{
-webkit-transform: rotate(360deg);
animation: rotation 3s linear infinite;
-moz-animation: rotation 3s linear infinite;
-webkit-animation: rotation 3s linear infinite;
-o-animation: rotation 3s linear infinite;
}

.img{border-radius: 250px;}

</style>
  </head>
  
  <body>
   <form id="customerForm"   action="contoller.do"  method="GET">
	  <input type="hidden" id="operation" name="operation" value="customerList"/>
	  <input type="hidden" id="userId" name="userId" value="<%=userId %>"/>
	  <input type="hidden" id="salesNo" name="salesNo" value="<%=salesNo %>"/>
     
		<div class="top">
		  <div class="top-left"><a href="contoller.do?operation=listMobile" ><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div> 
		  <div class="top-center">客户列表</div> 
		  <div class="top-right" style="left:80% ">
			  <span><a href="contoller.do?operation=searCustList&userId<%=userId %>&salesNo=<%=salesNo %>"><img src="jsp/htms/mobile/image/button/search.png" style="width: 25px;"/></a></span>&nbsp&nbsp
			  <span ><a href="javascript:orderSync()"><img id="refresh_image" src="jsp/htms/mobile/image/button/refresh.png" style="width: 25px;" /></a></span>
		  </div>
		</div>
		<div class="content">
		<%
			CustomerBean customerBean=null;
			for(int i=0;i<customerList.size();i++){
			customerBean=(CustomerBean)customerList.get(i);
		 %>
			<div class="main-content">
				<a href="contoller.do?operation=customerOrderList&customerName=<%=customerBean.getCustomerName() %>&customerId=<%=customerBean.getCustomerId() %>&salesNo=<%=salesNo %>&userId=<%=userId %>" style="display: block;">
				<%=customerBean.getCustomerName() %>
					<img src="jsp/htms/mobile/image/button/left.jpg" style="width: 10px;float: right;"></img>
				</a>
			 </div>
			 <%} %>
		</div>	
		
		<% if(total>=perPageCount){%>
			<input	type="hidden" name="perPageCount" id="perPageCount" value=<%=perPageCount %>>                   
			<%=pageHtml %>
		<%} %>
   	</form>
	<script src="jsp/htms/mobile/js/Ajax.js" ></script>
   	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
  	<script type="text/javascript" src="jsp/htms/mobile/js/mobile.js"></script>	
	   	<script type="text/javascript">
	   	var basePath = "<%=basePath %>" + '/controller.do';
	   	function alerts(){
	  		$.DialogByZ.Close();
   		};
   		function succssAlerts() {
   			window.location.reload();
   			$.DialogByZ.Close();
   		};
   		
	   		function orderSync() {
	   			<% if (salesNo == null) { %>
	   				$.DialogByZ.Alert({Title: "提示", Content: "登录超时，请重新登录",BtnL:"确定",FunL:alerts});
	   				
	   				return;
	   			<% } %>
	   			
	   			//class="Rotation img"
	   			
	   			var refreshImage = document.getElementById("refresh_image");
	   			refreshImage.setAttribute("class", "Rotation img");
	   			
	   			var startDate = getSyncStartDate();
	   			var endDate = getSyncEndDate();
	   			
	   			//console.log("startDate=" + startDate);
	   			//console.log("endDate=" + endDate);
	   			
	   			var salesNos = "<%=salesNo %>";
	   			
	   			//console.log("salesNosNum=" + salesNosNum);
	   			console.log("salesNos=" + salesNos);
	   			
   				var params = {operation:'mobileSyncSalesOrder', startDate:startDate, endDate:endDate, salesNo:salesNos, userId:<%=userId%>};
    	
	    		Ajax.getWithError(basePath, params, function(msg){		    					    					    			
	    			
	    				var msgObj = JSON.parse(msg);
	              		if ( parseInt(msgObj.isSuccess) == 1) {

	              			$.DialogByZ.Alert({Title: "提示", Content: "订单同步成功",BtnL:"确定",FunL:succssAlerts});
	              			
	              			console.log('orderSync success' + msg);
	              		}else {
							$.DialogByZ.Alert({Title: "提示", Content: "订单同步失败，请稍后再试",BtnL:"确定",FunL:alerts});
							console.log('orderSync fail' + msg);
	              		}
	          			
		    			refreshImage.setAttribute("class", "none");
		    				
	          			},function(status) {	
	          				refreshImage.setAttribute("class", "none");
		    				$.DialogByZ.Alert({Title: "提示", Content: "订单同步失败，请稍后再试",BtnL:"确定",FunL:alerts});
	          });
			}
	  </script>
  </body>
</html>
