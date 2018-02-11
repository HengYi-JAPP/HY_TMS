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
<com:loader css="css/common/table-list.css" validator="true"/>
<html:form id="cssForm" name="cssForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addCss"/>
			<html:hidden id="cssId" name="cssId" value="<%=tools.tool.getRandomUUID(64) %>"/>
		<html:hidden id="themesId" name="themesId" value="themesId"/>
			<html:hidden id="ownerId" name="ownerId" value="ownerId"/>
		<html:hidden id="ownderType" name="ownderType" value="ownderType"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.css.add.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				
			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.css.code#}"/></html:td>
					<html:td >
							<html:text name="cssCode" id="cssCode" styleClass="input-text"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.css.name#}"/></html:td>
					<html:td >
							<html:text name="cssName" id="cssName" styleClass="input-text"/>													
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.css.order#}"/></html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text"  value="totalCount"/>													
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.css.content#}"/></html:td>
					<html:td >
							<html:textarea name="cssContent" id="cssContent" styleClass="input-text" cols="40" rows="8"></html:textarea>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.css.desc#}"/></html:td>
					<html:td >
							<html:textarea name="cssDesc" id="cssDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="1" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate" offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  isSave="false" />									
					</html:td>	
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('cssForm')"/>		
						<btn:return href="contoller.do?operation=listCss&ownerId=$[ownerId]&ownderType=$[ownderType]&themesId=$[themesId]"/>								
				</html:td></html:tr>
			</html:table>	
			
		<com:validator formId="cssForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="cssCode"  types="none" event="onblur">
				<com:init size="36" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="cssName"  types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="showOrder"  types="number" event="onblur">
				<com:init size="36" maxlength="10" initValue="10"></com:init>
			</com:vElement>
			<com:vElement id="cssContent"  types="none" event="onblur">
				<com:init size="36" maxlength="300" ></com:init>
			</com:vElement>
			<com:vElement id="cssDesc"  types="none" event="onblur">
				<com:init size="36" maxlength="300"></com:init>
			</com:vElement>
		</com:validator>
	</html:form>
<script type="text/javascript">
var showOrder=document.getElementById("showOrder");
if(showOrder){
	var order = parseInt(showOrder.value);
	showOrder.value = order+1;
}
</script>

	</body>
</html>
