<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<cext:priv code="_subsystem_role_manage">
<html>
	<head>
		<title>角色管理</title>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js,js/htms/common/common.js"/>
		<com:loader css="css/common/table-list-new.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="roleForm" name="roleForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listSubSystemRole"/>
		<html:hidden id="sysId" name="sysId" value="sysId"/>
		<jsp:include page="../../../common/impart/table-banner-new.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.role.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0" styleClass="edit-talbe">
			<html:tr styleClass="trCell">
				<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.name#}"/></html:td>
				<html:td >
					<html:text name="roleNameSH" id="roleNameSH"  maxlength="30"  />						
				</html:td>
				<html:td styleClass="edit-talbe-label"></html:td>
				<html:td >	
					<span style="float:right;">	
						<cext:priv code="_subsystem_role_manage_search">				
							<btn:search href="javascript:submit('roleForm')"/>
						</cext:priv>
						<cext:priv code="_subsystem_role_manage_reset">
							<btn:reset href="javascript:cleanForm('roleForm')"/>
						</cext:priv>	
					</span>					
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<cext:priv code="_subsystem_role_manage_new">
					<btn:new href="contoller.do?operation=toAddSubSystemRole&sysId=$[sysId]"/>
				</cext:priv>
				<cext:priv code="_subsystem_role_manage_delete">
					<btn:delete href="javascript:batch_deletes('roleForm','checkRoleId','','deleteSubSystemRole');" />
				</cext:priv>
				
				<cext:priv code="_subsystem_role_manage_assignprivilege">
					<btn:button name="{$jsp.privilege.role.assign.title#}" onclick="javascript:checkBeforeSubmit('roleForm','checkRoleId','','toAssignPrivilegeForSubSystemRole',true);" typeId="assignPrivilege" value="{$jsp.privilege.role.assign.title#}" styleClass="button-self-style"/>
				</cext:priv>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.ROLE_LIST%>" bean="roleBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll" width="80px">
					<html:checkbox name="checkRoleId" id="checkRoleId" value="roleBean.roleId" />
				</html:td>
			
				<html:td  label="{$jsp.privilege.role.name#}" >
				<cext:priv code="_subsystem_role_manage_view">
					<html:a href="contoller.do?operation=viewSubSystemRole&roleId=$[roleBean.roleId]&sysId=$[sysId]">				
						<html:value value="roleBean.roleName"/>				
					</html:a>	
				</cext:priv>				
				<cext:priv code="_subsystem_role_manage_view" notPass="true">				
						<html:value value="roleBean.roleName"/>
				</cext:priv>							
				</html:td>
				<html:td  label="{$jsp.privilege.role.desc#}"  property="roleDesc" />
				<html:td label="{$jsp.common.status.validate#}" >
					<cext:priv code="_subsystem_role_manage_isvalidate">
						<com:switchbox varValue="roleBean.isValidate" talbeName="TB_CMS_ROLE" idValue="roleBean.roleId" offValue="0" varName="isValidate" onValue="1"  idName="roleId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do"/>
					</cext:priv>						
				</html:td>
					<%--
				<html:td label="{$jsp.portal.console.subconsole.role.column.title#}" width="140px">
						<btn:button href="contoller.do?operation=toAssignColumnForRole&checkRoleId=$[roleBean.roleId]&sysId=$[sysId]" name="{$jsp.portal.console.subconsole.role.column.title#}"  typeId="assignColumns" value="{$jsp.portal.console.subconsole.role.column.title#}" styleClass="button-self-style"/>
				</html:td>
				<html:td label="{$jsp.portal.console.subconsole.role.channel.title#}" width="140px">
						<btn:button href="contoller.do?operation=toAssignChannelForRole&checkRoleId=$[roleBean.roleId]&sysId=$[sysId]" name="{$jsp.portal.console.subconsole.role.channel.title#}"  typeId="assignColumns" value="{$jsp.portal.console.subconsole.role.channel.title#}" styleClass="button-self-style"/>
				</html:td>		
			 --%>		
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<cext:priv code="_subsystem_role_manage_modify">
						<btn:modify href="contoller.do?operation=viewSubSystemRole&isModify=true&roleId=$[roleBean.roleId]&sysId=$[sysId]"/>
					</cext:priv>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<cext:priv code="_subsystem_role_manage_delete">
						<btn:delete  href="javascript:deleteRow('contoller.do?operation=deleteSubSystemRole&checkRoleId=$[roleBean.roleId]&sysId=$[sysId]')"/>
					</cext:priv>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkRoleId" checkId="checkAll"/>	
		<com:page formId="roleForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>
</cext:priv>




