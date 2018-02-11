<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//Test
//request.getSession().setAttribute("UserId", "1");
//request.getSession().setAttribute("user_sales_no", "015");

String userId = (String)request.getSession().getAttribute("UserId");
String salesNo = (String)request.getSession().getAttribute("user_sales_no");

String addrId = request.getParameter("addrId");
String areaId = request.getParameter("areaId");
String addrContactor = request.getParameter("addrContactor");
String addrTelephone = request.getParameter("addrTelephone");
String addrDetail = request.getParameter("addrDetail");
String customerId = request.getParameter("customerId");

AreaRepository areaRepository = new AreaRepository();
List<AreaBean> ancestorAreaList = areaRepository.getAncestorArea(areaId);
if (ancestorAreaList == null) {
	ancestorAreaList = new ArrayList();
}

String cityStr = null;
String areaStr = null;
String streetStr = null;

int selProvinceId = -1;
int selCityId = -1;
int selAreaId = -1;
int selStreetId = -1;
String selAreaCode = null;

String selProvinceName = "";
String selCityName = "";
String selAreaName = "";
String selStreetName = "";

for (int i = 0; i < ancestorAreaList.size(); i++) {
	AreaBean parentAreaBean = ancestorAreaList.get(i);
	int parentAreaId = parentAreaBean.getAreaId();
	int parentAreaLevel = parentAreaBean.getAreaLevel();
	String name = parentAreaBean.getAreaName();
	
	if (parentAreaLevel == 1) {
		selProvinceId = parentAreaId;
		selProvinceName = name; 
	}else if (parentAreaLevel == 2) {
		selCityId = parentAreaId;
		selCityName = name;
	}else if (parentAreaLevel == 3) {
		selAreaId = parentAreaId;
		selAreaName = name;
	}else if (parentAreaLevel == 4) {
		selStreetId = parentAreaId;
		selStreetName = name;
		selAreaCode = parentAreaBean.getAreaCode();
	}
}

for (int i = 0; i < ancestorAreaList.size(); i++) {
	AreaBean parentAreaBean = ancestorAreaList.get(i);
	int areaLevel = parentAreaBean.getAreaLevel();
	
	if (areaLevel == 4) {
		continue;
	}
	
	String parentAreaId = parentAreaBean.getAreaId() + "";
	List<AreaBean> childAreaList = areaRepository.getNextLevelChild(parentAreaId);
	
	String dataStr = "[";
	boolean first = true;
		
		for (int j = 0; j < childAreaList.size(); j++) {
			if (!first) {
				dataStr += ",";
			}
			
			AreaBean areaBean = (AreaBean)childAreaList.get(j);
			dataStr += "{\"value\":";
			dataStr += areaBean.getAreaId();
			dataStr += ",";
			
			dataStr += "\"code\":\"";
			dataStr += areaBean.getAreaCode();
			dataStr += "\",";
			
			dataStr += "\"text\":\"";
			dataStr += areaBean.getAreaName();
			dataStr += "\"}";
			
			first = false;
		}
		dataStr += "]";

	if (areaLevel == 1) {
		cityStr = dataStr;
	} else if (areaLevel == 2) {
		areaStr = dataStr;
	}else if (areaLevel == 3) {
		streetStr = dataStr;
	}
}

List rootList=AreaRepository.getRootNodeList();
String provinceStr = "[";
		boolean first = true;
		
		for (int i = 0; i < rootList.size(); i++) {
			if (!first) {
				provinceStr += ",";
			}
			
			AreaBean areaBean = (AreaBean)rootList.get(i);
			provinceStr += "{\"value\":";
			provinceStr += areaBean.getAreaId();
			provinceStr += ",";
			
			provinceStr += "\"code\":\"";
			provinceStr += areaBean.getAreaCode();
			provinceStr += "\",";
			
			provinceStr += "\"text\":\"";
			provinceStr += areaBean.getAreaName();
			provinceStr += "\"}";
			
			first = false;
		}
		provinceStr += "]";

%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改地址</title>
     <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=3, minimum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="jsp/htms/mobile/css/order.css" type="text/css"></link>
  
<link rel="stylesheet" href="jsp/htms/mobile/css/mobile.css" type="text/css">
<link rel="stylesheet" href="jsp/htms/mobile/css/editaddr.css" type="text/css">
<link rel="stylesheet" href="jsp/htms/mobile/css/zdialog.css" type="text/css">
<style type="text/css">
.picker{display:none;position:fixed;top:0;z-index:100;width:100%;height:100%;overflow:hidden;text-align:center;font-family:PingFang SC,STHeitiSC-Light,Helvetica-Light,arial,sans-serif;font-size:14px;-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none;user-select:none}.picker .picker-mask{position:absolute;z-index:500;width:100%;height:100%;transition:all .5s;-webkit-transition:all .5s;background:transparent;opacity:0}.picker .picker-mask.show{background:rgba(0,0,0,.6);opacity:1}.picker .picker-panel{position:absolute;z-index:600;bottom:0;width:100%;height:243px;background:#fff;transform:translateY(243px);-webkit-transform:translateY(243px);transition:all .5s;-webkit-transition:all .5s}.picker .picker-panel.show{transform:translateY(0);-webkit-transform:translateY(0)}.picker .picker-panel .picker-choose{position:relative;height:50px;color:#878787;font-size:14px}.picker .picker-panel .picker-choose .picker-title{line-height:50px;font-size:19px;text-align:center;color:#333}.picker .picker-panel .picker-choose .cancel,.picker .picker-panel .picker-choose .confirm{position:absolute;padding:10px;top:6px}.picker .picker-panel .picker-choose .confirm{right:0;color:#fa8919}.picker .picker-panel .picker-choose .cancel{left:0}.picker .picker-panel .picker-content{position:relative}.picker .picker-panel .picker-content .mask-bottom,.picker .picker-panel .picker-content .mask-top{position:absolute;z-index:10;width:100%;height:68px;pointer-events:none;transform:translateZ(0);-webkit-transform:translateZ(0)}.picker .picker-panel .picker-content .mask-top{top:0;background:-webkit-gradient(linear,left bottom,left top,from(hsla(0,0%,100%,.4)),to(hsla(0,0%,100%,.8)));background:-o-linear-gradient(bottom,hsla(0,0%,100%,.4),hsla(0,0%,100%,.8))}.picker .picker-panel .picker-content .mask-top:after,.picker .picker-panel .picker-content .mask-top:before{display:block;position:absolute;border-top:1px solid #ccc;left:0;width:100%;content:" "}.picker .picker-panel .picker-content .mask-top:before{display:none;top:0}.picker .picker-panel .picker-content .mask-top:after{display:block;bottom:0}.picker .picker-panel .picker-content .mask-bottom{bottom:0;background:-webkit-gradient(linear,left top,left bottom,from(hsla(0,0%,100%,.4)),to(hsla(0,0%,100%,.8)));background:-o-linear-gradient(top,hsla(0,0%,100%,.4),hsla(0,0%,100%,.8))}.picker .picker-panel .picker-content .mask-bottom:after,.picker .picker-panel .picker-content .mask-bottom:before{display:block;position:absolute;border-top:1px solid #ccc;left:0;width:100%;content:" "}.picker .picker-panel .picker-content .mask-bottom:before{display:block;top:0}.picker .picker-panel .picker-content .mask-bottom:after{display:none;bottom:0}.picker .picker-panel .wheel-wrapper{display:-ms-flexbox;display:-webkit-box;display:flex;padding:0 10px}.picker .picker-panel .wheel-wrapper .wheel{-ms-flex:1 1 1e-9px;-webkit-box-flex:1;flex:1;flex-basis:1e-9px;width:1%;height:173px;overflow:hidden;font-size:21px}.picker .picker-panel .wheel-wrapper .wheel .wheel-scroll{margin-top:68px;line-height:36px}.picker .picker-panel .wheel-wrapper .wheel .wheel-scroll .wheel-item{height:36px;overflow:hidden;white-space:nowrap;color:#333}.picker .picker-footer{height:20px}@media (-webkit-min-device-pixel-ratio:1.5),(min-device-pixel-ratio:1.5){.border-1px:after,.border-1px:before{-webkit-transform:scaleY(.7);-webkit-transform-origin:0 0;transform:scaleY(.7)}.border-1px:after{-webkit-transform-origin:left bottom}}@media (-webkit-min-device-pixel-ratio:2),(min-device-pixel-ratio:2){.border-1px:after,.border-1px:before{-webkit-transform:scaleY(.5);transform:scaleY(.5)}}
</style>
</head>

  <body> 
    <div class="container">
    	<div class="top">
   			<div class="top-left"><a href="contoller.do?operation=listMineAddr&userId=<%=userId%>&salesNo=<%=salesNo%>"><img src="jsp/htms/mobile/image/button/return.jpg" style=" width: 25px"/></a></div>
   			<div class="top-center">修改地址</div>
	</div>
   			   	
	
   	<div class="content">
   		<div class="edit_addr" >
   			<div class="edit_addr_left edit_addr_text">
   				联系人
   			</div>
   			<div class="edit_addr_right">
   				<input type="text" class="edit_addr_input" placeholder="填写联系人" id="input_name" value="<%=addrContactor %>" />
   			</div>
   		</div>
   		
   		
   		<div class="edit_addr" >
   			<div class="edit_addr_left edit_addr_text">
   				联系方式
   			</div>
   			<div class="edit_addr_right">
   				<input type="text" pattern="[0-9]*" class="edit_addr_input" placeholder="填写联系方式" id="input_contact" value="<%=addrTelephone %>" />
   			</div>
   		</div>
   		
   		<div class="edit_addr" >
   			<div class="edit_addr_left edit_addr_text">
   				省
   			</div>
   			<div class="edit_addr_right">
   				<input  type="text" class="edit_addr_input" readonly="readonly"  placeholder="选择省" id="picker_province" unselectable="on" onfocus="this.blur()"/>
   				<span><img src="jsp/htms/mobile/image/button/left.jpg" class="custimg"></img></span>
   			</div>
   		</div>
   		
   		<div class="edit_addr" >
   			<div class="edit_addr_left edit_addr_text">
   				市
   			</div>
   			<div class="edit_addr_right">
   				<input type="text" class="edit_addr_input" readonly="readonly"  placeholder="选择市" id="picker_city" unselectable="on" onfocus="this.blur()"/>
   				<span><img src="jsp/htms/mobile/image/button/left.jpg" class="custimg"></img></span>
   			</div>
   		</div>
   		
   		<div class="edit_addr" >
   			<div class="edit_addr_left edit_addr_text">
   				县/区
   			</div>
   			<div class="edit_addr_right">
   				<input type="text" class="edit_addr_input" readonly="true" placeholder="选择县/区" id="picker_area" unselectable="on" onfocus="this.blur()"/>
   				<span><img src="jsp/htms/mobile/image/button/left.jpg" class="custimg"></img></span>
   			</div>
   		</div>
   		
   		<div class="edit_addr" >
   			<div class="edit_addr_left edit_addr_text">
   				街道
   			</div>
   			<div class="edit_addr_right">
   				<input type="text" readonly="true" class="edit_addr_input" placeholder="选择街道" id="picker_street" unselectable="on" onfocus="this.blur()"/>
   				<span><img src="jsp/htms/mobile/image/button/left.jpg" class="custimg"></img></span>
   			</div>
   		</div>
   		
   		<div class="edit_addr" >
   			<div class="edit_addr_left edit_addr_text">
   				详细地址
   			</div>
   			<div class="edit_addr_right">
   				<input type="text" class="edit_addr_input" placeholder="填写详细地址" id="input_addr_detail" value="<%=addrDetail %>" />
   			</div>
   		</div>
   		
   		<div class="contentbtn" ><a href="javascript:saveAddr()"><div  onclick="applyConfirm();" id="_save"  style="background-color: #2eaed3;border-radius:14px;font-size: 17px;width:100%;color:white; border: 1px solid;height:30px;padding:10px 0 6px 0;box-shadow: -1px 0px 1px 1px #9be9ff;"/>保存</div></a></div>
   		</div>
   	</div>
   	 <script src="jsp/htms/mobile/js/picker.min.js" ></script>
   	 <script src="jsp/htms/mobile/js/selectaddr.js" ></script>
   	 <script src="jsp/htms/mobile/js/Ajax.js" ></script>
   	 <script type="text/javascript" src="jsp/htms/mobile/js/zdialog.min.js"></script>
  	<script type="text/javascript" src="jsp/htms/mobile/js/zdialog.js"></script>
    <script type="text/javascript">
    
    var inputName = document.getElementById('input_name');
	var inputContact = document.getElementById('input_contact');
	var inputAddrDetail = document.getElementById('input_addr_detail');
    
    var dataProvince = <%=provinceStr%>;
 	var dataCity = <%=cityStr%>;
 	var dataArea = <%=areaStr%>;
 	var dataStreet = <%=streetStr%>;
 
 	var selProvinceId = <%=selProvinceId%>;
 	var selCityId = <%=selCityId%>;
 	var selAreaId = <%=selAreaId%>;
 	var selStreetId = <%=selStreetId%>;
 	var selAreaCode = <%=selAreaCode%>;
	
	var that = this;
	var basePath = "<%=basePath %>" + '/controller.do';
    
    function getAreaChild(nodeId, areaLevel) {
    		var params = {operation:'listCustomerAddrChild', parentAreaId:nodeId, areaLevel:areaLevel};
    		Ajax.get(basePath, params, function(msg){
                 	
                  	var jsonMsg = JSON.parse(msg);
                  	var curLevel = parseInt(jsonMsg.areaLevel);
                  	console.log('cur level=' + curLevel);
                  	
                  	if (curLevel == 1) {
                  		that.dataProvince = jsonMsg.areaData;
                  	}else if (curLevel == 2) {
                  		that.dataCity = jsonMsg.areaData;
                  	}else if (curLevel == 3) {
                  		that.dataArea = jsonMsg.areaData;
                  	}else if (curLevel == 4) {
                  		that.dataStreet = jsonMsg.areaData;
                  	}	
                  	
                 	console.log('getAreaChild success' + msg);
                 });

   	 		//List<AreaBean> areaBeanList = AreaRepository.getAllChildren();
   	 		console.log("getAreaChild");
   	 };
   	 
   	 function alerts(){
	  		$.DialogByZ.Close();
   	}
   	 function saveAddr() {
   	 	var name = trim(inputName.value);
   	 	if (name == null || name.length == 0) {
   	 		$.DialogByZ.Alert({Title: "提示", Content: "请填写联系人",BtnL:"确定",FunL:alerts});
   	 		return;
   	 	}
   	 	var contact = trim(inputContact.value)+"";
   	 	if (contact == null || contact.length == 0) {
   	 		$.DialogByZ.Alert({Title: "提示", Content: "请填写手机号码",BtnL:"确定",FunL:alerts});
   	 		return;
   	 	}
   	 	
   	 	var phoneTest = "^[0-9]*$";
   	 	var reg = new RegExp(phoneTest);
   	 	if (!reg.test(contact)) {
   	 		$.DialogByZ.Alert({Title: "提示", Content: "请填写正确的手机号码",BtnL:"确定",FunL:alerts});
   	 		return;
   	 	}
   	 	
   	 	var addrDetail = trim(inputAddrDetail.value);
   	 	if (addrDetail != null && addrDetail.length > 0) {
   	 		addrDetail = addrDetail.replace(/\./g, "");
   	 	}
   	 	if (addrDetail == null || addrDetail.length == 0) {
   	 		$.DialogByZ.Alert({Title: "提示", Content: "请填写详细地址",BtnL:"确定",FunL:alerts});
   	 		return;
   	 	}else if(addrDetail.length >250){
   	 		$.DialogByZ.Alert({Title: "提示", Content: "详细地址过长，请重新输入",BtnL:"确定",FunL:alerts});
   	 		return;
   	 	}
   	 	
   	 	
   	 	if (selProvinceId == -1) {
   	 		$.DialogByZ.Alert({Title: "提示", Content: "请选择省",BtnL:"确定",FunL:alerts});
   	 		
   	 		return;
   	 	}
   	 	if (selCityId == -1) {
   	 		$.DialogByZ.Alert({Title: "提示", Content: "请选择市",BtnL:"确定",FunL:alerts});
   	 		return;
   	 	}
   	 	if (selAreaId == -1) {
   	 		$.DialogByZ.Alert({Title: "提示", Content: "请选择区/县",BtnL:"确定",FunL:alerts});
   	 		return;
   	 	}
   	 	if (selStreetId == -1 || selAreaCode == null || selAreaCode.length == 0 || selAreaCode == 'null') {
   	 		$.DialogByZ.Alert({Title: "提示", Content: "请选择街道",BtnL:"确定",FunL:alerts});
   	 		return;
   	 	}
   	 	
   	 	var areaId = selAreaId;
   	 	if (selStreetId != -1) {
   	 		areaId = selStreetId;
   	 	}
   	 	var curTime = getNowFormatDate();
   	 	var customerId = <%=customerId %>;
	
   	 	var params = {operation:'modifyAddrSave', caddrId:<%=addrId %>, areaCode:selAreaCode, areaId:areaId,caddrDetail:addrDetail,creator:<%=userId %>,createTime:curTime,caddrContactor:name,caddrTelephone:contact,customerId:customerId};
        Ajax.get(basePath, params, function(msg){	
                  		var msgObj = JSON.parse(msg);
                  		if ( parseInt(msgObj.isSuccess) == 1) {
                  			window.location.href = basePath + "?operation=listMineAddr&userId=<%=userId%>&salesNo=<%=salesNo%>";
                  		}else {
                  			alert("保存失败，请稍后再试");
                  		}					   	 
                 });        
   	
   	 };
   	 
  	var inputProvince = document.getElementById('picker_province');
	var inputCity = document.getElementById('picker_city');
	var inputArea = document.getElementById('picker_area');
	var inputStreet = document.getElementById('picker_street');


	inputProvince.value = "<%=selProvinceName %>";
	inputCity.value = "<%=selCityName %>";
	inputArea.value = "<%=selAreaName %>";
	inputStreet.value = "<%=selStreetName %>";

  	var pickerProvince = new Picker({
    	data: [dataProvince]
  	});
  	
  	var pickerCity = null;
  	var pickerArea = null;
  	var picerStreet = null;

	if (dataCity != null) {
  		pickerCity = new Picker({
    	data: [dataCity]
  	});
  	}
  	if (dataArea != null) {
  		pickerArea = new Picker({
    	data: [dataArea]
  	});
  	}
  	if (dataStreet != null) {
  		pickerStreet = new Picker({
    	data: [dataStreet]
  	});
  	}

	//选择省
  	pickerProvince.on('picker.select', function (selectedVal, selectedIndex) {
    	inputProvince.value = dataProvince[selectedIndex[0]].text;
    	console.log('selectedVal' + selectedVal);
    	console.log('selProvinceId' + selProvinceId);
    	
    	if (selectedVal == selProvinceId) {
    		return;
    	}
    	
   	 	var nodeId = selectedVal;
    	console.log("select=" + selectedVal);
    	
    	dataCity = null;
    	dataArea = null;
    	dataStreet = null;
    	
    	pickerCity = null;
    	pickerArea = null;
    	pickerStreet = null;
    	
    	selProvinceId = parseInt(selectedVal);
    	selCityId = -1;
    	selAreaId = -1;
    	selStreetId = -1;
    	
    	inputCity.value = '请选择市';
    	inputArea.value = '请选择区/县';
    	inputStreet.value = '请选择街道';
    	
    	that.getAreaChild(nodeId, 2);
 	 });
	/**
  	pickerProvince.on('picker.change', function (index, selectedIndex) {
    	console.log(index);
   		console.log('selectedIndex=' + selectedIndex);
  	});

  	pickerProvince.on('picker.valuechange', function (selectedVal, selectedIndex) {
    	console.log(selectedVal);
  	});
  	*/
  	inputProvince.addEventListener('click', function () {
    	pickerProvince.show();
  	});
  	
  	//选择市
  	inputCity.addEventListener('click', function () {
  		console.log('pickerCity' + pickerCity);
  		console.log('dataCity' + dataCity);
  		if (dataCity == null) {
  			return;
  		}
  	
  		if (pickerCity == null) {
  			console.log('init picker city');
  			pickerCity = new Picker({
    			data: [dataCity]
  			});
  		}
    	pickerCity.show();
    	
  		pickerCity.on('picker.select', function (selectedVal, selectedIndex) {
    		inputCity.value = dataCity[selectedIndex[0]].text;
    	
    		if (selectedIndex == selCityId) {
    			return;
    		}
    	
   	 		var nodeId = selectedVal;
    		console.log("select=" + selectedVal);
    	
    		dataArea = null;
    		dataStreet = null;
    	
    		pickerArea = null;
    		pickerStreet = null;
    	
    		selCityId = parseInt(selectedVal);
    		selAreaId = -1;
    		selStreetId = -1;
    	
    		inputArea.value = '请选择区/县';
    		inputStreet.value = '请选择街道';
    	
    		that.getAreaChild(nodeId, 3);
 	 	});
  	});
  	
  	
  	//选择区-县
  	inputArea.addEventListener('click', function () {
  		if (dataArea == null) {
  			return;
  		}
  	
  		if (pickerArea == null) {
  			pickerArea = new Picker({
    			data: [dataArea]
  			});
  		}
    	pickerArea.show();
    	
    	pickerArea.on('picker.select', function (selectedVal, selectedIndex) {
    		inputArea.value = dataArea[selectedIndex[0]].text;
    	
    		if (selectedIndex == selAreaId) {
    			return;
    		}
    	
   	 		var nodeId = selectedVal;
    		console.log("select=" + selectedVal);
    	
    		dataStreet = null;
    	
    		pickerStreet = null;
    	
    		selAreaId = parseInt(selectedVal);
    		selStreetId = -1;
    	
    		inputStreet.value = '请选择街道';
    	
    		that.getAreaChild(nodeId, 4);
 	 	});
  	});
  	
  	//选择街道
  	inputStreet.addEventListener('click', function () {
  		if (dataStreet == null) {
  			return;
  		}
  	
  		if (pickerStreet == null) {
  			pickerStreet = new Picker({
    			data: [dataStreet]
  			});
  		}
    	pickerStreet.show();
    	
    	pickerStreet.on('picker.select', function (selectedVal, selectedIndex) {
    		inputStreet.value = dataStreet[selectedIndex[0]].text;
    	
    		selAreaCode = dataStreet[selectedIndex[0]].code;
    		selStreetId = parseInt(selectedVal);
 		 });
  	});
  	
    </script>
  </body>
</html>
