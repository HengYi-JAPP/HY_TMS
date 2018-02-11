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
<html:form id="tdtForm" name="tdtForm" method="post" action="contoller.do">
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.themes.defvar.view.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.defvar.code#}"/></html:td>
					<html:td >
							<html:value  value="tdtViewBean.tdtCode"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.defvar.name#}"/></html:td>
					<html:td >
							<html:value value="tdtViewBean.tdtName"/>													
					</html:td>							
				</html:tr>
				<html:tr>	
					<html:td align="right" styleClass="edit-content-label"><html:label label="{$jsp.portal.themes.defvar.icon#}"/></html:td>
					<html:td>	
					<html:img src="tdtViewBean.tdtIcon"></html:img>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.defvar.desc#}"/></html:td>
					<html:td >
							<html:value value="tdtViewBean.tdtDesc"/>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.defvar.order#}"/></html:td>
					<html:td >
							<html:value   value="tdtViewBean.showOrder"/>													
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="tdtViewBean.isValidate" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  isSave="false" />									
					</html:td>	
				</html:tr>
				<html:tr>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.themes.defvar.isdefault#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isDefault" varValue="tdtViewBean.isDefault" idValue="isDefault" offValue="0" varName="isDefault" onValue="1"  idName="isDefault"  offLabel="{$jsp.common.status.no#}" onLabel="{$jsp.common.status.yes#}"   isSave="false" /> 														
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=listDefineType&themesId=$[themesId]"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>


	</body>
</html>

