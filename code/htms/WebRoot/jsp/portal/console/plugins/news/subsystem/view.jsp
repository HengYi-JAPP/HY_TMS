<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../../common/impart/taglib.jsp"%>
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
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.news.view.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.title#}"/></html:td>
					<html:td >
							<html:value  value="newsViewBean.title"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.subtitle#}"/></html:td>
					<html:td >
							<html:value value="newsViewBean.subTile"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.introduction#}"/></html:td>
					<html:td >
							<html:value value="newsViewBean.introduction" />													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.keywords#}"/></html:td>
					<html:td >
							<html:value  value="newsViewBean.keyword"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.createtime#}"/></html:td>
					<html:td >
							<html:value  value="newsViewBean.createTime"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.modifytime#}"/></html:td>
					<html:td >
							<html:value  value="newsViewBean.createTime"/>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.news.content#}"/></html:td>
					<html:td >
							<html:value value="newsViewBean.contents"/>				
					</html:td>
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >						
						<btn:return href="contoller.do?operation=listSubSystemNews&columnId=$[columnId]"/>							
				</html:td></html:tr>
			</html:table>

	</body>
</html>