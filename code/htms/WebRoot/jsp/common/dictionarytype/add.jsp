<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<html:form id="dictionaryTypeForm" name="dictionaryTypeForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addDictionaryType"/>
			
			<html:hidden name="isValidate" id="isValidate" value="1"/> 
			<jsp:include page="../../common/impart/table-banner.jsp">	
				<jsp:param value='<%=tools.tool.getLocal("jsp.common.dictionary.type.add.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.type.code#}"/></html:td>
					<html:td >						
						<html:text name="typeCode" id="typeCode" styleClass="input-text" vTypes="isnull,number-letter-underline" vFireEvent="onblur"/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.type.name#}"/></html:td>
					<html:td >
							<html:text name="typeName" id="typeName" styleClass="input-text"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.dictionary.type.desc#}"/></html:td>
					<html:td>
							<html:textarea name="typeDesc" id="typeDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>				
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('dictionaryTypeForm');"/>
						<btn:return href="{$basePath}contoller.do?operation=listDictionaryType"/>							
				</html:td></html:tr>
			</html:table>	
	</html:form>
	<com:validator formId="dictionaryTypeForm" showNormal="true" submitValidate="true">
		<com:vElement id="typeName"  isNull="true">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="typeCode"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="typeDesc"  types="isnull" event="onblur">
			<com:init size="36" maxlength="300"></com:init>
		</com:vElement>
	</com:validator>
	</body>
</html>
