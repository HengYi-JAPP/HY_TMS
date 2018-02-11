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
<com:loader css="css/common/table-list.css" validator="true"/>
<html:form id="roleForm" name="roleForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addRole"/>
			<html:hidden name="roleId" id="roleId"  value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden name="isValidate" id="isValidate" value="1"/> 
			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.role.add.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="<%=PropKey.SYSTEM_LIST%>" >
							<html:option label="sysName" value="sysId" />
						</html:select>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.name#}"/></html:td>
					<html:td >
							<html:text name="roleName" id="roleName" styleClass="input-text"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.role.desc#}"/></html:td>
					<html:td>
							<html:textarea name="roleDesc" id="roleDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>				
					</html:td>
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('roleForm')"/>
						<btn:return href="contoller.do?operation=listRole"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="roleForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="roleName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="roleDesc"  types="none" event="onblur">
			<com:init size="36" maxlength="300" initValue=""></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
	
	

	</body>
</html>


