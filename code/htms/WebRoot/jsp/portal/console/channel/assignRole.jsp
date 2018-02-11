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
<html:form id="channelForm" name="channelForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="doAddRoleForChannel"/>
			

			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.channel.asign.title") %>' name='title'/>		
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.name#}"/></html:td>
					<html:td >	
						<html:value value="channelViewBean.channelName"/> 	
						<html:hidden name="channelId" id="channelId"  value="channelViewBean.channelId"/>										
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.assignrole.select.role#}"/></html:td>
					<html:td >		
					<com:lorbox lorBoxName="lorbox" filtDuplicated="true">
						<com:leftbox itemId="roleId" list="canSelectRole" itemValue="roleId" itemLabel="roleName" boxId="canSelectRole" orader="false" boxLabel="可选角色"/>
						<com:rightbox itemId="roleId" list="roleOfChannel" itemValue="roleId" itemLabel="roleName" boxId="selectedRole"  orader="false"  boxLabel="已选角色"/>
					</com:lorbox>	
							 											
					</html:td>
				</html:tr>			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:lorbox.submit();submit('channelForm')"/>
					
						<btn:return href="contoller.do?operation=listChannel"/>							
				</html:td></html:tr>
			</html:table>	
		

	</html:form>
	
	

	</body>
</html>

							
	