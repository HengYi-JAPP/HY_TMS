<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../../common/impart/taglib.jsp"%>
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
<com:loader css="css/common/table-list.css"  switchbox="true" validator="true" simplendar="true"  ajax="true"/>

<script type="text/javascript" src="<%=basePath %>ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=basePath %>ckfinder/ckfinder.js"></script>
<html:form id="piclinkForm" name="piclinkForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyPicLink"/>
			<html:hidden name="linkId" id="linkId"  value="picLinkViewBean.linkId"/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.piclinks.modify.title") %>' name='title'/>	
			</jsp:include>
			
			
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinktype.name#}"/></html:td>
					<html:td >
						<html:select id="linkTypeId" name="linkTypeId"  isCascade="true" isCascadeSource="true" isCascadeEdit="true" cascadeTarget="linkGroupId"  list="<%=PropKey.LINK_TYPE_LIST%>">
							<html:option label="linkTypeName" value="linkTypeId" selected="picLinkViewBean.linkTypeId"/>
						</html:select>														
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinkgroup.name#}"/></html:td>
					<html:td >
						<html:select id="linkGroupId" name="linkGroupId"   isCascade="true" isCascadeEdit="true" cascadeSource="linkTypeId" cascadeValue="linkTypeId" list="<%=PropKey.LINK_GROUP_LIST%>">
							<html:option label="linkGroupName" value="linkGroupId" selected="picLinkViewBean.linkGroupId"/>
						</html:select>														
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.name#}"/></html:td>
					<html:td >
							<html:text name="linkName" id="linkName" styleClass="input-text" value="picLinkViewBean.linkName" />													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.title#}"/></html:td>
					<html:td >
							<html:text name="linkTitle" id="linkTitle" styleClass="input-text" value="picLinkViewBean.linkTitle"/>													
					</html:td>
				</html:tr>				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.address#}"/></html:td>
					<html:td >
							<html:text name="linkAddr" id="linkAddr" styleClass="input-text" value="picLinkViewBean.linkAddr"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.showicon#}"/></html:td>
					<html:td > 
							<com:switchbox boxId="showLinkIcon" varValue="picLinkViewBean.showLinkIcon" idValue="showLinkIcon" offValue="0" varName="showLinkIcon" onValue="1"  idName="showLinkIcon"  offLabel="{$jsp.portal.console.plugin.piclinks.showicon.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.showicon.yes#}"   isSave="false" />												
					</html:td>
					
				</html:tr>		
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.iconpath#}"/></html:td>
					<html:td >
						<com:simpleUpload fileId="linkIconPath" sortDir="system_$[sysId]/pulgins/linkpic/" isImage="true" viewPath="picLinkViewBean.linkIconPath"></com:simpleUpload>
							<%--<html:text name="linkIconPath" id="linkIconPath" styleClass="input-text" size="40"  value="picLinkViewBean.linkIconPath"/>													
					--%>
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.iconlink#}"/></html:td>
					<html:td >
							<html:text name="linkIconAddr" id="linkIconAddr" styleClass="input-text" value="picLinkViewBean.linkIconAddr"/>													
					</html:td>
				</html:tr>		
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.iconwidth#}"/></html:td>
					<html:td >
							<html:text name="linkIconWidth" id="linkIconWidth" styleClass="input-text" value="picLinkViewBean.linkIconWidth"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.iconheight#}"/></html:td>
					<html:td >
							<html:text name="linkIconHeight" id="linkIconHeight" styleClass="input-text" value="picLinkViewBean.linkIconHeight"/>													
					</html:td>
				</html:tr>		
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.showword#}"/></html:td>
					<html:td >
					<com:switchbox boxId="showContents" varValue="picLinkViewBean.showContents" idValue="showContents" offValue="0" varName="showContents" onValue="1"  idName="showContents"  offLabel="{$jsp.portal.console.plugin.piclinks.showword.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.showword.yes#}"  isSave="false" />																	
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.isclick#}"/></html:td>
					<html:td >	
						<com:switchbox boxId="isClick" varValue="picLinkViewBean.isClick" idValue="isClick" offValue="0" varName="isClick" onValue="1"  idName="isClick"  offLabel="{$jsp.portal.console.plugin.piclinks.isclick.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.isclick.yes#}"   isSave="false" />									
					</html:td>
				</html:tr>		
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.content#}"/></html:td>
					<html:td colspan="3">
						<jsp:include page="../../../../../common/impart/ckeditor.jsp">
						<jsp:param value="contents" name="name"/>
						<jsp:param value="picLinkViewBean.contents" name="value"/>
						</jsp:include>															
					</html:td>
				</html:tr>
					
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.publisher#}"/></html:td>
					<html:td >
							<html:text name="publisher" id="publisher" styleClass="input-text" value="picLinkViewBean.publisher"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.publishtime#}"/></html:td>
					<html:td >
							
							<com:simplendar id="publishDatetime" value="picLinkViewBean.publishDatetime"/>													
					</html:td>
				</html:tr>		
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.draftor#}"/></html:td>
					<html:td >
							<html:text name="drafter" id="drafter" styleClass="input-text" value="picLinkViewBean.drafter"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.drafttime#}"/></html:td>
					<html:td >							
							<com:simplendar id="drafDatetime" value="picLinkViewBean.drafDatetime"/>												
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.order#}"/></html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text" value="picLinkViewBean.showOrder"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.issee#}"/></html:td>
					<html:td>
							<com:switchbox boxId="isSee" varValue="picLinkViewBean.isSee" idValue="isSee" offValue="0" varName="isSee" onValue="1"  idName="isSee"  offLabel="{$jsp.portal.console.plugin.piclinks.issee.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.issee.yes#}"   isSave="false" />												
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.desc#}"/></html:td>
					<html:td colspan="3">
					<html:textarea  name="linkDesc" id="linkDesc" styleClass="input-text" cols="60" rows="5" value="picLinkViewBean.linkDesc"></html:textarea>									
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td>
						<com:switchbox  boxId="isValidate" varValue="picLinkViewBean.isValidate"  idValue="linkId" offValue="0" varName="isValidate" onValue="1"  idName="linkId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="false"/>							
					</html:td>
					<html:td></html:td>
					<html:td >
																				
					</html:td>
					
				</html:tr>	
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('piclinkForm');"/>
						<btn:return href="contoller.do?operation=listPicLink&sysId=$[sysId]"  onclick="cleanUploadCache();"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="piclinkForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="showOrder"  types="number" event="onblur">
			<com:init size="40" maxlength="5" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="linkName"  types="none" event="onblur">
			<com:init size="40" maxlength="200" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="linkTitle"  types="none" event="onblur">
			<com:init size="40" maxlength="200" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="linkAddr"  types="none" event="onblur">
			<com:init size="40" maxlength="200" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="linkIconAddr"  types="none" event="onblur">
			<com:init size="40" maxlength="200" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="linkIconWidth"  types="none" event="onblur">
			<com:init size="40" maxlength="5" initValue="32"></com:init>
		</com:vElement>
		<com:vElement id="linkIconHeight"  types="none" event="onblur">
			<com:init size="40" maxlength="5" initValue="32"></com:init>
		</com:vElement>
		<com:vElement id="publisher"  types="none" event="onblur">
			<com:init size="40" maxlength="20" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="drafter"  types="none" event="onblur">
			<com:init size="40" maxlength="20" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="linkDesc"  types="none" event="onblur">
			<com:init maxlength="300" initValue=""></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
	
	<com:loader   simpleUpload="true"/>

	</body>
</html>
