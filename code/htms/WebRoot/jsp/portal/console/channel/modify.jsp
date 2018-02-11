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
<com:loader css="css/common/table-list.css"  switchbox="true" validator="true"/>
<html:form id="channelForm" name="channelForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyChannel"/>
			<html:hidden name="channelId" id="channelId"  value="channelViewBean.channelId"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.channel.modify.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="<%=PropKey.SYSTEM_LIST%>" >
							<html:option label="sysName" value="sysId" selected="channelViewBean.sysId"/>
						</html:select>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.name#}"/></html:td>
					<html:td >
							<html:text name="channelName" id="channelName" styleClass="input-text" size="36"  value="channelViewBean.channelName"/>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.url#}"/></html:td>
					<html:td >						
						<html:text name="channelUrl" id="channelUrl" styleClass="input-text" size="36"  value="channelViewBean.channelUrl"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.load#}"/></html:td>
					<html:td >
						<com:switchbox boxId="loadStyle"  varValue="channelViewBean.loadStyle" idValue="loadStyle" offValue="0" varName="loadStyle" onValue="1"  idName="loadStyle"  offLabel="{$jsp.portal.console.channel.load.async#}" onLabel="{$jsp.portal.console.channel.load.sync#}"   isSave="false"/>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="channelViewBean.isValidate" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  isSave="false" />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.order#}"/></html:td>
					<html:td >
						<html:text name="defaultOrder" id="defaultOrder" styleClass="input-text" size="36"  value="channelViewBean.defaultOrder"/> 														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.isshow#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="defaultShow"  varValue="channelViewBean.defaultShow" idValue="defaultShow" offValue="0" varName="defaultShow" onValue="1"  idName="defaultShow"  offLabel="{$jsp.portal.console.channel.isshow.yes#}" onLabel="{$jsp.portal.console.channel.isshow.no#}"  isSave="false"  />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.defselect#}"/></html:td>
					<html:td >
						<com:switchbox boxId="defaultSelect"  varValue="channelViewBean.defaultSelect" idValue="defaultSelect" offValue="0" varName="defaultSelect" onValue="1"  idName="defaultSelect"  offLabel="{$jsp.portal.console.channel.defselect.no#}" onLabel="{$jsp.portal.console.channel.defselect.yes#}"   isSave="false" />																		
					</html:td>
				</html:tr>
				
					<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.defstyle#}"/></html:td>
					<html:td >						
						<html:text name="defaultClass" id="defaultClass" styleClass="input-text" size="36"  value="channelViewBean.defaultClass"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.selectstyle#}"/></html:td>
					<html:td >
						<html:text name="selectedClass" id="selectedClass" styleClass="input-text" size="36"  value="channelViewBean.selectedClass"/>															
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.operation.composite.showheight#}"/></html:td>
					<html:td >	
						<html:text name="showHeight" id="showHeight" styleClass="input-text" value="channelViewBean.showHeight"/> 											
					</html:td>
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td >											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.desc#}"/></html:td>
					<html:td colspan="3">
							<html:textarea name="channelDesc" id="channelDesc" styleClass="input-text" cols="40" rows="8" value="channelViewBean.channelDesc"></html:textarea>				
					</html:td>
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('channelForm')"/>
						<btn:return href="contoller.do?operation=listChannel"/>							
				</html:td></html:tr>
			</html:table>	
			
		<com:validator formId="channelForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="channelCode"  types="isnull,number-letter-underline" event="onblur">
				<com:init size="36" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="channelName"  types="isnull" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="channelUrl"  types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="defaultOrder"  types="none" event="onblur">
				<com:init size="36" maxlength="60" initValue="10000"></com:init>
			</com:vElement>
			<com:vElement id="defaultClass"  types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			
			<com:vElement id="showHeight"  types="none" event="onblur">
				<com:init size="8" maxlength="5" initValue="800"></com:init>
			</com:vElement>
			<com:vElement id="selectedClass"  types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
		</com:validator>
	</html:form>
	</body>
</html>


