<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.dictionary.factory.FactoryRepository,com.zzy.htms.dictionary.factory.FactoryBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Traderitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
 
 List<FactoryBean>  factoryList=FactoryRepository.getFactoryList();
request.setAttribute("factoryList",factoryList);	
%>
<head><base href="<%=basePath%>"></head>

<com:loader  js="js/common/common.js,jsp/htms/logistic/fetchprivilege/fetchprivilege.js,js/console/list/list.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="fetchPrivilegeForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="POST" >
	<com:loader  simplendar="true"  />
	<html:hidden id="operation" name="operation" value="toAddFetchPrivilege"/>	
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='增加贸易商自提权限' name="title"/>
	</jsp:include>
	
	<html:table id="1647" styleClass="edit-talbe" list="routeViewBean" bean="routeViewBean">
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="厂区" ></html:label>
			</html:td>
			<html:td width="36%">
				<html:checkbox id="factoryIdSH"  name="factoryIdSH"   list="factoryList"  label="factoryName"  value="factoryId" 
				 checkedList="checkFactoryList" checkedValue="factoryId" checked="" />
				
			
			</html:td>
			<html:td   style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="checkBoxTip" style="font-size:12px;">请选择厂区。</font>
			</html:td>
		</html:tr>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td style="text-align:center;">
				<btn:search href="javascript:submit('fetchPrivilegeForm')"/>			
				<btn:reset href="javascript:cleanForm('fetchPrivilegeForm')"/>
				&nbsp;&nbsp;
			</html:td>
			<html:td style="text-align:center;">
				&nbsp;&nbsp;
				<btn:save href="javascript:void(0);" onclick="validateBatchFetchPrivilege(true,'addFetchPrivilege');"/>
				<btn:return href="contoller.do?operation=listFtechPrivilege"/>
			</html:td>
		</html:tr>
	</html:table>
	

<table id="1638" class="edit-talbe">
		
		<tr class="trCell">
			<html:td  styleClass="edit-talbe-label">
				贸易商
			</html:td>
			<html:td>
					<html:text id="userNameSH" name="userNameSH" value="$[userNameSH]"/>
			</html:td>	
		</tr>
		
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="userList" bean="userBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="300px"><html:checkbox name="userId" id="userId" value="userBean.userId" /></html:td>
			<html:td  label="贸易商">
				<html:value value="userBean.userName"/>
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
