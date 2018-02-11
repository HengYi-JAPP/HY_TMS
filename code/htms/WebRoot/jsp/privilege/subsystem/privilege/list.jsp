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
<cext:priv code="_subsystem_privilege_manage">
<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js,js/htms/common/common.js"/>
		<com:loader css="css/common/table-list-new.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true"  tree="true"/>	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="privilegeForm" name="privilegeForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listSubSystemPrivilege"/>
		<html:hidden id="sysId" name="sysId" value="sysId"/>
		<jsp:include page="../../../common/impart/table-banner-new.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.privilege.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0" styleClass="edit-talbe">
			<html:tr styleClass="trCell">
				<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.name#}"/></html:td>
				<html:td >
					<html:text name="privNameSH" id="privNameSH"  maxlength="30" />
				</html:td>
				<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.code#}"/></html:td>
				<html:td >
					<html:text name="privCodeSH" id="privCodeSH"  maxlength="30"  />
					<span style="float:right;">
						<cext:priv code="_subsystem_privilege_manage_search">
							<btn:search href="javascript:submit('privilegeForm')"/>
						</cext:priv>
						<cext:priv code="_subsystem_privilege_manage_reset">
							<btn:reset href="javascript:cleanForm('privilegeForm')"/>
						</cext:priv>	
					</span>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<cext:priv code="_subsystem_privilege_manage_new">
					<btn:new href="contoller.do?operation=toAddSubSystemPrivilege&sysId=$[sysId]"/>
				</cext:priv>
				<cext:priv code="_subsystem_privilege_manage_delete">
					<btn:delete href="javascript:batch_deletes('privilegeForm','checkPrivId','','deleteSubSystemPrivilege',true);" />
				</cext:priv>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
				<cext:priv code="_subsystem_privilege_manage_view">
				<com:tree treeList="<%=PropKey.PRIVILEGE_LIST%>" treeName="myTree" useCheckBox="true" chooseStyle="down"  treeNodeId="privId" cacheElementName="checkPrivId" appendNodeOperation="true" useNodeImage="true" expandAll="1" useLink="true" >
					<cext:priv code="_subsystem_privilege_manage_modify">
					<com:treeOpration href="contoller.do?operation=listCheckedSubSystemPrivilege&isModify=true&sysId=$[sysId]" name="　{$jsp.common.operation.modify#}" idPrefix="modify_"  target="_self"></com:treeOpration>
					</cext:priv>
					<com:treeNodeMap name="privName" nodeId="privId" parentId="privParentId" url="contoller.do?operation=listCheckedSubSystemPrivilege&sysId=$[sysId]" openType="_self"/>									
				</com:tree>
				</cext:priv>
			
			
		
	</html:form>
	
	</body>
</html>
</cext:priv>





