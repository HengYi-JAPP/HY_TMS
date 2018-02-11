<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%
String basePath = RequestHelper.getBasePath(request);

%>
<base href="<%=basePath%>">
<html:set name="picLinkName" randomLen="16" value=""/>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>

	<com:loader css="jsp/wsites/$[sysCode]/css/base.css"/>
	<com:loader css="jsp/wsites/$[sysCode]/css/common.css"/>
	<com:loader js="jsp/wsites/$[sysCode]/js/jquery.js"/>
	<com:loader js="jsp/wsites/$[sysCode]/js/Slider_jquery.js"/>

	
</head>
<body>
<info:piclink operation="listWebSitePicLinkIndex" type="index" columnId="columnId" linkCacheName="__picLinkList" linkGroupCacheName="__picLinkGroupList" linkTypeCacheName="__picLinkTypeList"/>
				<div id="tips_banner" class="viewport">
					<ul class="sliders cb">
						<logic:for beanCollectionsName="__picLinkList" currBeanName="linkBean">	
									<li><html:a href="linkBean.linkIconAddr" target="_blank" >
										<html:img  border="0"  
										src="$[basePath]$[linkBean.linkIconPath]" 
										width="1080px" 
										height="340px" append="alt='$[linkBean.linkName]'" />
									</html:a>
									</li>
								</logic:for>
					</ul>
					<div class="point"> 
					</div>
				</div>

<script>
	var flexSlider=new Slider('tips_banner');
</script>
</body>
</html>