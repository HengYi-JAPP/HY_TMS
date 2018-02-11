<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
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
	<html:form id="dictionaryForm" name="dictionaryForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listDictionary"/>
		<jsp:include page="../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.common.dictionary.list.title") %>' name='title'/>	
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.common.dictionary.code#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="dicCodeSH" id="dicCodeSH"  maxlength="30" styleClass="input_text" />						
				</html:td>
				<html:td styleClass="condition_label"><html:label label="{$jsp.common.dictionary.name#}"/></html:td>
				<html:td styleClass="condition_option">
						<html:text name="dicNameSH" id="dicNameSH" maxlength="30" styleClass="input_text" />
						<btn:search href="javascript:__vsubmit('dictionaryForm')"/>
						<btn:reset href="javascript:cleanForm('dictionaryForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="contoller.do?operation=toAddDictionary"/>
				<btn:delete href="javascript:batchDelete('dictionaryForm','checkDicId','','deleteDictionary');" />
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.DICTIONARY_LIST%>" bean="dicBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td id="selectAll" label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}">
					<html:checkbox name="checkDicId" id="checkDicId" value="dicBean.dicId" />
				</html:td>
				<html:td  label="{$jsp.common.dictionary.type#}"  property="typeName" />
				<html:td  label="{$jsp.common.dictionary.code#}"  property="dicCode" />
				<html:td  label="{$jsp.common.dictionary.name#}" >
				<html:a href="contoller.do?operation=viewDictionary&dicId=$[dicBean.dicId]">
				<html:value value="dicBean.dicName"/>
				</html:a>
				
				</html:td>
			
				<html:td label="{$jsp.common.dictionary.desc#}"  property="dicDesc"/>
				<html:td label="{$jsp.common.status.validate#}" >
					<com:switchbox varValue="dicBean.isValidate" talbeName="TB_DICTIONARY" idValue="dicBean.dicId" offValue="0" varName="isValidate" onValue="1"  idName="dicId" offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do"/>						
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewDictionary&isModify=true&dicId=$[dicBean.dicId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete  href="contoller.do?operation=deleteDictionary&checkDicId=$[dicBean.dicId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkDicId" checkId="checkAll"/>	
		<com:page formId="dictionaryForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>

