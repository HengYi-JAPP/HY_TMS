<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.zzy.htms.sales.ship.ShipBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<Integer, List<ShipBean>> appliedListMap=(Map<Integer, List<ShipBean>>)request.getAttribute("appliedListMap");
List<ShipBean> detailList=null;

//Test
request.getSession().setAttribute("UserId", "1");
request.getSession().setAttribute("user_sales_no", "015");

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");

%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>搜寻</title>
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
<script type="text/javascript" src="../../htms/js/common/common.js"></script>
  <body>
   
    <form  id="appliedForm"   action="contoller.do"  method="GET">
    <input id="operation" name="operation" value="appliedSearch" type="hidden"/>
    <input type="hidden" id="userId" name="userId" value="<%=userId %>"/>
  	<input type="hidden" id="salesNo" name="salesNo" value="<%=salesNo %>"/>
		<div class="top">
   			<div class="top-left"><a href="contoller.do?operation=appliedMobileList&userId=<%=userId %>&salesNo=<%=salesNo %>"><img src="jsp/htms/mobile/image/button/return.jpg" style=" width: 30px"/></a></div>
   			<div class="top-center" ><input type="text" placeholder="输入订单号" id="corderCodeSH" name="corderCodeSH" value=""/></div>
   			<div class="top-right" ><a href="javascript:submit('appliedForm')" ><img src="jsp/htms/mobile/image/button/search.png" style="width: 30px;"/></a></div> 
    	</div>
    	<div class="content" >	
			<%  	
   		
		ShipBean shipBean=null;
	
		if(appliedListMap!=null){
			Set keySet = appliedListMap.keySet();
			Iterator keyIterator = keySet.iterator();
			
			while(keyIterator.hasNext()) {
			
			detailList = appliedListMap.get(keyIterator.next());
			
			if (detailList.size() == 0) {
				continue;
			}
			
			shipBean=(ShipBean)detailList.get(0);
		%>
		<div  style="border-bottom: 1px #545353 solid;padding: 2% 0 2% 2%;"> 
			<div>客户：<%=shipBean.getCustomerName()%> </div>
			<div>订单：<%=shipBean.getCorderCode()%></div>
			<div>收货人：<%=shipBean.getCaddrContactor() %> </div>
			<div>收货地址：<%=shipBean.getAreaName() %><%=shipBean.getCaddrDetail() %> </div>
			
			<%
			for(int i=0;i<detailList.size();i++){
			shipBean=(ShipBean)detailList.get(i);
			%>
			<div style="border-top:1px #c5c5c5 dashed;">细项号：<%=shipBean.getCodetailCertificate() %></div>
 			<div>物料： <%=shipBean.getCodetailCertificateDesc()%> </div>
			<div>申请数量：<%=shipBean.getApplyTonNum() %>/包数：<%=shipBean.getApplyPackNum() %> </div>
			<%} %>
			
			<%if(shipBean.getApplyStatus()==1){ %>
			<div>状态：已审批通过 </div>
			<%}else if(shipBean.getApplyStatus()==2){ %>
			<div>状态：已分配 </div>
			<%}else if(shipBean.getApplyStatus()==0){ %>
			<div>状态：审批中 </div>
			<%}else if(shipBean.getApplyStatus()==-1){ %>
			<div>状态：撤销审批 </div>
			<%}else{ %>
			<div>状态：未通过</div>
			<%} %>
		
		</div>
		<%} } %>
   	</div>
 
   	</form>
  </body>
</html>
