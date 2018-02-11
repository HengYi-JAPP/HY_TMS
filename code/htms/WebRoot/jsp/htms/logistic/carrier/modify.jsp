<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="carrierForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="modifyCarrier"/>
	<html:hidden id="isValidate" name="isValidate" value="carrierViewBean.isValidate" />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.carrier.title.modify") %>' name="title"/>
	</jsp:include>
	<table id="1692" class="edit-talbe">
	<html:hidden id="carrierId" name="carrierId" value="carrierViewBean.carrierId"/>
		<tr class="trCell">
			<td class="edit-talbe-label" id="FCHCFHLBNOCBNOBLCIAMIMOAPIBNOEKACMJCIFNGIKGAEKBFAFCPIFCLOCKBHKKA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriername#}" ></html:label>
			</td>
			<td  id="ENJHBHHEOCKJGKHJHIELBMGAAKFFKLLBHEFHBPIOOCKHGHMCNILJJEPKECLKHFCI" colSpan="1" rowSpan="1">
				<html:text  id="carrierName"  name="carrierName"  value="carrierViewBean.carrierName" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GHNLHGHACKIHIFCMLGCFNLIHHENAIAEFCEBFOIEHEIHNIJKLCGGKFHFOLHOFKMLM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriercode#}" ></html:label>
			</td>
			<td  id="PNCHJAHAHOKPBKLIKKHNOCACKBFLKPHHCOGINFNPBJILAHFABBNBFFEMKKKNAPBH" colSpan="1" rowSpan="1">
				<html:text  id="carrierCode"  name="carrierCode"  value="carrierViewBean.carrierCode" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="LCENBOKPOAFBKKHOCEMFNEAIHGBKJMGPHBAICNOCGIKPFKEBKKBONJFJHOFNEOBI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriercontactor#}" ></html:label>
			</td>
			<td  id="BLOBOLOKEBNBKLMNKIGMEINEJKGNFKOFJKPLMGAGEHCKIJPCOIOAKOBLCOKPFKIK" colSpan="1" rowSpan="1">
				<html:text  id="carrierContactor"  name="carrierContactor"  value="carrierViewBean.carrierContactor" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NLPJACNGGKBLJCKLALJKMMMPNAJKOIINMACOJPJONECNHKPLCPMGONOHPMBLJBPC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriertelephone#}" ></html:label>
			</td>
			<td  id="FPFHBEBINPPNOJMHIJBNKAMFLNJFMNGEFBEIEFMOGPKMPKBHHIALBAPJAPKONNMB" colSpan="1" rowSpan="1">
				<html:text  id="carrierTelephone"  name="carrierTelephone"  value="carrierViewBean.carrierTelephone" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GGOMJHHAMIOGEOMKKAAOGOLGOHKJJFLNENPMAFKCEIKJGLFGAMGAFEKBOLOKHEBK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carrierarea#}" ></html:label>
			</td>
			<td  id="LIBKAAKJKGFFGPFEKKBBBBNNJKEIOEHOJJOAKEHKMKEMBAKABLGBHHLGGGECHEIO" colSpan="1" rowSpan="1">
				<html:text  id="carrierArea"  name="carrierArea"  value="carrierViewBean.carrierArea" size="40" style="width:300px;"/>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('carrierForm')"/>
				<btn:return href="contoller.do?operation=listCarrier"/>
			</html:td>
		</html:tr>
	</html:table>
	
	<com:validator formId="carrierForm" showNormal="true" submitValidate="true" >
		<com:vElement id="carrierName"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="carrierCode"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="carrierContactor"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="carrierTelephone"  types="number" event="onblur">
			<com:init size="20" maxlength="11"></com:init>
		</com:vElement>
	</com:validator>
</html:form>
