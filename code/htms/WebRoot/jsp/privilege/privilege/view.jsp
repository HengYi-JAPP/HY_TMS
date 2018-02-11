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
<com:loader css="css/common/table-list.css" validator="true"  tree="true" switchbox="true" ajax="true"/>

			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.privilege.view.title") %>' name='title'/>	
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="<%=PropKey.SYSTEM_LIST%>" disabled="true">
							<html:option label="sysName" value="sysId" selected="privilegeViewBean.sysId"/>
						</html:select>									
					</html:td>
				</html:tr>					
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.code#}"/></html:td>
					<html:td >						
							<html:value value="privilegeViewBean.privCode"/>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.name#}"/></html:td>
					<html:td >	
						<html:value value="privilegeViewBean.privName"/> 											
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
							<html:select id="privType" name="privType"  list="<%=PropKey.PRIVILEGE_TYPE_DIC%>"  disabled="true">
							<html:option label="dicName" value="dicId" selected="privilegeViewBean.privType"/>
						</html:select>														
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.address#}"/></html:td>
					<html:td >
							<html:value  value="privilegeViewBean.privAddr"/>													
					</html:td>
				</html:tr>				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.desc#}"/></html:td>
					<html:td>
							<html:textarea name="privDesc" id="privDesc" styleClass="input-text" cols="40" rows="8" value="privilegeViewBean.privDesc"  disabled="true"></html:textarea>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.privilege.order#}"/></html:td>
					<html:td >
							<html:value value="privilegeViewBean.privDesc"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td>
					<com:switchbox varValue="privilegeViewBean.isValidate" talbeName="TB_CMS_PRIVILEGE" idValue="privilegeViewBean.privId" offValue="0" varName="isValidate" onValue="1"  idName="privId" offLabel="无效" onLabel="有效"  ajaxUrl="contoller.do" disabled="true"/>									
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=listPrivilege"/>							
				</html:td></html:tr>
			</html:table>	
	
	</body>
</html>

							
									
