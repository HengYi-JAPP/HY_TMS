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
<html:form id="refForm" name="refForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifySubSystemWebRef"/>			
			<html:hidden id="modifyTime" name="modifyTime" value='<%=tools.tool.DateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss") %>'/>
			<html:hidden id="createTime" name="createTime" value='<%=tools.tool.DateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss") %>'/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<html:hidden id="columnId" name="columnId" value="columnId"/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.webref.config.title") %>' name='title'/>
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">		
			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.infoname#}"/></html:td>
					<html:td >
						<logic:if notNull="webRefViewBean.refName">
							<html:text name="refName" id="refName" styleClass="input-text" size="36"   value="webRefViewBean.refName"/>
						</logic:if>	
						<logic:if isNull="webRefViewBean.refName">
							<html:text name="refName" id="refName" styleClass="input-text" size="36"   value=""/>
						</logic:if>														
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webref.reflink#}"/></html:td>
					<html:td >
						<logic:if notNull="webRefViewBean.refLink">
							<html:text name="refLink" id="refLink" styleClass="input-text" size="36"   value="webRefViewBean.refLink"/>
						</logic:if>	
						<logic:if isNull="webRefViewBean.refLink">
							<html:text name="refLink" id="refLink" styleClass="input-text" size="36"   value=""/>
						</logic:if>	
												
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.desc#}"/></html:td>
					<html:td colspan="3">
						<logic:if notNull="webRefViewBean.refDesc">
							<html:textarea name="refDesc" id="refDesc" styleClass="input-text" cols="40" rows="8" value="webRefViewBean.refDesc"></html:textarea>
						</logic:if>	
						<logic:if isNull="webRefViewBean.refDesc">
							<html:textarea name="refDesc" id="refDesc" styleClass="input-text" cols="40" rows="8" ></html:textarea>
						</logic:if>		
					</html:td>
				</html:tr>
			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('refForm')" onclick="alert('{$jsp.portal.console.plugin.webpart.savesucc#}')"/>									
				</html:td></html:tr>
			</html:table>	
			

	</html:form>
	
<com:loader   simpleUpload="true"/>	

	</body>
</html>
