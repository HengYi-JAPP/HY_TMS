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
	<html:form id="layoutForm" name="layoutForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listLayout"/>
		<html:hidden id="checkChannelId" name="checkChannelId" value="checkChannelId"/>
		<html:hidden id="sysId" name="sysId" value="sysId"/>
		<jsp:include page="../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.layout.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.layout.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="layoutNameSH" id="layoutNameSH"  maxlength="30" styleClass="input_text" />					
								
						<btn:search href="javascript:__vsubmit('layoutForm')"/>
						<btn:reset href="javascript:cleanForm('layoutForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/portal/console/layout/add.jsp?checkChannelId=$[checkChannelId]&sysId=$[sysId]"/>
				<btn:delete href="javascript:batchDelete('layoutForm','checkLayoutId','','deleteLayout');" />
				<btn:return href="contoller.do?operation=listSubSystemChannel&sysId=$[sysId]"/>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.LAYOUT_LIST%>" bean="layoutBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkLayoutId" id="checkLayoutId" value="layoutBean.layoutId" />
				</html:td>
			
				<html:td  label="{$jsp.portal.console.layout.name#}" >
				<html:a href="contoller.do?operation=viewLayout&layoutId=$[layoutBean.layoutId]&checkChannelId=$[checkChannelId]&sysId=$[sysId]">
					<html:value value="layoutBean.layoutName"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.portal.console.layout.desc#}"  property="layoutDesc" />
				<html:td label="{$jsp.common.status.validate#}" >
					<com:switchbox varValue="layoutBean.isValidate" talbeName="TB_CMS_LAYOUT" idValue="layoutBean.layoutId" offValue="0" varName="isValidate" onValue="1"  idName="layoutId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="true"/>						
				</html:td>
				<html:td label="{$jsp.portal.console.layout.designer.title#}{$jsp.portal.console.layout.designer.design#}" width="100px">
					<btn:button href="contoller.do?operation=loadLayoutUnitColumn&checkLayoutId=$[layoutBean.layoutId]&sysId=$[sysId]&checkChannelId=$[checkChannelId]" name="{$jsp.portal.console.layout.designer.design#}"  typeId="assignRoleForColumn" value="{$jsp.portal.console.layout.designer.design#}" styleClass="button-self-style"/>
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewLayout&isModify=true&layoutId=$[layoutBean.layoutId]&checkChannelId=$[checkChannelId]&sysId=$[sysId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteLayout&checkLayoutId=$[layoutBean.layoutId]&checkChannelId=$[checkChannelId]&sysId=$[sysId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkLayoutId" checkId="checkAll"/>	
		<com:page formId="layoutForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




