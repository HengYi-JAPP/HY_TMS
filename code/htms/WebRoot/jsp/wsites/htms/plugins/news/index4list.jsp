<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="tools.tool"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>

<%@page import="com.mobilecn.plugins.news.NewsUtils"%>

<style>
<!--

-->
</style>
<portal:themes columnId="columnId" columnCode="columnCode" skinType="indexColumnSkin"/>	
<info:news operation="listWebSiteNewsIndex" type="index" columnId="columnId" cacheName="columnNewsList"/>
<html:div style="float:left;width:355px;height:760;vertical-align:top;">
<logic:for indexName="currentNewsIndex" beanCollectionsName="columnNewsList" currBeanName="newsBean" indexEnd="4">
<html:div style="float:left;width:355px;height:auto;padding: 20px 0;padding-left: 5px;border-bottom: 1px dashed #b5b5b5;vertical-align:top;">
<html:table styleClass="$[columnCode]news-index-box"  isHead="false" style="vertical-align:top;">
	<html:tr styleClass="">	
		<html:td styleClass=""  style="height:40px;vertical-align:middle;">
		<html:a styleClass="" style="color: #0072cf;font-size: 14px;font-weight: bold;    text-decoration: none;;" href='<%=NewsUtils.getViewPath(request) %>' target="_blank">
			<h4><html:value value="newsBean.title" length="$[indexShowLen]"/></h4>
		</html:a>	
		</html:td>	
	</html:tr>	
	<html:tr styleClass="">	
		<html:td styleClass="" style="width:100%px;height:33px;color: #666666;font-family: Candara;margin-top: 10px;;vertical-align:top;text-align:left;">
		 <%=NewsUtils.getDate(request) %>
		</html:td>	
	</html:tr>	
	<html:tr styleClass="$[columnCode]news-index-box-line">	
		<html:td styleClass="$[columnCode]news-index-box-line-title-logo" style="font-size: 12px;font-family: 'Microsoft YaHei';color: #333333;margin-top: 5px;vertical-align:top;">
			<p><html:value value="newsBean.introduction" length="160"/></p>
		</html:td>	
	</html:tr>	
</html:table>
</html:div>

</logic:for>
<html:div style="float:left;width:355px;height:auto;padding: 20px 0;padding-left: 5px;vertical-align:top;text-align:right;float: right;padding-bottom: 10px;">
<html:a href="$[basePath]jsp/wsites/$[sysCode]/loader/newPageLoader.jsp?newPageContentUrl=$[columnMoreListLink]" target="_blank" style="text-decoration:none;font-size: 12px;font-family: 'Microsoft YaHei';color: #0072cf;">View all news</html:a>
</html:div>
</html:div>
