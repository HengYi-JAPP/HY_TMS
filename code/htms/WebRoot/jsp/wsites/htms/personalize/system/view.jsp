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
<com:loader css="css/common/table-list.css"  />
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value="查看系统" name="title"/>		
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				
			
				<html:tr>
					<html:td styleClass="edit-talbe-label">名称：</html:td>
					<html:td >	
						<html:value value="systemViewBean.sysName"/> 											
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label">访问路径：</html:td>
					<html:td >
							<html:value value="systemViewBean.sysPath"/>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label">排序号：</html:td>
					<html:td >
							<html:value  value="systemViewBean.showOrder"/>													
					</html:td>
				</html:tr>			
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >				
						<btn:return href="jsp/portal/website/pesonal/system/list.jsp"/>							
				</html:td></html:tr>
			</html:table>	
	
	</body>
</html>

