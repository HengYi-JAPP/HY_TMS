<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../../../common/impart/taglib.jsp"%>
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
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="queryForm" name="queryForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listSubSystemSQLQuery"/>
		<html:hidden id="sysId" name="sysId" value="sysId"/>
		<html:hidden id="columnId" name="columnId" value="columnId"/>
		<jsp:include page="../../../../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.sqlquery.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.sqlquery.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="queryNameSH" id="queryNameSH"  maxlength="30" styleClass="input_text" />					
								
						<btn:search href="javascript:__vsubmit('queryForm')"/>
						<btn:reset href="javascript:cleanForm('queryForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="contoller.do?operation=toAddSubSystemSQLQuery&sysId=$[sysId]&columnId=$[columnId]"/>
				<btn:delete href="javascript:batchDelete('queryForm','checkQueryId','','deleteSubSystemSQLQuery');" />
				<btn:button name="{$jsp.portal.console.plugin.sqlquery.params.list.title#}" onclick="javascript:checkBeforeSubmit('queryForm','checkQueryId','','toListSubSystemSQLQueryParams',true);" typeId="addParamsForQuery" value="{$jsp.portal.console.plugin.sqlquery.params.list.title#}" styleClass="button-self-style"/>
				<btn:button name="{$jsp.portal.console.plugin.sqlquery.list.list.title#}" onclick="javascript:checkBeforeSubmit('queryForm','checkQueryId','','toListSubSystemSQLQueryList',true);" typeId="addListForQuery" value="{$jsp.portal.console.plugin.sqlquery.list.list.title#}" styleClass="button-self-style"/>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.SQLQUERY_LIST%>" bean="queryBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkQueryId" id="checkQueryId" value="queryBean.queryId" />
				</html:td>
			
				<html:td  label="{$jsp.portal.console.plugin.sqlquery.name#}" >
				<html:a href="contoller.do?operation=toViewSubSystemSQLQuery&queryId=$[queryBean.queryId]&sysId=$[sysId]&columnId=$[columnId]">
					<html:value value="queryBean.queryName"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.sqlquery.desc#}"  property="queryDesc" />
				
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=toViewSubSystemSQLQuery&isModify=true&queryId=$[queryBean.queryId]&sysId=$[sysId]&columnId=$[columnId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteSubSystemSQLQuery&checkQueryId=$[queryBean.queryId]&sysId=$[sysId]&columnId=$[columnId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkQueryId" checkId="checkAll"/>	
		<com:page formId="queryForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




