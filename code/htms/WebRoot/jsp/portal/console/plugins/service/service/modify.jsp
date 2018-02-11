
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.plugins.service.ServiceBean"%>
<%@ include file="../../../../../common/impart/taglib.jsp"%>
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
<html:form id="serviceForm" name="serviceForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyService"/>
			<html:hidden id="serviceId" name="serviceId" value="serviceViewBean.serviceId"/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.service.modify.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="systemList" fistOption="{$jsp.common.select.firstoption#}" isCascade="true" isCascadeSource="true" isCascadeEdit="true" cascadeTarget="columnId" >
							<html:option label="sysName" value="sysId" selected="columnViewBean.sysId"/>
						</html:select>										
					</html:td>	
						<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.column#}"/></html:td>
					<html:td >
						<html:select id="columnId" name="columnId"  list="columnList" isCascade="true" isCascadeEdit="true" cascadeSource="sysId" cascadeValue="sysId">
							<html:option label="columnName" value="columnId" selected="columnViewBean.columnId"/>
						</html:select>	 														
					</html:td>	
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.name#}"/></html:td>
					<html:td >
							<html:text name="serviceName" id="serviceName" styleClass="input-text" size="36"   value="serviceViewBean.serviceName"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.address#}"/></html:td>
					<html:td >
							<html:text name="serviceAddress" id="serviceAddress" styleClass="input-text" size="36"   value="serviceViewBean.serviceAddress"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.invokemethod#}"/></html:td>
					<html:td >
						<html:text name="invokeMethod" id="invokeMethod" styleClass="input-text" size="36"   value="serviceViewBean.invokeMethod"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td ></html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.invokestyle#}"/></html:td>
					<html:td >						
						<html:select id="invokeStyle" name="invokeStyle"  >
							<html:option label="{$jsp.portal.console.plugin.service.invokestyle.single#}" value="single" selected="serviceViewBean.invokeStyle"/>
							<html:option label="{$jsp.portal.console.plugin.service.invokestyle.batch#}" value="batch" selected="serviceViewBean.invokeStyle"/>
						</html:select>										
					</html:td>	
						<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.compenent#}"/></html:td>
					<html:td >
						<html:select id="seivcePlatform" name="seivcePlatform"  >
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
						<html:select id="showStyle" name="showStyle"  >
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.horizontal#}" value="horizontal"  selected="serviceViewBean.showStyle"/>
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.vertical#}" value="vertical"  selected="serviceViewBean.showStyle"/>
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.horizontalavg#}" value="horizontalAvg"  selected="serviceViewBean.showStyle"/>
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.verticalavg#}" value="verticalAvg"  selected="serviceViewBean.showStyle"/>
						</html:select>																			
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.shownum#}"/></html:td>
					<html:td >						
						<html:text name="showNum" id="showNum" styleClass="input-text" size="36"   value="serviceViewBean.showNum"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.showtitle#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isShowTitle" varValue="serviceViewBean.isShowTitle" talbeName="TB_CMS_INFO_SERVICE" idValue="serviceViewBean.serviceId" offValue="0" varName="isShowTitle" onValue="1"  idName="serviceId"  offLabel="{$jsp.portal.console.plugin.service.showtitle.no#}" onLabel="{$jsp.portal.console.plugin.service.showtitle.yes#}"  ajaxUrl="contoller.do" isSave="false"/>												
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.showlen#}"/></html:td>
					<html:td >						
						<html:text name="showLength" id="showLength" styleClass="input-text" size="36"   value="serviceViewBean.showLength"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.replace#}"/></html:td>
					<html:td >
						<input type="text" name="replaceString" id="replaceString" class="input-text" size="36"   value="<%=serviceBean.getReplaceString() %>"/>									
					 </html:td>		
					 <html:td styleClass="edit-talbe-label">&nbsp;</html:td>
					<html:td >&nbsp;</html:td>					
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.rownum#}"/></html:td>
					<html:td >
						<html:text name="titleRowNum" id="titleRowNum" styleClass="input-text" size="36"   value="serviceViewBean.titleRowNum"/>														
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.colnum#}"/></html:td>
					<html:td >						
						<html:text name="titleColNum" id="titleColNum" styleClass="input-text" size="36"   value="serviceViewBean.titleColNum"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.desc#}"/></html:td>
					<html:td colspan="3">
							<html:textarea name="serviceDesc" id="serviceDesc" styleClass="input-text" cols="40" rows="8"   value="serviceViewBean.serviceDesc"></html:textarea>	
					</html:td>
				</html:tr>
			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('serviceForm')"/>		
						<btn:return href="contoller.do?operation=listService&infoTypeCode=webService"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>
	
<com:loader   simpleUpload="true"/>	

	</body>
</html>