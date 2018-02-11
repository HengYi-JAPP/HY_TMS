<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.List,com.mobilecn.utils.PageCtl"%>
<%@ page import="com.mobilecn.common.dictionarytype.DictionaryTypeBean"%>
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
		<title>字典类型管理</title>
		
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css"/>
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />	
	</head>
<body>
	<!-- banner 页面导航条 -->
	<html:form id="dictionaryTypeForm" name="dictionaryTypeForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listDictionaryType"/>
		<html:hidden id="userId" name="userId"/>
		<jsp:include page="../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.common.datasurce.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.common.dictionary.type.code#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="typeCodeSH" id="typeCodeSH"  maxlength="30" styleClass="input_text" />						
				</html:td>
				<html:td styleClass="condition_label"><html:label label="{$jsp.common.dictionary.type.name#}"/></html:td>
				<html:td styleClass="condition_option">
						<html:text name="typeNameSH" id="typeNameSH" maxlength="30" styleClass="input_text" />
						<btn:search href="javascript:__vsubmit('dictionaryTypeForm')"/>
						<btn:reset href="javascript:cleanForm('dictionaryTypeForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/common/dictionarytype/add.jsp"/>
				<btn:delete href="javascript:batchDelete('dictionaryTypeForm','checkTypeId','','deleteDictionaryType')"/>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.DICTIONARY_TYPE_LIST%>" bean="typeBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td id="selectAll" label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}">
					<html:checkbox name="checkTypeId" id="checkTypeId" value="typeBean.typeId" />
				</html:td>
				<html:td  label="{$jsp.common.dictionary.type.code#}"  property="typeCode" />
				<html:td  label="{$jsp.common.dictionary.type.name#}" >
				<html:a href="contoller.do?operation=viewDictionaryType&typeId=$[typeBean.typeId]">
				<html:value value="typeBean.typeName"/>
				</html:a>
				
				</html:td>
			
				<html:td label="{$jsp.common.dictionary.type.desc#}"  property="typeDesc"/>
				<html:td label="{$jsp.common.status.validate#}" >
					<com:switchbox varValue="typeBean.isValidate" talbeName="TB_DIC_TYPE" idValue="typeBean.typeId" offValue="0" varName="isValidate" onValue="1"  idName="typeId" offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do"/>						
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
				<btn:modify href="contoller.do?operation=viewDictionaryType&isModify=true&typeId=$[typeBean.typeId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<btn:delete href="contoller.do?operation=deleteDictionaryType&checkTypeId=$[typeBean.typeId]"/>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkTypeId" checkId="checkAll"/>
		<!-- 注意要在表单之内才能提交 -->	
		<com:page formId="dictionaryTypeForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
			
	
</body>
</html>
	
<html:clean scope="request" />
