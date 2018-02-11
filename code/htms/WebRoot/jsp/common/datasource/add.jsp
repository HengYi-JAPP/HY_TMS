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
<html:form id="datasourceForm" name="datasourceForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addDatasource"/>
			<html:hidden name="dbsId" id="dbsId"  value="<%=tools.tool.getRandomUUID(64) %>"/>
			<html:hidden name="isValidate" id="isValidate" value="1"/> 
			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.common.datasurce.add.title") %>' name='title'/>		
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				
				<html:tr>
					<html:td styleClass="edit-talbe-label" ><html:value value="{$jsp.common.datasurce.dbsname#}"/></html:td>
					<html:td >						
							<html:text name="dbsName" id="dbsName" styleClass="input-text"/>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.dbtype#}"/></html:td>
					<html:td >	
						<html:select id="dbType" name="dbType"  list="<%=PropKey.DBTYPE_TYPE_DIC%>">
							<html:option label="dicName" value="dicId" />
						</html:select>											
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.dbdriver#}"/></html:td>
					<html:td >
							<html:select id="dbDriver" name="dbDriver"  list="<%=PropKey.DBDRIVER_TYPE_DIC%>">
							<html:option label="dicName" value="dicId" />
						</html:select>														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.dbname#}"/></html:td>
					<html:td >
							<html:text name="dbName" id="dbName" styleClass="input-text"/>													
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.hostip#}"/></html:td>
					<html:td>
							<html:text name="hostIp" id="hostIp" styleClass="input-text"/>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.hostport#}"/></html:td>
					<html:td >
							<html:text name="hostPort" id="hostPort" styleClass="input-text"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:value value="{$jsp.common.datasurce.dbaccount#}"/></html:td>
					<html:td >
							<html:text name="dbAccount" id="dbAccount" styleClass="input-text"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label" ><html:value value="{$jsp.common.datasurce.dbpwd#}"/></html:td>
					<html:td >
							<html:password name="dbPwd" id="dbPwd" styleClass="input-text"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label" ><html:value value="{$jsp.common.datasurce.maxconn#}"/></html:td>
					<html:td >
							<html:text name="maxConn" id="maxConn" styleClass="input-text"/>													
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('datasourceForm')"/>					
						<btn:return href="contoller.do?operation=listDatasource"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="datasourceForm" showNormal="true" submitValidate="true" >
		<com:vElement id="dbsName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="dbName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="hostIp"  types="ip" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="hostPort"  types="number" event="onblur">
			<com:init size="36" maxlength="10"></com:init>
		</com:vElement>
		<com:vElement id="dbAccount"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="dbPwd"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="maxConn"  types="isnull" event="onblur">	
			<com:init size="36" maxlength="10"></com:init>
		</com:vElement>	
	</com:validator>
	</html:form>
	</body>
</html>

	
