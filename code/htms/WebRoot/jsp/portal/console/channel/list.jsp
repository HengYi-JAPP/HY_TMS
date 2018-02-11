<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
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
	<html:form id="channelForm" name="channelForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listChannel"/>
		<jsp:include page="../../../common/impart/table-banner.jsp">
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
						
						<btn:search href="javascript:__vsubmit('channelForm')"/>
						<btn:reset href="javascript:cleanForm('channelForm')"/>	
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="contoller.do?operation=toAddChannel"/>
				<btn:delete href="javascript:batchDelete('channelForm','checkChannelId','','deleteChannel');" />
				<btn:button name="布局管理" onclick="javascript:checkBeforeSubmit('channelForm','checkChannelId','','listLayout',true);" typeId="assignPrivilege" value="布局管理" styleClass="button-self-style"/>
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
				
					<html:a href="contoller.do?operation=viewChannel&channelId=$[channelBean.channelId]">
						<html:value value="channelBean.channelName"/>
					</html:a>
				</html:td>
				<html:td  label="{$jsp.portal.console.channel.desc#}"  property="channelDesc" />
				<html:td label="{$jsp.common.status.validate#}" >
						<com:switchbox varValue="channelBean.isValidate" talbeName="TB_CMS_CHANNEL" idValue="channelBean.channelId" offValue="0" varName="isValidate" onValue="1"  idName="channelId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="true"/>
															
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
						<btn:modify href="contoller.do?operation=viewChannel&isModify=true&channelId=$[channelBean.channelId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
						<btn:delete  href="contoller.do?operation=deleteChannel&checkChannelId=$[channelBean.channelId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkChannelId" checkId="checkAll"/>	
		<com:page formId="channelForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>


