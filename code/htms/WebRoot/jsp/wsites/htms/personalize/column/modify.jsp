<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@page import="tools.tool"%>
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
<com:loader css="css/common/table-list.css"  switchbox="true" validator="true"  fckeditor="true"/>
<html:form id="columnForm" name="columnForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modify4UserDefineColumn"/>
			<html:hidden id="columnId"  name="columnId" value="columnViewBean.columnId" />
			<html:hidden id="layoutId" name="layoutId" value="layoutId"/>
			<html:hidden id="channelId"  name="channelId" value="channelId" />	
			<html:hidden id="sysId"  name="sysId" value="sysId" />
			<html:hidden id="currentSysCode"  name="currentSysCode" value="currentSysCode" />
			<html:hidden   id="isDirect" name="isDirect" value="isDirect" />
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tool.getLocal("jsp.portal.website.personalize.column.modifydefine") %>' name="title"/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
								
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.name#}" /></html:td>
					<html:td >
							<html:text name="columnName" id="columnName" styleClass="input-text" size="36"  value="columnViewBean.columnName"/>																			
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.logo#}" /></html:td>
					<html:td >
						<com:simpleUpload fileId="logo" isImage="true" viewPath="columnViewBean.logo" sortDir=""></com:simpleUpload>	 														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.contenlink#}" /></html:td>
					<html:td >						
						<html:text name="contentLink" id="contentLink" styleClass="input-text" size="36"  value="columnViewBean.contentLink"/>										
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.morelink#}" /></html:td>
					<html:td >
						<html:text name="moreLink" id="moreLink" styleClass="input-text" size="36"  value="columnViewBean.moreLink"/>	 														
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.contenwidth#}" /></html:td>
					<html:td >						
						<html:text name="contentWidth" id="contentWidth" styleClass="input-text" size="36"  value="columnViewBean.contentWidth"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.contentheight#}" /></html:td>
					<html:td >
						<html:text name="contentHeight" id="contentHeight" styleClass="input-text" size="36"  value="columnViewBean.contentHeight"/>																		
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
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.desc#}" /></html:td>
					<html:td colspan="3">
							<html:textarea name="columnDesc" id="columnDesc" styleClass="input-text" cols="100" rows="3" value="columnViewBean.columnDesc"></html:textarea>				
					</html:td>
				</html:tr>		
				<html:tr>
					<html:td styleClass="edit-talbe-label"  colspan="4" style="text-align:left;">						
						<a id="editorSwitchButton" href="javascript:void(0);" onclick="showEditior();"><html:label label="[{$jsp.portal.website.personalize.column.showeditor#}]" /></a>										
					</html:td>	
				</html:tr>	
			</html:table>
			<html:table  id="contentEditor" style="display:none;"   styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
			<html:tr >
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.website.personalize.column.content#}" /></html:td>
					<html:td colspan="3">
					<jsp:include page="../../../../common/impart/ckeditor.jsp">
						<jsp:param value="columnContent" name="name"/>
						<jsp:param value="columnViewBean.columnContent" name="value"/>
					</jsp:include>
					</html:td>
				</html:tr>	
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('columnForm')"/>
						<btn:return href="contoller.do?operation=loadColumns4UserLayoutDesign&currentSysCode=$[currentSysCode]&sysId=$[sysId]&channelId=$[channelId]&layoutId=$[layoutId]&isDirect=$[isDirect]"/>					
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="columnForm" showNormal="true" >	
		<com:vElement id="columnName"  types="isnull" event="onblur"/>
	</com:validator>
	</html:form>
	
	

	</body>
</html>
<com:loader   simpleUpload="true"/>
<script type="text/javascript">
	function showEditior(){

		var ceDisplay=document.getElementById('contentEditor').style.display;
		//alert('ceDisplay='+ceDisplay);
		if(ceDisplay=='block'){
			document.getElementById('contentEditor').style.display='none';
			document.getElementById('editorSwitchButton').innerHTML = '<html:label label="{$jsp.portal.website.personalize.column.showeditor#}" />';
		}else{ 
			document.getElementById('contentEditor').style.display='block';
			document.getElementById('editorSwitchButton').innerHTML = '<html:label label="{$jsp.portal.website.personalize.column.hiddeeditor#}" />';
		}
	}
</script>
