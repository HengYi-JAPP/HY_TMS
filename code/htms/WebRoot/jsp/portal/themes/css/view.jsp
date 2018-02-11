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
<com:loader css="css/common/table-list.css"/>
<html:form id="cssForm" name="cssForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyCss"/>
			<html:hidden id="ownerId" name="ownerId" value="cssViewBean.ownerId"/>
			<html:hidden id="cssId" name="cssId" value="cssViewBean.cssId"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.css.view.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				
			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.css.code#}"/></html:td>
					<html:td >
							<html:value  value="cssViewBean.cssCode"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.css.name#}"/></html:td>
					<html:td >
							<html:value  value="cssViewBean.cssName"/>													
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.css.order#}"/></html:td>
					<html:td >
							<html:value value="cssViewBean.showOrder"/>													
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.css.content#}"/></html:td>
					<html:td >
							<html:value value="cssViewBean.cssContent"/>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.css.desc#}"/></html:td>
					<html:td >
							<html:value value="cssViewBean.cssDesc"/>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" disabled="true" varValue="cssViewBean.isValidate" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   isSave="false" />									
					</html:td>	
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >	
						<btn:return href="contoller.do?operation=listCss&ownerId=$[cssViewBean.ownerId]&themesId=$[themesId]&ownderType=$[ownderType]"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>


	</body>
</html>
