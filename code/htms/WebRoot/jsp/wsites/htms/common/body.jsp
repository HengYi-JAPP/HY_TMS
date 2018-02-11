<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<%@page import="consts.PropKey"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String currentSysCode=request.getParameter("currentSysCode");
String currentSysId=request.getParameter("currentSysId");

//String channelLoaderPath =basePath+ "jsp/wsites/EthERNet/loader/channelLoader.jsp?channelId=$[__channelId]";
String newPageContentUrl = request.getParameter("newPageContentUrl");

if(newPageContentUrl==null||"".equals(newPageContentUrl.trim())||"null".equalsIgnoreCase(newPageContentUrl.trim())){
	newPageContentUrl="";
}else{
//System.out.println(" urlDecode newPageContentUrl="+newPageContentUrl);
	newPageContentUrl=tools.tool.urlDecode(newPageContentUrl);
	//System.out.println("urlDecode newPageContentUrl="+newPageContentUrl);
	newPageContentUrl=tools.tool.base64Decode(newPageContentUrl);
	if(newPageContentUrl.indexOf("currentSysCode")==-1){
		newPageContentUrl=newPageContentUrl+"&currentSysCode="+currentSysCode+"&currentSysId="+currentSysId;
	}
	//System.out.println("base64Decode newPageContentUrl="+newPageContentUrl);
}
%>
<com:loader js="js/iframe-resize.js"/>
<!-- 内容体[内容部分] -->
<html:table styleClass="global-body-content" align="center" valign="top">
 	<html:tr>
 		<!-- 内容体[内容部分][左部] -->
 		<html:td id="content-left" styleClass="global-body-content-left"></html:td>
 		<!-- 内容体[内容部分][中部] -->
 		<html:td id="content-middle"  styleClass="global-body-content-middle">
 			<html:iframe id="__channelLoader" src="<%=newPageContentUrl %>" isRandom="true" width="100%" height="100%" scrolling="no" marginWidth="0" marginHeight="0"  frameBorder="0" vSpace="0" hSpace="0" onload="__Resizer.resizeFrameHeight(this.id,null,null,0,0);"/>
	</html:td>
<!-- 内容体[内容部分][右部] -->
 		<html:td id="content-right" styleClass="global-body-content-right"></html:td>
 	</html:tr> 
</html:table>
<script>
/*
 * 由于前面默认加载的未能加载，在这里再加载一次
 */
 if(portalChannel){portalChannel.reSelect();}
</script>