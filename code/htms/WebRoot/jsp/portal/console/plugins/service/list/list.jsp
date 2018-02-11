<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../../common/impart/taglib.jsp"%>
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
	<html:form id="listForm" name="listForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="toListServiceList"/>
		<html:hidden id="checkServiceId" name="checkServiceId" value="checkServiceId"/>
		
		<jsp:include page="../../../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.service.list.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.service.list.service#}"/></html:td>
				<html:td styleClass="condition_option">						
					<html:value value="serviceViewBean.serviceName"/>										
				</html:td>	
				
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.service.list.title#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="titleSH" id="titleSH"  maxlength="30" styleClass="input_text" />					
								
						<btn:search href="javascript:__vsubmit('listForm')"/>
						<btn:reset href="javascript:cleanForm('listForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/portal/console/plugins/service/list/add.jsp?checkServiceId=$[checkServiceId]"/>
				<btn:delete href="javascript:batchDelete('listForm','checkConfigId','','deleteServiceList');" />
			    <btn:return href="contoller.do?operation=listService"/>
			    </html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.SERVICE_LIST_LIST%>" bean="listBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkConfigId" id="checkConfigId" value="listBean.configId" />
				</html:td>
				
				<html:td  label="{$jsp.portal.console.plugin.service.list.title#}" >
				<html:a href="contoller.do?operation=viewServiceList&configId=$[listBean.configId]&checkServiceId=$[checkServiceId]">
					<html:value value="listBean.title"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.service.list.var#}"  property="varName" />
				<html:td  label="{$jsp.portal.console.plugin.service.list.width#}"  property="width" />
				<html:td  label="{$jsp.portal.console.plugin.service.list.align#}">
					<html:select disabled="true" >
						<html:option label="{$jsp.portal.console.plugin.service.list.align.left#}" value="left"  selected="listBean.align"/>
						<html:option label="{$jsp.portal.console.plugin.service.list.align.center#}" value="center"  selected="listBean.align"/>
						<html:option label="{$jsp.portal.console.plugin.service.list.align.right#}" value="right"  selected="listBean.align"/>
					</html:select>	
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.service.list.valign#}" >
						<html:select disabled="true" >
							<html:option label="{$jsp.portal.console.plugin.service.list.valign.top#}" value="top"  selected="listBean.valign"/>
							<html:option label="{$jsp.portal.console.plugin.service.list.valign.middle#}" value="middle"  selected="listBean.valign"/>
							<html:option label="{$jsp.portal.console.plugin.service.list.valign.bottom#}" value="bottom"  selected="listBean.valign"/>
						</html:select>							
				</html:td>
				
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewServiceList&isModify=true&configId=$[listBean.configId]&checkServiceId=$[checkServiceId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteServiceList&checkConfigId=$[listBean.configId]&checkServiceId=$[checkServiceId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkConfigId" checkId="checkAll"/>	
		<com:page formId="listForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




