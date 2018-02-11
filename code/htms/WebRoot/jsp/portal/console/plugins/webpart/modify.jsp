<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@page import="com.mobilecn.portal.column.ColumnBean"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
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
<com:loader css="css/common/table-list.css"  />
<html:form id="webForm" name="webForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyWebPart"/>
			<html:hidden id="infoId" name="infoId" value="webPartViewBean.infoId"/>
			<html:hidden id="modifyTime" name="modifyTime" value='<%=tools.tool.DateUtil.getFormatDate("yyyy-MM-dd HH:mm:ss") %>'/>
			<html:hidden id="isValidate" name="isValidate" value="1"/>
			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.plugin.webpart.modify.title") %>' name='title'/>	
			</jsp:include>
			
			<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="systemList" fistOption="{$jsp.common.select.firstoption#}" isCascade="true" isCascadeSource="true" isCascadeEdit="true" cascadeTarget="columnId" >
							<html:option label="sysName" value="sysId" selected="columnViewBean.sysId" />
						</html:select>									
					</html:td>	
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.column#}"/></html:td>
					<html:td >
						<html:select id="columnId" name="columnId"  list="columnList" isCascade="true" isCascadeEdit="true" cascadeSource="sysId" cascadeValue="sysId">
							<html:option label="columnName" value="columnId"  selected="columnViewBean.columnId"/>
						</html:select>	 														
					</html:td>		
					
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.infoname#}"/></html:td>
					<html:td >
							<html:text name="webName" id="webName" styleClass="input-text" size="36"   value="webPartViewBean.webName"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.content#}"/></html:td>
					<html:td >
						<jsp:include page="../../../../common/impart/ckeditor.jsp">
						<jsp:param value="webContent" name="name"/>
						<jsp:param value="$[webPartViewBean.webContent]" name="value"/>
						</jsp:include>											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.webpart.desc#}"/></html:td>
					<html:td >
							<html:textarea name="webDesc" id="webDesc" styleClass="input-text" cols="40" rows="8" value="webPartViewBean.webDesc"></html:textarea>	
					</html:td>
				</html:tr>
			
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('webForm')"/>		
						<btn:return href="contoller.do?operation=listWebPart&infoTypeCode=webPart"/>								
				</html:td></html:tr>
			</html:table>	
			

	</html:form>

	</body>
</html>
