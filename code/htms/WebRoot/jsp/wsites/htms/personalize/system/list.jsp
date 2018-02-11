<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	String columnId =request.getParameter("columnId");
	columnId = columnId==null?"":columnId;
	String picLinkGroupList = "picLinkGroupList_"+columnId;
%>

<portal:system systemList="true" currentSystem="true" scope="session"/>
<html>
	<head>
		<title>用户系统管理</title>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js,js/portal/table-mover.js,js/portal/notip-closewin.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true"/>	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="sysForm" name="sysForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="updateSystem_of_commonSystem"/>
	
		
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/portal/website/pesonal/system/add.jsp"/>
				</html:td>
			</html:tr>
		</html:table>
		
		
		
		<!-- list box 内容列表区 -->
				<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" >
			<html:tr styleClass="dgHeaderStyle"  >
				<html:td width="30px">
					序号		
				</html:td>
				<html:td>
					系统名称		
				</html:td>
				<html:td  width="120px">
					是否默认加载						
				</html:td>
				<html:td  width="80px">
					是否显示						
				</html:td>
				<html:td  width="200px">
					排序
				</html:td>
				<html:td >
					操作
				</html:td>
			</html:tr>
			
			<logic:for beanCollectionsName="<%=PropKey.__SYSTEM_LIST_TAG%>" currBeanName="sysBean" indexName="sysIndex" currBeanScope="request">
				<html:tr  styleClass="dgAlternatingItemStyle">
				<html:td align="center">
					<html:value value="sysIndex"/>	
				</html:td>
				<html:td>
					<html:a  href="contoller.do?operation=viewSelfSystem&sysId=$[sysBean.sysId]">
					<html:value value="sysBean.sysName"/>	
					</html:a>
					<html:hidden id="_sysId" name="_sysId" value="sysBean.sysId"/>
				</html:td>
				<html:td  align="left">	
					<com:switchbox boxName="_isSelect" varValue="sysBean.isSelected"   idValue="sysBean.sysId" offValue="0" varName="_isSelect" onValue="1"  idName="sysId" offLabel="不加载" onLabel="加载"   isSave="false" isSingle="true"/>
				</html:td>
				<html:td  align="left">
					<com:switchbox boxName="_isShow"  varValue="sysBean.isShow"   idValue="sysBean.sysId" offValue="0" varName="_isShow" onValue="1"  idName="sysId" offLabel="不显示" onLabel="显示"   isSave="false"/>						
				</html:td>
				<html:td  align="center">					
					<html:hidden   name="_userOrder" value="sysBean.showOrder" />
					<html:hidden   name="isSystem" value="sysBean.isSystem" />
					<html:span onclick="moveTop(this,{orderElementName:'_userOrder'})" style="cursor:hand">左侧</html:span>
					<html:span onclick="moveUp(this,{orderElementName:'_userOrder'})" style="cursor:hand">左移</html:span>
					<html:span onclick="moveDown(this,{orderElementName:'_userOrder'})" style="cursor:hand">右移</html:span>
					<html:span onclick="moveBottom(this,{orderElementName:'_userOrder'})" style="cursor:hand">右侧</html:span>
				</html:td>
				<html:td >
					<logic:if condition="$[sysBean.isSystem]==0">
						<btn:modify href="contoller.do?operation=viewSelfSystem&isModify=true&sysId=$[sysBean.sysId]"/>
						<btn:delete href="contoller.do?operation=deleteSelfSystem&sysId=$[sysBean.sysId]"/>
					</logic:if>
				</html:td>
				</html:tr>
			
			</logic:for>
			<html:tr  styleClass="dgAlternatingItemStyle">
			<html:td colspan="6" align="center">
					<btn:save href="javascript:submit('sysForm')"/>
					<btn:return href="javascript:closewin();"/>
				</html:td>
				</html:tr>
		</html:table>	
	</html:form>
	
	</body>
</html>




