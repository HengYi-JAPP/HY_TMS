<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/console/list/list.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="vehicleForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="selectVehicle4SendToLogistics"/>
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
				<html:text  id="vehicleCodeSH"  name="vehicleCodeSH" />
			</td>
			<td class="edit-talbe-label" id="AEFCMKMKOKMCPONNBGKHKCFKHFEJFMFLOAFJJLOFJAELFFKJGKPBKKNKKIOHPOMK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleno#}" ></html:label>
			</td>
			<td  id="GHNKNBPCBOLNKFFJMCEOKNCNKKMAPNCKECFKINGPIJEGCOGAOJNKILAJGCMMPKMG" colSpan="1" rowSpan="1">
				<html:text  id="vehicleNoSH"  name="vehicleNoSH" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				承运商
			</td>
			<td  style="text-align:left;" colspan="3">
				<html:select id="carrierIdSH" name="carrierIdSH"  list="carrierList">
					<html:option label="carrierName" value="carrierId" selected="$[carrierIdSH]"/>
				</html:select>
				<btn:search href="javascript:submit('vehicleForm')"/>
				<btn:reset href="javascript:cleanForm('vehicleForm')"/>
			</td>
		</tr>
	</table>
	<table id="1690" class="edit-talbe">
		<tr class="trCell">
			<td  id="CIBNIOMMOKNIGOCCMIIKKOJEAKCBJHKHJOKGMCFKLKIKBKGEKEAMJEJKGLPLHLEN" colSpan="1" rowSpan="1">
				<btn:confirm href="javascript:void(0);" onclick="checkVehicleSelect()"/>
				<btn:close href="javascript:void(0);" onclick="parent.__myWin.closeWebWindow('selectVehicleWin')"/>
			</td>
		</tr>
		
	</table>
	<script>
	function checkVehicleSelect(){
		var selectVehicle=document.getElementsByName("selectVehicle");
		if(!selectVehicle||selectVehicle.length==0){
			//alert("没有可选择车辆，请直接录入或通过车辆管理。");
			alertTip("没有可选择车辆，请直接录入或通过车辆管理。");
			return;
		}
		var isSelect = false;
		for(var i=0;i<selectVehicle.length;i++){
			if(selectVehicle[i]&&selectVehicle[i].checked&&selectVehicle[i].checked==true){
				isSelect = true;
				break;
			}
		}
		if(isSelect==false){
			//alert("请选择车辆。");
			alertTip("请选择车辆。");
			return;
		}
		parent.__myWin.closeWebWindow('selectVehicleWin');
	}
	</script>
	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="vehicleList" bean="vehicleBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td  width="80px"><html:radio onclick="parent.setVehicle('$[vehicleBean.vehicleId]','$[vehicleBean.vehicleNo]');" name="selectVehicle"/></html:td>
			<html:td  label="{$jsp.htms.logistic.vehicle.vehiclecode#}">
				<html:value value="$[vehicleBean.vehicleCode]"/>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.vehicle.vehicleno#}">
				<html:value value="$[vehicleBean.vehicleNo]"/>
			</html:td>
			
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:page formId="vehicleForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
