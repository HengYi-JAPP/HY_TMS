<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
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
<com:loader css="css/common/table-list.css"  switchbox="true"  ajax="true"/>
			
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.infotype.params.view.title") %>' name='title'/>			
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.params.var#}"/></html:td>
					<html:td >						
						<html:value value="infoTypeParamsViewBean.paramsVar"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.params.name#}"/></html:td>
					<html:td >						
						<html:value  value="infoTypeParamsViewBean.paramsName"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.params.value#}"/></html:td>
					<html:td >						
						<html:value  value="infoTypeParamsViewBean.paramsValue"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.params.defvalue#}"/></html:td>
					<html:td >						
						<html:value  value="infoTypeParamsViewBean.paramsDefValue"/>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.infotype.params.desc#}"/></html:td>
					<html:td >	
						<html:value value="infoTypeParamsViewBean.paramsDesc"/>								
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >	
						<com:switchbox varValue="infoTypeParamsViewBean.isValidate" talbeName="TB_CMS_INFOTYPE_PARAMS" idValue="infoTypeParamsViewBean.paramsId" offValue="0" varName="isValidate" onValue="1"  idName="paramsId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="false" disabled="true"/>								
					</html:td>
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=listInfoTypeParams&checkInfoTypeId=$[checkInfoTypeId]"/>							
				</html:td></html:tr>
			</html:table>	

	</body>
</html>


