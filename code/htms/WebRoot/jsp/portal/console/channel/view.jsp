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
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.channel.view.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="<%=PropKey.SYSTEM_LIST%>" disabled="true">
							<html:option label="sysName" value="sysId" selected="channelViewBean.sysId"/>
						</html:select>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.name#}"/></html:td>
					<html:td >
							<html:value  value="channelViewBean.channelName"/>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.url#}"/></html:td>
					<html:td >						
						<html:value  value="channelViewBean.channelUrl"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.load#}"/></html:td>
					<html:td >
						<com:switchbox   varValue="channelViewBean.loadStyle" idValue="loadStyle" offValue="0" varName="loadStyle" onValue="1"  idName="loadStyle"  offLabel="{$jsp.portal.console.channel.load.async#}" onLabel="{$jsp.portal.console.channel.load.sync#}"   hideBox="true"/>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox  varValue="channelViewBean.isValidate" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   hideBox="true" />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.order#}"/></html:td>
					<html:td >
						<html:value value="channelViewBean.defaultOrder" /> 														
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.isshow#}"/></html:td>
					<html:td >						
						<com:switchbox varValue="channelViewBean.defaultShow" idValue="defaultShow" offValue="0" varName="defaultShow" onValue="1"  idName="defaultShow"  offLabel="{$jsp.portal.console.channel.isshow.yes#}" onLabel="{$jsp.portal.console.channel.isshow.no#}"  hideBox="true"  />									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.defselect#}"/></html:td>
					<html:td >
						<com:switchbox varValue="channelViewBean.defaultSelect" idValue="defaultSelect" offValue="0" varName="defaultSelect" onValue="1"  idName="defaultSelect"  offLabel="{$jsp.portal.console.channel.defselect.no#}" onLabel="{$jsp.portal.console.channel.defselect.yes#}"   hideBox="true" />																		
					</html:td>
				</html:tr>
				
					<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.defstyle#}"/></html:td>
					<html:td >						
						<html:value  value="channelViewBean.defaultClass"/>									
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.selectstyle#}"/></html:td>
					<html:td >
						<html:value  value="channelViewBean.selectedClass"/>															
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.operation.composite.showheight#}"/></html:td>
					<html:td >	
						<html:value  value="channelViewBean.showHeight"/>											
					</html:td>
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td >											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.desc#}"/></html:td>
					<html:td colspan="3">
						<html:value  value="channelViewBean.channelDesc"/>										
					</html:td>
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >						
						<btn:return href="contoller.do?operation=listChannel"/>							
				</html:td></html:tr>
			</html:table>	

	</body>
</html>


