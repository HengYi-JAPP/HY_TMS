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
<com:loader css="css/common/table-list.css" lorbox="true"/>
<html:form id="roleForm" name="roleForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="assignColumnForRole"/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			

			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.subconsole.role.column.title") %>' name="title"/>		
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.name#}"/></html:td>
					<html:td >	
						<html:value value="roleViewBean.roleName"/> 	
						<html:hidden name="checkRoleId" id="checkRoleId"  value="roleViewBean.roleId"/>										
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.assignrole.select.role#}"/></html:td>
					<html:td >		
					<com:lorbox lorBoxName="lorbox" filtDuplicated="true">
						<com:leftbox itemId="columnId" list="columnList" itemValue="columnId" itemLabel="columnName" boxId="canSelectColumn" orader="false" boxLabel="{$jsp.portal.console.subconsole.role.column.selectable#}"/>
						<com:rightbox itemId="columnId" list="columnCheckedList" itemValue="columnId" itemLabel="columnName" boxId="selectedColumn"  orader="false"  boxLabel="{$jsp.portal.console.subconsole.role.column.selected#}"/>
					</com:lorbox>	
							 											
					</html:td>
				</html:tr>			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:lorbox.submit();submit('roleForm')"/>
					
						<btn:return href="contoller.do?operation=listSubSystemRole&sysId=$[sysId]"/>						
				</html:td></html:tr>
			</html:table>	
		

	</html:form>
	
	

	</body>
</html>

							
	