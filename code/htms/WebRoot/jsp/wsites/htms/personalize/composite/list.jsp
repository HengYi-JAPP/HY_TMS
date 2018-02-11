<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true"  tree="true"/>	
	</head>
	<body style="margin:0px;border:0px;padding:0px;">
			<!-- banner 页面导航条 -->
	<html:form id="compositeForm" name="compositeForm" method="post" action="contoller.do">
		<html:hidden id="sysId" name="sysId" value="sysId"/>
		<html:hidden id="currentSysCode" name="currentSysCode" value="currentSysCode"/>
		<html:hidden id="channelId" name="channelId" value="channelId"/>
		<jsp:include page="../../../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.common.operation.composite") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.common.operation.composite.showname#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="showNameSH" id="showNameSH"  maxlength="30" styleClass="input_text" />
					<btn:search href="javascript:__vsubmit('compositeForm')"/>
					<btn:reset href="javascript:cleanForm('compositeForm')"/>	
					<btn:return href="contoller.do?operation=loadChannelPersonalizeList&currentSysCode=$[currentSysCode]&sysId=$[sysId]"/>						
				</html:td>
				
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<logic:if condition="$[channel4CompositeBean.userDefine]==1">
					<btn:new href="contoller.do?operation=toAddUserChannelComposite&channelId=$[channelId]&sysId=$[sysId]&currentSysCode=$[currentSysCode]"/>
				</logic:if>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<com:tree treeList="compositeList" treeName="myTree" useCheckBox="true" chooseStyle="down"  treeNodeId="newCcId" cacheElementName="newCcId" appendNodeOperation="true" useNodeImage="true" expandAll="1" useLink="true" >
			<com:treeOpration href="contoller.do?operation=viewUserChannelComposite&isModify=true&sysId=$[sysId]&currentSysCode=$[currentSysCode]&channelId=$[channelId]" name="{$jsp.common.operation.modify#}" idPrefix="modify_"  target="_self" showCondition="$[userDefine]==1"></com:treeOpration>
			<com:treeOpration href="contoller.do?operation=deleteUserChannelComposite&sysId=$[sysId]&currentSysCode=$[currentSysCode]&channelId=$[channelId]" name="{$jsp.common.operation.delete#}" idPrefix="delete_"  target="_self" showCondition="$[userDefine]==1"></com:treeOpration>
			<com:treeNodeMap name="showName" nodeId="ccId" parentId="parentId"  userDefine="userDefine" url="contoller.do?operation=viewUserChannelComposite&sysId=$[sysId]&currentSysCode=$[currentSysCode]&channelId=$[channelId]" order="showOrder" openType="_self"/>									
		</com:tree>
	</html:form>
	
	</body>
</html>





