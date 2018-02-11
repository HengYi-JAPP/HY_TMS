<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/comp-extends.tld" prefix="cext"%>
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

<com:loader css="css/common/table-list.css" />
<com:loader  js="js/common/common.js"/>
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.website.personalize.layout.selfdefine") %>' name="title"/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.website.personalize.layout.name#}" /></html:td>
					<html:td >	
						<html:value value="layoutViewBean.layoutName"/>											
					</html:td>
				</html:tr>
				<html:tr>
				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.website.personalize.layout.defaulticon#}" /></html:td>
					<html:td >								
							<html:img src="$[layoutViewBean.layoutLogo]"  />														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.website.personalize.layout.selectedicon#}" /></html:td>
					<html:td >
					<html:img src="$[layoutViewBean.layoutSelectedLogo]" />														
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
											
						<btn:return href="contoller.do?operation=loadUserPersonalizeLayoutList&currentSysCode=$[currentSysCode]&sysId=$[sysId]&channelId=$[channelId]"/>							
				</html:td></html:tr>
			</html:table>	
	</body>
</html>

