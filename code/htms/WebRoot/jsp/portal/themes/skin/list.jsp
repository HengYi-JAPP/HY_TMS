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
	<html:form id="skinForm" name="skinForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listSkin"/>
		<html:hidden id="themesId" name="themesId" value="themesId"/>
		<jsp:include page="../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.skin.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.themes.skin.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="skinNameSH" id="skinNameSH"  maxlength="30" styleClass="input_text" />	
				</html:td>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.themes.skin.code#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="skinCodeSH" id="skinCodeSH"  maxlength="30" styleClass="input_text" />	
				</html:td>
				
				<html:td styleClass="condition_option" colspan="2">
						<btn:search href="javascript:__vsubmit('skinForm')"/>
						<btn:reset href="javascript:cleanForm('skinForm')"/>	
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/portal/themes/skin/add.jsp?themesId=$[themesId]&totalCount=$[totalCount]"/>
				<btn:delete href="javascript:batchDelete('skinForm','checkSkinId','','deleteSkin');" />
				<btn:copy href="javascript:doSingleCopy('skinForm','checkSkinId','','copySkin');"/>
				<btn:next href="contoller.do?operation=orderSkin&themesId=$[themesId]" value="{$jsp.portal.themes.skin.showorder#}"/>
				<btn:import  href="javascript:void(0);" onclick="javascript:checkBeforeSubmit('skinForm','checkSkinId','','toImportSkinCss',true);"/>
				<btn:return href="contoller.do?operation=listThemes"/>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="skinList" bean="skinBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkSkinId" id="checkSkinId" value="skinBean.skinId" />
				</html:td>
				<html:td  label="{$jsp.portal.themes.skin.code#}"  property="skinCode" />
				<html:td  label="{$jsp.portal.themes.skin.name#}" >
				<html:a href="contoller.do?operation=viewSkin&skinId=$[skinBean.skinId]&themesId=$[themesId]">
					<html:value value="skinBean.skinName"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.portal.themes.skin.desc#}"  property="skinDesc" />
				
				<html:td label="{$jsp.portal.themes.css.list.title#}" width="80px">
					<html:a href="contoller.do?operation=listCss&ownerId=$[skinBean.skinId]&themesId=$[themesId]&ownderType=skin&curpage=1" ><html:label label="{$jsp.portal.themes.css.list.title#}"/></html:a>
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewSkin&isModify=true&skinId=$[skinBean.skinId]&themesId=$[themesId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteSkin&checkSkinId=$[skinBean.skinId]&themesId=$[themesId]"/>
				</html:td>
				
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkSkinId" checkId="checkAll"/>	
		<com:page formId="skinForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




