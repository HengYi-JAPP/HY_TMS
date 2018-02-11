<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.logistic.vehicle.VehicleBean" %>
<%@page import="com.zzy.htms.location.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
String carrierId = request.getParameter("carrierId");
String wxOpenId = request.getParameter("wxOpenId");
String driverId = request.getParameter("driverId");
List<VehicleBean> vehicleList = (List<VehicleBean>)request.getAttribute("vehicleList");
List<User> wxVehicleList = (List<User>)request.getAttribute("wxVehicleList");

%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/console/list/list.js,resources/simpleupload/jquery-min.js,js/htms/dialog/dialog.js"/>
<com:loader css="css/common/sub-table-list.css,css/htms/dialog/dialog.css"/>
<html:form id="vehicleForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="toAssociateVehicle"/>
	<html:hidden id="carrierId" name="carrierId" value="<%=carrierId %>"/>
	<html:hidden id="wxOpenId" name="wxOpenId" value="<%=wxOpenId %>"/>
	<html:hidden id="driverId" name="driverId" value="<%=driverId %>"/>
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
		
				<btn:search href="javascript:submit('vehicleForm')"/>
				<btn:reset href="javascript:cleanForm('vehicleForm')"/>
			</td>
		</tr>
		
	</table>
	<table>
		<tr class="trCell">
		</tr>
	</table>
	<script>
	function alerts(){
	  	$.DialogByZ.Close();
	}
	function checkVehicleSelect(isSubmit,switchOperation){
		var selectVehicle=document.getElementsByName("checkedVehicleId");
		if(!selectVehicle||selectVehicle.length==0){
			//alert("没有可选择车辆，请直接录入或通过车辆管理。");
			$.DialogByZ.Alert({Title: "提示", Content:"没有可选择车辆，请直接车辆管理添加。",BtnL:"确定",FunL:alerts});
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
			$.DialogByZ.Alert({Title: "提示", Content:"请选择车辆。",BtnL:"确定",FunL:alerts});
			return;
		}
		if(isSubmit){
			document.getElementById("operation").value=switchOperation;
			document.getElementById("vehicleForm").submit();
		}
	}
	
	function selectVehicle(obj){
		if(obj.checked){
			$.ajax({     
		        url: "contoller.do?operation=associateVehicle&driverId="+<%=driverId%>+"&vehicleId="+obj.value,
		        type: "POST",
		        dataType: "json",
		        success: function (msg){
		            
		        }
		    });
		}else{
			$.ajax({     
		        url: "contoller.do?operation=cancleAssociateVehicle&vehicleId="+obj.value,
		        type: "POST",
		        dataType: "json",
		        success: function (msg){
		            
		       }
		    });
		}
	}
	</script>
	
	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<td>选择</td>
			<td>车辆编号</td>
			<td>车牌号</td>
		</tr>
		<%if(vehicleList!=null&&!vehicleList.isEmpty()){
			VehicleBean vehicleBean = null;
			User wxVehicleBean = null;
			String targetVehicleId = null;
			Boolean isNull = false;
			Boolean isChecked = false;
			for(int i=0;i<vehicleList.size();i++){
				vehicleBean = vehicleList.get(i);
				request.setAttribute("vehicleBean",vehicleBean);
		%>
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<%if(wxVehicleList==null||wxVehicleList.isEmpty()){
					isNull = true;
			%>
			<html:td  width="80px"><html:checkbox id="checkedVehicleId" name="checkedVehicleId" value="vehicleBean.vehicleId" onclick="selectVehicle(this);"/></html:td>
			<%}
			if(isNull==false){
				for(int j=0;j<wxVehicleList.size();j++){
					wxVehicleBean = wxVehicleList.get(j);
						if(wxVehicleBean.getVehicleId().equals(vehicleBean.getVehicleId()+"")){
							isChecked = true;
							break;
						}else{
							isChecked = false;
						}
					}
				
					if(isChecked){
					%>
					<html:td  width="80px"><html:checkbox id="checkedVehicleId" name="checkedVehicleId" value="vehicleBean.vehicleId" checked="checked" onclick="selectVehicle(this);"/></html:td>
					<%}else{%>
					<html:td  width="80px"><html:checkbox id="checkedVehicleId" name="checkedVehicleId" value="vehicleBean.vehicleId" onclick="selectVehicle(this);"/></html:td>
			<%}}%>
			<html:td  label="{$jsp.htms.logistic.vehicle.vehiclecode#}">
				<html:value value="$[vehicleBean.vehicleCode]"/>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.vehicle.vehicleno#}">
				<html:value value="$[vehicleBean.vehicleNo]"/>
			</html:td>
			
		</html:tr>
	<%}}%>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:page formId="vehicleForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr>
			<html:td >
				<btn:save href="contoller.do?operation=listWXUser"/>
				<btn:return href="contoller.do?operation=listWXUser"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
