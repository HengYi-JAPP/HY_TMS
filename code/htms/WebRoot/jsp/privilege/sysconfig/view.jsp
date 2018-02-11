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
<com:loader css="css/common/table-list.css"  switchbox="true" ajax="true"/>
			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.sysconfig.view.title") %>' name='title'/>	
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.type#}"/></html:td>
					<html:td >						
							<html:select name="configType" id="configType">
								<html:option label="{$jsp.privilege.sysconfig.type.file#}" value="config-file"></html:option>
								<html:option label="{$jsp.privilege.sysconfig.type.page#}" value="page-config"></html:option>
								<html:option label="{$jsp.privilege.sysconfig.type.other#}" value="other-config"></html:option>
							</html:select>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.code#}"/></html:td>
					<html:td >						
							<html:value value="configViewBean.configCode"/>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.name#}"/></html:td>
					<html:td >	
						<html:value value="configViewBean.configName"/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.content#}"/></html:td>
					<html:td>
							<html:value value="configViewBean.configContent"/>				
					</html:td>
				</html:tr>	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.desc#}"/></html:td>
					<html:td>
							<html:value value="configViewBean.configDesc"/>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.version#}"/></html:td>
					<html:td >
							<html:value value="configViewBean.versionNo"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.sysconfig.isref#}"/></html:td>
					<html:td >
							<com:switchbox boxId="isRef" boxName="isRef" varValue="configViewBean.isRef" talbeName="TB_SYSTEM" disabled="true" idValue="isRef" offValue="0" varName="isRef" onValue="1"  idName="isRef" offLabel="{$jsp.privilege.sysconfig.isref.no#}" onLabel="{$jsp.privilege.sysconfig.isref.yes#}"  ajaxUrl="contoller.do" isSave="false"/>												
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=listSysConfig&sysId=$[sysId]"/>							
				</html:td></html:tr>
			</html:table>	
	</body>
</html>

	
