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
<com:loader css="css/common/table-list.css" tree="true" switchbox="true" ajax="true"/>

			<jsp:include page="../../common/impart/table-banner.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.group.view.title") %>' name='title'/>	
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.system#}"/></html:td>
					<html:td >						
						<html:select id="sysId" name="sysId"  list="<%=PropKey.SYSTEM_LIST%>" disabled="true">
							<html:option label="sysName" value="sysId"  selected="groupViewBean.sysId"/>
						</html:select>									
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.name#}"/></html:td>
					<html:td >	
						<html:value value="groupViewBean.groupName"/> 											
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
							<html:textarea name="groupDesc" id="groupDesc" styleClass="input-text" cols="40" rows="8" value="groupViewBean.groupDesc" disabled="true"></html:textarea>				
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.group.order#}"/></html:td>
					<html:td >
							<html:value  value="groupViewBean.showOrder"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.status.validate#}"/></html:td>
					<html:td>
					<com:switchbox varValue="groupViewBean.isValidate" talbeName="TB_CMS_Group" idValue="groupViewBean.groupId" offValue="0" varName="isValidate" onValue="1"  idName="groupId" offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do" disabled="true"/>									
					</html:td>
				</html:tr>
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						<btn:return href="contoller.do?operation=listGroup"/>							
				</html:td></html:tr>
			</html:table>	

	
	

	</body>
</html>

							
	