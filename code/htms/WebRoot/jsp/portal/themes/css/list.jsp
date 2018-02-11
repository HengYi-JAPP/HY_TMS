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
	<html:form id="cssForm" name="cssForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listCss"/>
		<html:hidden id="themesId" name="themesId" value="themesId"/>
		<html:hidden id="ownerId" name="ownerId" value="ownerId"/>
		<html:hidden id="ownderType" name="ownderType" value="ownderType"/>
		<jsp:include page="../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.css.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.themes.css.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="cssNameSH" id="cssNameSH"  maxlength="30" styleClass="input_text" />	
				</html:td>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.themes.css.code#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="cssCodeSH" id="cssCodeSH"  maxlength="30" styleClass="input_text" />	
				</html:td>
				
				<html:td styleClass="condition_option" colspan="2">
						<btn:search href="javascript:__vsubmit('cssForm')"/>
						<btn:reset href="javascript:cleanForm('cssForm')"/>	
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/portal/themes/css/add.jsp?ownerId=$[ownerId]&themesId=$[themesId]&ownderType=$[ownderType]&totalCount=$[totalCount]"/>
				<btn:delete href="javascript:batchDelete('cssForm','checkCssId','','deleteCss');" />
				<btn:copy href="javascript:doSingleCopy('cssForm','checkCssId','','copyCss');"/>
				<btn:next href="contoller.do?operation=orderCss&ownerId=$[ownerId]&themesId=$[themesId]" value="{$jsp.portal.themes.css.order.title#}"/>
				<logic:if equal="ownderType,themes">
				<btn:return href="contoller.do?operation=listThemes" />
				</logic:if>
				<logic:if equal="ownderType,skin">
				<btn:return href="contoller.do?operation=listSkin&themesId=$[themesId]" />
				</logic:if>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="cssList" bean="cssBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll" width="120px">
					<html:checkbox name="checkCssId" id="checkCssId" value="cssBean.cssId" />
				</html:td>
				<html:td  label="{$jsp.portal.themes.css.code#}"  property="cssCode" />
				<!--html:td  label="{$jsp.portal.themes.css.name#}" -->
				<!--html:a href="contoller.do?operation=viewCss&cssId=$[cssBean.cssId]"-->
					<!--html:value value="cssBean.cssName"/-->
				<!--/html:a-->				
				<!--/html:td-->
				<!--html:td  label="{$jsp.portal.themes.css.desc#}"  property="cssDesc" /-->
				<html:td label="{$jsp.portal.themes.cssitem.add.title#}" width="120px">
					<html:a href="contoller.do?operation=toListBatchCssItem&ownerId=$[ownerId]&themesId=$[themesId]&cssId=$[cssBean.cssId]&ownderType=$[ownderType]" ><html:label label="{$jsp.portal.themes.cssitem.add.title#}"/></html:a>
				</html:td>
				<html:td label="{$jsp.portal.themes.cssitem.list.title#}" width="80px">
					<html:a href="contoller.do?operation=listCssItem&ownerId=$[ownerId]&cssId=$[cssBean.cssId]&themesId=$[themesId]&ownerId=$[ownerId]&ownderType=$[ownderType]" ><html:label label="{$jsp.portal.themes.cssitem.list.title#}"/></html:a>
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewCss&isModify=true&cssId=$[cssBean.cssId]&themesId=$[themesId]&ownerId=$[ownerId]&ownderType=$[ownderType]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteCss&checkCssId=$[cssBean.cssId]&themesId=$[themesId]&ownerId=$[ownerId]&ownderType=$[ownderType]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkCssId" checkId="checkAll"/>	
		<com:page formId="cssForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




