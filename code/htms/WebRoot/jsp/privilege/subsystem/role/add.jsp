<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

 %>

<cext:priv code="_subsystem_role_manage_new">
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css" validator="true"/>
<html:form id="roleForm" name="roleForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addSubSystemRole"/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<html:hidden name="isValidate" id="isValidate" value="1"/> 
			<jsp:include page="../../../common/impart/table-banner-new.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.role.add.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.name#}"/></html:td>
					<html:td >
							<html:text name="roleName" id="roleName" styleClass="input-text"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.roletype#}"/></html:td>
					<html:td >
							<html:select id="roleType" name="roleType"  list="role_type_list">
								<html:option label="dicName" value="dicId" />
							</html:select>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.desc#}"/></html:td>
					<html:td>
							<html:textarea name="roleDesc" id="roleDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>				
					</html:td>
				</html:tr>
				
			</html:table>
		
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
				 <cext:priv code="_subsystem_role_manage_new_save">
						<btn:save href="javascript:__vsubmit('roleForm')"/>
				</cext:priv>
				 <cext:priv code="_subsystem_role_manage_new_return">
						<btn:return href="contoller.do?operation=listSubSystemRole&sysId=$[sysId]"/>
				</cext:priv>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="roleForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="roleName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="roleDesc"  types="none" event="onblur">
			<com:init size="36" maxlength="300" initValue=""></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
	
	</body>
</html>
</cext:priv>


