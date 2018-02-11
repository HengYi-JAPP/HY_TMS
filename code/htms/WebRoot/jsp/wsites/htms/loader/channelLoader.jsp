<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<com:loader js="js/iframe-resize.js"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html  style="margin:0px;border:0px;padding:0px;">

<%
String currentSysCode=  request.getParameter("currentSysCode");
String basePath = RequestHelper.getBasePath(request);
String channelId = RequestHelper.getString(request,"channelId");
channelId=channelId==null?"":channelId;


//String account=  request.getParameter("account");
//String userId=  request.getParameter("userId");
//System.out.println("\n\n\n\n\n\n  account============"+account);
//System.out.println("\n\n\n\n\n\n  userId============"+userId);
//request.setAttribute("account",account);
//request.setAttribute("userId",userId);
//request.getSession().setAttribute("account",account);
//request.getSession().setAttribute("userId",userId);
if(channelId.startsWith("CCID")){//组合栏目ID

}
%>
<%
if(channelId.startsWith("CCID")){ 
	channelId = channelId.replaceAll("CCID","");
%>
	<jsp:include page="subChannelLoader.jsp">
		<jsp:param value="<%=channelId %>" name="ccId"/>
		<jsp:param value="<%=currentSysCode %>" name="currentSysCode"/>
		<jsp:param value="true" name="isSubMenus"/>
	</jsp:include>
<%}else{ %>


<portal:themes/>
<com:loader js="js/iframe-resize.js"/>
<script src="<%=basePath %>js/portal/portal-loader.js" type="text/javascript"></script>
<body style="margin:0px;border:0px;padding:0px;">
<portal:layout layoutList="true" currentLayout="true" scope="session"/>
<html:iframe id="__layoutLoader" src="$[basePath]jsp/wsites/$[currentSysCode]/loader/layoutLoader.jsp?layoutId=$[__layoutId]&currentSysCode=$[currentSysCode]&currentSysId=$[currentSysId]&currentChannelId=$[channelId]" styleClass="channel-layout-loader" isRandom="true" width="100%" height="100%" scrolling="no" marginWidth="0" marginHeight="0"  frameBorder="0" vSpace="0" hSpace="0" allowTransparency="true" />		
<%} %>
</body>
