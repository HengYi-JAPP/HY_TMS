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
	<html:form id="themesForm" name="themesForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listThemes"/>
		<jsp:include page="../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.themes.list.title") %>' name='title'/>	
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.themes.themes.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="themesNameSH" id="themesNameSH"  maxlength="30" styleClass="input_text" />	
				</html:td>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.themes.themes.code#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="themesCodeSH" id="themesCodeSH"  maxlength="30" styleClass="input_text" />	
				</html:td>
				
				<html:td styleClass="condition_option" colspan="2">
						<btn:search href="javascript:__vsubmit('themesForm')"/>
						<btn:reset href="javascript:cleanForm('themesForm')"/>	
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/portal/themes/themes/add.jsp?totalCount=$[totalCount]"/>
				<btn:delete href="javascript:batchDelete('themesForm','checkThemesId','','deleteThemes');" />
				<btn:next href="contoller.do?operation=orderThemes" value="{$jsp.portal.themes.themes.showorder#}"/>
				<btn:copy href="javascript:doSingleCopy('themesForm','checkThemesId','','copyThemes');"/>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="themesList" bean="themesBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkThemesId" id="checkThemesId" value="themesBean.themesId" />
				</html:td>
				<html:td  label="{$jsp.portal.themes.themes.code#}"  property="themesCode" />
				<html:td  label="{$jsp.portal.themes.themes.name#}" >
				<html:a href="contoller.do?operation=viewThemes&themesId=$[themesBean.themesId]">
					<html:value value="themesBean.themesName"/>
				</html:a>				
				</html:td>
				<!--html:td  label="{$jsp.portal.themes.themes.desc#}"  property="themesDesc" /-->
				
				<html:td label="{$jsp.portal.themes.defvar.list.title#}" width="100px">
					<html:a href="contoller.do?operation=listDefineType&themesId=$[themesBean.themesId]" ><html:label label="{$jsp.portal.themes.defvar.list.title#}"/></html:a>
				</html:td>
				
				<html:td label="{$jsp.portal.themes.params.list.title#}" width="100px">
					<html:a href="contoller.do?operation=listThemesParams&themesId=$[themesBean.themesId]&curpage=1" ><html:label label="{$jsp.portal.themes.params.list.title#}"/></html:a>
				</html:td>
				<html:td label="{$jsp.portal.themes.css.list.title#}" width="100px">
					<html:a href="contoller.do?operation=listCss&ownerId=$[themesBean.themesId]&ownderType=themes&curpage=1" ><html:label label="{$jsp.portal.themes.css.list.title#}"/></html:a>
				</html:td>
				<html:td label="{$jsp.portal.themes.skin.list.title#}" width="100px">
					<html:a href="contoller.do?operation=listSkin&themesId=$[themesBean.themesId]&curpage=1" ><html:label label="{$jsp.portal.themes.skin.list.title#}"/></html:a>
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewThemes&isModify=true&themesId=$[themesBean.themesId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteThemes&checkThemesId=$[themesBean.themesId]"/>
				</html:td>
				
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkThemesId" checkId="checkAll"/>	
		<com:page formId="themesForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




