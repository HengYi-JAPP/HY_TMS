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
<com:loader css="css/common/table-list.css"  switchbox="true"/>
			<jsp:include page="../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.layout.view.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.name#}"/></html:td>
					<html:td >
							<html:value  value="layoutViewBean.layoutName"/>													
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.tmplpath#}"/></html:td>
					<html:td >
						<html:value  value="layoutViewBean.layoutTempl"/> 														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.deficonpath#}"/></html:td>
					<html:td >		
						<html:img src="layoutViewBean.layoutLogo"></html:img>								
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.seliconpath#}"/></html:td>
					<html:td>
						<html:img src="layoutViewBean.layoutSelectedLogo"></html:img>														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox  varValue="layoutViewBean.isValidate" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   hideBox="true" />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.order#}"/></html:td>
					<html:td >
						<html:value  value="layoutViewBean.defaultOrder"/> 														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.isshow#}"/></html:td>
					<html:td >						
						<com:switchbox varValue="layoutViewBean.defaultShow" idValue="defaultShow" offValue="0" varName="defaultShow" onValue="1"  idName="defaultShow"  offLabel="{$jsp.portal.console.layout.isshow.no#}" onLabel="{$jsp.portal.console.layout.isshow.yes#}"  hideBox="true" />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.defselect#}"/></html:td>
					<html:td >
						<com:switchbox varValue="layoutViewBean.defaultSelect" idValue="defaultSelect" offValue="0" varName="defaultSelect" onValue="1"  idName="defaultSelect"  offLabel="{$jsp.portal.console.layout.defselect.no#}" onLabel="{$jsp.portal.console.layout.defselect.yes#}"   hideBox="true" />																		
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.layout.desc#}"/></html:td>
					<html:td colspan="3">
							<html:value value="layoutViewBean.layoutDesc" />				
					</html:td>
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=listLayout&checkChannelId=$[layoutViewBean.channelId]&sysId=$[sysId]"/>							
				</html:td></html:tr>
			</html:table>	
			
	</body>
</html>


