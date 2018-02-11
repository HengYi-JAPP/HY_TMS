<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="vehicleForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="addVehicleToLogistics"/>
	<html:hidden id="isValidate" name="isValidate" value="1" />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.vehicle.title.add") %>' name="title"/>
	</jsp:include>
	<table id="1683" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="KFLIMJBJOGCIPHKOIMKNFFBMBMJKOPGMGMKMPCBKKKANJLLANGMCKMKAEBBEHAHK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriername#}" ></html:label>
			</td>
			<td  id="LJCNACPOPKHLOGJIHPKKBCKLOLKECNNKEKKPGFFMBKOKBFJHOHNFEOLLMBOPLMLI" colSpan="1" rowSpan="1">
				<html:select  id="carrierId"  name="carrierId"  list="carrierList" ><html:option  value="carrierId"  label="carrierName" ></html:option></html:select>
			</td>
			<td class="edit-talbe-label" id="PKAKPGNKGICEAGGHOMBNKCLKILKHIGCKLBNOABEEFHCJCALBHEKMCHHKOLGFIKEO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclecode#}" ></html:label>
			</td>
			<td  id="OGMAMMOFCCAFGOHEMEJINLCFCBKJIFJPFFGINJJJGHGEKFKNAKKHOLFNFKBNKPNB" colSpan="1" rowSpan="1">
				<html:text  id="vehicleCode"  name="vehicleCode" />
			</td>
			<td class="edit-talbe-label" id="GCONLAFJCLIBEKENMJFKIFMAOMHEIKLEKKCCGIAOHBPGLNHIMNFIJPMGFMOOBGPF" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleno#}" ></html:label>
			</td>
			<td  id="FOCPNOPJEKKKJHKPEIHKFNKCEAHMJKFNMELNEPHNKKHHIOEGABBFJMHABKMELKKI" colSpan="1" rowSpan="1" width="270px">
				<html:text  id="vehicleNo"  name="vehicleNo" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="CHKOLCKCPKAKAEENKHFCCKMGLKNEBFJLFMCNLFMNFMNKBMHCPPJMCEINKMCIGKKK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclelength#}" ></html:label>
			</td>
			<td  id="EKJKKJEKNMPJIOFHPBLIGHPAEOICKIHOJIOKHAHCGLGBKCHLNOJFMFPIKAIFIFEK" colSpan="1" rowSpan="1">
				<html:text  id="vehicleLength"  name="vehicleLength" size="8"/>
				<span style="font-size:11px;">(单位:m)</span>
			</td>
			<td class="edit-talbe-label" id="ECPPGGIGNNOEEHKGNIHLKCAIBNGLOAEAMFNFKNIKGMFHEOGNOEHLPBBPPNHCLJLC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclewidth#}" ></html:label>
			</td>
			<td  id="PBFNHIBKGEFKNFJHEJKBMKLEJBLHKFMPCKHFLMONCBONHEKJHBKMNGFOBFKOICMB" colSpan="1" rowSpan="1">
				<html:text  id="vehicleWidth"  name="vehicleWidth" size="8"/>
				<span style="font-size:11px;">(单位:m)</span>
			</td>
			<td class="edit-talbe-label" id="HLOCJHGEKFPJHJOPGFACCFFOKKEPBNGFPPCPNKMBMFGNPNFMMEIGFIKHNKKCIHHG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleheight#}" ></html:label>
			</td>
			<td  id="LKKFKMKBFAIGICPAMKOGPECNBOIEIPGLFGLEEMICACEMHLKCKPGJFLNIJNGNAHNP" colSpan="1" rowSpan="1">
				<html:text  id="vehicleHeight"  name="vehicleHeight" size="8"/>
				<span style="font-size:11px;">(单位:m)</span>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GGEEBEHGGBOPNKBKBKLLGFIJFKMGKJAKACFCJOELBEELMBFLICKGICJHAHPFAAGE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclemaxton#}" ></html:label>
			</td>
			<td  id="CKMPMMJNLHOKLNHGBKHJPKKKHFIAKCBBBAGGMBIOMOBJFCABINKIANJNAAJJPIJM" colSpan="1" rowSpan="1">
				<html:text  id="vehicleMaxTon"  name="vehicleMaxTon" size="8"/>
				<span style="font-size:11px;">(单位:kg)</span>
			</td>
			<td class="edit-talbe-label" id="BHNNEKIKKMMCEJEFLHAKBHKJCOFNEPEBFPBOHKLGLFKHIAKJFOJEGLAGKCMOCNOA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclepersonnum#}" ></html:label>
			</td>
			<td  id="IOOJIJEPOEPLKPLHAAPHHNLOKMNCHCIHINMLMFOJAJNKOICNFKCAANNJALKCCJOE" colSpan="3" rowSpan="1">
				<html:text  id="vehiclePersonNum"  name="vehiclePersonNum" size="8"/>
				<span style="font-size:11px;">(人)</span>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="OKIHFMHCOALGMJMHFCMGPKLNCONMCLABOOMGOPNBFOLKFANOMEOHAFKLLKEGGMKF" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicledesc#}" ></html:label>
			</td>
			<td  id="LABLKCIMGLHIBKGBHECPIMKGBAEEJCHGGJFOIMNIGNLAKNENIEGNKEPBELHFPIJN" colSpan="5" rowSpan="1">
				<html:textarea cols="40" rows="5"  id="vehicleDesc"  name="vehicleDesc" />
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('vehicleForm')"/>
				<btn:return href="contoller.do?operation=listVehicleToLogistics"/>
			</html:td>
		</html:tr>
	</html:table>
	
	<com:validator formId="vehicleForm" showNormal="true" submitValidate="true" >
		<com:vElement id="vehicleCode"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="vehicleNo"  types="vehicleno" event="onblur">
			<com:init size="20" maxlength="60" ></com:init>
		</com:vElement>
	</com:validator>
</html:form>
