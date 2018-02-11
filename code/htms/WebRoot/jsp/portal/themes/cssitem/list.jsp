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
	<html:form id="itemForm" name="itemForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listCssItem"/>
		<html:hidden id="themesId" name="themesId" value="themesId"/>
		<html:hidden id="ownerId" name="ownerId" value="ownerId"/>
		<html:hidden id="ownderType" name="ownderType" value="ownderType"/>
		<html:hidden id="cssId" name="cssId" value="cssId"/>
		<jsp:include page="../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.cssitem.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			
			<html:tr>
				
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.themes.cssitem.code#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="itemCodeSH" id="itemCodeSH"  maxlength="30" styleClass="input_text" />	
				</html:td>
				
				<html:td styleClass="condition_option" colspan="2">
						<btn:search href="javascript:__vsubmit('itemForm')"/>
						<btn:reset href="javascript:cleanForm('itemForm')"/>	
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/portal/themes/cssitem/add.jsp?&ownerId=$[ownerId]&cssId=$[cssId]&ownderType=$[ownderType]&themesId=$[themesId]"/>
				<btn:delete href="javascript:batchDelete('itemForm','checkItemId','','deleteCssItem');" />
				<btn:return href="contoller.do?operation=listCss&ownerId=$[ownerId]&ownderType=$[ownderType]&themesId=$[themesId]"/>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="itemList" bean="itemBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkItemId" id="checkItemId" value="itemBean.itemId" />
				</html:td>
				<html:td  label="{$jsp.portal.themes.cssitem.code#}"  property="itemCode" />
				
				<html:td  label="{$jsp.portal.themes.cssitem.value#}"  property="itemValue" />
				
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewCssItem&isModify=true&itemId=$[itemBean.itemId]&ownerId=$[ownerId]&cssId=$[cssId]&ownderType=$[ownderType]&themesId=$[themesId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteCssItem&checkItemId=$[itemBean.itemId]&ownerId=$[ownerId]&cssId=$[cssId]&ownderType=$[ownderType]&themesId=$[themesId]"/>
				</html:td>
				
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkItemId" checkId="checkAll"/>	
		<com:page formId="itemForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




