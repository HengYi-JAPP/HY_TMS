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
<com:loader css="css/common/table-list.css" switchbox="true" validator="true"/>
<html:form id="skinForm" name="skinForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addSkin"/>
		<html:hidden id="themesId" name="themesId" value="themesId"/>
			<html:hidden id="skinId" name="skinId" value="<%=tools.tool.getRandomUUID(64) %>"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.skin.add.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				
			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.skin.code#}"/></html:td>
					<html:td >
							<html:text name="skinCode" id="skinCode" styleClass="input-text" />													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.skin.name#}"/></html:td>
					<html:td >
							<html:text name="skinName" id="skinName" styleClass="input-text" />													
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.skin.order#}"/></html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text" value="totalCount"/>													
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.skin.desc#}"/></html:td>
					<html:td >
							<html:textarea name="skinDesc" id="skinDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="1" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate" offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  isSave="false" />									
					</html:td>	
				</html:tr>
				<html:tr>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.skin.isdefault#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isDefault" varValue="1" idValue="isDefault" offValue="0" varName="isDefault" onValue="1"  idName="isDefault"  offLabel="{$jsp.common.status.no#}" onLabel="{$jsp.common.status.yes#}"   isSave="false" /> 														
					</html:td>
				</html:tr>
				<html:tr>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.skin.iscolumnskin#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isColumnSkin" varValue="0" idValue="isColumnSkin" offValue="0" varName="isColumnSkin" onValue="1"  idName="isColumnSkin"  offLabel="{$jsp.common.status.no#}" onLabel="{$jsp.common.status.yes#}"   isSave="false" /> 														
					</html:td>
				</html:tr>
				<html:tr>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.skin.isindexskin#}"/></html:td>
					<html:td >
						<com:switchbox boxId="indexColumnSkin" varValue="0" idValue="indexColumnSkin" offValue="0" varName="indexColumnSkin" onValue="1"  idName="indexColumnSkin"  offLabel="{$jsp.common.status.no#}" onLabel="{$jsp.common.status.yes#}"  isSave="false" /> 														
					</html:td>
				</html:tr>
				<html:tr>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.skin.isviewskin#}"/></html:td>
					<html:td >
						<com:switchbox boxId="viewColumnSkin" varValue="0" idValue="viewColumnSkin" offValue="0" varName="viewColumnSkin" onValue="1"  idName="viewColumnSkin"  offLabel="{$jsp.common.status.no#}" onLabel="{$jsp.common.status.yes#}"  isSave="false" /> 														
					</html:td>
				</html:tr>
				<html:tr>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.skin.islistskin#}"/></html:td>
					<html:td >
						<com:switchbox boxId="listColumnSkin" varValue="0" idValue="listColumnSkin" offValue="0" varName="listColumnSkin" onValue="1"  idName="listColumnSkin"  offLabel="{$jsp.common.status.no#}" onLabel="{$jsp.common.status.yes#}"  isSave="false" /> 														
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('skinForm')"/>		
						<btn:return href="contoller.do?operation=listSkin&themesId=$[themesId]"/>								
				</html:td></html:tr>
			</html:table>	
			
		<com:validator formId="skinForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="skinCode"  types="isnull,number-letter-underline" event="onblur">
				<com:init size="36" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="skinName"  types="isnull" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="showOrder"  types="number" event="onblur">
				<com:init size="36" maxlength="10" initValue="10"></com:init>
			</com:vElement>
			<com:vElement id="skinDesc"  types="isnull" event="onblur">
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
