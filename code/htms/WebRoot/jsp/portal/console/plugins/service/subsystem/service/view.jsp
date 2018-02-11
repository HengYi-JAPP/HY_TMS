<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.plugins.service.ServiceBean"%>
<%@ include file="../../../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	ServiceBean serviceBean =(ServiceBean)request.getAttribute("serviceViewBean");
	serviceBean = serviceBean==null?new ServiceBean():serviceBean;
 %>
 
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"  switchbox="true"/>

			
			<jsp:include page="../../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.service.view.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.name#}"/></html:td>
					<html:td >
							<html:value  value="serviceViewBean.serviceName"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.address#}"/></html:td>
					<html:td >
							<html:value  value="serviceViewBean.serviceAddress"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.invokemethod#}"/></html:td>
					<html:td >
					<html:value value="serviceViewBean.invokeMethod"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td ></html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.invokestyle#}"/></html:td>
					<html:td >						
						<html:select id="invokeStyle" name="invokeStyle" disabled="true" >
							<html:option label="{$jsp.portal.console.plugin.service.invokestyle.single#}" value="single" selected="serviceViewBean.invokeStyle"/>
							<html:option label="{$jsp.portal.console.plugin.service.invokestyle.batch#}" value="batch" selected="serviceViewBean.invokeStyle"/>
						</html:select>	
					</html:td>	
						<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.compenent#}"/></html:td>
					<html:td >
						<html:select id="seivcePlatform" name="seivcePlatform" disabled="true" >
							<html:option label="axis" value="axis"   selected="serviceViewBean.seivcePlatform"/>
							<html:option label="axis2" value="axis2"  selected="serviceViewBean.seivcePlatform"/>
							<html:option label="cxf" value="cxf"  selected="serviceViewBean.seivcePlatform"/>
							<html:option label="xfire" value="xfire"  selected="serviceViewBean.seivcePlatform"/>
							<html:option label="dotnet" value="dotnet"  selected="serviceViewBean.seivcePlatform"/>
						</html:select>														
					</html:td>	
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.showstyle#}"/></html:td>
					<html:td >
						<html:select id="showStyle" name="showStyle"  disabled="true"  >
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.horizontal#}" value="horizontal"  selected="serviceViewBean.showStyle"/>
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.vertical#}" value="vertical"  selected="serviceViewBean.showStyle"/>
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.horizontalavg#}" value="horizontalAvg"  selected="serviceViewBean.showStyle"/>
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.verticalavg#}" value="verticalAvg"  selected="serviceViewBean.showStyle"/>
						</html:select>														
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.shownum#}"/></html:td>
					<html:td >						
						<html:value value="serviceViewBean.showNum"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.showtitle#}"/></html:td>
					<html:td >
						<com:switchbox varValue="serviceViewBean.isShowTitle"  disabled="true"   talbeName="TB_CMS_INFO_SERVICE" idValue="serviceViewBean.serviceId" offValue="0" varName="isShowTitle" onValue="1"  idName="serviceId"  offLabel="{$jsp.portal.console.plugin.service.showtitle.no#}" onLabel="{$jsp.portal.console.plugin.service.showtitle.yes#}"   ajaxUrl="contoller.do" isSave="false"/>
																			
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.showlen#}"/></html:td>
					<html:td >						
						<html:value value="serviceViewBean.showLength"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.replace#}"/></html:td>
					<html:td >
						<%=serviceBean.getReplaceString() %>								
					 </html:td>		
					 <html:td styleClass="edit-talbe-label">&nbsp;</html:td>
					<html:td >&nbsp;</html:td>					
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.rownum#}"/></html:td>
					<html:td >
						<html:value   value="serviceViewBean.titleRowNum"/>														
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.colnum#}"/></html:td>
					<html:td >						
						<html:value value="serviceViewBean.titleColNum"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.desc#}"/></html:td>
					<html:td colspan="3">
							<html:value value="serviceViewBean.serviceDesc"/>	
					</html:td>
				</html:tr>
			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >	
						<btn:return href="contoller.do?operation=listSubSystemService&sysId=$[sysId]&columnId=$[columnId]"/>								
				</html:td></html:tr>
			</html:table>	
			

	</body>
</html>

