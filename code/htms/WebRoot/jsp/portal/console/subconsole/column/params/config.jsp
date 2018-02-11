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
<com:loader css="css/common/table-list.css"  switchbox="true"  ajax="true" validator="true"/>
<html:form id="paramsForm" name="paramsForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="toAddSubSystemColumnParams"/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<html:hidden id="columnId" name="columnId" value="checkColumnId"/>
			<jsp:include page="../../../../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.portal.console.column.params.title") %>' name='title'/>		
			</jsp:include>
			
			<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="columnParamsList" bean="columnParamsBean" isHead="true" >				
								
				<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle"  onmouseover="onMouseMoveOverTableList(this)">
					<html:td label="{$jsp.portal.console.column.params.name#}"  styleClass="edit-talbe-label">
						<html:hidden name="paramsId" id="paramsId"  value="columnParamsBean.paramsId"/>			
						<html:hidden name="paramsName" id="paramsName" value="columnParamsBean.paramsName"/>									
						<html:hidden name="paramsVar" id="paramsVar"  value="columnParamsBean.paramsVar"/>
						<html:value value="columnParamsBean.paramsName"/>:
					</html:td>
				
					<html:td  label="{$jsp.portal.console.column.params.value#}" >										
							<html:text name="paramsValue" id="paramsValue" styleClass="input-text" size="20" maxlength="60" value="columnParamsBean.paramsValue"/>									
						
					</html:td>
					<html:td label="{$jsp.portal.console.column.params.defvalue#}" >											
							<html:text name="paramsDefValue" id="paramsDefValue" styleClass="input-text" size="10" maxlength="60" value="columnParamsBean.paramsDefValue"/>									
						
					</html:td>
				
					<html:td label="{$jsp.portal.console.column.params.desc#}" >	
						<html:value value="columnParamsBean.paramsDesc"/>
						<html:hidden name="paramsDesc" id="paramsDesc"  value="columnParamsBean.paramsDesc"/>								
					</html:td>
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('paramsForm')"/>
						<btn:return href="contoller.do?operation=listSubSystemColumn&sysId=$[sysId]"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="paramsForm" showNormal="true" submitValidate="true" >	
		<com:vElement id="columnName"  types="isnull" event="onblur"/>
	</com:validator>
	</html:form>
	
	

	</body>
</html>


