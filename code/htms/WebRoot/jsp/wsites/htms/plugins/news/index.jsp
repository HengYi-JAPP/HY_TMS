<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="tools.tool"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>

<%@page import="com.mobilecn.plugins.news.NewsUtils"%>


<portal:themes columnId="columnId" columnCode="columnCode" skinType="indexColumnSkin"/>	
<info:news operation="listWebSiteNewsIndex" type="index" columnId="columnId" cacheName="columnNewsList" />
<html:table styleClass="$[columnCode]news-index-box"  list="columnNewsList" bean="newsBean" isHead="false" >

	<html:tr styleClass="$[columnCode]news-index-box-line">		
		<html:td styleClass="$[columnCode]news-index-box-line-title-logo">&nbsp;</html:td>		
		<html:td styleClass="$[columnCode]news-index-box-line-title-cell">
		<html:a styleClass="$[columnCode]news-index-box-line-title-link-cell" href="<%=NewsUtils.getViewPath(request) %>" target="_blank">
			<html:value value="newsBean.title" length="$[indexShowLen]"/>
		</html:a>				
		</html:td>
		<html:td styleClass="$[columnCode]news-index-box-line-datetime-cell">
			<html:value value="newsBean.createTime"/>
		</html:td>
	</html:tr>
</html:table>
