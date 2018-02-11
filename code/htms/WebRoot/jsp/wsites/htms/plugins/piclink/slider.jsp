<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="/config/taglibs/tld/info-elements.tld" prefix="info"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>

<%
String basePath = RequestHelper.getBasePath(request);
%>
<html:set name="picLinkName" randomLen="16" value=""/>
<%=xss %>
<com:loader js="resources/jquery/jquery.js,resources/jquery/slider.jquery.js"/>
<style>
<!--
/*************图片轮播样式************/
.viewport{ width:1024px;overflow: hidden;position: relative; height:576px; background: #2d2d2d;zoom:1;vertical-align:top;}
  .sliders{zoom:1;overflow: hidden;float: left;width:1024px}
    .sliders li{width: 100%; height:100%;float: left; position: relative; overflow: hidden; background: #2d2d2d center center no-repeat;}
    .sliders img{width: 100%;height:100%;float: left;}  
  .viewport .point{position: absolute;bottom: 10px;height: 43px;width: 200px;left: 50%;margin-left: 0px;}
    .viewport .point ul{ position:absolute; right:2%; top:45%;}
    .viewport .point li{float: left; }
    .viewport .point li a{display:block;color: #fff;cursor: pointer; padding-left:0; width:14px;  height:14px; background:url(<%=basePath%>/images/icons/piclink-slider-icon.png) -21px -76px no-repeat; margin:0 5px;}
    .viewport .point a:hover{text-decoration: none;}
    .viewport .point li.current a{background-position:-1px -76px;}
-->
</style>

<div class="banner">
			<div class="con_banner">
				<div id="tips_banner" class="viewport">
					<ul class="sliders cb">
						<li> <a href="#"><img src="images/banner1.jpg" /></a></li>
						<li> <a href="#"><img src="images/banner1.jpg" /></a></li>
						<li> <a href="#"><img src="images/banner1.jpg" /></a></li>
						<li> <a href="#"><img src="images/banner1.jpg" /></a></li>
					</ul>
					<div class="point"> 
					</div>
				</div>
			</div>
		</div>
					

