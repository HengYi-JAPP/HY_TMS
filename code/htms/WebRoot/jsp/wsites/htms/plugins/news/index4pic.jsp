



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
<html:div style="float:left;width:680px;height:304px;">
<logic:for indexName="currentNewsIndex" beanCollectionsName="columnNewsList" currBeanName="newsBean" indexEnd="4">
<html:div style="float:left;width:325px;height:131px;margin-top:20px;">
<html:table styleClass="$[columnCode]news-index-box"  isHead="false" >
	<html:tr styleClass="$[columnCode]news-index-box-line">		
		<html:td styleClass="$[columnCode]news-index-box-line-title-logo" style="width:147px;height:131px;">
			<html:img src="$[basePath]$[newsBean.indexPic]" style="width:147px;height:131px;"></html:img>
		</html:td>		
		<html:td styleClass="$[columnCode]news-index-box-line-title-cell" style="width:178px;height:131px;background: #e6e6e6;">
			<html:table styleClass="$[columnCode]news-index-box"  isHead="false"  style="font-size: 12px;font-family: 'Microsoft YaHei';margin-left:5px;width:178px;height:131px;background:color: #333333;vertical-align:top;">
				<html:tr styleClass="">	
					<html:td styleClass=""  style="height:40px;vertical-align:middle;padding-left:5px;">
					<html:a styleClass="" style="font-weight: bold;color: #333333;" href="<%=NewsUtils.getViewPath(request) %>" target="_blank">
						<h4><html:value value="newsBean.title" length="$[indexShowLen]"/></h4>
					</html:a>	
					</html:td>	
					</html:tr>	
				<html:tr styleClass="$[columnCode]news-index-box-line">	
					<html:td styleClass="$[columnCode]news-index-box-line-title-logo" style="vertical-align:top;padding-left:5px;">
						<html:value value="newsBean.introduction" length="50"/>
					</html:td>	
				</html:tr>	
				<html:tr styleClass="$[columnCode]news-index-box-line">	
					<html:td styleClass="$[columnCode]news-index-box-line-title-logo" style="width:100%px;height:33px;;right: 0;bottom: 0;text-align:right;">
					 <html:div  style="float:right;width:33px;height:33px;border:0px;background:#cfcfcf;color:#cfcfcf;text-align:center;vertical-align:middle;">
					 	<html:a href="#" style="text-decoration: none;"><html:img src="$[basePath]jsp/wsites/$[sysCode]/images/linkarrow.png" border="0"/></html:a>
					 </html:div>
					</html:td>	
				</html:tr>		
			</html:table>
		</html:td>
		
	</html:tr>
</html:table>
</html:div>
<logic:if condition="$[currentNewsIndex]%2==0">
	<html:div style="float:left;width:24px;height:131px;">&nbsp;</html:div>
</logic:if>
</logic:for>
</html:div>