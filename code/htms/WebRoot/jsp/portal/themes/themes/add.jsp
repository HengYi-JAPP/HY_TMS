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
<com:loader css="css/common/table-list.css"  validator="true"/>
<html:form id="themesForm" name="themesForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addThemes"/>
			<html:hidden id="themesId" name="themesId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.themes.add.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				
			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.themes.code#}"/></html:td>
					<html:td >
							<html:text name="themesCode" id="themesCode" styleClass="input-text"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.themes.name#}"/></html:td>
					<html:td >
							<html:text name="themesName" id="themesName" styleClass="input-text"/>													
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.themes.order#}"/></html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text" value="totalCount"/>													
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.themes.desc#}"/></html:td>
					<html:td >
							<html:textarea name="themesDesc" id="themesDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="1" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   isSave="false" />									
					</html:td>	
				</html:tr>
				<html:tr>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.themes.isdefault#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isDefault" varValue="1" idValue="isDefault" offValue="0" varName="isDefault" onValue="1"  idName="isDefault" offLabel="{$jsp.portal.themes.themes.isdefault.no#}" onLabel="{$jsp.portal.themes.themes.isdefault.yes#}"   isSave="false" /> 														
					</html:td>
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('themesForm')"/>		
						<btn:return href="contoller.do?operation=listThemes"/>								
				</html:td></html:tr>
			</html:table>	
			
		<com:validator formId="themesForm" showNormal="true" submitValidate="true">	
			<com:vElement id="themesCode"  types="isnull,number-letter-underline" event="onblur">
				<com:init size="36" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="themesName"  types="isnull" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="showOrder"  types="number" event="onblur">
				<com:init size="36" maxlength="10" initValue="10"></com:init>
			</com:vElement>
			<com:vElement id="themesDesc"  types="none" event="onblur">
				<com:init size="36" maxlength="300" ></com:init>
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
