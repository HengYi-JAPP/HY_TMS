<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.logistic.driver.DriverBean" %>
<%@page import="com.zzy.htms.location.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
String carrierId = request.getParameter("carrierId");
String wxOpenId = request.getParameter("wxOpenId");
String driverId = request.getParameter("driverId");
List<DriverBean> driverList = (List<DriverBean>)request.getAttribute("driverList");
List<User> wxDriverList = (List<User>)request.getAttribute("wxDriverList");
%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/console/list/list.js,resources/simpleupload/jquery-min.js,js/htms/dialog/dialog.js"/>
<com:loader css="css/common/sub-table-list.css,css/htms/dialog/dialog.css"/>
<html:form id="driverForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="toAssociateDriver"/>
	<html:hidden id="carrierId" name="carrierId" value="<%=carrierId %>"/>
	<html:hidden id="wxOpenId" name="wxOpenId" value="<%=wxOpenId %>"/>
	<html:hidden id="driverId" name="driverId" value="<%=driverId %>"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.driver.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1690" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="NINFKOLNIELHFKLFKPGIECHIEJFAHFCAOKPNHCOEHPIJNIKBEHJKLILAHKGHPKLN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivercode#}" ></html:label>
			</td>
			<td  id="PPKBCCNLEBLNKLIOINFFGEPGLABHKFBLOOIOKPGAKPOKFKEMHNGFMEJAFFBPHBPM" colSpan="1" rowSpan="1">
				<html:text  id="driverCodeSH"  name="driverCodeSH" value="$[driverCodeSH]"/>
			</td>
			<td class="edit-talbe-label" id="AGNOKGGIPEFKNNEMCCOMCMAHLKLOJAKFHGMCIIBAEAGBJJIFHPPFIHHGEFHIGCHG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivername#}" ></html:label>
			</td>
			<td  id="CIBNIOMMOKNIGOCCMIIKKOJEAKCBJHKHJOKGMCFKLKIKBKGEKEAMJEJKGLPLHLEN" colSpan="1" rowSpan="1">
				<html:text  id="driverNameSH"  name="driverNameSH" value="$[driverNameSH]"/>
			
				<btn:search href="javascript:submit('driverForm')"/>
				<btn:reset href="javascript:cleanForm('driverForm')"/>
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
	function checkDriverSelect(isSubmit,switchOperation){
		var selectDriver=document.getElementsByName("checkedDriverId");
		if(!selectDriver||selectDriver.length==0){
			//alert("没有可选择司机，请直接录入或通过司机管理。");
			$.DialogByZ.Alert({Title: "提示", Content:"没有可选择司机，请通过司机管理添加。",BtnL:"确定",FunL:alerts});
			return;
		}
		var isSelect = false;
		for(var i=0;i<selectDriver.length;i++){
			if(selectDriver[i]&&selectDriver[i].checked&&selectDriver[i].checked==true){
				isSelect = true;
				break;
			}
		}
		if(isSelect==false){
			//alert("请选择司机。");
			$.DialogByZ.Alert({Title: "提示", Content:"请选择司机。",BtnL:"确定",FunL:alerts});
			return;
		}
		if(isSubmit){
			document.getElementById("operation").value=switchOperation;
			document.getElementById("driverForm").submit();
		}
		
	}
	
	function selectDriver(obj){
		var wxOpenId = "<%=wxOpenId%>";
		if(obj.checked){
			$.ajax({     
		        url: "contoller.do?operation=associateDriver&wxOpenId="+wxOpenId+"&checkedDriverId="+obj.value,
		        type: "POST",
		        dataType: "json",
		        success: function (msg){
		            
		        }
		    });
		}
	}
	</script>
	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;"  align="center" >
	<tr  class="dgHeaderStyle" >
		<td>选择</td>
		<td>司机编号</td>
		<td>司机名称</td>
		<td>司机身份证号</td>
		<td>司机手机</td>	    	
	</tr>
	<%if(driverList!=null&&!driverList.isEmpty()){
		DriverBean driverBean = null;
		User wxDriverBean = null;
		String targetDriverId = null;
		Boolean isNull = false;
		Boolean isChecked = false;
		for(int i=0;i<driverList.size();i++){
			driverBean = driverList.get(i);
			request.setAttribute("driverBean",driverBean);
	%>
		<tr class="dgAlternatingItemStyle" onmouseover="onMouseMoveOverTableList(this)">
			<%if(wxDriverList==null||wxDriverList.isEmpty()){
					isNull = true;
			%>
			<html:td  width="80px"><html:radio name="checkedDriverId" value="$[driverBean.driverId]" onclick="selectDriver(this)"/></html:td>
			<%}
			if(isNull==false){
				for(int j=0;j<wxDriverList.size();j++){
					wxDriverBean = wxDriverList.get(j);
						if(wxDriverBean.getDriverId().equals(driverBean.getDriverId()+"")){
							isChecked = true;
							break;
						}else{
							isChecked = false;
						}
					}
				
					if(isChecked){
					%>
					<html:td  width="80px"><html:radio name="checkedDriverId" value="$[driverBean.driverId]" checked="checked" onclick="selectDriver(this)"/></html:td>
					<%}else{%>
					<html:td  width="80px"><html:radio name="checkedDriverId" value="$[driverBean.driverId]" onclick="selectDriver(this)"/></html:td>
			<%}}%>
			<html:td  label="{$jsp.htms.logistic.driver.drivercode#}">
				<html:value value="$[driverBean.driverCode]"/>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.driver.drivername#}">
				<html:value value="$[driverBean.driverName]"/>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.driver.driveridnum#}">
				<html:value value="$[driverBean.driverIdNum]"></html:value>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.driver.drivermobile#}">
				<html:value value="$[driverBean.driverMobile]"></html:value>
			</html:td>
			
		</tr>
	<%}}%>
	</html:table>
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:page formId="driverForm" pageCtlName="pageCtl"/>
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
