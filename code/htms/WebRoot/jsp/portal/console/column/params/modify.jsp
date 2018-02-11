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
<com:loader css="css/common/table-list.css"  switchbox="true"  ajax="true" validator="true"/>
<html:form id="paramsForm" name="paramsForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyColumnParams"/>
			
			<html:hidden id="checkColumnId" name="checkColumnId" value="checkColumnId"/>
			<html:hidden name="paramsId" id="paramsId"  value="columnParamsViewBean.paramsId"/>
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.column.params.modify.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.params.var#}"/></html:td>
					<html:td >						
						<html:text name="paramsVar" id="paramsVar" styleClass="input-text" value="columnParamsViewBean.paramsVar"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.params.name#}"/></html:td>
					<html:td >						
						<html:text name="paramsName" id="paramsName" styleClass="input-text" value="columnParamsViewBean.paramsName"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.params.value#}"/></html:td>
					<html:td >						
						<html:text name="paramsValue" id="paramsValue" styleClass="input-text" value="columnParamsViewBean.paramsValue"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.params.defvalue#}"/></html:td>
					<html:td >						
						<html:text name="paramsDefValue" id="paramsDefValue" styleClass="input-text" value="columnParamsViewBean.paramsDefValue"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.params.desc#}"/></html:td>
					<html:td >	
						<html:textarea name="paramsDesc" id="paramsDesc" styleClass="input-text" cols="40" rows="8" value="columnParamsViewBean.paramsDesc"></html:textarea>								
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}" /></html:td>
					<html:td >	
						<com:switchbox varValue="columnParamsViewBean.isValidate" talbeName="TB_CMS_INFOTYPE_PARAMS" idValue="columnParamsViewBean.paramsId" offValue="0" varName="isValidate" onValue="1"  idName="paramsId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="true"/>								
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


