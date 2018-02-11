<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@page import="com.mobilecn.utils.random.IntRandom" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>">
<script type="text/javascript">
	function checkManageMentFee(){
		var isSubmit = true;
		var managementFee=document.getElementById("managementFee").value;
		var reg = /^\d+(\.\d{1,2})?$/;
		if(!managementFee){
			document.getElementById("feeTip").innerHTML="请输入管理费";
			return;
		}
		if(!reg.test(managementFee)){
			document.getElementById("feeTip").innerHTML="请输入整数或保留小数点后两位";
			isSubmit= false;
		}
		if(managementFee<=0){
			document.getElementById("feeTip").innerHTML="管理费需要大于0";
			isSubmit= false;
		}
		if(isSubmit){
			document.getElementById("ownCarForm").submit();
		}
	}
</script>
</head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="ownCarForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true" />
	<html:hidden id="operation" name="operation" value="modifyOwnCar"/>
	<html:hidden id="customerId" name="customerId" value="$[ownCarViewBean.customerId]"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../common/impart/table-banner-new.jsp">
		<jsp:param value='设置自备车管理费' name="title"/>
	</jsp:include>
	<table id="1652" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label"  colSpan="1" rowSpan="1">
				<html:label  label="客户编号" ></html:label>
			</td>
			<td  colSpan="1" rowSpan="1">
				<html:value  value="$[ownCarViewBean.customerCode]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label"colSpan="1" rowSpan="1">
				<html:label  label="客户名称" ></html:label>
			</td>
			<td  colSpan="1" rowSpan="1">
				<html:value  value="$[ownCarViewBean.customerName]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label"colSpan="1" rowSpan="1">
				<html:label  label="管理费(元/吨)" ></html:label>
			</td>
			<td colSpan="1" rowSpan="1">
				<html:text id="managementFee" name="managementFee" value="$[ownCarViewBean.managementFee]"/>
				<span id="feeTip" style="font-size:12px;color:red;font-weight: bold;letter-spacing: 2px;font-family: 宋体;"></span>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save onclick="checkManageMentFee();" href="javascript:void(0);"/>
				<btn:return href="contoller.do?operation=listOwnCar"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
