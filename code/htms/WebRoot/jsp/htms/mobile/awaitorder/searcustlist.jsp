<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.zzy.htms.sales.customer.CustomerBean"%>
<%@page import="com.mobilecn.utils.PageCtl" %>
<%@page import="com.mobilecn.utils.JTypeUtils" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<CustomerBean> customerList=(List<CustomerBean>)request.getAttribute("customerList");
if  (customerList == null) {
	customerList = new ArrayList();
}

//Test
//request.getSession().setAttribute("UserId", "1");
//request.getSession().setAttribute("user_sales_no", "015");

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");

String customerNameSH=(String)request.getParameter("customerNameSH");


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
String pageHtml = pageCtl.getPaginationHtml("searcustForm");
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>搜索</title>
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
  <script type="text/javascript" src="<%=path %>/js/common/common.js"></script>
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
   <form id="searcustForm"   action="contoller.do"  method="GET">
	  <input type="hidden" id="operation" name="operation" value="searCustList"/>
	  <input type="hidden" id="userId" name="userId" value="<%=userId %>"/>
	  <input type="hidden" id="salesNo" name="salesNo" value="<%=salesNo %>"/>
     
		<div class="top">
		  <div class="top-left"><a href="contoller.do?operation=customerList&userId=<%=userId %>&salesNo=<%=salesNo %>" ><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div> 
		  <%if(customerNameSH==null){ %>
		  <div class="top-center" style="margin: 5px 21% 1px;"><input type="text" placeholder="输入客户名称" id="customerNameSH" name="customerNameSH"style="width: 85%;height: 24px;"/></div>
		 <%}else{ %>
		 <div class="top-center" style="margin: 5px 21% 1px;"><input type="text"  id="customerNameSH" name="customerNameSH" value="<%=customerNameSH %>" style="width: 85%;height: 24px;"/></div>
		 <%} %>
		  <div class="top-right"  >
			  <span><a href="javascript:submit('searcustForm')"><img src="jsp/htms/mobile/image/button/search.png" style="width: 25px;"/></a></span>
		  </div>
		</div>
		<div class="content">
		
		<!-- 没有搜索结果 -->
    	<%
    		if(customerList == null  || customerList.size() == 0){
    	%>
    	 	<div style="margin-top:60px;text-align:center;background:#f0f1f3;" >没有找到相关结果</div>
    	<% } %>
		
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
		<% if(total>perPageCount){%>
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
	   			
	   			var salesNos = "<%=salesNo %>".split(",");
	   			var salesNosNum = salesNos.length;
	   			var successNum = 0;
	   			var failNum = 0;
	   			
	   			//console.log("salesNosNum=" + salesNosNum);
	   			//console.log("salesNos=" + salesNos);
	   			
	   			for (var i = 0; i < salesNosNum; i++) {
	   				var oneSalesNo = salesNos[i];
	   				
	   				var params = {operation:'mobileSyncSalesOrder', startDate:startDate, endDate:endDate, salesNo:oneSalesNo, userId:<%=userId%>};
	    	
		    		Ajax.getWithError(basePath, params, function(msg){		    					    					    			
		    			
		    			var msgObj = JSON.parse(msg);
		              		if ( parseInt(msgObj.isSuccess) == 1) {
		              			successNum++;
		              			
		              			//$.DialogByZ.Alert({Title: "提示", Content: "订单同步成功",BtnL:"确定",FunL:alerts});
		              			
		              		}else {
		              			failNum++;
		              			
		              			//$.DialogByZ.Alert({Title: "提示", Content: "订单同步失败，请稍后再试",BtnL:"确定",FunL:alerts});
		              		}
		          			console.log('orderSync success' + msg);
		          			if ((successNum + failNum) >= salesNosNum) {
			    				if (failNum > 0) {
			    					$.DialogByZ.Alert({Title: "提示", Content: "订单同步失败，请稍后再试",BtnL:"确定",FunL:alerts});
			    				}else {
			    					$.DialogByZ.Alert({Title: "提示", Content: "订单同步成功",BtnL:"确定",FunL:alerts});
			    				}
			    				
			    				refreshImage.setAttribute("class", "none");
		    				}
		          			},function(status) {
		          			
		          			failNum++;
		          			if ((successNum + failNum) >= salesNosNum) {
		          				refreshImage.setAttribute("class", "none");
			    				$.DialogByZ.Alert({Title: "提示", Content: "订单同步成功",BtnL:"确定",FunL:alerts});
		    				}
		          });
	   			}
   		}
	  </script>
  </body>
</html>
