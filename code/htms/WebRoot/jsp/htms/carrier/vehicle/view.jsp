<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="vehicleForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.vehicle.title.view") %>' name="title"/>
	</jsp:include>
	<table id="1685" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="FNIMKJIKMOLBPOEKIPABHKLMCAFFHPIKCBEJHCFMKFMKIAKOHKLHIEIOGMNJFKON" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriername#}" ></html:label>
			</td>
			<td  id="HKJKOHOBEAKAPGOBKCGILIBOFNMBPCKFKAOPFPEGLBEGJOGOGINEJNHHGCFMKGLK" colSpan="1" rowSpan="1">
				<html:value value="carrierViewBean.carrierName"></html:value>
				<!--<html:select  id="carrierId"  name="carrierId"  list="carrierList"  disabled="true" ><html:option  selected="vehicleViewBean.carrierId"  value="carrierId"  label="carrierName" ></html:option></html:select>
			--></td>
			<td class="edit-talbe-label" id="FHFOGKFEHKIOFCEKKIKCPCNIFJIMPCBMMJOCGGIKFJKNIFPIKKOPKLBOFOKKBJFM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclecode#}" ></html:label>
			</td>
			<td  id="KFFLNAOHHMABHKKEELHOPALPNMHEIKJOHJHOGMCKCCFLJFOEECANLPCNKFIABJKH" colSpan="1" rowSpan="1">
				<html:value  value="vehicleViewBean.vehicleCode" ></html:value>
			</td>
			<td class="edit-talbe-label" id="EMIKLJEHPHJGALKGJMMCPLHKHFMCHOIPKLKKELMANOKJGOKLBKOELIBAKGCCBMBG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleno#}" ></html:label>
			</td>
			<td  id="CAEPCAKFLIAAOMBKKMKLBHCMOHKFNINEBCMBJGBKBEFIKJMGHIJOGMACKCLIIAFK" colSpan="1" rowSpan="1">
				<html:value  value="vehicleViewBean.vehicleNo" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="OCBCHHECHLMGIOFOOPOHNKGAKKIKEKPGKEBLENLOAPLKOBHEJLJAPMKJOEAPLEKJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclelength#}" ></html:label>
			</td>
			<td  id="MKJKGOCBJFNNHKGKLNGNHHKLNLKGHFKNGFIPMKOFHFEFMBLMFJNFHCKAOKALLMLP" colSpan="1" rowSpan="1">
				<html:value  value="vehicleViewBean.vehicleLength" ></html:value>
				<span style="font-size:11px;">(单位:m)</span>
			</td>
			<td class="edit-talbe-label" id="MEPEKLEPGFMNFFHOCINOGOOPOOEEJIICFEKOKLLMGAANALGKJAGANKOKOEBLNKJA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclewidth#}" ></html:label>
			</td>
			<td  id="JKHNLPKJJJMPJLEPHLKMEPKMKNJPILHCAPHJAMHFAIAHAMHJHHBBGOJGCHIJNNHN" colSpan="1" rowSpan="1">
				<html:value  value="vehicleViewBean.vehicleWidth" ></html:value>
				<span style="font-size:11px;">(单位:m)</span>
			</td>
			<td class="edit-talbe-label" id="OKNNNFJKIOEOINNOMPEHHJCLHICMONBPKELCIKMACFMLBLKCBMLIAKEMAHANMKGA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleheight#}" ></html:label>
			</td>
			<td  id="LHIMMMOJEEOACBIHNBMGANIIHLHPLJIJEFHGMFHBJENMNPFBFPLMCCFHLLGCFKBN" colSpan="1" rowSpan="1">
				<html:value  value="vehicleViewBean.vehicleHeight" ></html:value>
				<span style="font-size:11px;">(单位:m)</span>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KBKNPOEKKPFKJBNKFBOIGHKEKPAOBKKPBAKEKOLFOLIHECHBFMPGIIONHGOPKKFL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclemaxton#}" ></html:label>
			</td>
			<td  id="KEHAAJHHNBOBKOKALEGFNFJPMHOOBJOLKBGHNLOGLJAPBMKJFHAKOIKBICFAIKKJ" colSpan="1" rowSpan="1">
				<html:value  value="vehicleViewBean.vehicleMaxTon" ></html:value>
				<span style="font-size:11px;">(单位:kg)</span>
			</td>
			<td class="edit-talbe-label" id="PGOKCOKJEFLLKAIAFNBAJOANPOIKNPAMHJKNKLOFFPJPGLCPKPLNJINMJGBJKMMF" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehiclepersonnum#}" ></html:label>
			</td>
			<td  id="KKFEGINGFNNPLFCAOHOBOBPLIFBJELLECMHKOLBAPBHENPGKNLFGPIJMKBKAILJJ" colSpan="3" rowSpan="1">
				<html:value  value="vehicleViewBean.vehiclePersonNum" ></html:value>
				<span style="font-size:11px;">(人)</span>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GJGKNNAPNEEBPCGKHKHKKCGEOFJCLGKPAINLNKECKKMGLMLOJOBENICLHLILMIEG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicledesc#}" ></html:label>
			</td>
			<td  id="KKEFIHNAPMEHAEJJJKPHBFPAJPHHCGLMBLNPHEEKGKGFBGHCENCJMOIFBGJNFEHE" colSpan="5" rowSpan="1">
				<html:value  value="vehicleViewBean.vehicleDesc" ></html:value>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listVehicleToLogistics"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
