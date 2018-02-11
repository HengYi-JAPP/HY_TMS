<%@ page language="java"   pageEncoding="UTF-8"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<%
String currentSysCode=  request.getParameter("currentSysCode");
RequestHelper helper = new RequestHelper(request);
ColumnBean columnBean = null;
String columnLoader="columnLoader.jsp";
%>
<portal:unit layoutId="layoutId" unitId="unitId" columnBeanName="columnBean">
<%

 columnBean = (ColumnBean)helper.getValueFromAllScopes("columnBean");
 if(columnBean!=null&&columnBean.getColumnLoader()!=null&&!"".equals(columnBean.getColumnLoader().trim())){
 	columnLoader = columnBean.getColumnLoader();
 }
 %>
	<jsp:include page="<%=columnLoader %>">
		<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
	</jsp:include>
</portal:unit>
