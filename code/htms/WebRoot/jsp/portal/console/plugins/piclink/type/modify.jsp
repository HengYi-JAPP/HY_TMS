<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 String currentDate = tools.tool.DateUtil.getFormatDate(null);
 %>
 
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"  switchbox="true" validator="true"/>
<html:form id="piclinkForm" name="piclinkForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyPicLinkType"/>
			<html:hidden name="linkTypeId" id="linkTypeId"   value="picLinkTypeViewBean.linkTypeId"/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.piclinktype.modify.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinktype.typecode#}"/></html:td>
					<html:td >
							<html:text name="linkTypeCode" id="linkTypeCode" styleClass="input-text" size="40"  value="picLinkTypeViewBean.linkTypeCode"/>													
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinktype.name#}"/></html:td>
					<html:td >
							<html:text name="linkTypeName" id="linkTypeName" styleClass="input-text" size="40"  value="picLinkTypeViewBean.linkTypeName"/>													
					</html:td>
				</html:tr>
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinktype.desc#}"/></html:td>
					<html:td >
							<html:textarea name="linkTypeDesc" id="linkTypeDesc" styleClass="input-text" cols="60" rows="8"  value="picLinkTypeViewBean.linkTypeDesc"></html:textarea>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td >						
						<com:switchbox boxId="isValidate" varValue="picLinkTypeViewBean.isValidate" idValue="isValidate" offValue="0" varName="isValidate" onValue="1"  idName="isValidate"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   isSave="false" />									
					</html:td>		
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('piclinkForm')"/>
						<btn:return href="contoller.do?operation=listPicLinkType&sysId=$[sysId]"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="piclinkForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="title"  types="isnull" event="onblur">
		</com:vElement>
		<com:vElement id="linkTypeCode"  types="none" event="onblur">
			<com:init size="40" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="linkTypeName"  types="none" event="onblur">
			<com:init size="40" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="linkTypeDesc"  types="none" event="onblur">
			<com:init maxlength="300" initValue=""></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
	
	

	</body>
</html>