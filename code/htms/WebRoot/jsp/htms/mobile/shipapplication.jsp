<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    
    <title>客户排发货申请</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">

  </head>
  
  <body>
   	<table class="head_box" >
   		<tr>
   			<td><a href="jsp/htms/mobile/customerapplication.jsp"><img src="jsp/htms/mobile/image/button/return.jpg" style="margin-left: -20px; width: 38px"/></a></td>
   			<td>客户排发货申请</td>
   			<td><img src="jsp/htms/mobile/image/button/black.jpg" style="width: 38px;"/></td>
   		</tr>
   	</table>
   	<table class="head_block">
			<tr>
				<td></td>
			</tr>
	</table>
   	<table class="body_box" align="center" valign="middle">
   		<tr>
   			<td colspan="2" style="text-align: center;font-size: 1rem;font-weight: bold;font-family: '宋体';color: black;">杭州萧山三星化纤原料有限公司</td>
   		</tr>
   		<tr>
   			<td>
   				<table align="center" >
   					<tr>
   						<td>
	   						<div style="float: left;">物料：</div>
						   	<div style="float: left;">DTY-666dtex/192f-B56041-A-S+Z-WL27</div>
					   	</td>
   						
   					</tr>
   					<tr>
				   		<td>
					   		<div style="float: left;">订单号：</div>
					   		<div style="float: left;">0010000168</div>
					   		<div style="float: left;margin-left:2.5em;">申请数量：</div>
					   		<div style="float: left;">10/包数：</div>
					   		<div style="float: left;">2</div>
				   		</td>				   
			   		</tr>
			   		<tr>
			   			<td>
			   				<div style="float: left;">申请号：20170725-65901</div>
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   				<div style="float: left;">收货人：</div>
					   		<div style="float: left;">789</div>
			   				
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   				<div style="float: left;">收货地址：</div>
					   		<div style="float: left;">浙江省杭州市萧山区衙前7890456</div>
			   			</td>
			   		</tr>
			   		<tr>
			   			<td>
			   				<div style="float: left;">状态：审批中</div>
					   		<div style="float: left;"><a ><button class="button">撤销</button></a></div>
			   			</td>
			   		</tr>
   				</table>
   			</td>
   		</tr>
   	</table>
  </body>
</html>
