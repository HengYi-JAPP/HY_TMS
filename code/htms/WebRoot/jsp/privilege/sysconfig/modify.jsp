<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
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
<cext:dic cacheName="dicBean" typeCode="<%=PropKey.PRIVILEGE_TYPE_DIC%>" dicCode="<%=PropKey.SYSTEM_PRIVILEGE_MENUS_TYPE%>" scope="request"/>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"  switchbox="true" ajax="true" fckeditor="true"/>
<html:form id="sysConfigForm" name="sysConfigForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifySysConfig"/>
			<html:hidden name="sysId" id="sysId"  value="sysId"/>	
			<html:hidden name="configId" id="configId"  value="configViewBean.configId"/>
			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.sysconfig.modify.title") %>' name='title'/>	
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.type#}"/></html:td>
					<html:td >						
							<html:select name="configType" id="configType">
								<html:option label="{$jsp.privilege.sysconfig.type.file#}" value="config-file"></html:option>
								<html:option label="{$jsp.privilege.sysconfig.type.page#}" value="page-config"></html:option>
								<html:option label="{$jsp.privilege.sysconfig.type.other#}" value="other-config"></html:option>
							</html:select>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.code#}"/></html:td>
					<html:td >						
							<html:text name="configCode" id="configCode" styleClass="input-text" size="36" value="configViewBean.configCode"/>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.name#}"/></html:td>
					<html:td >	
						<html:text name="configName" id="configName" styleClass="input-text" size="36" value="configViewBean.configName"/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.content#}"/></html:td>
					<html:td>
							
							<com:fckeditor instanceName="configContent" width="600" height="400" defalutValue="configViewBean.configContent"></com:fckeditor>						
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.desc#}"/></html:td>
					<html:td>
							<html:textarea name="configDesc" id="configDesc" styleClass="input-text" cols="40" rows="8" value="configViewBean.configDesc"></html:textarea>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.version#}"/></html:td>
					<html:td >
							<html:text name="versionNo" id="versionNo" styleClass="input-text" value="configViewBean.versionNo"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.isref#}"/></html:td>
					<html:td >
							<com:switchbox boxId="isRef" boxName="isRef" varValue="configViewBean.isRef" talbeName="TB_SYSTEM" idValue="isRef" offValue="0" varName="isRef" onValue="1"  idName="isRef" offLabel="{$jsp.privilege.sysconfig.isref.no#}" onLabel="{$jsp.privilege.sysconfig.isref.yes#}"   ajaxUrl="contoller.do" isSave="false"/>												
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('sysConfigForm')"/>
					
						<btn:return href="contoller.do?operation=listSysConfig&sysId=$[sysId]"/>							
				</html:td></html:tr>
			</html:table>	
	<com:validator formId="groupForm" showNormal="true" submitValidate="true" >
		<com:vElement id="configCode"  types="none" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="configName"  types="none" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="configDesc"  types="none" event="onblur">
			<com:init maxlength="300" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="versionNo"  types="number" event="onblur">
			<com:init maxlength="10" initValue=""></com:init>
		</com:vElement>
	</com:validator>	
	
	</html:form>
	</body>
</html>

	
