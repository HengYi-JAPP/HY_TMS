<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@page import="java.util.List"%>
<%@page import="com.mobilecn.portal.channel.ChannelBean"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/portal-elements.tld" prefix="portal"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
List<ChannelBean> channelList=(List<ChannelBean>)request.getAttribute("personalizeChannelList");
%>


<html>
	<head>
		<title><html:label label="{$jsp.portal.website.personalize.channel.config#}"/></title>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js,js/portal/table-mover.js,js/portal/notip-closewin.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true"/>	
	</head>
	<body>
			<!-- banner 页面导航条 -->
	<html:form id="channelForm" name="channelForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="updateChannel_of_commonSystem"/>
		<html:hidden   name="sysId" value="$[sysId]" />
		<html:hidden   name="currentSysCode" value="$[currentSysCode]" />
		
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="$[basePath]jsp/wsites/$[currentSysCode]/personalize/channel/add.jsp?currentSysCode=$[currentSysCode]&sysId=$[sysId]"/>
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" >
			<html:tr styleClass="dgHeaderStyle"  >
				<html:td width="100px">
					<html:label label="{$jsp.portal.website.personalize.channel.order#}"/>
				</html:td>
				<html:td>
					<html:label label="{$jsp.portal.website.personalize.channel.channel#}"/>
				</html:td>
				<html:td  width="120px">
					<html:label label="{$jsp.portal.website.personalize.channel.defaultload#}"/>				
				</html:td>
				<html:td  width="80px">
					<html:label label="{$jsp.portal.website.personalize.channel.isshow#}"/>				
				</html:td>
				<html:td  width="280px">
					<html:label label="{$jsp.portal.website.personalize.channel.sort#}"/>
				</html:td>
				<html:td >
					<html:label label="{$jsp.portal.website.personalize.channel.operation#}"/>
				</html:td>
			</html:tr>
			
			<logic:for beanCollectionsName="personalizeChannelList" currBeanName="userChannelBean" indexName="channelIndex" currBeanScope="request">
				<html:tr  styleClass="dgAlternatingItemStyle">
				<html:td align="center">
					<html:value value="channelIndex"/>	
				</html:td>
				<html:td>
					<html:a  href="$[basePath]contoller.do?operation=viewUserSpecifyChannel&currentSysCode=$[currentSysCode]&sysId=$[sysId]&channelId=$[userChannelBean.channelId]&name=$[userChannelBean.channelName]">
						<html:value value="userChannelBean.channelName"/>
					</html:a>
					<html:hidden id="_channelId" name="_channelId" value="userChannelBean.channelId"/>
				</html:td>
				<html:td  align="left">	
					<com:switchbox boxName="_isCurrent" varValue="userChannelBean.defaultSelect"   idValue="userChannelBean.channelId" offValue="0" varName="_isCurrent" onValue="1"  idName="channelId" offLabel="{$jsp.portal.website.personalize.noload#}" onLabel="{$jsp.portal.website.personalize.load#}"   isSave="false" isSingle="true"/>
				</html:td>
				<html:td  align="left">
					<com:switchbox boxName="_isShow"  varValue="userChannelBean.defaultShow"   idValue="userChannelBean.channelId" offValue="0" varName="_isShow" onValue="1"  idName="channelId" offLabel="{$jsp.portal.website.personalize.noshow#}" onLabel="{$jsp.portal.website.personalize.show#}"   isSave="false"/>						
				</html:td>
				<html:td  align="center" style="display:inline;">					
					<html:hidden   name="_channelOrder" value="userChannelBean.defaultOrder" />
					<html:hidden   name="isSystem" value="userChannelBean.isSystem" />
					<html:span onclick="moveTop(this,{orderElementName:'_channelOrder'})" style="cursor:hand;float:left;padding-left:10px;">
						<html:label label="{$jsp.portal.website.personalize.order.forefront#}"/>	
					</html:span>
					<html:span onclick="moveUp(this,{orderElementName:'_channelOrder'})" style="cursor:hand;float:left;padding-left:10px;">
						<html:label label="{$jsp.portal.website.personalize.order.forward#}"/>	
					</html:span>
					<html:span onclick="moveDown(this,{orderElementName:'_channelOrder'})" style="cursor:hand;float:left;padding-left:10px;">
						<html:label label="{$jsp.portal.website.personalize.order.backward#}"/>	
					</html:span>
					<html:span onclick="moveBottom(this,{orderElementName:'_channelOrder'})" style="cursor:hand;float:left;padding-left:10px;">
						<html:label label="{$jsp.portal.website.personalize.order.lastest#}"/>	
					</html:span>
				</html:td>
				<html:td >
					<logic:if condition="$[userChannelBean.userDefine]==1"><!-- $[userChannelBean.userId]==$[userId] -->
						<btn:button href="contoller.do?operation=listUserChannelComposite&currentSysCode=$[currentSysCode]&sysId=$[sysId]&channelId=$[userChannelBean.channelId]" name="{$jsp.common.operation.composite#}"  typeId="assignPrivilege" value="{$jsp.common.operation.composite#}" styleClass="button-self-style"/>
						<btn:modify href="contoller.do?operation=viewUserSpecifyChannel&isModify=true&channelId=$[userChannelBean.channelId]&currentSysCode=$[currentSysCode]&sysId=$[sysId]"/>
						<btn:delete href="contoller.do?operation=deleteUserSelfChannel&channelId=$[userChannelBean.channelId]&currentSysCode=$[currentSysCode]&sysId=$[sysId]"/>
					</logic:if>
				</html:td>
				</html:tr>
			
			</logic:for>
			
		</html:table>	
		<html:table style="width: 100%;; border-collapse: collapse;" align="center" >	
		<html:tr  styleClass="dgAlternatingItemStyle">
			<html:td colspan="6" align="center">
					<btn:save href="javascript:submit('channelForm')"/>
					<btn:close href="javascript:parent.__myWin.closeWebWindow('channlePersonalized');"/>
				</html:td>
				</html:tr>
		</html:table>	
	</html:form>
	
	</body>
</html>




