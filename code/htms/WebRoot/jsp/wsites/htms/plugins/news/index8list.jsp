<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="tools.tool"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>

<%@page import="com.mobilecn.plugins.news.NewsUtils"%>
<%
	String currentSysCode=request.getParameter("currentSysCode");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
<style>
<!--
.new-icon{background: url(<%=basePath%>jsp/wsites/<%=currentSysCode%>/images/icon.png) -36px -190px;display: inline-block;
    width: 5px;
    height: 9px;
    margin-right: 5px;
    cursor: pointer;}
-->
</style>
<portal:themes columnId="columnId" columnCode="columnCode" skinType="indexColumnSkin"/>	

<info:news operation="listWebSiteNewsIndex" type="index" columnId="columnId" cacheName="columnNewsList" />
<html:table styleClass="$[columnCode]news-index-box"  isHead="false" style="float:top;vertical-align:top;height:$[columnBean.contentHeight]px;">
<logic:for indexName="currentNewsIndex" beanCollectionsName="columnNewsList" currBeanName="newsBean" indexEnd="8">
	<html:tr style="vertical-align:top;float:top;height:28px;vertical-align:middle;">	
		<html:td styleClass=""  style="padding-left:10px;height:28px;vertical-align:middle;">
			<html:span styleClass="new-icon"/>
		</html:td>
		<html:td styleClass=""  style="height:28px;vertical-align:middle;text-align:left;">
		<html:a styleClass="" style="color:#333333;font:12px/1.5 Arial,Simsun,\588b\4f53;text-decoration: none;height:28px;vertical-align:middle;text-align:left;" href='<%=NewsUtils.getViewPath(request) %>' target="_blank">
			<html:value value="newsBean.title" length="$[indexShowLen]"/>
		</html:a>	
		</html:td>
	</html:tr>	
</logic:for>
<html:tr style="vertical-align:top;height:auto;">	
		<html:td style="height:auto;">
		</html:td>
		<html:td>
		
		</html:td>
	</html:tr>	
</html:table>
