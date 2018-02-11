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
String pageHtml = pageCtl.getPaginationHtml("searAddrForm");

//Test
//request.getSession().setAttribute("UserId", "1");
//request.getSession().setAttribute("user_sales_no", "015");

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");

String customerNameSH=(String)request.getParameter("customerNameSH");
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>搜索</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="format-detection" content="telephone=no">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="jsp/htms/mobile/css/order.css" type="text/css"></link>
  </head>
 <link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">
  <link rel="stylesheet" href="jsp/htms/mobile/css/zdialog.css" type="text/css">
  <script type="text/javascript" src="<%=path %>/js/common/common.js"></script>
  
  <body>
   <form  id="searAddrForm"   action="contoller.do"  method="GET">
    <input id="operation"name="operation" value="searMineAddr" type="hidden"/>
    <input type="hidden" id="userId" name="userId" value="<%=userId %>"/>
  	<input type="hidden" id="salesNo" name="salesNo" value="<%=salesNo %>"/>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
  
  	<div class="container">
  		<div class="top">
   			<div class="top-left"><a href="contoller.do?operation=listMineAddr&userId=<%=userId %>"><img src="jsp/htms/mobile/image/button/return.jpg" style="width: 25px;"/></a></div>
   			<%if(customerNameSH==null){ %>
   			<div class="top-center" style="margin: 5px 21% 1px;"><input type="text" placeholder="输入客户名称" id="customerNameSH" name="customerNameSH" style="width: 85%;height: 24px;"/></div>
   			<%}else{ %>
   			<div class="top-center" style="margin: 5px 21% 1px;"><input type="text" placeholder="输入客户名称" id="customerNameSH" name="customerNameSH" value="<%=customerNameSH %>" style="width: 85%;height: 24px;"/></div>
   			<%} %>
   			<div class="top-right" ><a href="javascript:submit('searAddrForm')" ><img src="jsp/htms/mobile/image/button/search.png" style="width: 25px;"/></a></div> 	
   		</div>
   	
   		<div class="content" >  		
   			<%
   			if (addrList != null && addrList.size() > 0) {
   				for (int i = 0; i < addrList.size(); i++) {
   					CustomerAddrBean addrBean = addrList.get(i);
   					
   			%>
   				<div class="addrcontent" >
   				<input type="hidden" id="customerName" name="customerName" value="<%=addrBean.getCustomerName() %>">
   						<div class="custname">联系人:<%=addrBean.getCaddrContactor() %>
   							<span class="custphone">联系方式:<%=addrBean.getCaddrTelephone() %></span>
   						</div>
   						<div class="address">地址:<%=addrBean.getAreaName() %><%=addrBean.getCaddrDetail() %></div>
   					<div class="edita" align="right">
   						<a href="contoller.do?operation=modifyAddress&addrId=<%=addrBean.getCaddrId() %>&areaId=<%=addrBean.getAreaId() %>&addrContactor=<%=addrBean.getCaddrContactor() %>&addrTelephone=<%=addrBean.getCaddrTelephone() %>&addrDetail=<%=addrBean.getCaddrDetail() %>&userId=<%=userId %>&salesNo=<%=salesNo %>&customerId=<%=addrBean.getCustomerId() %>">
   						<button style="border: none;"  type="button"  ><img src="jsp/htms/mobile/image/button/edita.png" width="11px" ></img>&nbsp编辑</button>
   						</a>
   						
						<a href="javascript:deleteConfirm(<%=addrBean.getCaddrId() %>)">
							<button style="border: none;"  type="button"  ><img src="jsp/htms/mobile/image/button/dele.jpg" width="11px" ></img>&nbsp删除</button>
						</a>   						
   					</div>
   				</div>
   				
   			<%
   				}
   			} else {
   			%>
   				<div style="margin-top:60px;text-align:center;background:#f0f1f3;" >没有找到相关结果</div>
   			<%}%>
   		</div> 	
   		
   		<%if(total>=perPageCount){ %>	
   		 <input	type="hidden" name="perPageCount" id="perPageCount" value=<%=perPageCount %>>                   
			<%=pageHtml %>
  	 	<%} %>
  	</div>
  	   	 	
  	<script type="text/javascript">
  	
  		function deleteConfirm(addrId) {
  			console.log("delete addr=" + addrId);
  		
  			$.DialogByZ.Confirm({Title: "提示", Content: "确定要删除这个地址吗？",FunL:function() {
  				$.DialogByZ.Close();
  				
  				var basePath = "<%=basePath %>" + "contoller.do?";
  			//if (confirm("确定要删除这个地址吗？")) {
  				 window.location.href = basePath + "operation=deleteMineAddr&addrId=" + addrId;
  			//}	
  			},FunR:function(){
  				$.DialogByZ.Close();
  			}});  			 			
  		}
  		
  	</script>   	 	
  </form>
  </body>
</html>
