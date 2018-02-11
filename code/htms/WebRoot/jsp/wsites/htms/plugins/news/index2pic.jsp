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
<html:div style="float:left;width:680px;height:360px;">
<logic:for indexName="currentNewsIndex" beanCollectionsName="columnNewsList" currBeanName="newsBean" indexEnd="2">
<html:div style="float:left;width:325px;height:332px;margin-top:20px;">
<html:table styleClass="$[columnCode]news-index-box"  isHead="false" >
	<html:tr styleClass="$[columnCode]news-index-box-line">		
		<html:td styleClass="$[columnCode]news-index-box-line-title-logo" style="width:326px;height:171px;">
			<html:img src="$[basePath]$[newsBean.indexPic]" style="width:326px;height:171px;"></html:img>
		</html:td>	
	</html:tr>		
	<html:tr styleClass="">	
		<html:td styleClass=""  style="height:40px;text-align:left;vertical-align:middle;padding-top: 15px;">
		<html:a styleClass="" style="font-size: 12px;font-family: 'Microsoft YaHei';color:#6d6d6d;" href="<%=NewsUtils.getViewPath(request) %>" target="_blank">
			<h4><html:value value="newsBean.title" length="$[indexShowLen]"/></h4>
		</html:a>	
		</html:td>	
	</html:tr>	
	<html:tr styleClass="$[columnCode]news-index-box-line">	
		<html:td styleClass="$[columnCode]news-index-box-line-title-logo" style="text-align:left;vertical-align:top;">
			<p style="font: 12px/1.5 Arial,Simsun,\588b\4f53;;color: #333333;margin-top: 10px;"><html:value value="newsBean.introduction" length="300"/></p>
		</html:td>	
	</html:tr>	
</html:table>
</html:div>
<logic:if condition="$[currentNewsIndex]%2==0">
	<html:div style="float:left;width:24px;height:131px;">&nbsp;</html:div>
</logic:if>
</logic:for>
</html:div>
