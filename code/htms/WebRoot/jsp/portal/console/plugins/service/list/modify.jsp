<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../../common/impart/taglib.jsp"%>
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
<com:loader css="css/common/table-list.css" switchbox="true" ajax="true" />
<html:form id="listForm" name="listForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyServiceList"/>
			<html:hidden id="checkServiceId" name="checkServiceId" value="checkServiceId"/>
			<html:hidden id="configId" name="configId" value="serviceListViewBean.configId"/>
			<html:hidden id="isValidate" name="isValidate" value="serviceListViewBean.isValidate"/>
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.service.list.modify.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.list.title#}"/></html:td>
					<html:td >
						<html:text name="title" id="title" styleClass="input-text" size="36"   value="serviceListViewBean.title"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.list.width#}"/></html:td>
					<html:td >
						<html:text name="width" id="width" styleClass="input-text" size="36"   value="serviceListViewBean.width"/>													
					</html:td>		
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.list.var#}"/></html:td>
					<html:td >
							<html:text name="varName" id="varName" styleClass="input-text" size="36"   value="serviceListViewBean.varName"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.list.excdefine#}"/></html:td>
					<html:td >
						<html:text name="exchange" id="exchange" styleClass="input-text" size="36"   value="serviceListViewBean.exchange"/>													
					</html:td>
				</html:tr>
				<html:tr>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.list.isview#}"/></html:td>
					<html:td >
						<com:switchbox  boxId="isView"  varValue="serviceListViewBean.isValidate" idValue="isView" offValue="0" varName="isView" onValue="1"  idName="isView"  offLabel="{$jsp.portal.console.plugin.service.list.isview.no#}" onLabel="{$jsp.portal.console.plugin.service.list.isview.yes#}"   isSave="false" />														
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.list.openstyle#}"/></html:td>
					<html:td >						
						<html:select id="target" name="target"  >
							<html:option label="{$jsp.portal.console.plugin.service.list.openstyle.self#}" value="_self" selected="serviceListViewBean.target"/>
							<html:option label="{$jsp.portal.console.plugin.service.list.openstyle.blank#}" value="_blank"  selected="serviceListViewBean.target"/>
							<html:option label="{$jsp.portal.console.plugin.service.list.openstyle.parent#}" value="_parent"  selected="serviceListViewBean.target"/>
						</html:select>																
					</html:td>	
									
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.list.align#}"/></html:td>
					<html:td >						
						<html:select id="align" name="align"  >
							<html:option label="{$jsp.portal.console.plugin.service.list.align.left#}" value="left"  selected="serviceListViewBean.align"/>
							<html:option label="{$jsp.portal.console.plugin.service.list.align.center#}" value="center"  selected="serviceListViewBean.align"/>
							<html:option label="{$jsp.portal.console.plugin.service.list.align.right#}" value="right"  selected="serviceListViewBean.align"/>
						</html:select>															
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.list.valign#}"/>：</html:td>
					<html:td >
						<html:select id="valign" name="valign"  >
							<html:option label="{$jsp.portal.console.plugin.service.list.valign.top#}" value="top"  selected="serviceListViewBean.valign"/>
							<html:option label="{$jsp.portal.console.plugin.service.list.valign.middle#}" value="middle"  selected="serviceListViewBean.valign"/>
							<html:option label="{$jsp.portal.console.plugin.service.list.valign.bottom#}" value="bottom"  selected="serviceListViewBean.valign"/>
						</html:select>														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.service.list.order#}"/></html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text" size="36"   value="serviceListViewBean.showOrder"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label">&nbsp;</html:td>
					<html:td >
						&nbsp;													
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('listForm')"/>		
						<btn:return href="contoller.do?operation=toListServiceList&checkServiceId=$[checkServiceId]"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>

	</body>
</html>
