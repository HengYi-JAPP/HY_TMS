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
<com:loader css="css/common/table-list.css" lorbox="true"/>
<html:form id="sysForm" name="sysForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="doAddBackgroundForSystem"/>
			

			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.system.list.title") %>' name='title'/>		
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.name#}"/></html:td>
					<html:td >	
						<html:value value="sysViewBean.sysName"/> 	
						<html:hidden name="checkSysId" id="checkSysId"  value="sysViewBean.sysId"/>										
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.system.background.select#}"/></html:td>
					<html:td >		
					<com:lorbox lorBoxName="lorbox" filtDuplicated="true">
						<com:leftbox itemId="bgdId" list="canSelectBackground" itemValue="bgdId" itemLabel="bgdName" boxId="canSelectBackground" orader="false" boxLabel="{$jsp.privilege.system.background.selectable#}"/>
						<com:rightbox itemId="bgdId" list="backgroundOfSystem" itemValue="bgdId" itemLabel="bgdName" boxId="selectedBackground"  orader="false"  boxLabel="{$jsp.privilege.system.background.selected#}"/>
					</com:lorbox>	
							 											
					</html:td>
				</html:tr>			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:lorbox.submit();submit('sysForm')"/>
					
						<btn:return href="contoller.do?operation=listSystem"/>							
				</html:td></html:tr>
			</html:table>	
		

	</html:form>
	
	

	</body>
</html>

							
	