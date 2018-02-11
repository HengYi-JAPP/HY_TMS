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
<com:loader css="css/common/table-list.css" switchbox="true"/>
<html:form id="paramsForm" name="paramsForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyThemesParams"/>
			<html:hidden id="themesId" name="themesId" value="themesId"/>
			<html:hidden id="paramsId" name="paramsId" value="paramsViewBean.paramsId"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.params.modify.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.params.type#}"/></html:td>
					<html:td >
						<html:select name="paramsType" id="paramsType" >
							<html:option label="{$jsp.portal.themes.params.type.text#}" value="texttype" selected="paramsViewBean.paramsType"/>
							<html:option label="{$jsp.portal.themes.params.type.image#}" value="imagetype" selected="paramsViewBean.paramsType"/>
							<html:option label="{$jsp.portal.themes.params.type.color#}" value="colortype" selected="paramsViewBean.paramsType"/>
							<html:option label="{$jsp.portal.themes.params.type.font#}" value="fonttype" selected="paramsViewBean.paramsType"/>
						</html:select>	
					</html:td>
				</html:tr>
			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.params.code#}"/></html:td>
					<html:td >
							<html:text name="paramsCode" id="paramsCode" styleClass="input-text" value="paramsViewBean.paramsCode"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.params.name#}"/></html:td>
					<html:td >
							<html:text name="paramsName" id="paramsName" styleClass="input-text" value="paramsViewBean.paramsName"/>													
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.params.order#}"/></html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text" value="paramsViewBean.showOrder"/>													
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.params.desc#}"/></html:td>
					<html:td >
							<html:textarea name="paramsDesc" id="paramsDesc" styleClass="input-text" cols="40" rows="8" value="paramsViewBean.paramsDesc"></html:textarea>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="paramsViewBean.isValidate" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  isSave="false" />									
					</html:td>	
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('paramsForm')"/>		
						<btn:return href="contoller.do?operation=listThemesParams&themesId=$[themesId]"/>								
				</html:td></html:tr>
			</html:table>	
			
		<com:validator formId="paramsForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="paramsCode"  types="none" event="onblur">
				<com:init size="36" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="paramsName"  types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="showOrder"  types="number" event="onblur">
				<com:init size="36" maxlength="10"></com:init>
			</com:vElement>
			<com:vElement id="paramsDesc"  types="none" event="onblur">
				<com:init size="36" maxlength="300" ></com:init>
			</com:vElement>
		</com:validator>

	</html:form>


	</body>
</html>
<com:loader   simpleUpload="true"/>