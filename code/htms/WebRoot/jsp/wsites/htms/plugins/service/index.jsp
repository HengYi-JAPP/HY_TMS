<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>

<!-- 内容是否要考虑加载方式：jsp include ,iframe, async load -->
<info:service operation="listWebSiteWebServiceIndex" cacheScope="request" columnBeanCacheName="columnBean" serviceConfigCacheName="serviceConfigList"  serviceListCacheName="serviceListMap" serviceDatasCacheName="serviceDatasMap"/>
<!-- serviceBean在include的页中使用到 -->
<logic:for beanCollectionsName="serviceConfigList" currBeanName="serviceBean">
			
	<logic:if equal="serviceBean.showStyle,horizontal">
		<jsp:include page="horizontal.jsp"></jsp:include>
	</logic:if>
	<logic:if equal="serviceBean.showStyle,vertical">
		<jsp:include page="vertical.jsp"></jsp:include>
	</logic:if>
	<logic:if equal="serviceBean.showStyle,horizontalAvg">
		<jsp:include page="horizontalAvg.jsp"></jsp:include>
	</logic:if>
	<logic:if equal="serviceBean.showStyle,verticalAvg">
		<jsp:include page="verticalAvg.jsp"></jsp:include>
	</logic:if>
</logic:for>