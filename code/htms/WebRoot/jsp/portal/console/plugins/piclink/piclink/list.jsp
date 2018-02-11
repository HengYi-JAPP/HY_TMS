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
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true"/>	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="linkForm" name="linkForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listPicLink"/>
		<html:hidden id="sysId" name="sysId" value="sysId"/>
		<jsp:include page="../../../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.piclinks.list.title") %>' name='title'/>	
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>	
					<%--<html:td styleClass="condition_label">系统：</html:td>
					<html:td styleClass="condition_option">
						<html:select id="sysIdSH" name="sysIdSH"    isCascade="true" isCascadeSource="true" cascadeTarget="linkTypeIdSH"  list="<%=PropKey.SYSTEM_LIST%>">
							<html:option label="sysName" value="sysId" selected="sysIdSH"/>
						</html:select>														
					</html:td>
					--%><html:td styleClass="edit-talbe-condition_label"><html:label label="{$jsp.portal.console.plugin.piclinktype.name#}"/></html:td>
					<html:td styleClass="condition_option">
						<html:select id="linkTypeIdSH" name="linkTypeIdSH" fistOption="{$jsp.common.select.firstoption#}" isCascade="true" isCascadeSource="true" isCascadeEdit="true" cascadeTarget="linkGroupIdSH"  list="<%=PropKey.LINK_TYPE_LIST%>">
							<html:option label="linkTypeName" value="linkTypeId"  selected="linkTypeIdSH"/>
						</html:select>														
					</html:td>
			<%--
			</html:tr>
			<html:tr>
					--%>
					<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.piclinkgroup.name#}"/></html:td>
					<html:td styleClass="condition_option">
						<html:select id="linkGroupIdSH" name="linkGroupIdSH"   isCascade="true" isCascadeEdit="true" cascadeSource="linkTypeIdSH" cascadeValue="linkTypeId" list="<%=PropKey.LINK_GROUP_LIST%>">
							<html:option label="linkGroupName" value="linkGroupId"  selected="linkGroupIdSH"/>
						</html:select>														
					</html:td>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.piclinks.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="linkNameSH" id="linkNameSH"  maxlength="30" styleClass="input_text" />					
								
						<btn:search href="javascript:__vsubmit('linkForm')"/>
						<btn:reset href="javascript:cleanForm('linkForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jcontoller.do?operation=toAddPicLink&sysId=$[sysId]"/>
				<btn:delete href="javascript:batchDelete('linkForm','checkLinkId','','deletePicLink');" />
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.LINK_LIST%>" bean="linkBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkLinkId" id="checkLinkId" value="linkBean.linkId" />
				</html:td>
				
				<html:td  label="{$jsp.portal.console.plugin.piclinks.name#}" >
					<html:a href="contoller.do?operation=viewPicLink&linkId=$[linkBean.linkId]&sysId=$[sysId]">
						<html:value value="linkBean.linkName"/>
					</html:a>				
				</html:td>				
				<html:td  label="{$jsp.portal.console.plugin.piclinks.order#}"  property="showOrder" />
				<html:td  label="{$jsp.portal.console.plugin.piclinks.showicon.yes#}" >
					<com:switchbox  varValue="linkBean.showLinkIcon" idValue="showLinkIcon" offValue="0" varName="showLinkIcon" onValue="1"  idName="showLinkIcon"  offLabel="{$jsp.portal.console.plugin.piclinks.showicon.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.showicon.yes#}"   isSave="false"  hideBox="true"/>
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.piclinks.showword#}" >
					<com:switchbox  varValue="linkBean.showContents" idValue="showContents" offValue="0" varName="showContents" onValue="1"  idName="showContents"  offLabel="{$jsp.portal.console.plugin.piclinks.showword.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.showword.yes#}"  isSave="false"  hideBox="true"/>
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.piclinks.issee#}">
					<com:switchbox  varValue="linkBean.isSee" idValue="isSee" offValue="0" varName="isSee" onValue="1"  idName="isSee"  offLabel="{$jsp.portal.console.plugin.piclinks.isclick.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.isclick.yes#}"   isSave="false" hideBox="true"/>
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.piclinks.isclick#}">
					<com:switchbox  varValue="linkBean.isClick" idValue="isClick" offValue="0" varName="isClick" onValue="1"  idName="isClick"  offLabel="{$jsp.portal.console.plugin.piclinks.issee.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.issee.yes#}"   isSave="false"  hideBox="true"/>
				</html:td>
				
				<html:td label="{$jsp.common.status.validate#}" >						
					<com:switchbox varValue="linkBean.isValidate" talbeName="TB_CMS_LINK" idValue="linkBean.linkId" offValue="0" varName="isValidate" onValue="1"  idName="linkId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="true"/>					
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewPicLink&isModify=true&linkId=$[linkBean.linkId]&sysId=$[sysId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deletePicLink&checkLinkId=$[linkBean.linkId]&sysId=$[sysId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkLinkId" checkId="checkAll"/>	
		<com:page formId="linkForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




