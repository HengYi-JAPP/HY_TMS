<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/comp-extends.tld" prefix="cext"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 %>
 
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>

<com:loader css="css/common/table-list.css" />
<com:loader  js="js/common/common.js" validator="true"/>
<html:form id="layoutForm" name="layoutForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyUserDefineLayout"/>
			<html:hidden name="layoutId" id="layoutId"  value="layoutViewBean.layoutId"/>
			<html:hidden   name="sysId" value="sysId" />
			<html:hidden   name="currentSysCode" value="currentSysCode" />
			<html:hidden   name="channelId" value="channelId" />
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.website.personalize.layout.selfdefine") %>' name="title"/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.website.personalize.layout.name#}" /></html:td>
					<html:td >	
						<html:text name="layoutName" id="layoutName" styleClass="input-text" size="36" maxlength="60" value="layoutViewBean.layoutName"/>											
					</html:td>
				</html:tr>
				<html:tr>
				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.website.personalize.layout.defaulticon#}" /></html:td>
					<html:td >								
							<com:simpleUpload fileId="layoutLogo" isImage="true" viewPath="$[layoutViewBean.layoutLogo]"  sortDir="personalfiles/system_$[sysId]/$[userId]/icons"></com:simpleUpload>														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.website.personalize.layout.selectedicon#}" /></html:td>
					<html:td >
					<com:simpleUpload fileId="layoutSelectedLogo" isImage="true" viewPath="$[layoutViewBean.layoutSelectedLogo]"  sortDir="personalfiles/system_$[sysId]/$[userId]/icons"></com:simpleUpload>														
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('layoutForm');"/>					
						<btn:return href="contoller.do?operation=loadUserPersonalizeLayoutList&currentSysCode=$[currentSysCode]&sysId=$[sysId]&channelId=$[channelId]"/>							
				</html:td></html:tr>
			</html:table>	
	<com:validator formId="layoutForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="layoutName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
	</com:validator>	
	
	</html:form>
	<com:loader   simpleUpload="true"/>
	</body>
</html>

