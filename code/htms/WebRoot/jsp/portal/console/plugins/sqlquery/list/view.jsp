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
			
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.sqlquery.list.view.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.title#}"/></html:td>
					<html:td >
						<html:text name="title" id="title" styleClass="input-text" size="36"   value="sqlqueryListViewBean.title"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.width#}"/></html:td>
					<html:td >
						<html:value  value="sqlqueryListViewBean.width"/>													
					</html:td>		
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.var#}"/></html:td>
					<html:td >
							<html:value value="sqlqueryListViewBean.varName"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.exchange#}"/></html:td>
					<html:td >
						<html:value  value="sqlqueryListViewBean.exchange"/>													
					</html:td>
				</html:tr>
				<html:tr>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.isview#}"/></html:td>
					<html:td >
						<com:switchbox  disabled="true" varValue="sqlqueryListViewBean.isValidate" idValue="isView" offValue="0" varName="isView" onValue="1"  idName="isView"  offLabel="{$jsp.portal.console.plugin.sqlquery.list.isview.no#}" onLabel="{$jsp.portal.console.plugin.sqlquery.list.isview.yes#}"   isSave="false" />														
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.target#}"/></html:td>
					<html:td >						
						<html:select  disabled="true">
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.target.self#}" value="_self" selected="sqlqueryListViewBean.target"/>
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.target.blank#}" value="_blank"  selected="sqlqueryListViewBean.target"/>
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.target.parent#}" value="_parent"  selected="sqlqueryListViewBean.target"/>
						</html:select>															
					</html:td>	
									
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.align#}"/></html:td>
					<html:td >						
						<html:select  disabled="true" >
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.align.left#}" value="left"  selected="sqlqueryListViewBean.align"/>
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.align.center#}" value="center"  selected="sqlqueryListViewBean.align"/>
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.align.right#}" value="right"  selected="sqlqueryListViewBean.align"/>
						</html:select>															
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.valign#}"/></html:td>
					<html:td >
						<html:select disabled="true">
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.valign.top#}" value="top"  selected="sqlqueryListViewBean.valign"/>
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.valign.middle#}" value="middle"  selected="sqlqueryListViewBean.valign"/>
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.valign.bottom#}" value="bottom"  selected="sqlqueryListViewBean.valign"/>
						</html:select>														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.order#}"/></html:td>
					<html:td >
							<html:value   value="sqlqueryListViewBean.showOrder"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label">&nbsp;</html:td>
					<html:td >
						&nbsp;													
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >		
						<btn:return href="contoller.do?operation=toListSQLQueryList&checkQueryId=$[checkQueryId]"/>								
				</html:td></html:tr>
			</html:table>	

	</body>
</html>
