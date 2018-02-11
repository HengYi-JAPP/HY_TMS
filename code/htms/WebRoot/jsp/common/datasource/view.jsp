<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/comp-extends.tld" prefix="cext"%>
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
<com:loader css="css/common/table-list.css" validator="true"  tree="true"/>
<cext:dic typeCode="<%=PropKey.DBTYPE_TYPE_DIC%>" scope="request"/>
<cext:dic typeCode="<%=PropKey.DBDRIVER_TYPE_DIC%>"  scope="request"/>

			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.common.datasurce.view.title") %>' name='title'/>	
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.dbsname#}"/></html:td>
					<html:td >						
							<html:value value="datasourceViewBean.dbsName"/>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.dbtype#}"/></html:td>
					<html:td >	
						<html:select id="dbType" name="dbType"  list="<%=PropKey.DBTYPE_TYPE_DIC%>"  disabled="true">
							<html:option label="dicName" value="dicId"  selected="datasourceViewBean.dbType"/>
						</html:select>											
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.dbdriver#}"/></html:td>
					<html:td >
							<html:select id="dbDriver" name="dbDriver"  list="<%=PropKey.DBDRIVER_TYPE_DIC%>" disabled="true">
							<html:option label="dicName" value="dicId"  selected="datasourceViewBean.dbDriver"/>
						</html:select>														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.dbname#}"/></html:td>
					<html:td >
							<html:value  value="datasourceViewBean.dbName"/>													
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.hostip#}"/></html:td>
					<html:td>
							<html:value  value="datasourceViewBean.hostIp"/>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.hostport#}"/></html:td>
					<html:td >
							<html:value  value="datasourceViewBean.hostPort"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.dbaccount#}"/></html:td>
					<html:td >
							<html:value  value="datasourceViewBean.dbAccount"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.dbpwd#}"/></html:td>
					<html:td >
							<html:password name="dbPwd" id="dbPwd" styleClass="input-text" size="36"  value="datasourceViewBean.dbPwd" disabled="true"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.maxconn#}"/></html:td>
					<html:td >
							<html:value  value="datasourceViewBean.maxConn"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.vstatus#}"/></html:td>
					<html:td>
					<com:switchbox varValue="datasourceViewBean.isValidate" talbeName="TB_DATASOURCE" idValue="datasourceViewBean.dbsId" offValue="0" varName="isValidate" onValue="1"  idName="dbsId" offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do"  disabled="true"/>									
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >					
						<btn:return href="contoller.do?operation=listDatasource"/>							
				</html:td></html:tr>
			</html:table>	
	</body>
</html>

	


