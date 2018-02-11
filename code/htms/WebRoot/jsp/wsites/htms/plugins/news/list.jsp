<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.plugins.news.NewsUtils"%>
<%

String currentSysCode=request.getParameter("currentSysCode");
String forward=request.getRequestURI();
String path = request.getContextPath();
forward=forward==null?"":forward.replace(path,"");
 %>
<body style="background:#FAFCEE;">
<!-- info:news operation="listWebSiteNewsIndex" type="index" columnId="columnId" cacheName="columnNewsList"/-->
<portal:themes columnId="columnId" columnCode="columnCode" skinType="listColumnSkin"/>	
<com:loader css="css/common/table-list.css" />
<jsp:include page="../../../../common/impart/table-banner.jsp">
	<jsp:param value='<%tools.tool.getLocal("website.jsp.specify.news.list.title") %>' name="title"/>		
</jsp:include>

<html:div style="float:left;width:90%;height:auto;vertical-align:top;padding: 20px 50px 20px 50px;">
<logic:for indexName="currentNewsIndex" beanCollectionsName="newsList" currBeanName="newsBean">
<html:div style="float:left;width:100%;height:auto;padding: 20px 0;padding-left: 5px;border-bottom: 1px dashed #b5b5b5;vertical-align:top;">
<html:table styleClass="$[columnCode]news-index-box"  isHead="false" style="vertical-align:top;">
	<html:tr styleClass="">	
		<html:td styleClass=""  style="height:40px;vertical-align:middle;">
		<html:a styleClass="" style="color: #0072cf;font-size: 16px;font-weight: bold;    text-decoration: none;;" href='<%=NewsUtils.getViewPath(request) %>' target="_blank">
			<h2><html:value value="newsBean.title"/></h2>
		</html:a>	
		</html:td>	
	</html:tr>	
	<html:tr styleClass="">	
		<html:td styleClass="" style="width:100%px;height:33px;color: #666666;font-family: Candara;margin-top: 10px;;vertical-align:top;text-align:left;">
		 <%=NewsUtils.getDate(request) %>
		</html:td>	
	</html:tr>	
	<html:tr styleClass="$[columnCode]news-index-box-line">	
		<html:td styleClass="$[columnCode]news-index-box-line-title-logo" style="font-size: 14px;font-family: 'Microsoft YaHei';color: #333333;margin-top: 5px;vertical-align:top;">
			<p><html:value value="newsBean.introduction" length="160"/></p>
		</html:td>	
	</html:tr>	
</html:table>
</html:div>

</logic:for>
<html:div style="float:left;width:355px;height:auto;padding: 20px 0;padding-left: 5px;vertical-align:top;text-align:right;font-size: 12px;font-family: 'Microsoft YaHei';color: #0072cf;float: right;padding-bottom: 10px;">

<html:form id="newsListForm" name="newsListForm" method="post" action="contoller.do">
<html:hidden name="operation" id="operation" value="listWebSiteNewsList"/>
<html:hidden name="columnId" id="columnId" value="columnId"/>
<html:hidden name="currentSysCode" id="currentSysCode" value="currentSysCode"/>
<html:hidden name="typeId" id="typeId" value="typeId"/>
<html:hidden name="forward" id="forward" value="<%=forward %>"/>
<html:hidden name="perPageCount" id="perPageCount" value="perPageCount"/>

<com:page formId="newsListForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
</html:form>
</html:div>

</html:div>


<com:loader  js="js/common/common.js"/>	
<script type="text/javascript">reSizePageFrameworkHeight();</script>
</body>
