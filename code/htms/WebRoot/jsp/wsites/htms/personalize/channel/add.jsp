<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
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
<com:loader css="css/common/table-list.css" switchbox="true" validator="true"/>
<html:form id="channelForm" name="channelForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addUserSelfChannel"/>
			<html:hidden   name="sysId" value="$[sysId]" />
			<html:hidden   name="currentSysCode" value="$[currentSysCode]" />
			<html:hidden id="userDefine" name="userDefine" value="1"/>
			<html:hidden id="channelCode" name="channelCode" value="UDC"/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.channel.add.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.name#}"/></html:td>
					<html:td >
							<html:text name="channelName" id="channelName" styleClass="input-text"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td >					
					</html:td>				
					
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.icon.before#}"/></html:td>
					<html:td >		
						<com:simpleUpload fileId="beforeIcon" sortDir="personalfiles/system_$[sysId]/$[userId]/icons" isImage="true"></com:simpleUpload>								
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.icon.after#}"/></html:td>
					<html:td >
						<com:simpleUpload fileId="afterIcon" sortDir="personalfiles/system_$[sysId]/$[userId]/icons" isImage="true"></com:simpleUpload>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.url#}"/></html:td>
					<html:td >						
						<html:text name="channelUrl" id="channelUrl" styleClass="input-text"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.load#}"/></html:td>
					<html:td >
						<com:switchbox boxId="loadStyle"  varValue="1" idValue="loadStyle" offValue="0" varName="loadStyle" onValue="1"  idName="loadStyle"  offLabel="{$jsp.portal.console.channel.load.async#}" onLabel="{$jsp.portal.console.channel.load.sync#}"  isSave="false"/>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.isshow#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="defaultShow"  varValue="1" idValue="defaultShow" offValue="0" varName="defaultShow" onValue="1"  idName="defaultShow"  offLabel="{$jsp.portal.console.channel.isshow.no#}" onLabel="{$jsp.portal.console.channel.isshow.yes#}"  isSave="false"  />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.defselect#}"/></html:td>
					<html:td >
						<com:switchbox boxId="defaultSelect"  varValue="0" idValue="defaultSelect" offValue="0" varName="defaultSelect" onValue="1"  idName="defaultSelect"  offLabel="{$jsp.portal.console.channel.defselect.no#}" onLabel="{$jsp.portal.console.channel.defselect.yes#}"   isSave="false" />																		
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.operation.composite.showheight#}"/></html:td>
					<html:td >	
						<html:text name="showHeight" id="showHeight" styleClass="input-text"/> 											
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.order#}"/></html:td>
					<html:td >
						<html:text name="defaultOrder" id="defaultOrder" styleClass="input-text"/> 														
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('channelForm')"/>
						<btn:return href="contoller.do?operation=loadChannelPersonalizeList&currentSysCode=$[currentSysCode]&sysId=$[sysId]"/>
				</html:td>
				</html:tr>
			</html:table>	
			
	<com:validator formId="channelForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="channelName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="channelUrl"  types="none" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="defaultOrder"  types="none" event="onblur">
			<com:init size="36" maxlength="60" initValue="10000"></com:init>
		</com:vElement>
		<com:vElement id="showHeight"  types="none" event="onblur">
			<com:init size="8" maxlength="5" initValue="800"></com:init>
		</com:vElement>
	</com:validator>
	</html:form>

	</body>
</html>
<com:loader   simpleUpload="true"/>

