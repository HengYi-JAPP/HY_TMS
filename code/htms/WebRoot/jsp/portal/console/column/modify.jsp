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
<html:form id="columnForm" name="columnForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyColumn"/>
			<html:hidden name="columnId" id="columnId"  value="columnViewBean.columnId"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.column.modify.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="<%=PropKey.SYSTEM_LIST%>" >
							<html:option label="sysName" value="sysId" selected="columnViewBean.sysId"/>
						</html:select>									
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.parent#}"/></html:td>
					<html:td >						
						<html:text name="parentColumnId" id="parentColumnId" styleClass="input-text" value="columnViewBean.parentColumnId"/>									
					</html:td>				
					
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.name#}"/></html:td>
					<html:td >
							<html:text name="columnName" id="columnName" styleClass="input-text" value="columnViewBean.columnName"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.type#}"/></html:td>
					<html:td >						
						<html:text name="infoTypeId" id="infoTypeId" styleClass="input-text" value="columnViewBean.infoTypeId"/>									
					</html:td>	
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.code#}"/></html:td>
					<html:td >						
						<html:text name="columnCode" id="columnCode" styleClass="input-text" value="columnViewBean.columnCode"/>										
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.logo#}"/></html:td>
					<html:td >
						<com:simpleUpload fileId="logo" sortDir="themes/global/column-logo" viewPath="columnViewBean.logo" isImage="true"></com:simpleUpload>	 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.loadpath#}"/></html:td>
					<html:td >						
						<html:text name="columnLoader" id="columnLoader" styleClass="input-text" />										
					</html:td>				
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td >
																			
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.contenlink#}"/></html:td>
					<html:td >						
						<html:text name="contentLink" id="contentLink" styleClass="input-text" value="columnViewBean.contentLink"/>										
					</html:td>	
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td > 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.contenwidth#}"/></html:td>
					<html:td >						
						<html:text name="contentWidth" id="contentWidth" styleClass="input-text" value="columnViewBean.contentWidth"/>										
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.contentheight#}"/></html:td>
					<html:td >
						<html:text name="contentHeight" id="contentHeight" styleClass="input-text"  value="columnViewBean.contentHeight"/>	 														
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.ismore#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isMore" varValue="columnViewBean.isMore" idValue="isMore" offValue="0" varName="isMore" onValue="1"  idName="isMore"  offLabel="{$jsp.portal.console.column.personalize.no#}" onLabel="{$jsp.portal.console.column.personalize.yes#}"   isSave="false" />								
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.morelink#}"/></html:td>
					<html:td >
						<html:text name="moreLink" id="moreLink" styleClass="input-text" value="columnViewBean.moreLink"/>	 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.viewLink#}"/></html:td>
					<html:td >						
						<html:text name="viewLink" id="viewLink" styleClass="input-text" size="36"  value="columnViewBean.viewLink"/>										
					</html:td>				
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td ></html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="columnViewBean.isValidate" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  isSave="false" />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.personalize#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isPersonalize" varValue="columnViewBean.isPersonalize" idValue="isPersonalize" offValue="0" varName="isPersonalize" onValue="1"  idName="isPersonalize"  offLabel="{$jsp.portal.console.column.personalize.no#}" onLabel="{$jsp.portal.console.column.personalize.yes#}"   isSave="false" /> 														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.load#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isAsyncLoad" varValue="columnViewBean.isAsyncLoad" idValue="isAsyncLoad" offValue="0" varName="isAsyncLoad" onValue="1"  idName="isAsyncLoad"  offLabel="{$jsp.portal.console.column.load.async#}" onLabel="{$jsp.portal.console.column.load.sync#}"   isSave="false" />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.defload#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isDefaultLoad" varValue="columnViewBean.isDefaultLoad" idValue="isDefaultLoad" offValue="0" varName="isDefaultLoad" onValue="1"  idName="isDefaultLoad"  offLabel="{$jsp.portal.console.column.defload.no#}" onLabel="{$jsp.portal.console.column.defload.yes#}"   isSave="false" /> 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.index.show.num#}"/></html:td>
					<html:td >						
						<html:text name="indexShowNum" id="indexShowNum" styleClass="input-text" value="columnViewBean.indexShowNum"/>										
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.list.show.num#}"/></html:td>
					<html:td >
						<html:text name="listShowNum" id="listShowNum" styleClass="input-text" value="columnViewBean.listShowNum"/>	 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.index.title.num#}"/></html:td>
					<html:td >						
						<html:text name="indexShowLen" id="indexShowLen" styleClass="input-text" value="columnViewBean.indexShowLen"/>										
					</html:td>				
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td >	 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.desc#}"/></html:td>
					<html:td colspan="3">
							<html:textarea name="columnDesc" id="columnDesc" styleClass="input-text" cols="40" rows="8" value="columnViewBean.columnDesc"></html:textarea>				
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.justcontent#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="justContent" varValue="columnViewBean.justContent" idValue="justContent" offValue="0" varName="justContent" onValue="1"  idName="justContent"  offLabel="{$jsp.portal.console.column.personalize.no#}" onLabel="{$jsp.portal.console.column.personalize.yes#}"   isSave="false" />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><!--html:label label="{$jsp.portal.console.column.defload#}"/--></html:td>
					<html:td >
						<!--com:switchbox boxId="isDefaultLoad" varValue="1" idValue="isDefaultLoad" offValue="0" varName="isDefaultLoad" onValue="1"  idName="isDefaultLoad"  offLabel="{$jsp.portal.console.column.defload.no#}" onLabel="{$jsp.portal.console.column.defload.yes#}"   isSave="false" /--> 														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.skin#}"/></html:td>
					<html:td >						
						<html:select id="columnSkin" name="columnSkin"  list="listColumnSkin"  fistOption="{$jsp.portal.console.column.select.firstoption#}" fistOptionValue="">
							<html:option label="skinName" value="skinId"  selected="columnViewBean.columnSkin"/>
						</html:select>									
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.index.skin#}"/></html:td>
					<html:td >						
						<html:select id="indexColumnSkin" name="indexColumnSkin"  list="listIndexColumnSkin"  fistOption="{$jsp.portal.console.column.select.firstoption#}" fistOptionValue="">
							<html:option label="skinName" value="skinId"  selected="columnViewBean.indexColumnSkin"/>
						</html:select>								
					</html:td>				
					
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.view.skin#}"/></html:td>
					<html:td >						
						<html:select id="viewColumnSkin" name="viewColumnSkin"  list="listViewColumnSkin"  fistOption="{$jsp.portal.console.column.select.firstoption#}" fistOptionValue="">
							<html:option label="skinName" value="skinId"  selected="columnViewBean.viewColumnSkin"/>
						</html:select>									
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.list.skin#}"/></html:td>
					<html:td >						
						<html:select id="listColumnSkin" name="listColumnSkin"  list="listListColumnSkin"  fistOption="{$jsp.portal.console.column.select.firstoption#}" fistOptionValue="">
							<html:option label="skinName" value="skinId"  selected="columnViewBean.listColumnSkin"/>
						</html:select>										
					</html:td>				
					
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('columnForm')"/>
						<btn:return href="contoller.do?operation=listColumn"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="columnForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="columnCode"  types="isnull,number-letter-underline" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="channelName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="parentColumnId"  types="none" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="columnLoader"  types="none" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="logo"  types="none" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="contentLink"  types="none" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="moreLink"  types="none" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="indexShowNum"  types="none" event="onblur">
			<com:init size="36" maxlength="10"></com:init>
		</com:vElement>
		<com:vElement id="listShowNum"  types="none" event="onblur">
			<com:init size="36" maxlength="10"></com:init>
		</com:vElement>
		<com:vElement id="indexShowLen"  types="none" event="onblur">
			<com:init size="36" maxlength="10"></com:init>
		</com:vElement>
		<com:vElement id="columnDesc"  types="none" event="onblur">
			<com:init size="36" maxlength="300"></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
<com:loader   simpleUpload="true"/>	
	

	</body>
</html>


