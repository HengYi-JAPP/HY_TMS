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
			<html:hidden id="operation" name="operation" value="addSQLQueryList"/>
			<html:hidden id="checkQueryId" name="checkQueryId" value="checkQueryId"/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.sqlquery.list.add.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.title#}"/></html:td>
					<html:td >
						<html:text name="title" id="title" styleClass="input-text" size="36"   value=""/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.width#}"/></html:td>
					<html:td >
						<html:text name="width" id="width" styleClass="input-text" size="36"   value="30%"/>													
					</html:td>		
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.var#}"/></html:td>
					<html:td >
							<html:text name="varName" id="varName" styleClass="input-text" size="36"   value=""/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.exchange#}"/></html:td>
					<html:td >
						<html:text name="exchange" id="exchange" styleClass="input-text" size="36"   value=""/>													
					</html:td>
				</html:tr>
				<html:tr>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.isview#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isView" varValue="1" idValue="isView" offValue="0" varName="isView" onValue="1"  idName="isView" offLabel="{$jsp.portal.console.plugin.sqlquery.list.isview.no#}" onLabel="{$jsp.portal.console.plugin.sqlquery.list.isview.yes#}"  isSave="false" />														
					</html:td>				
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.target#}"/></html:td>
					<html:td >						
						<html:select id="target" name="target"  >
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.target.self#}" value="_self" />
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.target.blank#}" value="_blank"  />
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.target.parent#}" value="_parent"  />
						</html:select>												
					</html:td>	
									
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.align#}"/></html:td>
					<html:td >						
						<html:select id="align" name="align"  >
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.align.left#}" value="left" />
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.align.center#}" value="center" />
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.align.right#}" value="right" />
						</html:select>																
					</html:td>	
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.valign#}"/></html:td>
					<html:td >
						<html:select id="valign" name="valign"  >
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.valign.top#}" value="top"  />
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.valign.middle#}" value="middle"  />
							<html:option label="{$jsp.portal.console.plugin.sqlquery.list.valign.bottom#}" value="bottom"  />
						</html:select>														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.list.order#}"/></html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text" size="36"   value="999"/>													
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
						<btn:return href="contoller.do?operation=toListSQLQueryList&checkQueryId=$[checkQueryId]"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>

	</body>
</html>