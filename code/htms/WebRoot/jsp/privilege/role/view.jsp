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
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.role.view.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="<%=PropKey.SYSTEM_LIST%>" disabled="true">
							<html:option label="sysName" value="sysId"  selected="roleViewBean.sysId" />
						</html:select>									
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.name#}"/></html:td>
					<html:td >
							<html:value  value="roleViewBean.roleName" />													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.desc#}"/></html:td>
					<html:td>
						<html:value  value="roleViewBean.roleDesc" />			
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td>
					<com:switchbox varValue="roleViewBean.isValidate" talbeName="TB_CMS_ROLE" idValue="roleViewBean.roleId" offValue="0" varName="isValidate" onValue="1"  idName="roleId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do" disabled="true"/>									
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=listRole"/>							
				</html:td></html:tr>
			</html:table>	
			

	

	</body>
</html>



