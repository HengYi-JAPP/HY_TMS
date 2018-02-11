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
			<html:hidden id="operation" name="operation" value="addSQLQueryParams"/>
			<html:hidden id="checkQueryId" name="checkQueryId" value="checkQueryId"/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.sqlquery.params.add.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.params.code#}"/></html:td>
					<html:td >
							<html:text name="paramCode" id="paramCode" styleClass="input-text" size="36"   value=""/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.params.name#}"/></html:td>
					<html:td >
							<html:text name="paramName" id="paramName" styleClass="input-text" size="36"   value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.params.var#}"/></html:td>
					<html:td >
						<html:text name="paramVar" id="paramVar" styleClass="input-text" size="36"   value=""/>														
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.params.value#}"/></html:td>
					<html:td >
						<html:text name="paramValue" id="paramValue" styleClass="input-text" size="36"   value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.params.desc#}"/></html:td>
					<html:td colspan="3">
							<html:textarea name="paramDesc" id="paramDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>	
					</html:td>
				</html:tr>
			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('paramForm')"/>		
						<btn:return href="contoller.do?operation=toListSQLQueryParams&checkQueryId=$[checkQueryId]"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>

	</body>
</html>