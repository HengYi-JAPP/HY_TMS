<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

 %>
 
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css" validator="true"/>
<html:form id="dictionaryForm" name="dictionaryForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addDictionary"/>
			
			<html:hidden name="isValidate" id="isValidate" value="1"/> 
			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.common.dictionary.add.title") %>' name='title'/>		
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.type#}"/></html:td>
					<html:td >						
					<html:select id="dicType" name="dicType"  list="<%=PropKey.DICTIONARY_TYPE_LIST%>">
					<html:option label="typeName" value="typeId" />
					</html:select>	
						 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.code#}"/></html:td>
					<html:td >	
						<html:text name="dicCode" id="dicCode" styleClass="input-text"/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.name#}"/></html:td>
					<html:td >
							<html:text name="dicName" id="dicName" styleClass="input-text"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.desc#}"/></html:td>
					<html:td>
							<html:textarea name="dicDesc" id="dicDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.order#}"/></html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text"/>													
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('dictionaryForm')"/>
						<btn:return href="contoller.do?operation=listDictionary"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="dictionaryForm" showNormal="true" submitValidate="true" >
		<com:vElement id="dicCode"  types="isnull,number-letter-underline" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="dicName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="dicType"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="showOrder"  types="number" event="onblur">
			<com:init size="10" maxlength="10" initValue="10"></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
	
	

	</body>
</html>
