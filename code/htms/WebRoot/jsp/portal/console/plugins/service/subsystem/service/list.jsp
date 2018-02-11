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
		<title>服务管理</title>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="serviceForm" name="serviceForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listSubSystemService"/>
		<html:hidden id="sysId" name="sysId" value="sysId"/>
		<html:hidden id="columnId" name="columnId" value="columnId"/>
		<jsp:include page="../../../../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.service.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.service.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="serviceNameSH" id="serviceNameSH"  maxlength="30" styleClass="input_text" />					
								
						<btn:search href="javascript:__vsubmit('serviceForm')"/>
						<btn:reset href="javascript:cleanForm('serviceForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/portal/console/plugins/service/subsystem/service/add.jsp?sysId=$[sysId]&columnId=$[columnId]"/>
				<btn:delete href="javascript:batchDelete('serviceForm','checkServiceId','','deleteService');" />
				<btn:button name="{$jsp.portal.console.plugin.service.params.list.title#}" onclick="javascript:checkBeforeSubmit('serviceForm','checkServiceId','','toListSubSystemServiceParams',true);" typeId="addParamsForService" value="{$jsp.portal.console.plugin.service.params.list.title#}" styleClass="button-self-style"/>
				<btn:button name="{$jsp.portal.console.plugin.service.list.list.title#}" onclick="javascript:checkBeforeSubmit('serviceForm','checkServiceId','','toListSubSystemServiceList',true);" typeId="addListForService" value="{$jsp.portal.console.plugin.service.list.list.title#}" styleClass="button-self-style"/>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.SERVICE_LIST%>" bean="serviceBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkServiceId" id="checkServiceId" value="serviceBean.serviceId" />
				</html:td>
			
				<html:td  label="{$jsp.portal.console.plugin.service.name#}" >
				<html:a href="contoller.do?operation=viewSubSystemService&serviceId=$[serviceBean.serviceId]&sysId=$[sysId]&columnId=$[columnId]">
					<html:value value="serviceBean.serviceName"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.service.desc#}"  property="serviceDesc" />
				
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewSubSystemService&isModify=true&serviceId=$[serviceBean.serviceId]&sysId=$[sysId]&columnId=$[columnId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteSubSystemService&checkServiceId=$[serviceBean.serviceId]&sysId=$[sysId]&columnId=$[columnId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkServiceId" checkId="checkAll"/>	
		<com:page formId="serviceForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




