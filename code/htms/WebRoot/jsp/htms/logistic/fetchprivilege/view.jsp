<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Tranderitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 

%>
<head><base href="<%=basePath%>"></head>

<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
	<com:loader  simplendar="true"  />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='查看贸易商自提权限' name="title"/>
	</jsp:include>
	
	<html:table id="1629" styleClass="edit-talbe" >
		<tr class="trCell">
			<td class="edit-talbe-label" colSpan="1" rowSpan="1">
				<html:label  label="贸易商" ></html:label>
			</td>
			<td colSpan="1" rowSpan="1">
				<html:value value="$[fetchPrivilegeViewBean.userName]"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="BIJKPENIIOHEKMBNJIJMEHNLOHHHJGKLFALCNMPEKBJFMJMFGCOKOPNPBFAHBPFH" colSpan="1" rowSpan="1">
				<html:label  label="厂区" ></html:label>
			</td>
			<td  id="CMEHGKCLOCPCAAJFMCLFIHKIOKKKABKGBEKCAIKKLPAKNKPCKBCOHEEMOGOCPBLA" colSpan="1" rowSpan="1">
				<html:value value="$[fetchPrivilegeViewBean.factoryName]"/>
			</td>
		</tr>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listFtechPrivilege"/>
			</html:td>
		</html:tr>
	</html:table>
