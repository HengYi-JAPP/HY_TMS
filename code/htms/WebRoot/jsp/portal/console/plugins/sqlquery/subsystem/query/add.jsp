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
<html:form id="queryForm" name="queryForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addSubSystemSQLQuery"/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<html:hidden id="columnId" name="columnId" value="columnId"/>
			<jsp:include page="../../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.sqlquery.add.title") %>' name='title'/>			
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.name#}"/></html:td>
					<html:td >
							<html:text name="queryName" id="queryName" styleClass="input-text" size="36"   value=""/>													
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.datasource#}"/></html:td>
					<html:td >
							<html:select id="dbsId" name="dbsId"  list="datasourceList" >
								<html:option label="dbsName" value="dbsId" />
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
							<html:textarea name="indexSQL" id="indexSQL" styleClass="input-text" cols="60" rows="3"></html:textarea>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label" style="text-align:left;" align="left"><html:label label="{$jsp.portal.console.plugin.sqlquery.listsql#}"/></html:td>
				</html:tr>
				<html:tr>
					<html:td>
							<html:textarea name="listSQL" id="listSQL" styleClass="input-text" cols="60" rows="3"></html:textarea>	
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label" style="text-align:left;" align="left"><html:label label="{$jsp.portal.console.plugin.sqlquery.viewsql#}"/></html:td>
				</html:tr>
				<html:tr>
					<html:td>
							<html:textarea name="viewSQL" id="viewSQL" styleClass="input-text" cols="60" rows="3"></html:textarea>	
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table   styleClass="edit-talbe" cellSpacing="0"  align="center" isHead="false" >
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.showstyle#}"/></html:td>
					<html:td >
						<html:select id="showStyle" name="showStyle"  >
							<html:option label="{$jsp.portal.console.plugin.sqlquery.showstyle.horizontal#}" value="horizontal"  />
							<html:option label="{$jsp.portal.console.plugin.sqlquery.showstyle.vertical#}" value="vertical"  />
							<html:option label="{$jsp.portal.console.plugin.sqlquery.showstyle.horizontalavg#}" value="horizontalAvg"  />
							<html:option label="{$jsp.portal.console.plugin.sqlquery.showstyle.verticalavg#}" value="verticalAvg"  />
						</html:select>													
																			
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.shownum#}"/></html:td>
					<html:td >						
						<html:text name="showNum" id="showNum" styleClass="input-text" size="36"   value="6"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.showtitle#}"/></html:td>
					<html:td >
						<html:select id="isShowTitle" name="isShowTitle"  >
							<html:option label="{$jsp.portal.console.plugin.sqlquery.showtitle.yes#}" value="1" />
							<html:option label="{$jsp.portal.console.plugin.sqlquery.showtitle.no#}" value="0" />
						</html:select>														
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.showlen#}"/></html:td>
					<html:td >						
						<html:text name="showLength" id="showLength" styleClass="input-text" size="36"   value="6"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.replace#}"/></html:td>
					<html:td >						
						<input type="text" name="replaceString" id="replaceString" class="input-text" size="36"   value="..."/>									
					</html:td>			
					<html:td styleClass="edit-talbe-label">&nbsp;</html:td>
					<html:td >&nbsp;</html:td>
									
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.colnum#}"/></html:td>
					<html:td >
						<html:text name="titleRowNum" id="titleRowNum" styleClass="input-text" size="36"   value="1"/>														
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.rownum#}"/></html:td>
					<html:td >						
						<html:text name="titleColNum" id="titleColNum" styleClass="input-text" size="36"   value="1"/>									
					</html:td>							
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.sqlquery.desc#}"/></html:td>
					<html:td colspan="3">
							<html:textarea name="queryDesc" id="queryDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>	
					</html:td>
				</html:tr>
			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('queryForm')"/>		
						<btn:return href="contoller.do?operation=listSubSystemSQLQuery&sysId=$[sysId]&columnId=$[columnId]"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>
	
<com:loader   simpleUpload="true"/>	

	</body>
</html>
