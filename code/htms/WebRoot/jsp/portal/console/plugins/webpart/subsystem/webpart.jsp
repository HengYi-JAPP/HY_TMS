<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
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
<com:loader css="css/common/table-list.css" validator="true" />
<html:form id="webForm" name="webForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifySubSystemWebPart"/>			
			<html:hidden id="modifyTime" name="modifyTime" value='<%=tools.tool.DateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss") %>'/>
			<html:hidden id="createTime" name="createTime" value='<%=tools.tool.DateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss") %>'/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<html:hidden id="columnId" name="columnId" value="columnId"/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.webpart.config.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">		
			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.infoname#}"/></html:td>
					<html:td >
						<logic:if notNull="webPartViewBean.webName">
							<html:text name="webName" id="webName" styleClass="input-text" value="webPartViewBean.webName"/>
						</logic:if>	
						<logic:if isNull="webPartViewBean.webName">
							<html:text name="webName" id="webName" styleClass="input-text"/>
						</logic:if>														
					</html:td>	
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.content#}"/></html:td>
					<html:td >	
						<jsp:include page="../../../../../common/impart/ckeditor.jsp">
						<jsp:param value="webContent" name="name"/>
						<jsp:param value="$[webPartViewBean.webContent]" name="value"/>
						</jsp:include>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.desc#}"/></html:td>
					<html:td>
						<logic:if notNull="webPartViewBean.webDesc">
							<html:textarea name="webDesc" id="webDesc" styleClass="input-text" cols="40" rows="8" value="webPartViewBean.webDesc"></html:textarea>
						</logic:if>	
						<logic:if isNull="webPartViewBean.webDesc">
							<html:textarea name="webDesc" id="webDesc" styleClass="input-text" cols="40" rows="8" ></html:textarea>
						</logic:if>		
					</html:td>
				</html:tr>
			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('webForm')" onclick="alert('{$jsp.portal.console.plugin.webpart.savesucc#}')"/>									
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="newsForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="webName"  types="isnull" event="onblur">
			<com:init size="80" maxlength="300" ></com:init>
		</com:vElement>
		<com:vElement id="webDesc"  types="none" event="onblur">
			<com:init maxlength="300" initValue=""></com:init>
		</com:vElement>
	</com:validator>
	</html:form>


	</body>
</html>
