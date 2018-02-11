<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@ include file="../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="ownCarForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listOwnCar"/>
	<com:loader binder="true" checkall="true" switchbox="true"/>
	<jsp:include page="../../common/impart/table-banner-new.jsp">
		<jsp:param value='自备车管理费管理' name="title"/>
	</jsp:include>
	<table id="1630" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label"  colSpan="1" rowSpan="1">
				<html:label  label="客户名称" ></html:label>
			</td>
			<td   colSpan="1" rowSpan="1">
				<html:text  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]" />
			</td>
			<td class="edit-talbe-label" colSpan="1" rowSpan="1">
				<html:label  label="客户编号" ></html:label>
			</td>
			<td colSpan="1" rowSpan="1">
				<html:text  id="customerCodeSH"  name="customerCodeSH" value="$[customerCodeSH]" />
				<span style="float:right;">
					<btn:search href="javascript:submit('ownCarForm')"/>
					<btn:reset href="javascript:cleanForm('ownCarForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
			<btn:delete href="javascript:batch_deletes('ownCarForm','customerId','','deleteOwnCar');" />
			<!--<btn:save href="javascript:batchDelete('ownCarForm','userId','','addOwnCar');" />
				<html:a href="javascript:void(0);">
					<input type="button"  id="" name="" value="修改管理费"  class="commonBtn" style="width: 90px;" onclick="__myWin.createWebWindow({winId:'selectFeeWin',title:'修改管理费',content:'contoller.do?operation=toModifyManagementFee',intLeft:10 ,intTop:10 ,intWidth:600 ,intHeight:400,isResize: true,isFullScreen: false});">
				</html:a>
				-->
			</td>
		</tr>
	</table> 

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="ownCarList" bean="ownCarBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" >
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="customerId" id="customerId" value="ownCarBean.customerId" /></html:td>
			<html:td  label="客户编号" >
				<html:a href="contoller.do?operation=viewOwnCar&isModify=0&customerId=$[ownCarBean.customerId]">
					<html:value value="$[ownCarBean.customerCode]"/>
				</html:a>
			</html:td>
			<html:td  label="客户名称" >
				<html:a href="contoller.do?operation=viewOwnCar&isModify=0&customerId=$[ownCarBean.customerId]">
					<html:value value="$[ownCarBean.customerName]"/>
				</html:a>
			</html:td>
			<html:td  label="管理费(元/吨)" >
					<html:value value="$[ownCarBean.managementFee]"/>
			</html:td>
			<html:td  label="操作">
				<btn:modify value="设置" href="contoller.do?operation=viewOwnCar&isModify=1&customerId=$[ownCarBean.customerId]"/>
				<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteOwnCar&customerId=$[ownCarBean.customerId]')"/>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="customerId" checkId="checkAll"/>
				<com:page formId="ownCarForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
