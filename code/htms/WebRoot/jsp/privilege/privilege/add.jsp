<%@ page language="java"  pageEncoding="UTF-8"%>
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
<cext:dic typeCode="<%=PropKey.PRIVILEGE_TYPE_DIC%>" scope="request"/>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css" validator="true"  tree="true"/>
<html:form id="privilegeForm" name="privilegeForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="addPrivilege"/>
			<html:hidden name="isValidate" id="isValidate" value="1"/> 
			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.privilege.add.title") %>' name='title'/>	
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="<%=PropKey.SYSTEM_LIST%>" >
							<html:option label="sysName" value="sysId" />
						</html:select>									
					</html:td>
				</html:tr>			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.code#}"/></html:td>
					<html:td >						
							<html:text name="privCode" id="privCode" styleClass="input-text"/>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.name#}"/></html:td>
					<html:td >	
						<html:text name="privName" id="privName" styleClass="input-text"/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.parent#}"/></html:td>
					<html:td >						
						<com:tree treeList="<%=PropKey.PRIVILEGE_LIST%>" treeName="myTree" useCheckBox="true" chooseStyle="single"  useNodeImage="true" expandAll="1" cacheElementName="privParentId" >
							<com:treeNodeMap name="privName" nodeId="privId" parentId="privParentId" />
						</com:tree>					 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.type#}"/></html:td>
					<html:td >
							<html:select id="privType" name="privType"  list="<%=PropKey.PRIVILEGE_TYPE_DIC%>">
							<html:option label="dicName" value="dicId" />
						</html:select>														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.address#}"/></html:td>
					<html:td >
							<html:text name="privAddr" id="privAddr" styleClass="input-text"/>													
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.desc#}"/></html:td>
					<html:td>
							<html:textarea name="privDesc" id="privDesc" styleClass="input-text" cols="40" rows="8"></html:textarea>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.order#}"/></html:td>
					<html:td >
							<html:text name="privOrder" id="privOrder" styleClass="input-text"/>													
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('privilegeForm')"/>
					
						<btn:return href="contoller.do?operation=listPrivilege"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="privilegeForm" showNormal="true" submitValidate="true">
		<com:vElement id="privCode"  types="isnull,number-letter-underline" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="privName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="privAddr"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="privOrder"  types="number" event="onblur">
			<com:init size="36" maxlength="10" initValue="10"></com:init>
		</com:vElement>
		<com:vElement id="privDesc"  types="none" event="onblur">
			<com:init maxlength="300" initValue=""></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
	
	

	</body>
</html>

							
									