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
	<html:form id="paramForm" name="paramForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="toListSubSystemSQLQueryParams"/>
		<html:hidden id="checkQueryId" name="checkQueryId" value="checkQueryId"/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<html:hidden id="columnId" name="columnId" value="columnId"/>
		
		<jsp:include page="../../../../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.sqlquery.params.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.sqlquery.name#}"/></html:td>
				<html:td styleClass="condition_option">						
					<html:value value="sqlqueryViewBean.queryName"/>										
				</html:td>	
				
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.sqlquery.params.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="paramNameSH" id="paramNameSH"  maxlength="30" styleClass="input_text" />					
								
						<btn:search href="javascript:__vsubmit('paramForm')"/>
						<btn:reset href="javascript:cleanForm('paramForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				
				<btn:new href="jsp/portal/console/plugins/sqlquery/subsystem/params/add.jsp?checkQueryId=$[checkQueryId]&sysId=$[sysId]&columnId=$[columnId]"/>
				<btn:delete href="javascript:batchDelete('paramForm','checkParamId','','deleteSubSystemSQLQueryParams');" />
				<btn:return href="contoller.do?operation=listSubSystemSQLQuery&sysId=$[sysId]&columnId=$[columnId]"/>
			    </html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.SQLQUERY_PARAMS_LIST%>" bean="paramBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkParamId" id="checkParamId" value="paramBean.paramId" />
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.sqlquery.params.code#}"  property="paramCode" />
				<html:td  label="{$jsp.portal.console.plugin.sqlquery.params.name#}" >
				<html:a href="contoller.do?operation=viewSubSystemSQLQueryParams&paramId=$[paramBean.paramId]&checkQueryId=$[checkQueryId]&sysId=$[sysId]&columnId=$[columnId]">
					<html:value value="paramBean.paramName"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.sqlquery.params.var#}"  property="paramVar" />
				<html:td  label="{$jsp.portal.console.plugin.sqlquery.params.value#}"  property="paramValue" />
				<html:td  label="{$jsp.portal.console.plugin.sqlquery.params.desc#}"  property="paramDesc" />
				
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewSubSystemSQLQueryParams&isModify=true&paramId=$[paramBean.paramId]&checkQueryId=$[checkQueryId]&sysId=$[sysId]&columnId=$[columnId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteSubSystemSQLQueryParams&checkParamId=$[paramBean.paramId]&checkQueryId=$[checkQueryId]&sysId=$[sysId]&columnId=$[columnId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkParamId" checkId="checkAll"/>	
		<com:page formId="paramForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




