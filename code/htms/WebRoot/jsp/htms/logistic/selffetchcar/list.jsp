<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/console/list/list.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="selfFetchCarForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listSelfFetchCar"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='自备车自提车辆管理' name="title"/>
	</jsp:include>
	<table id="1690" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="NINFKOLNIELHFKLFKPGIECHIEJFAHFCAOKPNHCOEHPIJNIKBEHJKLILAHKGHPKLN" colSpan="1" rowSpan="1">
				客户名称
			</td>
			<td  id="PPKBCCNLEBLNKLIOINFFGEPGLABHKFBLOOIOKPGAKPOKFKEMHNGFMEJAFFBPHBPM" colSpan="1" rowSpan="1">
				<html:text  id="customerNameSH"  name="customerNameSH"  value="$[customerNameSH]"/>
			</td>
			<td class="edit-talbe-label" id="AGNOKGGIPEFKNNEMCCOMCMAHLKLOJAKFHGMCIIBAEAGBJJIFHPPFIHHGEFHIGCHG" colSpan="1" rowSpan="1">
				车牌号
			</td>
			<td  id="CIBNIOMMOKNIGOCCMIIKKOJEAKCBJHKHJOKGMCFKLKIKBKGEKEAMJEJKGLPLHLEN" colSpan="1" rowSpan="1">
				<html:text  id="vehicleNoSH"  name="vehicleNoSH"  value="$[vehicleNoSH]"/>
				<span style="float:right;">
					<btn:search href="javascript:submit('selfFetchCarForm')"/>
					<btn:reset href="javascript:cleanForm('selfFetchCarForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<btn:new href="contoller.do?operation=toAddSelfFetchCar"/>
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center"
	 list="selfFetchCarList" bean="selfFetchCarBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle"  onmouseover="onMouseMoveOverTableList(this)">
			
			<html:td  label="客户名称"  width="250px">
				<html:value value="$[selfFetchCarBean.customerName]"></html:value> 
			</html:td>
			<html:td  label="车牌号" width="100px">
				<html:value value="$[selfFetchCarBean.vehicleNo]"></html:value>
			</html:td>
			<html:td  label="备注"  width="500px">
				<html:value value="$[selfFetchCarBean.remark]"></html:value>
			</html:td>
			<html:td  label="操作"  width="100px">
				<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteSelfFetchCar&carId=$[selfFetchCarBean.carId]')"/>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkCarId" checkId="checkAll"/>
				<com:page formId="selfFetchCarForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
