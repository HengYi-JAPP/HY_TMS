<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<cext:priv code="_subsystem_role_manage_assignprivilege">
<html>
	<head>
		
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		
		<com:loader css="css/common/sub-table-list.css" validator="true"  tree="true" switchbox="true" ajax="true"/>
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="assignForm" name="assignForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="assignPrivilegeForSubSystemRole"/>
		<html:hidden id="sysId" name="sysId" value="sysId"/>
		<jsp:include page="../../../common/impart/table-banner-new.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.role.assign.title") %>' name='title'/>		
			<jsp:param value="true" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label" style="width:110px;"><html:label label="{$jsp.privilege.role.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:value value="roleViewBean.roleName"/>
					<html:hidden name="roleId" id="roleId"  value="roleViewBean.roleId" />						
				</html:td>
			</html:tr>
		</html:table>
	
	<com:tree treeList="privilegeList" checkedTreeList="privilegeCheckedList" treeName="myTree" useCheckBox="true" chooseStyle="down"  useNodeImage="true" expandAll="1" cacheElementName="privId" >
		<com:treeNodeMap name="privName" nodeId="privId" parentId="privParentId" />
	</com:tree>	
		
		<!-- list box 内容列表区 -->
		<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
					<cext:priv code="_subsystem_role_manage_assignprivilege_save">
						<btn:save href="javascript:__vsubmit('assignForm')"/>	
					</cext:priv>
					<cext:priv code="_subsystem_role_manage_assignprivilege_return">				
						<btn:return href="contoller.do?operation=listSubSystemRole&sysId=$[sysId]"/>
					</cext:priv>							
				</html:td></html:tr>
			</html:table>	
	</html:form>
	
	</body>
</html>
</cext:priv>
