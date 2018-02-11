<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="vehicleForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listVehicle"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.vehicle.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1686" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="JKHEBLHNJMAKNFLJKPLIPJKHPOFJKJFFGLHOLAHPOKIMHEEHPMEECCIHFKPKCFGL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclecode#}" ></html:label>
			</td>
			<td  id="IAKBCOFNJEJIFFEBLKAHCGHIHALAHLBMLHBBICBGCLIIKLBHGNEKPKPBBIPNLKNN" colSpan="1" rowSpan="1">
				<html:text  id="vehicleCodeSH"  name="vehicleCodeSH" value="$[vehicleCodeSH]"/>
			</td>
			<td class="edit-talbe-label" id="AEFCMKMKOKMCPONNBGKHKCFKHFEJFMFLOAFJJLOFJAELFFKJGKPBKKNKKIOHPOMK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleno#}" ></html:label>
			</td>
			<td  id="GHNKNBPCBOLNKFFJMCEOKNCNKKMAPNCKECFKINGPIJEGCOGAOJNKILAJGCMMPKMG" colSpan="1" rowSpan="1">
				<html:text  id="vehicleNoSH"  name="vehicleNoSH" value="$[vehicleNoSH]"/>
				<span style="float:right;">
					<btn:search href="javascript:submit('vehicleForm')"/>
					<btn:reset href="javascript:cleanForm('vehicleForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<btn:new href="contoller.do?operation=toAddVehicle"/>
				<btn:delete href="javascript:batch_deletes('vehicleForm','checkVehicleId','','deleteVehicle');" />
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="vehicleList" bean="vehicleBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="checkVehicleId" id="checkVehicleId" value="VehicleBean.vehicleId" /></html:td>
			<html:td  label="{$jsp.htms.logistic.vehicle.vehiclecode#}">
				<html:a  href="contoller.do?operation=viewVehicle&isModify=0&vehicleId=$[vehicleBean.vehicleId]">
				     <html:value value="$[vehicleBean.vehicleCode]"></html:value> 
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.vehicle.vehicleno#}">
				<html:a  href="contoller.do?operation=viewVehicle&isModify=0&vehicleId=$[vehicleBean.vehicleId]">
				   <html:value value="$[vehicleBean.vehicleNo]"></html:value>
				    </html:a>
			</html:td>
			
			
			<html:td  label="操作">
				<btn:modify href="contoller.do?operation=viewVehicle&isModify=1&vehicleId=$[vehicleBean.vehicleId]"/>
				<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteVehicle&vehicleId=$[vehicleBean.vehicleId]')"/>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkVehicleId" checkId="checkAll"/>
				<com:page formId="vehicleForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
