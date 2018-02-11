<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
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

			<jsp:include page="../../../../common/impart/table-banner.jsp">
				<jsp:param value='View Channel Composite' name='title'/>	
			</jsp:include>
			
<html:table  styleClass="edit-talbe" align="center" cellPadding="0" cellSpacing="0">	
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.channel.name#}"/></html:td>
					<html:td >			
					
					<html:label label="$[channelViewBean.channelName]"></html:label>							
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.column.name#}"/></html:td>
					<html:td >						
						<html:select id="columnId" name="columnId"  list="columnList" bean="columnBean" disabled="true">
							<html:option label="columnName" value="columnId" selected="compositeViewBean.columnId"/>
						</html:select>									
					</html:td>
				</html:tr>			
				
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.operation.composite.showname#}"/></html:td>
					<html:td >	
						<html:value value="compositeViewBean.showName"/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.icon.before#}"/></html:td>
					<html:td >		
						<html:img src="compositeViewBean.beforeIcon"/>								
					</html:td>	
				</html:tr>
				<html:tr>			
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.icon.after#}"/></html:td>
					<html:td >
						<html:img src="compositeViewBean.afterIcon"/>													
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.portal.console.plugin.piclinkgroup.order#}"/></html:td>
					<html:td >	
						<html:value value="compositeViewBean.showOrder"/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.operation.composite.showheight#}"/></html:td>
					<html:td >	
						<html:value value="compositeViewBean.showHeight"/> 											
					</html:td>
				</html:tr>
				<html:tr>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.common.operation.composite.parentname#}"/></html:td>
					<html:td >						
						<com:tree treeList="compositeList" checkedTreeList="checkedCompositeList" treeName="myTree" useCheckBox="true" chooseStyle="single"  useNodeImage="true" expandAll="1" cacheElementName="parentId" >
							<com:treeNodeMap name="showName" nodeId="ccId" parentId="parentId" />
						</com:tree>					 											
					</html:td>
				</html:tr>
				
			</html:table>
			
			<html:table  cellSpacing="0"  align="center" isHead="false" >
				<html:tr ><html:td >
						
					
						<btn:return href="contoller.do?operation=listChannelComposite&channelId=$[channelId]&sysId=$[sysId]"/>							
				</html:td></html:tr>
			</html:table>	
	
	
	

	</body>
</html>

							
									
