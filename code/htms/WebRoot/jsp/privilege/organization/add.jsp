<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
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
<html:form id="organizationForm" name="organizationForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addOrganization"/>
			<html:hidden name="isValidate" id="isValidate" value="1"/> 
			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.org.add.title") %>' name='title'/>
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.org.code#}"/></html:td>
					<html:td >						
							<html:text name="orgCode" id="orgCode" styleClass="input-text" size="36" maxlength="60" value=""/>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.org.name#}"/></html:td>
					<html:td >	
						<html:text name="orgName" id="orgName" styleClass="input-text" size="36" maxlength="60" value=""/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.org.parent#}"/></html:td>
					<html:td >						
						<com:tree treeList="<%=PropKey.ORGANIZATION_LIST%>" treeName="myTree" useCheckBox="true" chooseStyle="single"  useNodeImage="true" expandAll="1" cacheElementName="orgParentId" >
							<com:treeNodeMap name="orgName" nodeId="orgId" parentId="orgParentId" />
						</com:tree>					 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.org.shotname#}"/></html:td>
					<html:td >
							<html:text name="orgSimpleName" id="orgSimpleName" styleClass="input-text" size="36"  maxlength="60" value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.org.alias#}"/></html:td>
					<html:td >
							<html:text name="orgAlias" id="orgAlias" styleClass="input-text" size="36"  maxlength="60"  value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.org.enname#}"/></html:td>
					<html:td >
							<html:text name="orgEngName" id="orgEngName" styleClass="input-text" size="36"  maxlength="60"  value=""/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.org.desc#}"/></html:td>
					<html:td>
							<html:textarea name="orgDesc" id="orgDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.org.order#}"/></html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text" size="36" maxlength="10" value=""/>													
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('organizationForm')"/>
					
						<btn:return href="contoller.do?operation=listOrganization"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="organizationForm" showNormal="true" submitValidate="true" >
	<com:vElement id="orgCode"  types="isnull,number-letter-underline" event="onblur"/>
	<com:vElement id="orgName"  types="isnull" event="onblur"/>
	</com:validator>
	</html:form>
	
	

	</body>
</html>

							
									
