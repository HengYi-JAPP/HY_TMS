<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>

<!-- 内容是否要考虑加载方式：jsp include ,iframe, async load -->
<info:sqlquery type="index" operation="listWebSiteSQLQueryIndex" cacheScope="request" columnBeanCacheName="columnBean" sqlqueryConfigCacheName="sqlqueryConfigList"  sqlqueryListCacheName="sqlqueryListMap" sqlqueryDatasCacheName="sqlqueryDatasMap"  infoIdCacheName="infoIds" idColumnNameCacheName="idColumns"/>
<!-- serviceBean在include的页中使用到 -->
<logic:for beanCollectionsName="sqlqueryConfigList" currBeanName="sqlqueryBean">
			
	<logic:if equal="sqlqueryBean.showStyle,horizontal">
		<jsp:include page="horizontal.jsp"></jsp:include>
	</logic:if>
	<logic:if equal="sqlqueryBean.showStyle,vertical">
		<jsp:include page="vertical.jsp"></jsp:include>
	</logic:if>
	<logic:if equal="sqlqueryBean.showStyle,horizontalAvg">
		<jsp:include page="horizontalAvg.jsp"></jsp:include>
	</logic:if>
	<logic:if equal="sqlqueryBean.showStyle,verticalAvg">
		<jsp:include page="verticalAvg.jsp"></jsp:include>
	</logic:if>
</logic:for>