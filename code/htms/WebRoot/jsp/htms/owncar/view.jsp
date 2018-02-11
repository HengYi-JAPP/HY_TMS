<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="productForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../common/impart/table-banner-new.jsp">
		<jsp:param value='查看自备车管理费' name="title"/>
	</jsp:include>
	<table id="1629" class="edit-talbe">
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
					<html:value value="$[ownCarViewBean.managementFee]"/>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listOwnCar"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
