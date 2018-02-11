<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="serviceUserForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="modifyServiceUser"/>
	<html:hidden id="suserId" name="suserId" value="serviceUserBean.suserId"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.serviceuser.title.modify") %>' name="title"/>
	</jsp:include>
	<table id="1688" class="edit-talbe">
		<table id="1687" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label"  colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.serviceuser.syscode#}" ></html:label>
			</td>
			<td  colSpan="1" rowSpan="1">
				<html:text  id="syscode"  name="syscode" value="$[serviceUserBean.syscode]"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.serviceuser.account#}" ></html:label>
			</td>
			<td  colSpan="1" rowSpan="1">
				<html:text  id="sysAccount"  name="sysAccount" value="$[serviceUserBean.account]"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.serviceuser.passwd#}" ></html:label>
			</td>
			<td  colSpan="1" rowSpan="1">
				<html:text id="sysPwd"  name="sysPwd"  value="$[serviceUserBean.passwd]"/>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('serviceUserForm')"/>
				<btn:return href="contoller.do?operation=listServiceUser"/>
			</html:td>
		</html:tr>
	</html:table>
	
	<com:validator formId="serviceUserForm" showNormal="true" submitValidate="true" >
		<com:vElement id="syscode"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="sysAccount"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="sysPwd"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
	</com:validator>
</html:form>
