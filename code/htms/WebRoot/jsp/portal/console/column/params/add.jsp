<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
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
<com:loader css="css/common/table-list.css"  switchbox="true" validator="true"/>
<html:form id="paramsForm" name="paramsForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addColumnParams"/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<html:hidden id="checkColumnId" name="checkColumnId" value="checkColumnId"/>
			<html:hidden name="paramsId" id="paramsId"  value="<%=tools.tool.getRandomUUID(64) %>"/>
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.column.params.add.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.params.var#}"/></html:td>
					<html:td >						
						<html:text name="paramsVar" id="paramsVar" styleClass="input-text"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.params.name#}"/></html:td>
					<html:td >						
						<html:text name="paramsName" id="paramsName" styleClass="input-text"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.params.value#}"/></html:td>
					<html:td >						
						<html:text name="paramsValue" id="paramsValue" styleClass="input-text"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.params.defvalue#}"/></html:td>
					<html:td >						
						<html:text name="paramsDefValue" id="paramsDefValue" styleClass="input-text"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.params.desc#}"/></html:td>
					<html:td >	
						<html:textarea name="paramsDesc" id="paramsDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>								
					</html:td>
				</html:tr>
				
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('paramsForm')"/>
						<btn:return href="contoller.do?operation=listColumnParams&checkColumnId=$[checkColumnId]"/>							
				</html:td></html:tr>
			</html:table>	
			
		<com:validator formId="paramsForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="paramsName" types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="paramsVar" types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="paramsValue" types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="paramsDefValue" types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="paramsDesc" types="none" event="onblur">
				<com:init size="36" maxlength="300" ></com:init>
			</com:vElement>
		</com:validator>
	</html:form>
	
	

	</body>
</html>


