<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.portal.infotype.InfoTypeRepository"%>
<%@page import="com.mobilecn.portal.infotype.InfoTypeBean"%>

<%@page import="com.mobilecn.utils.RequestHelper"%>

<%
RequestHelper helper = new RequestHelper(request);
String basePath = helper.getBasePath();
String columnId = (String)helper.getValueFromAllScopes("columnId");
String typeId = (String)helper.getValueFromAllScopes("typeId");
InfoTypeBean typeBean = InfoTypeRepository.getInfoTypeBean(typeId);
%>
<html>
	<head>
		<title>频道管理</title>
		<base href="<%=basePath%>">
	</head>
	<body>
<!-- info:news operation="listWebSiteNewsIndex" type="index" columnId="columnId" cacheName="columnNewsList"/-->
<html:form id="newsListForm" name="newsListForm" method="post" action="contoller.do">
<html:hidden name="operation" id="operation" value="listWebSiteNewsList"/>
<html:hidden name="columnId" id="columnId" value="columnId"/>
<html:hidden name="typeId" id="typeId" value="typeId"/>
<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="newsList" bean="newsBean" isHead="false" >
	<html:tr >				
		<html:td >
		<html:a href="contoller.do?operation=viewWebSiteNews&infoId=$[newsBean.infoId]" target="_blank">
			<html:value value="newsBean.title"/>
		</html:a>				
		</html:td>
		<html:td >
			<html:value value="newsBean.createTime"/>
		</html:td>
	</html:tr>
</html:table>
<com:page formId="newsListForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
</html:form>
	</body>
</html>
