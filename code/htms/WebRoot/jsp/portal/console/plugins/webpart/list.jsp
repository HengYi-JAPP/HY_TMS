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

<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="webForm" name="webForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listWebPart"/>
		
		<jsp:include page="../../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.webpart.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.webpart.system#}"/></html:td>
				<html:td styleClass="condition_option">						
					<html:select id="sysIdSH" name="sysIdSH"  list="systemList" fistOption="{$jsp.common.select.firstoption#}" isCascade="true" isCascadeSource="true" isCascadeEdit="true" cascadeTarget="columnIdSH" >
						<html:option label="sysName" value="sysId" selected="sysIdSH"/>
					</html:select>										
				</html:td>	
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.webpart.column#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:select id="columnIdSH" name="columnIdSH"  list="columnList" isCascade="true" isCascadeEdit="true" cascadeSource="sysIdSH" cascadeValue="sysId">
						<html:option label="columnName" value="columnId" selected="columnIdSH"/>
					</html:select>	 														
				</html:td>	
				<html:td styleClass="condition_label"><html:label label="{$jsp.portal.console.plugin.webpart.infoname#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="webNameSH" id="webNameSH"  maxlength="30" styleClass="input_text" />					
								
						<btn:search href="javascript:__vsubmit('webForm')"/>
						<btn:reset href="javascript:cleanForm('webForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="contoller.do?operation=toAddWebPart"/>
				<btn:delete href="javascript:batchDelete('webForm','checkInfoId','','deleteWebPart');" />
				
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.WEB_PART_LIST%>" bean="infoBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkInfoId" id="checkInfoId" value="infoBean.infoId" />
				</html:td>
			
				<html:td  label="{$jsp.portal.console.plugin.webpart.infoname#}" >
				<html:a href="contoller.do?operation=toViewWebPart&infoId=$[infoBean.infoId]">
					<html:value value="infoBean.webName"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.portal.console.plugin.webpart.desc#}"  property="webDesc" />
				
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=toViewWebPart&isModify=true&infoId=$[infoBean.infoId]&infoTypeCode=webPart"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteWebPart&checkInfoId=$[infoBean.infoId]&infoTypeCode=webPart"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkInfoId" checkId="checkAll"/>	
		<com:page formId="webForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>




