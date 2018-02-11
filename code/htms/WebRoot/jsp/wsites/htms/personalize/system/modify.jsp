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
<com:loader switchbox="true" ajax="true"  css="css/common/table-list.css" validator="true"/>
<html:form id="systemForm" name="systemForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifySelfSystem"/>
			<html:hidden name="sysId" id="sysId"  value="systemViewBean.sysId"/>
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value="修改系统" name="title"/>		
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				
			
				<html:tr>
					<html:td styleClass="edit-talbe-label">名称：</html:td>
					<html:td >	
						<html:text name="sysName" id="sysName" styleClass="input-text" size="36" maxlength="60" value="systemViewBean.sysName"/> 											
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label">访问路径：</html:td>
					<html:td >
							<html:text name="sysPath" id="sysPath" styleClass="input-text" size="36"  value="systemViewBean.sysPath"/>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label">排序号：</html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text" size="36"  value="systemViewBean.showOrder"/>													
					</html:td>
				</html:tr>			
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:submit('systemForm')"/>					
						<btn:return href="jsp/portal/website/pesonal/system/list.jsp"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="systemForm" showNormal="true" >
		<com:vElement id="sysCode"  types="number-letter-underline" event="onblur"/>
		<com:vElement id="sysName"  types="isnull" event="onblur"/>
		<com:vElement id="sysPath"  types="url" event="onblur"/>
	</com:validator>
	</html:form>
	</body>
</html>

