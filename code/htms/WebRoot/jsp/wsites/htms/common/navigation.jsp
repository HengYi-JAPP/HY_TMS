<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="tools.tool"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.utils.RequestHelper"%>
<%
String basePath = RequestHelper.getBasePath(request);
String currentSysCode=  request.getParameter("currentSysCode");
//String channelLoaderPath =basePath+ "jsp/wsites/EthERNet/loader/channelLoader.jsp";
String newPageContentUrl = request.getParameter("newPageContentUrl");
String columnName=null;
if(newPageContentUrl==null||"".equals(newPageContentUrl.trim())||"null".equalsIgnoreCase(newPageContentUrl.trim())){
	newPageContentUrl="";
}else{
	//System.out.println(" urlDecode newPageContentUrl="+newPageContentUrl);
	newPageContentUrl=tools.tool.urlDecode(newPageContentUrl);
	//System.out.println("urlDecode newPageContentUrl="+newPageContentUrl);
	newPageContentUrl=tools.tool.base64Decode(newPageContentUrl);
	if(newPageContentUrl.indexOf("currentSysCode")==-1){
		newPageContentUrl=newPageContentUrl+"&currentSysCode="+currentSysCode;
	}
	//System.out.println("base64Decode newPageContentUrl="+newPageContentUrl);
	columnName=tools.tool.getUrlParams("columnName",newPageContentUrl);
}
	columnName= columnName==null?"":columnName;
%>
<script src="<%=basePath %>js/portal/portal-loader.js" type="text/javascript"></script>
<portal:themes />
<portal:channel channelList="true" currentChannel="true" scope="session"/>
<html:table styleClass="navigation-box">
   	<html:tr>
   		<!-- 内容体[导航部分][左部] -->
   		<html:td styleClass="navigation-box-left">
   			<html:table styleClass="navigation-box-left-box">
   				<html:tr>
   					<html:td styleClass="navigation-box-left-box-title"><html:label label="{$jsp.portal.website.navigation.position#}"/></html:td>
   					<html:td styleClass="navigation-box-left-box-title-comma">:</html:td>
   					<html:td styleClass="navigation-box-left-box-path">
   						<html:span id="navigateSystem" styleClass="navigation-system-name"><html:value value="__CURRENT_SYSTEM_TAG.sysName"/> ></html:span>
   						<html:span id="navigateChannel" styleClass="navigation-channel-name"> <html:value value="__CURRENT_CHANNEL_TAG.channelName"/></html:span> 
   						<logic:if notNull="$[columnName]">> <html:span id="navigateColumnName"  styleClass="navigation-column-name"><%=columnName %></html:span></logic:if>
   					</html:td>
   				</html:tr>
   			</html:table>
   		</html:td>
   		<!-- 内容体[导航部分][中部] -->
   		<html:td styleClass="navigation-box-middle" >
   			&nbsp;
		</html:td>
   		<!-- 内容体[导航部分][右部] -->
   		<html:td styleClass="navigation-box-right">
		</html:td>
   	</html:tr>  
</html:table>