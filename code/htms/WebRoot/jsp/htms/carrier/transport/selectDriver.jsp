<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/console/list/list.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="driverForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="selectDriver4SendToLogistics"/>
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
				<html:text  id="driverCodeSH"  name="driverCodeSH" />
			</td>
			<td class="edit-talbe-label" id="AGNOKGGIPEFKNNEMCCOMCMAHLKLOJAKFHGMCIIBAEAGBJJIFHPPFIHHGEFHIGCHG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivername#}" ></html:label>
			</td>
			<td  id="CIBNIOMMOKNIGOCCMIIKKOJEAKCBJHKHJOKGMCFKLKIKBKGEKEAMJEJKGLPLHLEN" colSpan="1" rowSpan="1">
				<html:text  id="driverNameSH"  name="driverNameSH" />
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
				<btn:search href="javascript:submit('driverForm')"/>
				<btn:reset href="javascript:cleanForm('driverForm')"/>
			</td>
		</tr>
	</table>
	<table id="1690" class="edit-talbe">
		<tr class="trCell">
			<td  id="CIBNIOMMOKNIGOCCMIIKKOJEAKCBJHKHJOKGMCFKLKIKBKGEKEAMJEJKGLPLHLEN" colSpan="1" rowSpan="1">
				<btn:confirm href="javascript:void(0);" onclick="checkDriverSelect()"/>
				<btn:close href="javascript:void(0);" onclick="parent.__myWin.closeWebWindow('selectDriverWin')"/>
			</td>
		</tr>
		
	</table>
	<script>
	function checkDriverSelect(){
		var selectDriver=document.getElementsByName("selectDriver");
		if(!selectDriver||selectDriver.length==0){
			//alert("没有可选择司机，请直接录入或通过司机管理。");
			alertTip("没有可选择司机，请直接录入或通过司机管理。");
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
			alertTip("请选择司机。");
			return;
		}
		parent.__myWin.closeWebWindow('selectDriverWin');
	}
	</script>
	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="driverList" bean="driverBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td  width="80px"><html:radio onclick="parent.setDriver('$[driverBean.driverId]','$[driverBean.driverName]','$[driverBean.driverIdNum]','$[driverBean.driverMobile]');" name="selectDriver"/></html:td>
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
			
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:page formId="driverForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
