<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../../../common/impart/taglib.jsp"%>
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
<com:loader css="css/common/table-list.css"/>
<html:form id="serviceForm" name="serviceForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addSubSystemService"/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<html:hidden id="columnId" name="columnId" value="columnId"/>
			<jsp:include page="../../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.service.add.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.name#}"/></html:td>
					<html:td >
							<html:text name="serviceName" id="serviceName" styleClass="input-text" size="36"   value=""/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.address#}"/></html:td>
					<html:td >
							<html:text name="serviceAddress" id="serviceAddress" styleClass="input-text" size="36"   value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.invokemethod#}"/></html:td>
					<html:td >
						<html:text name="invokeMethod" id="invokeMethod" styleClass="input-text" size="36"   value="getPortletData"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"></html:td>
					<html:td ></html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.invokestyle#}"/></html:td>
					<html:td >						
						<html:select id="invokeStyle" name="invokeStyle"  >
							<html:option label="{$jsp.portal.console.plugin.service.invokestyle.single#}" value="single" />
							<html:option label="{$jsp.portal.console.plugin.service.invokestyle.batch#}" value="batch" />
						</html:select>										
					</html:td>	
						<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.compenent#}"/></html:td>
					<html:td >
						<html:select id="seivcePlatform" name="seivcePlatform"  >
							<html:option label="axis" value="axis" />
							<html:option label="axis2" value="axis2" />
							<html:option label="cxf" value="cxf" />
							<html:option label="xfire" value="xfire" />
							<html:option label="dotnet" value="dotnet" />
						</html:select>														
					</html:td>	
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.showstyle#}"/></html:td>
					<html:td >
						<html:select id="showStyle" name="showStyle"  >
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.horizontal#}" value="horizontal" />
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.vertical#}" value="vertical"/>
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.horizontalavg#}" value="horizontalAvg" />
							<html:option label="{$jsp.portal.console.plugin.service.showstyle.verticalavg#}" value="verticalAvg"/>
						</html:select>																		
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.shownum#}"/></html:td>
					<html:td >						
						<html:text name="showNum" id="showNum" styleClass="input-text" size="36"   value="6"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.showtitle#}"/></html:td>
					<html:td >
						<html:select id="isShowTitle" name="isShowTitle"  >
							<html:option label="{$jsp.portal.console.plugin.service.showtitle.yes#}" value="1" />
							<html:option label="{$jsp.portal.console.plugin.service.showtitle.no#}" value="0" />
						</html:select>																							
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.showlen#}"/></html:td>
					<html:td >						
						<html:text name="showLength" id="showLength" styleClass="input-text" size="36"   value="6"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.replace#}"/></html:td>
					<html:td >						
						<input type="text" name="replaceString" id="replaceString" class="input-text" size="36"   value="..."/>									
					</html:td>			
					<html:td styleClass="edit-talbe-label">&nbsp;</html:td>
					<html:td >&nbsp;</html:td>
									
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.rownum#}"/></html:td>
					<html:td >
						<html:text name="titleRowNum" id="titleRowNum" styleClass="input-text" size="36"   value="1"/>														
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.colnum#}"/></html:td>
					<html:td >						
						<html:text name="titleColNum" id="titleColNum" styleClass="input-text" size="36"   value="1"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.desc#}"/></html:td>
					<html:td colspan="3">
							<html:textarea name="serviceDesc" id="serviceDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>	
					</html:td>
				</html:tr>
			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('serviceForm')"/>		
						<btn:return href="contoller.do?operation=listSubSystemService&sysId=$[sysId]&columnId=$[columnId]"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>
	
<com:loader   simpleUpload="true"/>	

	</body>
</html>
