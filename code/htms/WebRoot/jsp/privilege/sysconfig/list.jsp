<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/logic-elements.tld" prefix="logic"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
		request.setAttribute("privilegeSystemId",PropKey.PRIVILEGE_SYSTEM_ID);
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css" />
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />	
	</head>
	<body>

			<!-- banner 页面导航条 -->
	<html:form id="sysConfigForm" name="sysConfigForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listSysConfig"/>
		<html:hidden name="sysId" id="sysId"  value="sysId"/>	
		<jsp:include page="../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.system.config.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.privilege.sysconfig.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="configNameSH" id="configNameSH"  maxlength="30" styleClass="input_text" />						
				</html:td>
				<html:td styleClass="condition_label"><html:label label="{$jsp.privilege.sysconfig.code#}"/></html:td>
				<html:td styleClass="condition_option">	
						<html:text name="configCodeSH" id="configCodeSH"  maxlength="30" styleClass="input_text" />					
						<btn:search href="javascript:__vsubmit('sysConfigForm')"/>
						<btn:reset href="javascript:cleanForm('sysConfigForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/privilege/sysconfig/add.jsp?sysId=$[sysId]"/>
				<btn:delete href="javascript:batchDelete('sysConfigForm','checkConfigId','','deleteSysConfig');" />
							</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="sysConfigList" bean="sysConfigBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<html:checkbox name="checkConfigId" id="checkConfigId" value="sysConfigBean.configId" />
				</html:td>
				<html:td  label="{$jsp.privilege.sysconfig.code#}"  property="configCode" />
				<html:td  label="{$jsp.privilege.sysconfig.name#}" >
				<html:a href="contoller.do?operation=viewSysConfig&configId=$[sysConfigBean.configId]&sysId=$[sysId]">
					<html:value value="sysConfigBean.configName"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.privilege.sysconfig.desc#}"  property="configDesc" />
				<html:td label="{$jsp.common.status.validate#}" >
					<com:switchbox varValue="sysConfigBean.isValidate" talbeName="TB_CMS_SYS_CONF" idValue="sysConfigBean.configId" offValue="0" varName="isValidate" onValue="1"  idName="configId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do"/>						
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewSysConfig&isModify=true&configId=$[sysConfigBean.configId]&sysId=$[sysId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<logic:if notEqual="sysConfigBean.configId,privilegeSysConfigId">
					<btn:delete  href="contoller.do?operation=deleteSysConfig&checkConfigId=$[sysConfigBean.configId]&sysId=$[sysId]"/>
					</logic:if>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkConfigId" checkId="checkAll"/>	
		<com:page formId="sysConfigForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	
	</body>
</html>

