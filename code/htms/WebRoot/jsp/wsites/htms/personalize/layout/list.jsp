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
		
%>

<html>
	<head>
		<title><html:label label="{$jsp.portal.website.personalize.layout.config#}" /></title>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js,js/portal/table-mover.js,js/portal/notip-closewin.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true"/>	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="layoutForm" name="layoutForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="updateLayout_of_commonSystem"/>
		<html:hidden   name="sysId" value="sysId" />
		<html:hidden   name="currentSysCode" value="currentSysCode" />
		<html:hidden   name="channelId" value="channelId" />
		
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="contoller.do?operation=loadColumns4UserDefineLayout&currentSysCode=$[currentSysCode]&sysId=$[sysId]&channelId=$[channelId]"/>
				</html:td>
			</html:tr>
		</html:table>
		
		
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" >
			<html:tr styleClass="dgHeaderStyle"  >
				<html:td width="80px">
					<html:label label="{$jsp.portal.website.personalize.layout.order#}" />
				</html:td>
				<html:td>
					<html:label label="{$jsp.portal.website.personalize.layout.name#}" />	
				</html:td>
				<html:td  width="120px">
					<html:label label="{$jsp.portal.website.personalize.layout.defaultload#}" />						
				</html:td>
				<html:td  width="80px">
					<html:label label="{$jsp.portal.website.personalize.layout.isshow#}" />						
				</html:td>
				<html:td  width="280px">
					<html:label label="{$jsp.portal.website.personalize.layout.sort#}" />
				</html:td>
				<html:td width="280px">
					<html:label label="{$jsp.portal.website.personalize.layout.operation#}" />
				</html:td>
			</html:tr>
			
			<logic:for beanCollectionsName="personalizeLayoutList" currBeanName="layoutBean" indexName="layoutIndex" currBeanScope="request">
				<html:tr  styleClass="dgAlternatingItemStyle">
				<html:td align="center">
					<html:value value="layoutIndex"/>	
				</html:td>
				<html:td>
					<html:a  href="contoller.do?operation=viewUserDefineLayout&currentSysCode=$[currentSysCode]&sysId=$[sysId]&channelId=$[channelId]&layoutId=$[layoutBean.layoutId]">
					<html:value value="layoutBean.layoutName"/>	
					</html:a>
					<html:hidden id="_layoutId" name="_layoutId" value="layoutBean.layoutId"/>
				</html:td>
				<html:td  align="left">	
					<com:switchbox boxName="_isSelect" varValue="layoutBean.defaultSelect"   idValue="layoutBean.layoutId" offValue="0" varName="_isCurrent" onValue="1"  idName="layoutId" offLabel="{$jsp.portal.website.personalize.noload#}" onLabel="{$jsp.portal.website.personalize.load#}"   isSave="false" isSingle="true"/>
				</html:td>
				<html:td  align="left">
					<com:switchbox boxName="_isShow"  varValue="layoutBean.defaultShow"   idValue="layoutBean.layoutId" offValue="0" varName="_isShow" onValue="1"  idName="layoutId" offLabel="{$jsp.portal.website.personalize.noshow#}" onLabel="{$jsp.portal.website.personalize.show#}"   isSave="false"/>						
				</html:td>
				<html:td  align="center" style="display:inline;">					
					<html:hidden   name="_showOrder" value="layoutBean.defaultOrder" />
					<html:hidden   name="isSystem" value="layoutBean.isSystem" />
					<html:span onclick="moveTop(this,{orderElementName:'_showOrder'})" style="cursor:hand;float:left;padding-left:10px;">
						<html:label label="{$jsp.portal.website.personalize.order.forefront#}"/>	
					</html:span>
					<html:span onclick="moveUp(this,{orderElementName:'_showOrder'})" style="cursor:hand;float:left;padding-left:10px;">
						<html:label label="{$jsp.portal.website.personalize.order.forward#}"/>	
					</html:span>
					<html:span onclick="moveDown(this,{orderElementName:'_showOrder'})" style="cursor:hand;float:left;padding-left:10px;">
						<html:label label="{$jsp.portal.website.personalize.order.backward#}"/>	
					</html:span>
					<html:span onclick="moveBottom(this,{orderElementName:'_showOrder'})" style="cursor:hand;float:left;padding-left:10px;">
						<html:label label="{$jsp.portal.website.personalize.order.lastest#}"/>	
					</html:span>
				</html:td>
				<html:td >
					<logic:if condition="$[layoutBean.userDefine]==1">
						<btn:button href="contoller.do?operation=loadColumns4UserLayoutDesign&layoutId=$[layoutBean.layoutId]&currentSysCode=$[currentSysCode]&sysId=$[sysId]&channelId=$[channelId]" name="{$jsp.portal.console.layout.designer.design#}"  typeId="assignRoleForColumn" value="{$jsp.portal.console.layout.designer.design#}" styleClass="button-self-style"/>
						<btn:modify href="contoller.do?operation=viewUserDefineLayout&isModify=true&layoutId=$[layoutBean.layoutId]&currentSysCode=$[currentSysCode]&sysId=$[sysId]&channelId=$[channelId]"/>
						<btn:delete href="contoller.do?operation=deleteUserDefineLayout&currentSysCode=$[currentSysCode]&sysId=$[sysId]&channelId=$[channelId]&layoutId=$[layoutBean.layoutId]"/>
					</logic:if>
				</html:td>
				</html:tr>
			
			</logic:for>
			
		</html:table>	
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" >
		<html:tr  styleClass="dgAlternatingItemStyle">
			<html:td colspan="6" align="center">
					<btn:save href="javascript:submit('layoutForm')"/>
					<btn:close href="javascript:parent.__myWin.closeWebWindow('userLayoutMangerWind');"/>
				</html:td>
				</html:tr>
		</html:table>	
	</html:form>
	
	</body>
</html>




