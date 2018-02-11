<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.dictionary.factory.FactoryRepository,com.zzy.htms.dictionary.factory.FactoryBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Traderitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 

 List<FactoryBean>  factoryList=FactoryRepository.getFactoryList();
request.setAttribute("factoryList",factoryList);
%>

<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="fetchPrivilegeForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"   />   
	<html:hidden id="operation" name="operation" value="listFtechPrivilege"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='贸易商自提权限管理' name="title"/>
	</jsp:include> 
	<table id="1650" class="edit-talbe">
	<tr class="trCell"> 
		<html:td  styleClass="edit-talbe-label">
				贸易商
			</html:td>
		<html:td>
				<html:text id="userNameSH" name="userNameSH" value="$[userNameSH]"/>
		</html:td>	
		<html:td  styleClass="edit-talbe-label">
				厂区
			</html:td>
		<html:td>
				<html:select name="factoryNameSH" list="factoryList" value="$[factoryNameSH]">
					<html:option label="factoryName" value="factoryName"></html:option>
				</html:select>
		</html:td>	
		<html:td style="text-align:center;">
			<btn:search href="javascript:submit('fetchPrivilegeForm')"/>			
			<btn:reset href="javascript:cleanForm('fetchPrivilegeForm')"/>
		</html:td>
	</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colspan="10" >
				<btn:new href="contoller.do?operation=toAddFetchPrivilege"/>
				<btn:delete href="javascript:batch_deletes('fetchPrivilegeForm','userId','','deleteFetchPrivilege');" />
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="fetchPrivilegeList" bean="fetchPrivilegeBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="userId" id="userId" value="fetchPrivilegeBean.userId" /></html:td>
			<html:td  label="贸易商">
				<html:a href="contoller.do?operation=viewFetchPrivilege&isModify=0&userId=$[fetchPrivilegeBean.userId]">
					<html:value value="$[fetchPrivilegeBean.userName]"/>
				</html:a>
			</html:td>
			<html:td label="厂区">
				<html:value value="$[fetchPrivilegeBean.factoryName]"/>
			</html:td>
			<html:td  label="操作">
				<btn:modify href="contoller.do?operation=viewFetchPrivilege&isModify=1&userId=$[fetchPrivilegeBean.userId]"/>
				<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteFetchPrivilege&userId=$[fetchPrivilegeBean.userId]')"/>
			</html:td>
		</html:tr>
	</html:table>
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="userId" checkId="checkAll"/>
				<com:page formId="fetchPrivilegeForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
