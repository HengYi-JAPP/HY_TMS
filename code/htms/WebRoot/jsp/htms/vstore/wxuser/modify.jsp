<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.location.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
List<User> wxUserViewList = (List<User>)request.getAttribute("wxUserViewList");
%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="wxUserModifyFrom"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="modifyWXUser"/>
	<html:hidden id="wxOpenId" name="wxOpenId" value="$[wxUserViewBean.openId]"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true"  validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='修改微信用户管理' name="title"/>
	</jsp:include>

	<html:table styleClass="edit-talbe">
		<html:tr styleClass="trCell" >
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="司机名称" ></html:label>
			</html:td >
			<html:td>
				<html:text id="driverName" name="driverName" value="$[wxUserViewBean.driverName]"></html:text>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell" >
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="司机手机号" ></html:label>
			</html:td >
			<html:td>
				<html:text id="driverMobile" name="driverMobile" value="$[wxUserViewBean.driverMobile]"></html:text>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell" >
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="司机身份证号" ></html:label>
			</html:td >
			<html:td>
				<html:text id="identity" name="identity" value="$[wxUserViewBean.identity]"></html:text>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell" >
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="物流公司" ></html:label>
			</html:td >
			<html:td>
				<html:select id="logistics" name="logistics" list="carrierList">
					<html:option selected="$[wxUserViewBean.logistics]" label="carrierName" value="carrierId"></html:option>
				</html:select>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell" >
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="车辆号" ></html:label>
			</html:td >
			<html:td>
				<html:text id="vehicleNo" name="vehicleNo" value="$[wxUserViewBean.vehicleNo]"></html:text>
			</html:td>
		</html:tr>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr>
			<html:td >
				<btn:save href="javascript:__vsubmit('wxUserModifyFrom')"/>
				<btn:return href="contoller.do?operation=listWXUser"/>
			</html:td>
		</html:tr>
	</html:table>
	<com:validator formId="wxUserModifyFrom" showNormal="true" submitValidate="true" >	
			<com:vElement id="driverName"  types="isnull" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="driverMobile"  types="mobile" event="onblur">
				<com:init size="20" maxlength="11" ></com:init>
			</com:vElement>
			<com:vElement id="identity"  types="isidcard" event="onblur">
				<com:init size="20" maxlength="18" ></com:init>
			</com:vElement>
			<com:vElement id="vehicleNo"  types="vehicleno" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
		</com:validator>
</html:form>
