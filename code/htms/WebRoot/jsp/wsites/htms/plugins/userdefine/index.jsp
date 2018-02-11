<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@page import="com.mobilecn.portal.infotype.InfoTypeRepository"%>
<%@page import="com.mobilecn.portal.infotype.InfoTypeBean"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>

<%
RequestHelper helper = new RequestHelper(request);
String basePath = helper.getBasePath();
ColumnBean columnBean = (ColumnBean)helper.getValueFromAllScopes("columnBean");
String columnId = (String)helper.getValueFromAllScopes("columnId");
String typeId = (String)helper.getValueFromAllScopes("typeId");
InfoTypeBean typeBean = InfoTypeRepository.getInfoTypeBean(typeId);
%>
<html>
	<head>
		<title>用户自定义栏目内容</title>
		<!-- base href="<%=basePath%>"> -->
	</head>
	<body>

<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" isHead="false" >
	<html:tr >				
		<html:td >
		<logic:if notNull="columnBean.contentLink" >
			<html:iframe src="columnBean.contentLink" style="height:$[columnBean.contentHeight];width:$[columnBean.contentWidth]"></html:iframe>
		</logic:if>
		 <logic:if isNull="columnBean.contentLink" >
		 	<html:value value="columnBean.columnContent"/>
		 </logic:if>
		</html:td>
	</html:tr>
</html:table>
	</body>
</html>
