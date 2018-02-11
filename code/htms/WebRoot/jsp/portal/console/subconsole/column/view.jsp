<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

 %>
<cext:priv code="_subsystem_column_manage_view">
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"  switchbox="true" validator="true"/>
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.column.view.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.code#}"/></html:td>
					<html:td >				
						<html:value  value="columnViewBean.columnCode"/>										
					</html:td>		
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.parent#}"/></html:td>
					<html:td >						
						<html:value  value="columnViewBean.parentColumnId"/>									
					</html:td>				
					
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.name#}"/></html:td>
					<html:td >
							<html:value  value="columnViewBean.columnName"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.type#}"/></html:td>
					<html:td >						
						<html:value  value="columnViewBean.infoTypeId"/>									
					</html:td>	
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.loadpath#}"/></html:td>
					<html:td >						
						<html:value  value="columnViewBean.columnLoader"/>										
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.logo#}"/></html:td>
					<html:td >
						<html:value  value="columnViewBean.logo"/>	 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.contenlink#}"/></html:td>
					<html:td >						
						<html:value value="columnViewBean.contentLink"/>											
					</html:td>	
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td >	 														
					</html:td>	
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.contenwidth#}"/></html:td>
					<html:td >						
						<html:value value="columnViewBean.contentWidth"/>											
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.contentheight#}"/></html:td>
					<html:td >
						<html:value value="columnViewBean.contentHeight"/>		 														
					</html:td>	
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.ismore#}"/></html:td>
					<html:td >	
						<com:switchbox boxId="isMore" varValue="columnViewBean.isMore" idValue="isMore" offValue="0" varName="isMore" onValue="1"  idName="isMore"  offLabel="{$jsp.portal.console.column.personalize.no#}" onLabel="{$jsp.portal.console.column.personalize.yes#}"   isSave="false" hideBox="true"/>											
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.morelink#}"/></html:td>
					<html:td >
						<html:value value="columnViewBean.moreLink"/>		 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.viewLink#}"/></html:td>
					<html:td >	
						<html:value value="columnViewBean.viewLink"/>											
					</html:td>				
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td >		 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.order#}"/></html:td>
					<html:td >					
						<html:value value="columnViewBean.defaultOrder"/>										
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.defaultshow#}"/></html:td>
					<html:td >
						<com:switchbox boxId="defaultShow" varValue="columnViewBean.defaultShow" idValue="defaultShow" offValue="0" varName="defaultShow" onValue="1"  idName="defaultShow"  offLabel="{$jsp.portal.console.column.personalize.no#}" onLabel="{$jsp.portal.console.column.personalize.yes#}"   isSave="false" hideBox="true"/> 														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.defaultopen#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="defaultOpen" varValue="columnViewBean.defaultOpen" idValue="defaultOpen" offValue="0" varName="defaultOpen" onValue="1"  idName="defaultOpen"  offLabel="{$jsp.portal.console.column.personalize.no#}" onLabel="{$jsp.portal.console.column.personalize.yes#}"   isSave="false" hideBox="true"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.defaultmove#}"/></html:td>
					<html:td >
						<com:switchbox boxId="defaultMove" varValue="columnViewBean.defaultMove" idValue="defaultMove" offValue="0" varName="defaultMove" onValue="1"  idName="defaultMove"  offLabel="{$jsp.portal.console.column.personalize.no#}" onLabel="{$jsp.portal.console.column.personalize.yes#}"   isSave="false" hideBox="true"/> 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox varValue="columnViewBean.isValidate" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  hideBox="true" />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.personalize#}"/></html:td>
					<html:td >
						<com:switchbox varValue="columnViewBean.isPersonalize" idValue="isPersonalize" offValue="0" varName="isPersonalize" onValue="1"  idName="isPersonalize"  offLabel="{$jsp.portal.console.column.personalize.no#}" onLabel="{$jsp.portal.console.column.personalize.yes#}"   hideBox="true"/> 														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.load#}"/></html:td>
					<html:td >						
						<com:switchbox varValue="columnViewBean.isAsyncLoad" idValue="isAsyncLoad" offValue="0" varName="isAsyncLoad" onValue="1"  idName="isAsyncLoad"  offLabel="{$jsp.portal.console.column.load.async#}" onLabel="{$jsp.portal.console.column.load.sync#}" hideBox="true"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.defload#}"/></html:td>
					<html:td >
						<com:switchbox varValue="columnViewBean.isDefaultLoad" idValue="isDefaultLoad" offValue="0" varName="isDefaultLoad" onValue="1"  idName="isDefaultLoad"  offLabel="{$jsp.portal.console.column.defload.no#}" onLabel="{$jsp.portal.console.column.defload.yes#}"   hideBox="true" /> 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.index.show.num#}"/></html:td>
					<html:td >						
						<html:value value="columnViewBean.indexShowNum"/>										
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.list.show.num#}"/></html:td>
					<html:td >
						<html:value  value="columnViewBean.listShowNum"/>	 														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.index.title.num#}"/></html:td>
					<html:td >						
						<html:value  value="columnViewBean.indexShowLen"/>										
					</html:td>				
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td >	 														
					</html:td>
				</html:tr>
					<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.desc#}"/></html:td>
					<html:td colspan="3">
							<html:value value="columnViewBean.columnDesc" />				
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.skin#}"/></html:td>
					<html:td >						
						<html:select id="columnSkin" name="columnSkin"  list="listColumnSkin" disabled="true" fistOption="{$jsp.portal.console.column.select.firstoption#}" fistOptionValue="">
							<html:option label="skinName" value="skinId"  selected="columnViewBean.columnSkin"/>
						</html:select>									
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.index.skin#}"/></html:td>
					<html:td >						
						<html:select id="indexColumnSkin" name="indexColumnSkin"  list="listIndexColumnSkin"  disabled="true" fistOption="{$jsp.portal.console.column.select.firstoption#}" fistOptionValue="">
							<html:option label="skinName" value="skinId"  selected="columnViewBean.indexColumnSkin"/>
						</html:select>								
					</html:td>				
					
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.view.skin#}"/></html:td>
					<html:td >						
						<html:select id="viewColumnSkin" name="viewColumnSkin"  list="listViewColumnSkin"  disabled="true" fistOption="{$jsp.portal.console.column.select.firstoption#}" fistOptionValue="">
							<html:option label="skinName" value="skinId"  selected="columnViewBean.viewColumnSkin"/>
						</html:select>									
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.list.skin#}"/></html:td>
					<html:td >						
						<html:select id="listColumnSkin" name="listColumnSkin"  list="listListColumnSkin"  disabled="true" fistOption="{$jsp.portal.console.column.select.firstoption#}" fistOptionValue="">
							<html:option label="skinName" value="skinId"  selected="columnViewBean.listColumnSkin"/>
						</html:select>										
					</html:td>				
					
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
					<cext:priv code="_subsystem_column_manage_view_return">
						<btn:return href="contoller.do?operation=listSubSystemColumn&sysId=$[sysId]"/>
					</cext:priv>							
				</html:td></html:tr>
			</html:table>	
	

	</body>
</html>
</cext:priv>


