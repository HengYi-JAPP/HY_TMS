<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/comp-extends.tld" prefix="cext"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

 %>

<cext:priv code="_subsystem_privilege_manage_modify">  
<html>
<head>
<base href="<%=basePath%>">
</head>
<body>
<cext:dic typeCode="<%=PropKey.PRIVILEGE_TYPE_DIC%>" scope="request"/>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css" validator="true"  tree="true" switchbox="true" ajax="true"/>
<html:form id="privilegeForm" name="privilegeForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifySubSystemPrivilege"/>
			<html:hidden id="sysId" name="sysId" value="sysId"/>
			<html:hidden name="privId" id="privId"  value="privilegeViewBean.privId"/>
			<jsp:include page="../../../common/impart/table-banner-new.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.privilege.modify.title") %>' name='title'/>		
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.code#}"/></html:td>
					<html:td >						
							<html:text name="privCode" id="privCode" styleClass="input-text" value="privilegeViewBean.privCode"/>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.name#}"/></html:td>
					<html:td >	
						<html:text name="privName" id="privName" styleClass="input-text" value="privilegeViewBean.privName"/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.parent#}"/></html:td>
					<html:td >						
						<com:tree treeList="<%=PropKey.PRIVILEGE_LIST%>" checkedTreeList="privilegeCheckedList" treeName="myTree" useCheckBox="true" chooseStyle="single"  useNodeImage="true" expandAll="1" cacheElementName="privParentId" >
							<com:treeNodeMap name="privName" nodeId="privId" parentId="privParentId" />
						</com:tree>					 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.type#}"/></html:td>
					<html:td >
							<html:select id="privType" name="privType"  list="<%=PropKey.PRIVILEGE_TYPE_DIC%>">
							<html:option label="dicName" value="dicId" selected="privilegeViewBean.privType"/>
						</html:select>														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.address#}"/></html:td>
					<html:td >
							<html:text name="privAddr" id="privAddr" styleClass="input-text" value="privilegeViewBean.privAddr"/>													
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.desc#}"/></html:td>
					<html:td>
							<html:textarea name="privDesc" id="privDesc" styleClass="input-text" cols="40" rows="8" value="privilegeViewBean.privDesc"></html:textarea>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.order#}"/></html:td>
					<html:td >
							<html:text name="privOrder" id="privOrder" styleClass="input-text" value="privilegeViewBean.privOrder"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td>
					<com:switchbox varValue="privilegeViewBean.isValidate" talbeName="TB_CMS_PRIVILEGE" idValue="privilegeViewBean.privId" offValue="0" varName="isValidate" onValue="1"  idName="privId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do"/>									
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
					<cext:priv code="_subsystem_privilege_manage_modify_save"> 
						<btn:save href="javascript:__vsubmit('privilegeForm')"/>
					</cext:priv>
					<cext:priv code="_subsystem_privilege_manage_modify_return"> 
						<btn:return href="contoller.do?operation=listSubSystemPrivilege&sysId=$[sysId]"/>
					</cext:priv>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="privilegeForm" showNormal="true" submitValidate="true" >
		<com:vElement id="privCode"  types="isnull,number-letter-underline" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="privName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="privAddr"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="privOrder"  types="isnull" event="onblur">
			<com:init size="36" maxlength="10" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="privDesc"  types="none" event="onblur">
			<com:init maxlength="300" initValue=""></com:init>
		</com:vElement>
	</com:validator>
	</html:form>


	</body>
</html>
</cext:priv>

							
									
