<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.plugins.sqlquery.SQLQueryBean"%>
<%@ include file="../../../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	SQLQueryBean queryBean =(SQLQueryBean)request.getAttribute("sqlqueryViewBean");
	queryBean = queryBean==null?new SQLQueryBean():queryBean;
 %>
 
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"  switchbox="true"/>
			
			<jsp:include page="../../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.sqlquery.view.title") %>' name='title'/>
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.name#}"/></html:td>
					<html:td >
							<html:value  value="sqlqueryViewBean.queryName"/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.datasource#}"/></html:td>
					<html:td >
							<html:select id="dbsId" name="dbsId"  list="datasourceList"  disabled="true">
								<html:option label="dbsName" value="dbsId" selected="sqlqueryViewBean.dbsId"/>
							</html:select>														
					</html:td>
				</html:tr>
				</html:table>
				<html:table   styleClass="edit-talbe" cellSpacing="0"  align="center" isHead="false" >
				
				<html:tr>
					<html:td styleClass="edit-talbe-label" style="text-align:left;" align="left"><html:label label="{$jsp.portal.console.plugin.sqlquery.indexsql#}"/></html:td>
				</html:tr>
				<html:tr>
					<html:td>
							<html:textarea disabled="true" name="indexSQL" id="indexSQL" styleClass="input-text" cols="60" rows="3"   value="sqlqueryViewBean.indexSQL"></html:textarea>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label" style="text-align:left;" align="left"><html:label label="{$jsp.portal.console.plugin.sqlquery.listsql#}"/></html:td>
				</html:tr>
				<html:tr>
					<html:td>
							<html:textarea disabled="true" name="listSQL" id="listSQL" styleClass="input-text" cols="60" rows="3"  value="sqlqueryViewBean.listSQL"></html:textarea>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label" style="text-align:left;" align="left"><html:label label="{$jsp.portal.console.plugin.sqlquery.viewsql#}"/></html:td>
				</html:tr>
				<html:tr>
					<html:td>
							<html:textarea disabled="true" name="viewSQL" id="viewSQL" styleClass="input-text" cols="60" rows="3"  value="sqlqueryViewBean.viewSQL"></html:textarea>	
					</html:td>
				</html:tr>
			</html:table>
				<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.showstyle#}"/></html:td>
					<html:td >
						<html:select id="showStyle" name="showStyle"   disabled="true">
							<html:option label="{$jsp.portal.console.plugin.sqlquery.showstyle.horizontal#}" value="horizontal"  selected="sqlqueryViewBean.showStyle"/>
							<html:option label="{$jsp.portal.console.plugin.sqlquery.showstyle.vertical#}" value="vertical"  selected="sqlqueryViewBean.showStyle"/>
							<html:option label="{$jsp.portal.console.plugin.sqlquery.showstyle.horizontalavg#}" value="horizontalAvg"  selected="sqlqueryViewBean.showStyle"/>
							<html:option label="{$jsp.portal.console.plugin.sqlquery.showstyle.verticalavg#}" value="verticalAvg"  selected="sqlqueryViewBean.showStyle"/>
						</html:select>														
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.shownum#}"/></html:td>
					<html:td >						
						<html:value  value="sqlqueryViewBean.showNum"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.showtitle#}"/></html:td>
					<html:td >
						<com:switchbox boxId="isShowTitle" varValue="sqlqueryViewBean.isShowTitle" talbeName="TB_CMS_INFO_SERVICE" idValue="sqlqueryViewBean.queryId" offValue="0" varName="isShowTitle" onValue="1"  idName="queryId"  offLabel="{$jsp.portal.console.plugin.sqlquery.showtitle.no#}" onLabel="{$jsp.portal.console.plugin.sqlquery.showtitle.yes#}"   ajaxUrl="contoller.do" isSave="false"/>												
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.showlen#}"/></html:td>
					<html:td >						
						<html:value  value="sqlqueryViewBean.showLength"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.replace#}"/></html:td>
					<html:td >
						<%=queryBean.getReplaceString() %>									
					 </html:td>		
					 <html:td styleClass="edit-talbe-label">&nbsp;</html:td>
					<html:td >&nbsp;</html:td>					
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.colnum#}"/></html:td>
					<html:td >
						<html:value  value="sqlqueryViewBean.titleRowNum"/>														
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.rownum#}"/></html:td>
					<html:td >						
						<html:value  value="sqlqueryViewBean.titleColNum"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.desc#}"/></html:td>
					<html:td colspan="3">
							<html:textarea  disabled="true" name="queryDesc" id="queryDesc" styleClass="input-text" cols="40" rows="8"   value="sqlqueryViewBean.queryDesc"></html:textarea>	
					</html:td>
				</html:tr>
			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >		
						<btn:return href="contoller.do?operation=listSubSystemSQLQuery&sysId=$[sysId]&columnId=$[columnId]"/>								
				</html:td></html:tr>
			</html:table>	
			


	</body>
</html>



