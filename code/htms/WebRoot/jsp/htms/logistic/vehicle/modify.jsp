<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="vehicleForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="modifyVehicle"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.vehicle.title.modify") %>' name="title"/>
	</jsp:include>
	<table id="1684" class="edit-talbe">
	<html:hidden id="vehicleId" name="vehicleId" value="vehicleViewBean.vehicleId"/>
		<tr class="trCell">
			<td class="edit-talbe-label" id="PILJPOKJHIGEKGNNGFIFKOAJOONJLHNCOINHOEGKIEGIAENNKKGOKKMLKABMIHCG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriername#}" ></html:label>
			</td>
			<td  id="KEGEKHFAGKJBMGHFCNKAEALFFKEGLKLKJNLIPHMGFJHABABLEMCEBLIEMMPOOEIC" colSpan="1" rowSpan="1">
				<html:select  id="carrierId"  name="carrierId"  list="carrierList" ><html:option  selected="vehicleViewBean.carrierId"  value="carrierId"  label="carrierName" ></html:option></html:select>
			</td>
			<td class="edit-talbe-label" id="BJLMAJBPBJKHFJBJNNFKFJPKHOHCNKAMJKPHHKPJKIJNBKFBBCPFMIKMLAFBCHIA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclecode#}" ></html:label>
			</td>
			<td  id="AOJGBJIHMEBMKHKNMMONLPHHLKEHGHOPIPJFKLBEJHCPBKGPKEMLMMPKGJKLGOAC" colSpan="1" rowSpan="1">
				<html:text  id="vehicleCode"  name="vehicleCode"  value="vehicleViewBean.vehicleCode" />
			</td>
			<td class="edit-talbe-label" id="LOFNBNLKMMIJKNKPBCABIKJHPOMIOPEKHEGPEEAHGPJFLCPCOKKNENLLIHNMMLOM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleno#}" ></html:label>
			</td>
			<td  id="FAIKNJPAIFHHOMGEOHGHHKAPLMKIKPJKEFNNJJJAKBKOFAHNBPNAHFCKPKAPCBJO" colSpan="1" rowSpan="1" width="270px">
				<html:text  id="vehicleNo"  name="vehicleNo"  value="vehicleViewBean.vehicleNo" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="HKJKIMAOCAJAOBCIHBBNCGNKGJCJEJPKCEPLJKKOKJIABNOKKBNKPGAFPMOFAJCN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclelength#}" ></html:label>
			</td>
			<td  id="EPIFLOABPMFHCBOJBKEOLIGACMIHOJGCIFMJLCLKOAICCCLGIGEAJNPEEOGGKOEA" colSpan="1" rowSpan="1">
				<html:text  id="vehicleLength"  name="vehicleLength"  value="vehicleViewBean.vehicleLength" />
				<span style="font-size:11px;">(单位:m)</span>
			</td>
			<td class="edit-talbe-label" id="JFEAOIIEIJNKFKMKOMMAEALAEINAONMKGFHMEIEKJKPKGMMOLJAAMGCONOACPIOJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclewidth#}" ></html:label>
			</td>
			<td  id="POLKFJEJJFHEOLGBGPBCOEKLCHPFAGKPKEKJKMMGEGMPGCBNGCKAGABKEGBKCKFJ" colSpan="1" rowSpan="1">
				<html:text  id="vehicleWidth"  name="vehicleWidth"  value="vehicleViewBean.vehicleWidth" />
				<span style="font-size:11px;">(单位:m)</span>
			</td>
			<td class="edit-talbe-label" id="MOKHLBAGKMBGJEIKPIKGJJFJECOBLHGCPNEKGKAHAOCBHAGMBKLJENCPFNHNCGPE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleheight#}" ></html:label>
			</td>
			<td  id="BLLJNPKNHKMPCEKGJAGINHKONFPAMPNOIKHJLJMMFFMKFFHBKFBBPPEEKLONCGGK" colSpan="1" rowSpan="1">
				<html:text  id="vehicleHeight"  name="vehicleHeight"  value="vehicleViewBean.vehicleHeight" />
				<span style="font-size:11px;">(单位:m)</span>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KFNLEJKJHMOKJFLKAJKJJEHGKLCNIKEPMJKPOGEHMNPAKHLLKHBAHNCIHKNHAHOA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclemaxton#}" ></html:label>
			</td>
			<td  id="EKMNMNGBMPGKIKPKJBKNCHFOFOEMKOKEOLBNGPBKBLFIAGFLCFLCHJLBFPKGOMPK" colSpan="1" rowSpan="1">
				<html:text  id="vehicleMaxTon"  name="vehicleMaxTon"  value="vehicleViewBean.vehicleMaxTon" />
				<span style="font-size:11px;">(单位:kg)</span>
			</td>
			<td class="edit-talbe-label" id="HHHCOFCEOIHLEKAPAMBKGJLJELOKFLALKNKLBMAACEHIAIJEEKMJNGJIHHHFCPPL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclepersonnum#}" ></html:label>
			</td>
			<td  id="LHKCBNKONPCNFMNGJLKGAOJGIELIMGEHACANNHGAAOGGJCKJJLFLHEMCCGPOHLGA" colSpan="3" rowSpan="1">
				<html:text  id="vehiclePersonNum"  name="vehiclePersonNum"  value="vehicleViewBean.vehiclePersonNum" />
				<span style="font-size:11px;">(人)</span>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="PKNKKJCHHIKKOBPLKEKCABGNKFKLAKGMHOFHIJKPGNMMOCPEACAJEPKICHIHEFBM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicledesc#}" ></html:label>
			</td>
			<td  id="HJCHKLFFABOAJACHGPJAHNOMNIKEGHECPLIBEHLKAAPBFHLFEPEIKJLPIBJPKKPK" colSpan="5" rowSpan="1">
				<html:textarea  id="vehicleDesc"  name="vehicleDesc"  value="vehicleViewBean.vehicleDesc" cols="40" rows="5" />
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('vehicleForm')"/>
				<btn:return href="contoller.do?operation=listVehicle"/>
			</html:td>
		</html:tr>
	</html:table>
	
	<com:validator formId="vehicleForm" showNormal="true" submitValidate="true" >
		<com:vElement id="vehicleCode"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="vehicleNo"  types="vehicleno" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
	</com:validator>
</html:form>
