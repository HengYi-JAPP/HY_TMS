<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 String currentDate = tools.tool.DateUtil.getFormatDate(null);
 %>
 
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<com:loader  js="js/common/common.js"/>			
<com:loader css="css/common/table-list.css"  switchbox="true" validator="true"/>
			
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td >
							<html:value  value="newsViewBean.title"/>													
					</html:td>
				</html:tr>
				
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >	
				<btn:close  href="javascript:window.close();"/>							
				</html:td></html:tr>
			</html:table>

	</body>
</html>