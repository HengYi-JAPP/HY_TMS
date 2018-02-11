<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true"  tree="true"/>	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="privilegeForm" name="privilegeForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listPrivilege"/>
		<jsp:include page="../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.privilege.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.privilege.privilege.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="privNameSH" id="privNameSH"  maxlength="30" styleClass="input_text" />
					<btn:search href="javascript:__vsubmit('privilegeForm')"/>
						<btn:reset href="javascript:cleanForm('privilegeForm')"/>							
				</html:td>
				<html:td styleClass="condition_label"><html:label label="{$jsp.privilege.privilege.code#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="privCodeSH" id="privCodeSH"  maxlength="30" styleClass="input_text" />
					<btn:search href="javascript:__vsubmit('privilegeForm')"/>
						<btn:reset href="javascript:cleanForm('privilegeForm')"/>							
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="contoller.do?operation=toAddPrivilege"/>
				<btn:delete href="javascript:batchDelete('privilegeForm','checkPrivId','','deletePrivilege',true);" />
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		
					
				<com:tree treeList="<%=PropKey.PRIVILEGE_LIST%>" treeName="myTree" useCheckBox="true" chooseStyle="down"  treeNodeId="privId" cacheElementName="checkPrivId" appendNodeOperation="true" useNodeImage="true" expandAll="1" useLink="true" >
					<com:treeOpration href="contoller.do?operation=listCheckedPrivilege&isModify=true" name="　{$jsp.common.operation.modify#}" idPrefix="modify_"  target="_self" ></com:treeOpration>
					<com:treeNodeMap name="privName" nodeId="privId" parentId="privParentId" url="contoller.do?operation=listCheckedPrivilege" openType="_self"/>									
				</com:tree>
			
			
		
	</html:form>
	
	</body>
</html>





