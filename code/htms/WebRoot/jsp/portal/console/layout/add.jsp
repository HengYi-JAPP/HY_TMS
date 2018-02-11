<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
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
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"  switchbox="true" validator="true" simpleUpload="true" />
<html:form id="layoutForm" name="layoutForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addLayout"/>
			<html:hidden id="checkChannelId" name="checkChannelId" value="checkChannelId"/>
			<html:hidden name="layoutId" id="layoutId"  value="<%=tools.tool.getRandomUUID(64) %>"/>
			
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.layout.add.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.name#}"/></html:td>
					<html:td >
							<html:text name="layoutName" id="layoutName" styleClass="input-text"/>													
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.tmplpath#}"/></html:td>
					<html:td >
						<html:text name="layoutTempl" id="layoutTempl" styleClass="input-text"/> 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.deficonpath#}"/></html:td>
					<html:td >		
						<com:simpleUpload fileId="layoutLogo" sortDir="system_$[sysId]/layout/icons/" isImage="true"></com:simpleUpload>								
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.seliconpath#}"/></html:td>
					<html:td>
						<com:simpleUpload fileId="layoutSelectedLogo" sortDir="system_$[sysId]/layout/icons/" isImage="true"></com:simpleUpload>														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="1" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   isSave="false" />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.order#}"/></html:td>
					<html:td >
						<html:text name="defaultOrder" id="defaultOrder" styleClass="input-text"/> 														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.isshow#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="defaultShow"  varValue="1" idValue="defaultShow" offValue="0" varName="defaultShow" onValue="1"  idName="defaultShow" offLabel="{$jsp.portal.console.layout.isshow.no#}" onLabel="{$jsp.portal.console.layout.isshow.yes#}" isSave="false"  />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.defselect#}"/></html:td>
					<html:td >
						<com:switchbox boxId="defaultSelect"  varValue="1" idValue="defaultSelect" offValue="0" varName="defaultSelect" onValue="1"  idName="defaultSelect" offLabel="{$jsp.portal.console.layout.defselect.no#}" onLabel="{$jsp.portal.console.layout.defselect.yes#}"   isSave="false" />																		
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.desc#}"/></html:td>
					<html:td colspan="3">
							<html:textarea name="layoutDesc" id="layoutDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>				
					</html:td>
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('layoutForm')"/>
						<btn:return href="contoller.do?operation=listLayout&checkChannelId=$[checkChannelId]&sysId=$[sysId]"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="layoutForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="layoutName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="layoutTempl" types="none" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="layoutLogo" types="none" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="layoutSelectedLogo" types="none" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="defaultOrder" types="none" event="onblur">
			<com:init size="36" maxlength="60" initValue="10000"></com:init>
		</com:vElement>
		<com:vElement id="layoutDesc" types="none" event="onblur">
			<com:init size="36" maxlength="300" ></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
	
	

	</body>
</html>


