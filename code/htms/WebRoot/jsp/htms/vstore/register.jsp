<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="com.zzy.htms.logistic.carrier.CarrierBean"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

List<CarrierBean> carrierList = (List<CarrierBean>)request.getAttribute("carrierList");
if(carrierList == null){
	carrierList = new ArrayList();
}


%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

	
	<link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">
  	<link rel="stylesheet" href="jsp/htms/vstore/css/register.css" type="text/css"></link>
 	<link rel="stylesheet" href="jsp/htms/mobile/css/zdialog.css" type="text/css">
  </head>
  
  <body>
  	
   <form  id="registerForm"   action="contoller.do"  method="GET">
      <input id="operation"name="operation" value="addRegWxUser" type="hidden"/>
	  <div class="container">
	  <div class="top">
		  <div class="top-center" >注册</div>
	  </div>
	  <div class="content" >
		<div class="register"><span style="margin-left: 30px;">姓名:</span><input type="text" class="reginput"  placeholder="请输入姓名" id="driverName" name="driverName"/></div>
		<div class="register"><span style="margin-left: 30px;">电话:</span><input type="text" class="reginput"  placeholder="请输入手机号码" maxlength="11" id="driverMobile" name="driverMobile"/></div>
		<div class="register">身份证号:<input type="text" class="reginput" style="margin-left: 10px;"  placeholder="请输入身份证号" id="identity" name="identity" maxlength="18"/></div>
		<div class="register">物流公司:
			<select class="reginput" id="carrierName" name="carrierName">
			<%
				CarrierBean carrierBean=null;
				for(int i=0;i<carrierList.size();i++){
					carrierBean=(CarrierBean) carrierList.get(i);
			 %>
			 	<option value="<%=carrierBean.getCarrierId() %>"><%=carrierBean.getCarrierName() %></option>
			 <%} %>
			 </select>
		</div>
	    <div class="register"><span style="margin-left: 18px;">车牌号:</span><input type="text" class="reginput" style="margin-left: 10px;"  placeholder="请输入车牌号" id="vehicleNo" name="vehicleNo"/></div>
	   <div style="padding:5px 5px;"> <a href="javascript:regSave();"><div class="regBtn" onclick="regSave();" />保存</div></a></div>
	  </div>
	  </div>
	</form>
	 <script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
	<script type="text/javascript">
		var driverName = document.getElementById("driverName");
		var driverMobile = document.getElementById("driverMobile");
		var identity = document.getElementById("identity");
		var vehicleNo = document.getElementById("vehicleNo");
		
		 function alerts(){
	  		$.DialogByZ.Close();
   		}
   		
		function trim(str) {
		 return str.replace(/(^\s+)|(\s+$)/g, "");
		}
		
		function regSave(){
			var name = trim(driverName.value)
			if (name == null || name.length == 0) {
	   	 		$.DialogByZ.Alert({Title: "提示", Content: "请填写联系人",BtnL:"确定",FunL:alerts});
	   	 		return;
   	 		}
   	 		var phone=trim(driverMobile.value)+"";
   	 		if (phone == null || phone.length == 0) {
	   	 		$.DialogByZ.Alert({Title: "提示", Content: "请填写电话",BtnL:"确定",FunL:alerts});
	   	 		return;
   	 		}
   	 		var phoneTest = "^[0-9]*$";
	   	 	var reg = new RegExp(phoneTest);
	   	 	if (!reg.test(phone)) {
	   	 		$.DialogByZ.Alert({Title: "提示", Content: "请填写正确的手机号码",BtnL:"确定",FunL:alerts});
	   	 		return;
	   	 	}
   	 	
   	 		
   	 		var identityNum=trim(identity.value)+"";
   	 		if (identityNum == null || identityNum.length == 0) {
	   	 		$.DialogByZ.Alert({Title: "提示", Content: "请填写身份证号",BtnL:"确定",FunL:alerts});
	   	 		return;
   	 		}
   	 		var driverTest = "^[0-9Xx]+$";
	   	 	var reg = new RegExp(driverTest);
	   	 	if (!reg.test(identityNum)) {
	   	 		$.DialogByZ.Alert({Title: "提示", Content: "请填写正确的身份证号",BtnL:"确定",FunL:alerts});
	   	 		return;
	   	 	}
	   	 	var vehicle=trim(vehicleNo.value)+"";
   	 		if (vehicle == null || vehicle.length == 0) {
	   	 		$.DialogByZ.Alert({Title: "提示", Content: "请填写车牌号",BtnL:"确定",FunL:alerts});
	   	 		return;
   	 		}
   	 		document.getElementById("registerForm").submit();
		}
	</script>
  </body>
</html>
