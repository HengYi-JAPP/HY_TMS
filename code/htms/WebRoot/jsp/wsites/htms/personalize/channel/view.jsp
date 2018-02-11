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
<com:loader css="css/common/table-list.css" switchbox="true" validator="true"/>
<html:form id="channelForm" name="channelForm" method="post" action="contoller.do">
			
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.channel.view.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.name#}"/></html:td>
					<html:td >
							<html:value value="userChannelBean.channelName"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td >					
					</html:td>				
					
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.icon.before#}"/></html:td>
					<html:td >		
						<html:img src="userChannelBean.beforeIcon" />								
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.icon.after#}"/></html:td>
					<html:td >
						<html:img src="userChannelBean.afterIcon" />													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.url#}"/></html:td>
					<html:td >						
						<html:value value="userChannelBean.channelUrl"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.load#}"/></html:td>
					<html:td >
						<com:switchbox boxId="loadStyle"  varValue="userChannelBean.loadStyle" idValue="loadStyle" offValue="0" varName="loadStyle" onValue="1"  idName="loadStyle"  offLabel="{$jsp.portal.console.channel.load.async#}" onLabel="{$jsp.portal.console.channel.load.sync#}"  isSave="false" hideBox="true"/>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.isshow#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="defaultShow"  varValue="userChannelBean.defaultShow" idValue="defaultShow" offValue="0" varName="defaultShow" onValue="1"  idName="defaultShow"  offLabel="{$jsp.portal.console.channel.isshow.no#}" onLabel="{$jsp.portal.console.channel.isshow.yes#}"  isSave="false"  hideBox="true" />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.defselect#}"/></html:td>
					<html:td >
						<com:switchbox boxId="defaultSelect"  varValue="userChannelBean.defaultSelect" idValue="defaultSelect" offValue="0" varName="defaultSelect" onValue="1"  idName="defaultSelect"  offLabel="{$jsp.portal.console.channel.defselect.no#}" onLabel="{$jsp.portal.console.channel.defselect.yes#}"   isSave="false"  hideBox="true"/>																		
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.operation.composite.showheight#}"/></html:td>
					<html:td >	
						<html:value value="userChannelBean.showHeight" /> 											
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.order#}"/></html:td>
					<html:td >
						<html:value value="userChannelBean.defaultOrder" /> 														
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=loadChannelPersonalizeList&currentSysCode=$[currentSysCode]&sysId=$[sysId]"/>
				</html:td>
				</html:tr>
			</html:table>	
	</html:form>

	</body>
</html>
<com:loader   simpleUpload="true"/>

