<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
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
<com:loader css="css/common/table-list.css"/>
<html:form id="itemForm" name="itemForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addCssItem"/>
		<html:hidden id="themesId" name="themesId" value="themesId"/>
			<html:hidden id="ownerId" name="ownerId" value="ownerId"/>
		<html:hidden id="ownderType" name="ownderType" value="ownderType"/>
			<html:hidden id="cssId" name="cssId" value="cssId"/>
			<html:hidden id="itemId" name="itemId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.cssitem.add.title") %>' name='title'/>
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				
			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.code#}"/></html:td>
					<html:td >
							<html:text name="itemCode" id="itemCode" styleClass="input-text"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.cssitem.value#}"/></html:td>
					<html:td >
							<html:text name="itemValue" id="itemValue" styleClass="input-text"/>													
					</html:td>							
				</html:tr>
				<html:tr>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isValidate" varValue="1" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   isSave="false" /> 														
					</html:td>
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('itemForm')"/>		
						<btn:return href="contoller.do?operation=listCssItem&ownerId=$[ownerId]&cssId=$[cssId]&ownderType=$[ownderType]&themesId=$[themesId]"/>								
				</html:td></html:tr>
			</html:table>	
			
		<com:validator formId="itemForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="itemCode"  types="none" event="onblur">
				<com:init size="36" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="itemValue"  types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
		</com:validator>
	</html:form>


	</body>
</html>
