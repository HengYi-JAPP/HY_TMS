<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/comp-extends.tld" prefix="cext"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<title><html:value value="{$jsp.common.datasurce.list.title#}"/></title>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="datasourceForm" name="datasourceForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listDatasource"/>
		<jsp:include page="../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.common.datasurce.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:value value="{$jsp.common.datasurce.dbname#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="dbsNameSH" id="dbsNameSH"  maxlength="30" styleClass="input_text" />						
				</html:td>
				<html:td styleClass="condition_label"><html:value value="{$jsp.common.datasurce.dbaccount#}"/></html:td>
				<html:td styleClass="condition_option">	
						<html:text name="dbAccountSH" id="dbAccountSH"  maxlength="30" styleClass="input_text" />					
						<btn:search href="javascript:__vsubmit('datasourceForm')"/>
						<btn:reset href="javascript:cleanForm('datasourceForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/common/datasource/add.jsp"/>
				<btn:delete href="javascript:batchDelete('datasourceForm','checkDbsId','','deleteDatasource');" />
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.DATASOURCE_LIST%>" bean="dbsBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td id="selectAll" label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}">
					<html:checkbox name="checkDbsId" id="checkDbsId" value="dbsBean.dbsId" />
				</html:td>
				
				<html:td  label="{$jsp.common.datasurce.dbsname#}" >
				<html:a href="contoller.do?operation=viewDatasource&dbsId=$[dbsBean.dbsId]">
					<html:value value="dbsBean.dbsName"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.common.datasurce.dbaccount#}"  property="dbAccount" />
				<html:td  label="{$jsp.common.datasurce.dbname#}" >
					<cext:dic dicId="dbsBean.dbName"/>
				</html:td>
				<html:td  label="{$jsp.common.datasurce.hostip#}"  property="hostIp" />
				<html:td  label="{$jsp.common.datasurce.hostport#}"  property="hostPort" />
				<html:td label="{$jsp.common.datasurce.vstatus#}" >
					<com:switchbox varValue="dbsBean.isValidate" talbeName="TB_DATASOURCE" idValue="dbsBean.dbsId" offValue="0" varName="isValidate" onValue="1"  idName="dbsId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do"/>						
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewDatasource&isModify=true&dbsId=$[dbsBean.dbsId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteDatasource&checkDbsId=$[dbsBean.dbsId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkDbsId" checkId="checkAll"/>	
		<com:page formId="datasourceForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>



