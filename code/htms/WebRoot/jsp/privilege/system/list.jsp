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
	<%=PropKey.PRIVILEGE_SYSTEM_ID%>
			<!-- banner 页面导航条 -->
	<html:form id="systemForm" name="systemForm" method="post" action="contoller.do">
		<html:hidden id="operation" name="operation" value="listSystem"/>
		<html:hidden name="privSysId" id="privSysId" value="<%=PropKey.PRIVILEGE_SYSTEM_ID%>" />	
		<jsp:include page="../../common/impart/table-banner.jsp">
			<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.system.list.title") %>' name='title'/>
			<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			<jsp:param value="false" name="hideSearchBanner"/>
		</jsp:include>
	
		<!-- searchbox 搜索条 -->	
		<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
			<html:tr>
				<html:td styleClass="condition_label"><html:label label="{$jsp.privilege.system.name#}"/></html:td>
				<html:td styleClass="condition_option">
					<html:text name="sysNameSH" id="sysNameSH"  maxlength="30" styleClass="input_text" />						
				</html:td>
				<html:td styleClass="condition_label"><html:label label="{$jsp.privilege.system.code#}"/></html:td>
				<html:td styleClass="condition_option">	
						<html:text name="sysCodeSH" id="sysCodeSH"  maxlength="30" styleClass="input_text" />					
						<btn:search href="javascript:__vsubmit('systemForm')"/>
						<btn:reset href="javascript:cleanForm('systemForm')"/>						
				</html:td>
			</html:tr>
		</html:table>
	
		<!-- operationbox 功能操作条 -->
		<html:table cellSpacing="0" style="width: 100%;" align="center">
			<html:tr>
				<html:td>
				<btn:new href="jsp/privilege/system/add.jsp"/>
				<btn:delete href="javascript:batchDelete('systemForm','checkSysId','','deleteSystem');" />				
				<btn:button name="{$jsp.privilege.system.init.title#}" onclick="javascript:checkBeforeSubmit('systemForm','checkSysId','','toInitPrivilegeForSubsystem',true);" typeId="initPrivilegeForSubsystem" value="{$jsp.privilege.system.init.title#}" styleClass="button-self-style"/>
				<btn:button name="{$jsp.privilege.system.inittmpl.title#}" onclick="javascript:checkBeforeSubmit('systemForm','checkSysId','','toInitTemplateForSubsystem',true);" typeId="initTmplForSubsystem" value="{$jsp.privilege.system.inittmpl.title#}" styleClass="button-self-style"/>
				<btn:button name="{$jsp.privilege.system.initthemes.title#}" onclick="javascript:checkBeforeSubmit('systemForm','checkSysId','','toInitThemesForSubsystem',true);" typeId="initTmplForSubsystem" value="{$jsp.privilege.system.initthemes.title#}" styleClass="button-self-style"/>

				<btn:button name="{$jsp.privilege.system.themes.title#}" onclick="javascript:checkBeforeSubmit('systemForm','checkSysId','','toAddThemesForSystem',true);" typeId="bindThemesForSubsystem" value="{$jsp.privilege.system.themes.title#}"  styleClass="button-self-style"/>
				<btn:button name="{$jsp.privilege.system.background.title#}" onclick="javascript:checkBeforeSubmit('systemForm','checkSysId','','toAddBackgroundForSystem',true);" typeId="bindBackgroundForSubsystem" value="{$jsp.privilege.system.background.title#}"  styleClass="button-self-style"/>
				
				</html:td>
			</html:tr>
		</html:table>
		
		<!-- list box 内容列表区 -->
		<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="<%=PropKey.SYSTEM_LIST%>" bean="systemBean" isHead="true" >
			<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
				<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" id="selectAll">
					<logic:if condition="$[systemBean.sysId]!=1">
					<html:checkbox name="checkSysId" id="checkSysId" value="systemBean.sysId" />
					</logic:if>
				</html:td>
				<html:td  label="{$jsp.privilege.system.code#}"  property="sysCode" />
				<html:td  label="{$jsp.privilege.system.name#}" >
				<html:a href="contoller.do?operation=viewSystem&sysId=$[systemBean.sysId]">
					<html:value value="systemBean.sysName"/>
				</html:a>				
				</html:td>
				<html:td  label="{$jsp.privilege.system.desc#}"  property="sysDesc" />
				<html:td label="{$jsp.common.status.validate#}" >
					<com:switchbox varValue="systemBean.isValidate" talbeName="TB_SYSTEM" idValue="systemBean.sysId" offValue="0" varName="isValidate" onValue="1"  idName="sysId" offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do"/>						
				</html:td>
				<html:td  label="{$jsp.privilege.system.config.title#}" >
				<html:a href="contoller.do?operation=listSysConfig&sysId=$[systemBean.sysId]">
					<html:label label="{$jsp.privilege.system.config.title#}"></html:label>
				</html:a>				
				</html:td>
				<html:td label="{$jsp.common.operation.modify#}" width="80px">
					<btn:modify href="contoller.do?operation=viewSystem&isModify=true&sysId=$[systemBean.sysId]"/>
				</html:td>
				<html:td label="{$jsp.common.operation.delete#}" width="80px">
					<logic:if condition="$[systemBean.sysId]!=1">
					<btn:delete  href="contoller.do?operation=deleteSystem&checkSysId=$[systemBean.sysId]"/>
					</logic:if>
				</html:td>
			</html:tr>
		</html:table>	
		<com:checkall targetName="checkSysId" checkId="checkAll"/>	
		<com:page formId="systemForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
	</html:form>
	<script type="text/javascript">
	function escapeCheckAll(elementName,elementValue){
	var elementObjs = document.getElementsByName(elementName);
	//confirm(checkBoxs.length);
	if(elementObjs==null||elementObjs.length==0){
		
		return false;
	}
	
	
		for(var i = 0;i<elementObjs.length;i++){
			if(elementObjs[i].value==elementValue){
				elementObjs[i].setAttribute("disabled",true);
			}
		}	
		
	
	}

	escapeCheckAll("checkSysId","<%=PropKey.PRIVILEGE_SYSTEM_ID%>");
	</script>
	</body>
</html>

