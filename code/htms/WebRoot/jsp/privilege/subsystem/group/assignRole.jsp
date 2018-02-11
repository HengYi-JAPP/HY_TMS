<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%> 

<cext:priv code="_subsystem_group_manage_assignrole">	
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css" lorbox="true"/>
<html:form id="groupForm" name="groupForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="doAddRoleForSubSystemGroup"/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>

			<jsp:include page="../../../common/impart/table-banner-new.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.group.asign.role") %>' name='title'/>		
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.name#}"/></html:td>
					<html:td >	
						<html:value value="groupViewBean.groupName"/> 	
						<html:hidden name="checkGroupId" id="checkGroupId"  value="groupViewBean.groupId"/>										
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.assignrole.select.role#}"/></html:td>
					<html:td >		
					<com:lorbox lorBoxName="lorbox" filtDuplicated="true">
						<com:leftbox itemId="roleId" list="canSelectRole" itemValue="roleId" itemLabel="roleName" boxId="canSelectRole" orader="false" boxLabel="{$jsp.privilege.group.assignrole.selectable.role#}"/>
						<com:rightbox itemId="roleId" list="roleOfGroup" itemValue="roleId" itemLabel="roleName" boxId="selectedRole"  orader="false"  boxLabel="{$jsp.privilege.group.assignrole.selected.role#}"/>
					</com:lorbox>	
							 											
					</html:td>
				</html:tr>			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
					<cext:priv code="_subsystem_group_manage_assignrole_save">	
						<btn:save href="javascript:lorbox.submit();submit('groupForm')"/>
					</cext:priv>
					<cext:priv code="_subsystem_group_manage_assignrole_return">	
						<btn:return href="contoller.do?operation=listSubSystemGroup&sysId=$[sysId]"/>
					</cext:priv>							
				</html:td></html:tr>
			</html:table>	
		

	</html:form>
	
	

	</body>
</html>
</cext:priv>

							
	