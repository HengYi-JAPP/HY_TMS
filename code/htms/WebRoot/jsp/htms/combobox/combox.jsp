<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>combobox</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="jsp/htms/combobox/combox.css" />
		<script src="jsp/htms/mobile/js/Ajax.js"></script>
		<script type="text/javascript" src="jsp/htms/autocompleter/jquery.min.js"></script>
		<script type="text/javascript" src="jsp/htms/combobox/jquery.combox.min.js"></script>
		<script type="text/javascript">
       var basePath = "<%=basePath %>" + '/controller.do';
       window.onload=function myComBox(){
		  var params = {operation:'COMBOXCUSTOMER'};
	      	Ajax.get(basePath, params, function(msg){
	           	var jsonMsg = JSON.parse(msg);
	           	console.log('jsonMsg=' + jsonMsg);
	            $('#customerName').combotree({
	                valueField: "id", //Value字段
	                textField: "text", //Text字段
	                multiple: true,
	                data: jsonMsg, //[{ "id": 1, "text": "All", "children": [{ "id": 13, "text": "C1" }, { "id": 14, "text": "C2" }, { "id": 15, "text": "C3"}]}],
	                //url: "tree_data2.json", //数据源
	                onCheck: function (node, checked) {
	                   //让全选不显示
	                  $("#customerName").combotree("setText", $("#customerName").combobox("getText").toString().replace("全选,", ""));
	                }
            	});
          	});
		}
    </script>
	</head>

	<body>
		多选：
		<select id="customerName" class="easyui-combotree"style="width: 205px; height: 24px;"></select>
	</body>
</html>
