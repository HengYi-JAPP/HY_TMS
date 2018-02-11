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
<com:loader css="css/common/table-list.css"  switchbox="true" validator="true"/>
<html:form id="infoTypeForm" name="infoTypeForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyInfoType"/>
			<html:hidden name="infoTypeId" id="infoTypeId"  value="infoTypeViewBean.infoTypeId"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.infotype.modify.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.name#}"/></html:td>
					<html:td >
							<html:text name="infoTypeName" id="infoTypeName" styleClass="input-text" value="infoTypeViewBean.infoTypeName"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.code#}"/></html:td>
					<html:td >						
						<html:text name="infoTypeCode" id="infoTypeCode" styleClass="input-text" value="infoTypeViewBean.infoTypeCode"/>										
					</html:td>				
					
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.listaddress#}"/></html:td>
					<html:td >						
						<html:text name="listLink" id="listLink" styleClass="input-text" value="infoTypeViewBean.listLink"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.indexaddress#}"/></html:td>
					<html:td >
						<html:text name="indexContentLink" id="indexContentLink" styleClass="input-text" value="infoTypeViewBean.indexContentLink"/>														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.viewaddress#}"/></html:td>
					<html:td >						
						<html:text name="detailContentLink" id="detailContentLink" styleClass="input-text" value="infoTypeViewBean.detailContentLink"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.manageraddress#}"/></html:td>
					<html:td >
						<html:text name="manageLink" id="manageLink" styleClass="input-text" value="infoTypeViewBean.manageLink"/>														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.importfile#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isImport" varValue="infoTypeViewBean.isImport" idValue="isImport" offValue="0" varName="isImport" onValue="1"  idName="isImport"  offLabel="{$jsp.portal.console.infotype.importfile.no#}" onLabel="{$jsp.portal.console.infotype.importfile.yes#}"   isSave="false" />									
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.deploy#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isDeploy" varValue="infoTypeViewBean.isDeploy" idValue="isDeploy" offValue="0" varName="isDeploy" onValue="1"  idName="isDeploy"  offLabel="{$jsp.portal.console.infotype.deploy.no#}" onLabel="{$jsp.portal.console.infotype.deploy.yes#}"    isSave="false" />									
					</html:td>	
				</html:tr>
		
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.desc#}"/></html:td>
					<html:td >
							<html:textarea name="infoTypeDesc" id="infoTypeDesc" styleClass="input-text" cols="40" rows="8" value="infoTypeViewBean.infoTypeDesc"></html:textarea>				
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="infoTypeViewBean.isValidate" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  isSave="false" />									
					</html:td>	
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('infoTypeForm')"/>
						<btn:return href="contoller.do?operation=listInfoType"/>							
				</html:td></html:tr>
			</html:table>	
			
		<com:validator formId="infoTypeForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="infoTypeName"  types="isnull" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="infoTypeCode" types="isnull,number-letter-underline" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="listLink" types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="indexContentLink" types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="detailContentLink" types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="manageLink" types="none" event="onblur">
				<com:init size="36" maxlength="60"></com:init>
			</com:vElement>
			<com:vElement id="infoTypeDesc" types="none" event="onblur">
				<com:init size="36" maxlength="300" ></com:init>
			</com:vElement>
		</com:validator>
	</html:form>
	
	

	</body>
</html>


