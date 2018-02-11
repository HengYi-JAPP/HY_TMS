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
<com:loader css="css/common/table-list.css" validator="true"  tree="true" switchbox="true" ajax="true"/>
<html:form id="groupForm" name="groupForm" method="post" action="contoller.do">
			<html:hidden id="operation" name="operation" value="modifyGroup"/>
			<html:hidden name="groupId" id="groupId"  value="groupViewBean.groupId"/>

			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.group.modify.title") %>' name='title'/>
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="<%=PropKey.SYSTEM_LIST%>">
							<html:option label="sysName" value="sysId"  selected="groupViewBean.sysId"/>
						</html:select>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.name#}"/></html:td>
					<html:td >	
						<html:text name="groupName" id="groupName" styleClass="input-text" value="groupViewBean.groupName"/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.parent#}"/></html:td>
					<html:td >						
						<com:tree treeList="groupList"  treeName="myTree"  checkedTreeList="groupCheckedList" useCheckBox="true" chooseStyle="single"  useNodeImage="true" expandAll="1" cacheElementName="groupParentId" >
							<com:treeNodeMap name="groupName" nodeId="groupId" parentId="groupParentId" />
						</com:tree>					 											
					</html:td>
				</html:tr>			
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.desc#}"/></html:td>
					<html:td>
							<html:textarea name="groupDesc" id="groupDesc" styleClass="input-text" cols="40" rows="8" value="groupViewBean.groupDesc"></html:textarea>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.order#}"/></html:td>
					<html:td >
							<html:text name="showOrder" id="showOrder" styleClass="input-text" value="groupViewBean.showOrder"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td>
					<com:switchbox varValue="groupViewBean.isValidate" talbeName="TB_CMS_Group" idValue="groupViewBean.groupId" offValue="0" varName="isValidate" onValue="1"  idName="groupId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do"/>									
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:save href="javascript:__vsubmit('groupForm')"/>
					
						<btn:return href="contoller.do?operation=listGroup"/>							
				</html:td></html:tr>
			</html:table>	
			
	<com:validator formId="groupForm" showNormal="true" submitValidate="true" >
		<com:vElement id="groupName"  types="isnull" event="onblur">
			<com:init size="36" maxlength="60" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="groupDesc"  types="none" event="onblur">
			<com:init maxlength="300" initValue=""></com:init>
		</com:vElement>
		<com:vElement id="showOrder"  types="number" event="onblur">
			<com:init size="36" maxlength="10" initValue=""></com:init>
		</com:vElement>
	</com:validator>
	</html:form>
	
	

	</body>
</html>

							
	