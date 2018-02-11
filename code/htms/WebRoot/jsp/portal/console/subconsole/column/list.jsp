<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	
%>
<cext:priv code="_subsystem_column_manage">
<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="columnForm" name="columnForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listSubSystemColumn"/>
		<html:hidden id="sysId" name="sysId" value="sysId"/>
		<jsp:include page="../../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.column.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.column.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="columnNameSH" id="columnNameSH"  maxlength="30" styleClass="input_text" />					
						<cext:priv code="_subsystem_column_manage_search">		
							<btn:search href="javascript:__vsubmit('columnForm')"/>
						</cext:priv>
						<cext:priv code="_subsystem_column_manage_reset">
							<btn:reset href="javascript:cleanForm('columnForm')"/>
						</cext:priv>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<cext:priv code="_subsystem_column_manage_new">
					<btn:new href="contoller.do?operation=toAddSubSystemColumn&sysId=$[sysId]"/>
				</cext:priv>
				<cext:priv code="_subsystem_column_manage_delete">
					<btn:delete href="javascript:batchDelete('columnForm','checkColumnId','','deleteSubSystemColumn');" />
				</cext:priv>				
				<btn:button name="{$jsp.portal.console.column.params.title#}" onclick="javascript:checkBeforeSubmit('columnForm','checkColumnId','','listSubSystemColumnParams',true);" typeId="addParamsForColumn" value="{$jsp.portal.console.column.params.title#}" styleClass="button-self-style"/>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.COLUMN_LIST%>" bean="columnBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkColumnId" id="checkColumnId" value="columnBean.columnId" />
				</html:td>
			
				<html:td  label="{$jsp.portal.console.column.name#}" >
					<cext:priv code="_subsystem_column_manage_view">
						<html:a href="contoller.do?operation=viewSubSystemColumn&columnId=$[columnBean.columnId]&sysId=$[sysId]">
							<html:value value="columnBean.columnName"/>
						</html:a>	
					</cext:priv>
					<cext:priv code="_subsystem_column_manage_view" notPass="true">
						<html:value value="columnBean.columnName"/>
					</cext:priv>			
				</html:td>
				<html:td  label="{$jsp.portal.console.column.desc#}"  property="columnDesc" />
				<html:td label="{$jsp.common.status.validate#}" >
					<cext:priv code="_subsystem_column_manage_isvalidate">
						<com:switchbox varValue="columnBean.isValidate" talbeName="TB_CMS_COLUMN" idValue="columnBean.columnId" offValue="0" varName="isValidate" onValue="1"  idName="columnId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="true"/>
					</cext:priv>						
				</html:td>
				<html:td label="{$jsp.portal.console.subconsole.column.assign.title#}" width="100px">
					<btn:button href="contoller.do?operation=toAddRoleForSubSystemColumn&checkColumnId=$[columnBean.columnId]&sysId=$[sysId]" name="{$jsp.portal.console.subconsole.column.assign.title#}"  typeId="assignRoleForColumn" value="{$jsp.portal.console.subconsole.column.assign.title#}" styleClass="button-self-style"/>
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<cext:priv code="_subsystem_column_manage_modify">
						<btn:modify href="contoller.do?operation=viewSubSystemColumn&isModify=true&columnId=$[columnBean.columnId]&sysId=$[sysId]"/>
					</cext:priv>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<cext:priv code="_subsystem_column_manage_delete">
						<btn:delete  href="contoller.do?operation=deleteSubSystemColumn&checkColumnId=$[columnBean.columnId]&sysId=$[sysId]"/>
					</cext:priv>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkColumnId" checkId="checkAll"/>	
		<com:page formId="columnForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>
</cext:priv>


