<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
String isApply = request.getParameter("isApply");
String corderId = request.getParameter("corderId");
String customerCode = request.getParameter("customerCode");
request.setAttribute("corderId",corderId);
request.setAttribute("customerCode",customerCode);
%>
<head>
<script type="text/javascript">
var basePath="<%=basePath%>";

function selectAreaId(obj){
	document.getElementById('area').value=obj.value
	document.getElementById("areaTip").innerHTML="";
}
function submitCustAddr(){
	var isSubmit = true;
	var areaId = document.getElementById("areaId").value;
	if(!areaId){
		document.getElementById("areaTip").innerHTML="请选择地址";
		isSubmit= false;
	}
	if(isSubmit){
		window.location.href="javascript:__vsubmit('customerAddrForm')";
	}
}
</script>
<base href="<%=basePath%>">
</head>
<com:loader  js="js/common/common.js" myWin="true"/>
<com:loader css="css/common/sub-table-list.css"/>
<com:loader js="jsp/htms/dictionary/route/area.js"/>
<html:form id="customerAddrForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true" />
	<html:hidden id="operation" name="operation" value="addCustomerAddr"/>
	<html:hidden id="isValidate"  name="isValidate" value="1"/>
	<html:hidden id="isDefault"  name="isDefault" value="0"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="corderId" name="corderId" value="<%=corderId %>" />
	<html:hidden id="customerCode" name="customerCode" value="<%=customerCode %>"/>
	<html:hidden id="customerId" name="customerId" value="customerBean.customerId"/>
	<html:hidden id="isApply" name="isApply" value="<%=isApply %>"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.customeraddr.title.add") %>' name="title"/>
	</jsp:include>
	<html:table id="1643" styleClass="edit-talbe" > 
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</html:td>
			<html:td>
				<!--<html:select id="checkCustomerAddrId" name="checkCustomerAddrId" list="customerList">
					<html:option label="customerName" value="customerId"></html:option>
				</html:select>
				-->
				<html:value value="customerBean.customerName"></html:value>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.customeraddr#}" ></html:label>
			</html:td>
			<html:td width="450px;">
				<html:text  id="caddrContactor"  name="caddrContactor"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				客户地址
			</html:td>
			<html:td >
				<html:hidden name="area" id="area"  value=""/>
				<html:hidden id="areaId" name="areaId" value=""/>	
				<input type="text" name="orderArea" id="orderArea" value="" onblur="selectAreaId(this);" readonly="readonly" style="width:320"/>	
				<btn:button name="Select" href="javascript:void(0);" onclick="selectAsyncArea()" typeId="selectArea" value='选择' styleClass="button-self-style"/>
				<span id="areaTip" style="font-size:12px;color:red;font-weight: bold;letter-spacing: 2px;font-family: 宋体;"></span>
			</html:td>
			
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.caddrtelephone#}" ></html:label>
			</html:td>
			<html:td>
				<html:text  id="caddrTelephone"  name="caddrTelephone"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				详细地址<%--<html:label  label="{$jsp.htms.sales.customeraddr.caddrdetail#}" ></html:label>--%>
			</html:td>
			<html:td colspan="3">
				<html:text  id="caddrDetail"  name="caddrDetail" style="width:320"/>
			</html:td>
			
		</html:tr>
		
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save onclick="submitCustAddr();"/>
				<btn:return href="contoller.do?operation=toApplyShip&corderId=$[corderId]&customerCode=$[customerCode]"/>
			</html:td>
		</html:tr>
	</html:table>
	<com:validator formId="customerAddrForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="caddrDetail"  types="isnull" event="onblur">
				<com:init size="40" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="caddrContactor"  types="isnull" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="caddrTelephone"  types="mobile" event="onblur">
				<com:init size="20" maxlength="11" ></com:init>
			</com:vElement>
			<com:vElement id="carNo"  types="vehicleno" event="onblur">
				<com:init size="20" maxlength="11" ></com:init>
			</com:vElement>
		</com:validator>
</html:form>
