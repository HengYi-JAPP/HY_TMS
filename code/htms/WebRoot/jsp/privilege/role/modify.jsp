<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
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
<com:loader switchbox="true" ajax="true"  css="css/common/table-list.css" validator="true"/>
<html:form id="roleForm" name="roleForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyRole"/>
			<html:hidden name="roleId" id="roleId"  value="roleViewBean.roleId"/>
			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.role.modify.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="<%=PropKey.SYSTEM_LIST%>">
							<html:option label="sysName" value="sysId" selected="roleViewBean.sysId"/>
						</html:select>									
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.name#}"/></html:td>
					<html:td >
							<html:text name="roleName" id="roleName" styleClass="input-text" value="roleViewBean.roleName" />													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.desc#}"/></html:td>
					<html:td>
							<html:textarea name="roleDesc" id="roleDesc" styleClass="input-text" cols="40" rows="8" value="roleViewBean.roleDesc" ></html:textarea>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td>
					<com:switchbox varValue="roleViewBean.isValidate" talbeName="TB_CMS_ROLE" idValue="roleViewBean.roleId" offValue="0" varName="isValidate" onValue="1"  idName="roleId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do"/>									
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('roleForm')"/>
						<btn:return href="contoller.do?operation=listRole"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="roleForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="roleName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="roleDesc"  types="none" event="onblur">
			<com:init  maxlength="300" initValue=""></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
	
	

	</body>
</html>



