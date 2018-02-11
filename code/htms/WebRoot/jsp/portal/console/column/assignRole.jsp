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
<html:form id="columnForm" name="columnForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="doAddRoleForColumn"/>
			

			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value="指定访问角色" name="title"/>		
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label">栏目名称：</html:td>
					<html:td >	
						<html:value value="columnViewBean.columnName"/> 	
						<html:hidden name="columnId" id="columnId"  value="columnViewBean.columnId"/>										
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label">请选择角色：</html:td>
					<html:td >		
					<com:lorbox lorBoxName="lorbox" filtDuplicated="true">
						<com:leftbox itemId="roleId" list="canSelectRole" itemValue="roleId" itemLabel="roleName" boxId="canSelectRole" orader="false" boxLabel="可选角色"/>
						<com:rightbox itemId="roleId" list="roleOfColumn" itemValue="roleId" itemLabel="roleName" boxId="selectedRole"  orader="false"  boxLabel="已选角色"/>
					</com:lorbox>	
							 											
					</html:td>
				</html:tr>			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:lorbox.submit();submit('columnForm')"/>
					
						<btn:return href="contoller.do?operation=listColumn"/>							
				</html:td></html:tr>
			</html:table>	
		

	</html:form>
	
	

	</body>
</html>

							
	