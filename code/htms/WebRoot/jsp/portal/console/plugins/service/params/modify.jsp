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
<com:loader css="css/common/table-list.css"/>
<html:form id="paramForm" name="paramForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyServiceParams"/>
			<html:hidden id="checkServiceId" name="checkServiceId" value="serviceParamsViewBean.serviceId"/>
			<html:hidden id="paramId" name="paramId" value="serviceParamsViewBean.paramId"/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.service.params.modify.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.params.code#}"/></html:td>
					<html:td >
							<html:text name="paramCode" id="paramCode" styleClass="input-text" size="36"   value="serviceParamsViewBean.paramCode"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.params.name#}"/></html:td>
					<html:td >
							<html:text name="paramName" id="paramName" styleClass="input-text" size="36"   value="serviceParamsViewBean.paramName"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.params.var#}"/></html:td>
					<html:td >
						<html:text name="paramVar" id="paramVar" styleClass="input-text" size="36"   value="serviceParamsViewBean.paramVar"/>														
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.params.defvalue#}"/></html:td>
					<html:td >
						<html:text name="paramValue" id="paramValue" styleClass="input-text" size="36"   value="serviceParamsViewBean.paramValue"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.params.desc#}"/></html:td>
					<html:td colspan="3">
							<html:textarea name="paramDesc" id="paramDesc" styleClass="input-text" cols="40" rows="8" value="serviceParamsViewBean.paramDesc"></html:textarea>	
					</html:td>
				</html:tr>
			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('paramForm')"/>		
						<btn:return href="contoller.do?operation=toListServiceParams&checkServiceId=$[checkServiceId]"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>

	</body>
</html>