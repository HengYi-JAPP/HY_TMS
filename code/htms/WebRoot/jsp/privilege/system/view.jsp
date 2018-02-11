<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
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
<com:loader switchbox="true" ajax="true"  css="css/common/table-list.css" />
			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.system.view.title") %>' name='title'/>
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.code#}"/></html:td>
					<html:td >						
							<html:value value="systemViewBean.sysCode"/>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.name#}"/></html:td>
					<html:td >	
						<html:value value="systemViewBean.sysName"/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.isinside#}"/></html:td>
					<html:td >	
						<com:switchbox boxId="isInside" varValue="systemViewBean.isInside" idValue="sysId" offValue="0" varName="isInside" onValue="1"  idName="isInside"  offLabel="{$jsp.portal.console.column.personalize.no#}" onLabel="{$jsp.portal.console.column.personalize.yes#}"   isSave="false" disabled="true"/>											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.accesspath#}"/></html:td>
					<html:td >
							<html:value value="systemViewBean.sysPath"/>													
					</html:td>
				</html:tr>
							
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.desc#}"/></html:td>
					<html:td>
							<html:textarea name="sysDesc" id="sysDesc" styleClass="input-text" cols="40" rows="8" value="systemViewBean.sysDesc" disabled="true"></html:textarea>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.order#}"/></html:td>
					<html:td >
							<html:value  value="systemViewBean.showOrder"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td>
					<com:switchbox varValue="systemViewBean.isValidate" talbeName="TB_SYSTEM" idValue="systemViewBean.sysId" offValue="0" varName="isValidate" onValue="1"  idName="sysId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do" disabled="true"/>									
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=listSystem"/>					
				</html:td></html:tr>
			</html:table>
	</body>
</html>

