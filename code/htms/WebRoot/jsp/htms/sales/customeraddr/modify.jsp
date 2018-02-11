<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

String currentAreaId=request.getParameter("areaId");
AreaRepository rep = new AreaRepository();
String areaName = (String)rep.getFullAreaName(currentAreaId,"",true);
areaName=areaName==null?"":areaName;
%>
<head>
<script type="text/javascript">
var basePath="<%=basePath%>";
</script>
<base href="<%=basePath%>">
</head>
<com:loader  js="js/common/common.js" myWin="true"/>
<com:loader css="css/common/sub-table-list.css"/>
<com:loader js="jsp/htms/dictionary/route/area.js"/>
<html:form id="customerAddrForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true" />
	<html:hidden id="operation" name="operation" value="modifyCustomerAddr"/>	
	<html:hidden id="caddrId" name="caddrId" value="customerAddrViewBean.caddrId"/>
	<html:hidden id="customerId" name="customerId" value="customerAddrViewBean.customerId"/>
	<html:hidden id="isValidate"  name="isValidate" value="customerAddrViewBean.isValidate"/>
	<html:hidden id="isDefault"  name="isDefault" value="customerAddrViewBean.isDefault"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true"  validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.customeraddr.title.modify") %>' name="title"/>
	</jsp:include>
	<html:table id="1643" styleClass="edit-talbe" > 
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</html:td>
			<html:td>
				<html:value value="customerList.customerName"></html:value>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.customeraddr#}" ></html:label>
			</html:td>
			<html:td width="450px;">
				<html:text  id="caddrContactor"  name="caddrContactor" value="$[customerAddrViewBean.caddrContactor]"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				客户地址
			</html:td>
			<html:td >
				<html:hidden name="area" id="area"  value="$[areaViewBean.areaName]"/>
				<html:hidden id="areaId" name="areaId" value="$[areaViewBean.areaId]"/>	
				<html:text name="orderArea" id="orderArea"  value="<%=areaName %>" onblur="document.getElementById('area').value=this.value" readonly="readonly" style="width:320"/>	
				<btn:button name="Select" href="javascript:void(0);" onclick="selectAsyncArea()" typeId="selectArea" value='选择' styleClass="button-self-style"/>
			</html:td>
			
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.caddrtelephone#}" ></html:label>
			</html:td>
			<html:td>
				<html:text  id="caddrTelephone"  name="caddrTelephone" value="$[customerAddrViewBean.caddrTelephone]"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				详细地址<%--<html:label  label="{$jsp.htms.sales.customeraddr.caddrdetail#}" ></html:label>--%>
			</html:td>
			<html:td colspan="3">
				<html:text  id="caddrDetail"  name="caddrDetail"  value="$[customerAddrViewBean.caddrDetail]" style="width:320px;"/>
			</html:td>
		</html:tr>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('customerAddrForm')"/>
				<btn:return href="contoller.do?operation=listCustomerAddr"/>
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
