<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../../../common/impart/taglib.jsp"%>
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
<com:loader css="css/common/table-list.css"  switchbox="true"  uploader="true" ajax="true"/>
			<jsp:include page="../../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.piclinks.view.title") %>' name='title'/>
			</jsp:include>
			
			
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinktype.name#}"/></html:td>
					<html:td >
						<html:select id="linkTypeId" name="linkTypeId"   list="<%=PropKey.LINK_TYPE_LIST%>" disabled="true">
							<html:option label="linkTypeName" value="linkTypeId" selected="picLinkViewBean.linkTypeId"/>
						</html:select>														
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinkgroup.name#}"/></html:td>
					<html:td >
						<html:select id="linkGroupId" name="linkGroupId"   list="<%=PropKey.LINK_GROUP_LIST%>"  disabled="true">
							<html:option label="linkGroupName" value="linkGroupId" selected="picLinkViewBean.linkGroupId"/>
						</html:select>														
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.name#}"/></html:td>
					<html:td >
							<html:value value="picLinkViewBean.linkName" />													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.title#}"/></html:td>
					<html:td >
							<html:value  value="picLinkViewBean.linkTitle"/>													
					</html:td>
				</html:tr>				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.address#}"/></html:td>
					<html:td >
							<html:value value="picLinkViewBean.linkAddr"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.showicon#}"/></html:td>
					<html:td > 
							<com:switchbox boxId="showLinkIcon" varValue="picLinkViewBean.showLinkIcon" idValue="showLinkIcon" offValue="0" varName="showLinkIcon" onValue="1"  idName="showLinkIcon"  offLabel="{$jsp.portal.console.plugin.piclinks.showicon.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.showicon.yes#}"  isSave="false" disabled="true" />												
					</html:td>
					
				</html:tr>		
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.iconpath#}"/></html:td>
					<html:td >
							<div id="listElementId"></div>
							<div style="display:none;">
							<com:uploader >
								<com:uploadConfig uploader="picLinkUploader" showFileListElementId="listElementId" isShowInfoList="true" ></com:uploadConfig>
								<com:uploadServerConfig diskRootPath="C:/tomcat6/Tomcat6018/webapps/mywcms/" diskRelativePath="/upload/piclinks"/>
								
								<com:uploadLoader  loaderFile="picLinkViewBean.linkIconPath" loaderView="image" showOperation="false" elementHeight="64" elementWidth="64" isView="false" showFormat="false" showSize="false"></com:uploadLoader>
							</com:uploader>	
							</div>												
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.iconlink#}"/></html:td>
					<html:td >
							<html:value value="picLinkViewBean.linkIconAddr"/>													
					</html:td>
				</html:tr>		
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.iconwidth#}"/></html:td>
					<html:td >
							<html:value  value="picLinkViewBean.linkIconWidth"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.iconheight#}"/></html:td>
					<html:td >
							<html:value  value="picLinkViewBean.linkIconHeight"/>													
					</html:td>
				</html:tr>		
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.showword#}"/></html:td>
					<html:td >
					<com:switchbox boxId="showContents" varValue="picLinkViewBean.showContents" idValue="showContents" offValue="0" varName="showContents" onValue="1"  idName="showContents"  offLabel="{$jsp.portal.console.plugin.piclinks.showword.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.showword.yes#}"   isSave="false"  disabled="true" />																	
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.isclick#}"/></html:td>
					<html:td >	
						<com:switchbox boxId="isClick" varValue="picLinkViewBean.isClick" idValue="isClick" offValue="0" varName="isClick" onValue="1"  idName="isClick"  offLabel="{$jsp.portal.console.plugin.piclinks.isclick.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.isclick.yes#}"   isSave="false"  disabled="true" />									
					</html:td>
				</html:tr>		
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.content#}"/></html:td>
					<html:td colspan="3">
						<html:value value="picLinkViewBean.contents"/>												
					</html:td>
				</html:tr>
					
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.publisher#}"/></html:td>
					<html:td >
							<html:value  value="picLinkViewBean.publisher"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.publishtime#}"/></html:td>
					<html:td >
							<html:value value="picLinkViewBean.publishDatetime"/>											
					</html:td>
				</html:tr>		
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.draftor#}"/></html:td>
					<html:td >
							<html:value  value="picLinkViewBean.drafter"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.drafttime#}"/></html:td>
					<html:td >	
						<html:value value="picLinkViewBean.drafDatetime"/>												
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.order#}"/></html:td>
					<html:td >
							<html:value  value="picLinkViewBean.showOrder"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.issee#}"/></html:td>
					<html:td>
							<com:switchbox boxId="isSee" varValue="picLinkViewBean.isSee" idValue="isSee" offValue="0" varName="isSee" onValue="1"  idName="isSee"  offLabel="{$jsp.portal.console.plugin.piclinks.issee.no#}" onLabel="{$jsp.portal.console.plugin.piclinks.issee.yes#}"  isSave="false"  disabled="true" />												
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinks.desc#}"/></html:td>
					<html:td colspan="3">
					<html:value value="picLinkViewBean.linkDesc"/>									
					</html:td>
				</html:tr>	
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=listSubSystemPicLink&sysId=$[sysId]&columnId=$[columnId]" onclick="cleanUploadCache();"/>							
				</html:td></html:tr>
			</html:table>	

	</body>
</html>
