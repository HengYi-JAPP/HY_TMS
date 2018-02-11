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
<com:loader css="css/common/table-list.css"  switchbox="true" />
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.piclinkgroup.view.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinktype.name#}"/></html:td>
					<html:td >
						
						<html:select id="linkTypeId" name="linkTypeId"  list="<%=PropKey.LINK_TYPE_LIST%>" disabled="true">
							<html:option label="linkTypeName" value="linkTypeId" selected="picLinkGroupViewBean.linkTypeId"/>
						</html:select>														
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinkgroup.code#}"/></html:td>
					<html:td >
							<html:value  value="picLinkGroupViewBean.linkGroupCode"/>													
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinkgroup.name#}"/></html:td>
					<html:td >
							<html:value  value="picLinkGroupViewBean.linkGroupName"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinkgroup.showname#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="showGroupName" varValue="picLinkGroupViewBean.showGroupName" idValue="showGroupName" offValue="0" varName="showGroupName" onValue="1"  idName="linkGroupId"  offLabel="{$jsp.portal.console.plugin.piclinkgroup.showname.no#}" onLabel="{$jsp.portal.console.plugin.piclinkgroup.showname.yes#}"  isSave="false" disabled="true"/>									
					</html:td>		
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinkgroup.order#}"/></html:td>
					<html:td >
							<html:value  value="picLinkGroupViewBean.showOrder"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinkgroup.desc#}"/></html:td>
					<html:td >
							<html:value value="picLinkGroupViewBean.linkGroupDesc"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="picLinkGroupViewBean.isValidate" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   isSave="false" disabled="true"/>									
					</html:td>		
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=listPicLinkGroup&sysId=$[sysId]"/>							
				</html:td></html:tr>
			</html:table>	
	
	

	</body>
</html>


