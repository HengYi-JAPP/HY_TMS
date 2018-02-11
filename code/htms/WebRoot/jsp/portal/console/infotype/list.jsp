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
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true"/>	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="infoTypeForm" name="infoTypeForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listInfoType"/>
		<jsp:include page="../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.infotype.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.infotype.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="infoTypeNameSH" id="infoTypeNameSH"  maxlength="30" styleClass="input_text" />					
								
						<btn:search href="javascript:__vsubmit('infoTypeForm')"/>
						<btn:reset href="javascript:cleanForm('infoTypeForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/portal/console/infotype/add.jsp"/>
				<btn:delete href="javascript:batchDelete('infoTypeForm','checkInfoTypeId','','deleteInfoType');" />
				<btn:button name="{$jsp.portal.console.infotype.params.title#}" onclick="javascript:checkBeforeSubmit('infoTypeForm','checkInfoTypeId','','listInfoTypeParams',true);" typeId="addParamsForInfoType" value="{$jsp.portal.console.infotype.params.title#}" styleClass="button-self-style"/>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.INFOTYPE_LIST%>" bean="infoTypeBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkInfoTypeId" id="checkInfoTypeId" value="infoTypeBean.infoTypeId" />
				</html:td>
			
				<html:td  label="{$jsp.portal.console.infotype.name#}" >
				<html:a href="contoller.do?operation=viewInfoType&infoTypeId=$[infoTypeBean.infoTypeId]">
					<html:value value="infoTypeBean.infoTypeName"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.portal.console.infotype.desc#}"  property="infoTypeDesc" />
				<html:td label="{$jsp.common.status.validate#}" >
					<com:switchbox varValue="infoTypeBean.isValidate" talbeName="TB_CMS_INFOTYPE" idValue="infoTypeBean.infoTypeId" offValue="0" varName="isValidate" onValue="1"  idName="infoTypeId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="true"/>						
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewInfoType&isModify=true&infoTypeId=$[infoTypeBean.infoTypeId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteInfoType&checkInfoTypeId=$[infoTypeBean.infoTypeId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkInfoTypeId" checkId="checkAll"/>	
		<com:page formId="infoTypeForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




