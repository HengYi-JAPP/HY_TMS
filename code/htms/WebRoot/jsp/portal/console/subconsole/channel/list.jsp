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
<cext:priv code="_subsystem_channel_manage">
<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="channelForm" name="channelForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listSubSystemChannel"/>
		<html:hidden id="sysId" name="sysId" value="sysId"/>
		<jsp:include page="../../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.channel.list.title") %>' name='title'/>	
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.channel.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="channelNameSH" id="channelNameSH"  maxlength="30" styleClass="input_text" />					
						<cext:priv code="_subsystem_channel_manage_search">		
							<btn:search href="javascript:__vsubmit('channelForm')"/>
						</cext:priv>
						<cext:priv code="_subsystem_channel_manage_reset">
							<btn:reset href="javascript:cleanForm('channelForm')"/>	
						</cext:priv>					
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
					<cext:priv code="_subsystem_channel_manage_new">
						<btn:new href="jsp/portal/console/subconsole/channel/add.jsp?sysId=$[sysId]"/>
					</cext:priv>
					<cext:priv code="_subsystem_channel_manage_delete">
						<btn:delete href="javascript:batchDelete('channelForm','checkChannelId','','deleteSubSystemChannel');" />
					</cext:priv>
					
					<btn:button name="{$jsp.portal.themes.themes.showorder#}" href="contoller.do?operation=orderChannel&sysId=$[sysId]"  typeId="assignPrivilege" value="{$jsp.portal.themes.themes.showorder#}" styleClass="button-self-style" />
					
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.CHANNEL_LIST%>" bean="channelBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkChannelId" id="checkChannelId" value="channelBean.channelId" />
				</html:td>
			
				<html:td  label="{$jsp.portal.console.channel.name#}" >
					<cext:priv code="_subsystem_channel_manage_view">
						<html:a  href="contoller.do?operation=viewSubSystemChannel&channelId=$[channelBean.channelId]&sysId=$[sysId]">
							<html:value value="channelBean.channelName"/>
						</html:a>	
					</cext:priv>
					<cext:priv code="_subsystem_channel_manage_view" notPass="true">
						<html:value value="channelBean.channelName"/>
					</cext:priv>			
				</html:td>
				<html:td  label="{$jsp.portal.console.channel.desc#}"  property="channelDesc" />
				<html:td label="{$jsp.common.status.validate#}" >
					<cext:priv code="_subsystem_channel_manage_isvalidate">
						<com:switchbox varValue="channelBean.isValidate" talbeName="TB_CMS_CHANNEL" idValue="channelBean.channelId" offValue="0" varName="isValidate" onValue="1"  idName="channelId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="true"/>
					</cext:priv>						
				</html:td>
				<html:td label="{$jsp.common.operation.composite#}" width="100px" align="center">
						<btn:button href="contoller.do?operation=listChannelComposite&channelId=$[channelBean.channelId]&sysId=$[sysId]" name="{$jsp.common.operation.composite#}"  typeId="assignPrivilege" value="{$jsp.common.operation.composite#}" styleClass="button-self-style"/>
				</html:td>
				<html:td label="{$jsp.portal.console.subconsole.column.assign.title#}" width="100px">
					<btn:button href="contoller.do?operation=toAddRoleForSubSystemChannel&checkChannelId=$[channelBean.channelId]&sysId=$[sysId]" name="{$jsp.portal.console.subconsole.column.assign.title#}"  typeId="assignRoleForColumn" value="{$jsp.portal.console.subconsole.column.assign.title#}" styleClass="button-self-style"/>
				</html:td>
				<html:td label="{$jsp.portal.console.layout.designer.title#}{$jsp.portal.console.layout.designer.design#}" width="100px">
					<btn:button href="contoller.do?operation=listLayout&checkChannelId=$[channelBean.channelId]&sysId=$[sysId]" name="{$jsp.portal.console.layout.designer.title#}{$jsp.portal.console.layout.designer.design#}"  typeId="assignRoleForColumn" value="{$jsp.portal.console.layout.designer.title#}{$jsp.portal.console.layout.designer.design#}" styleClass="button-self-style"/>
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<cext:priv code="_subsystem_channel_manage_modify">
						<btn:modify href="contoller.do?operation=viewSubSystemChannel&isModify=true&channelId=$[channelBean.channelId]&sysId=$[sysId]"/>
					</cext:priv>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<cext:priv code="_subsystem_channel_manage_delete">
						<btn:delete  href="contoller.do?operation=deleteSubSystemChannel&checkChannelId=$[channelBean.channelId]&sysId=$[sysId]"/>
					</cext:priv>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkChannelId" checkId="checkAll"/>	
		<com:page formId="channelForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>
</cext:priv>



