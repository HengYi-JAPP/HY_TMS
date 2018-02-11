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
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true"/>	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="linkGroupForm" name="linkGroupForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listSubSystemPicLinkGroup"/>
		<html:hidden id="sysId" name="sysId" value="sysId"/>
		<html:hidden id="columnId" name="columnId" value="columnId"/>
		<jsp:include page="../../../../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.piclinkgroup.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.piclinkgroup.code#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="linkGroupCodeSH" id="linkGroupCodeSH"  maxlength="30" styleClass="input_text" />	
				</html:td>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.piclinkgroup.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="linkGroupNameSH" id="linkGroupNameSH"  maxlength="30" styleClass="input_text" />					
								
						<btn:search href="javascript:__vsubmit('linkGroupForm')"/>
						<btn:reset href="javascript:cleanForm('linkGroupForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jcontoller.do?operation=toAddSubSystemPicLinkGroup&sysId=$[sysId]&columnId=$[columnId]"/>
				<btn:delete href="javascript:batchDelete('linkGroupForm','checkLinkGroupId','','deleteSubSystemPicLinkGroup');" />
				<btn:return href="contoller.do?operation=listSubSystemPicLink&sysId=$[sysId]&columnId=$[columnId]"/>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.LINK_GROUP_LIST%>" bean="linkGroupBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkLinkGroupId" id="checkLinkGroupId" value="linkGroupBean.linkGroupId" />
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.piclinkgroup.code#}"  property="linkGroupCode" />
				<html:td  label="{$jsp.portal.console.plugin.piclinkgroup.name#}" >
				<html:a href="contoller.do?operation=viewSubSystemPicLinkGroup&linkGroupId=$[linkGroupBean.linkGroupId]&sysId=$[sysId]&columnId=$[columnId]">
					<html:value value="linkGroupBean.linkGroupName"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.piclinkgroup.desc#}"  property="linkGroupDesc" />
				<html:td label="{$jsp.common.status.validate#}" >
					<com:switchbox varValue="linkGroupBean.isValidate" talbeName="TB_CMS_LINK_GROUP" idValue="linkGroupBean.linkGroupId" offValue="0" varName="isValidate" onValue="1"  idName="linkGroupId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="true"/>						
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewSubSystemPicLinkGroup&isModify=true&linkGroupId=$[linkGroupBean.linkGroupId]&sysId=$[sysId]&columnId=$[columnId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteSubSystemPicLinkGroup&checkLinkGroupId=$[linkGroupBean.linkGroupId]&sysId=$[sysId]&columnId=$[columnId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkLinkGroupId" checkId="checkAll"/>	
		<com:page formId="linkGroupForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




