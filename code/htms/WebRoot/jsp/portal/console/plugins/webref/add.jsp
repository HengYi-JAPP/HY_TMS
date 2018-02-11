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
<com:loader css="css/common/table-list.css"/>
<html:form id="refForm" name="refForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addWebRef"/>
			<html:hidden id="createTime" name="createTime" value='<%=tools.tool.DateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss") %>'/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.webref.add.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="systemList" fistOption="{$jsp.common.select.firstoption#}" isCascade="true" isCascadeSource="true" isCascadeEdit="true" cascadeTarget="columnId" >
							<html:option label="sysName" value="sysId" />
						</html:select>										
					</html:td>	
						<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.column#}"/></html:td>
					<html:td >
						<html:select id="columnId" name="columnId"  list="columnList" isCascade="true" isCascadeEdit="true" cascadeSource="sysId" cascadeValue="sysId">
							<html:option label="columnName" value="columnId" />
						</html:select>	 														
					</html:td>		
					
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.infoname#}"/></html:td>
					<html:td >
							<html:text name="refName" id="refName" styleClass="input-text" size="36"   value=""/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webref.reflink#}"/></html:td>
					<html:td >
							<html:text name="refLink" id="refLink" styleClass="input-text" size="36"   value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.desc#}"/></html:td>
					<html:td colspan="3">
							<html:textarea name="refDesc" id="refDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>	
					</html:td>
				</html:tr>
			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('refForm')"/>		
						<btn:return href="contoller.do?operation=listWebRef&infoTypeCode=webRef"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>
	
<com:loader   simpleUpload="true"/>	

	</body>
</html>
