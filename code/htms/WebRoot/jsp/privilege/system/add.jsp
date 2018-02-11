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
<com:loader css="css/common/table-list.css" validator="true"  switchbox="true"/>
<html:form id="systemForm" name="systemForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addSystem"/>
			<html:hidden name="sysId" id="sysId"  value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden name="privType" id="privType"  value="dicBean.dicId"/>			
			<html:hidden name="isValidate" id="isValidate" value="1"/> 
			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.system.add.title") %>' name='title'/>				
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.code#}"/></html:td>
					<html:td >						
							<html:text name="sysCode" id="sysCode" styleClass="input-text" value=""/>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.name#}"/></html:td>
					<html:td >	
						<html:text name="sysName" id="sysName" styleClass="input-text" value=""/> 											
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.isinside#}"/></html:td>
					<html:td >	
						<com:switchbox boxId="isInside" varValue="0" idValue="sysId" offValue="0" varName="isInside" onValue="1"  idName="isInside"  offLabel="{$jsp.portal.console.column.personalize.no#}" onLabel="{$jsp.portal.console.column.personalize.yes#}"   isSave="false" />											
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.accesspath#}"/></html:td>
					<html:td >
							<html:text name="sysPath" id="sysPath" styleClass="input-text" value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.desc#}"/></html:td>
					<html:td>
							<html:textarea name="sysDesc" id="sysDesc" styleClass="input-text" cols="40" rows="8" value=""></html:textarea>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.order#}"/></html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text" value=""/>													
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('systemForm')"/>
						<btn:return href="contoller.do?operation=listSystem"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="systemForm" showNormal="true" submitValidate="true" >
		<com:vElement id="sysCode"  types="isnull,number-letter-underline" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="sysName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="sysPath"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="sysDesc"  types="none" event="onblur">
			<com:init maxlength="300" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="showOrder"  types="number" event="onblur">
			<com:init size="36" maxlength="10" initValue="10"></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
	</body>
</html>

	
