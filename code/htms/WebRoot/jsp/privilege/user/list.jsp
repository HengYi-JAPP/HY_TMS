<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>

<%@ page import="com.mobilecn.privilege.user.UserBean,com.mobilecn.common.dictionary.DicRepository"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@ include file="../../common/impart/common.jsp"%>
<%@ taglib uri="/config/taglibs/tld/comp-extends.tld" prefix="cext"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//List list = (List)request.getAttribute(PropKey.USER_LIST);
 %>
<html>
	<head>
		<com:loader  js="js/common/common.js,js/console/list/list.js,js/htms/common/common.js"/>
		<com:loader css="css/common/table-list-new.css"/>
		<com:loader binder="true" checkall="true" switchbox="true" ajax="true"/>
	</head>
		<body>
		<!-- banner 页面导航条 -->
		<html:form id="userForm" name="userForm" method="post" action="contoller.do" loadCache="true">
			<html:hidden id="operation" name="operation" value="listUser"/>
			<html:hidden id="userId" name="userId"/>
			<jsp:include page="../../common/impart/table-banner-new.jsp">
				<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.user.list.title") %>' name='title'/>
				<jsp:param value="searchConditionBox" name="conditionBoxId"/>
			</jsp:include>
		
			<!-- searchbox 搜索条 -->	
			<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0" styleClass="edit-talbe">
				<html:tr styleClass="trCell">
					<html:td styleClass="edit-talbe-label">
						<html:label label="{$jsp.privilege.user.account#}"/>
					</html:td>
					<html:td >
						<html:text name="accountSH" id="accountSH"  maxlength="30"  />						
					</html:td>
					<html:td styleClass="edit-talbe-label"><html:label label="{$jsp.privilege.user.name#}"/></html:td>
					<html:td styleClass="condition_option">
							<html:text name="userNameSH" id="userNameSH" maxlength="30"  />
							<span style="float:right;">
								<btn:search onclick="submit('userForm')"/>
								<btn:reset onclick="cleanForm('userForm')"/>
							</span>					
					</html:td>
				</html:tr>
			</html:table>
		
			<!-- operationbox 功能操作条 -->
			<html:table cellSpacing="0" style="width: 100%;" align="center">
				<html:tr>
					<html:td>
					<btn:new  href="contoller.do?operation=toAddSubSystemUser"/>
					<btn:delete href="javascript:batch_deletes('userForm','checkUserId','','deleteUser');" />
					
					<!--<btn:button name="{$jsp.privilege.user.join.title#}" href="www" typeId="add2Group" value="{$jsp.privilege.user.join.title#}" styleClass="button-self-style"/>-->	
					<!--<html:checkbox id="checkAll" name="bean.name" value="bean.sex" label="全选" checked="1"/>
						--><!-- <div style="overflow: hidden; width: 100%; display: inline;">
							<div class="btn new" style="float:left;">新增</div></a>
							<a href="javascript:batchDelete('userForm','operation','deleteUser','userId');" onclick="return delWarnning();"><div class="btn del" style="float:left;">删除</div></a>
						
						<a href="javascript:doAction('managerColumn')"><div class="btn vikaudit" style="display:block">管理栏目</div></a>	
					
						<a href="javascript:doAction('managerPortal')"><div class="btn vikaudit" style="display:block" >管理门户</div></a>	
					
						<a href="javascript:doAction('managerGroup')"><div class="btn vikaudit" style="display:block">加入组</div></a>	
				
						<a href="javascript:doAction('managerOrg')"><div class="btn vikaudit" style="display:block">管理机构</div></a>					
						</div>	 -->
					</html:td>
				</html:tr>
			</html:table>
			
			<!-- list box 内容列表区 -->
			<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width: 100%;; border-collapse: collapse;" align="center" list="userList" bean="userBean" isHead="true" >
				<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
					<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}">
						<html:checkbox name="checkUserId" id="checkUserId" value="userBean.userId" />
					</html:td>
					<html:td  label="{$jsp.privilege.user.account#}"  property="account" />
					<html:td  label="{$jsp.privilege.user.name#}"  property="">
						<html:a href="contoller.do?operation=viewUser&userId=$[userBean.userId]">
							<html:value value="userBean.userName"/>
						</html:a>
					</html:td>
					<html:td label="{$jsp.privilege.user.sex#}" >
						<cext:dic dicId="userBean.sex"/>
					</html:td>
					<%--
					<html:td label="{$jsp.privilege.user.department#}"  property="department"/>
					<html:td label="{$jsp.privilege.user.subdepartment#}"  property="subDepartment"/> --%>
					<html:td label="{$jsp.privilege.user.mobile#}"  property="mobile"/>
					<html:td label="{$jsp.common.status.validate#}">
						<com:switchbox varValue="userBean.isValidate" talbeName="TB_CMS_USER" idValue="userBean.userId" offValue="0" varName="isValidate" onValue="1"  idName="userId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"  ajaxUrl="contoller.do"/>						
					</html:td>
					<html:td label="{$jsp.common.operation.modify#}" width="7%">
						<btn:modify href="contoller.do?operation=viewUser&isModify=true&userId=$[userBean.userId]"/>
					</html:td>
					<html:td label="{$jsp.common.operation.delete#}" width="7%">
						<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteUser&checkUserId=$[userBean.userId]')"/>
					</html:td>
				</html:tr>
			</html:table>	
			<com:page formId="userForm" pageCtlName="<%=PropKey.PAGE_CTL%>"/>
			<com:checkall targetName="checkUserId" checkId="checkAll"/>	
	</html:form>
			
	

		</body>
</html>

