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
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.customeraddr.title.view") %>' name="title"/>
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
			<html:td width="450px">
				<html:value value="$[customerAddrViewBean.caddrContactor]"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				客户地址
			</html:td>
			<html:td >
				<html:value  value="<%=areaName %>"/>	
			</html:td>
			
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.caddrtelephone#}" ></html:label>
			</html:td>
			<html:td>
				<html:value value="$[customerAddrViewBean.caddrTelephone]"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				详细地址<%--<html:label  label="{$jsp.htms.sales.customeraddr.caddrdetail#}" ></html:label>--%>
			</html:td>
			<html:td colspan="3">
				<html:value value="$[customerAddrViewBean.caddrDetail]"/>
			</html:td>
			
			<!--<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.carno#}" ></html:label>
			</html:td>
			<html:td>
				<html:value value="$[customerAddrViewBean.carNo]"/>
			</html:td>
		--></html:tr>
		<!--<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.caddrnotice#}" ></html:label>
			</html:td>
			<html:td colspan="3">
				<html:value  value="$[customerAddrViewBean.caddrNotice]"/>
			</html:td>
		</html:tr>
		
	--></html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listCustomerAddr"/>
			</html:td>
		</html:tr>
	</html:table>
