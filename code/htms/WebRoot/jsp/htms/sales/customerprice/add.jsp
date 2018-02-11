<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="customerPriceForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"   />
	<html:hidden id="operation" name="operation" value="addCustomerPrice"/>
	<html:hidden id="isValidate" name="isValidate" value="1"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.customerprice.title.add") %>' name="title"/>
	</jsp:include>
	<html:table id="1647" styleClass="edit-talbe" list="routeViewBean" bean="routeViewBean">
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
			<html:label label="{$jsp.htms.dictionary.transprice.route#}"></html:label>
			</html:td>
			<html:td>
			<html:value value="routeViewBean.productName"/>:
			<html:value value="routeViewBean.factoryName"/>-><html:value value="routeViewBean.areaName"/>
			<html:hidden id="checkRouteId" name="checkRouteId" value="routeViewBean.routeId"/>
			</html:td>
			<html:td styleClass="edit-talbe-label" id="HMGBGCOFCMIMJKHNIBBKOIIEKNICFIHNKAJLJPNCINAKJPEHIHKBLNPFOCKPNKKE" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</html:td>
			<html:td  id="KBEMLHJIOCEHGKHMMJPEPBEJNKOPKFMLABJPAFPNKMHEOCGBOAKJNOAGJEIINEIP" colspan="1" rowspan="1">
				<html:select  id="customerId"  name="customerId"  list="customerList" ><html:option  value="customerId"  label="customerName" ></html:option></html:select>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" id="NCKIPJPFIECFCNMJGMIIOCKNBEBBBHHPKMKNECKCOKGKJBFBIJPKKPLLAHHJBALG" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.customerprice.pricetype#}" ></html:label>
			</html:td>
			<html:td  id="BHGLACPIKHEMCNCNNGIBABFNKHPJHMKFLCHEILBLJMMBGMAENKMKNELJACIJIHNI" colspan="1" rowspan="1">
				<html:select id="priceType" name="priceType"  list="price_type_list" isCascade="true" isCascadeSource="true" cascadeTarget="priceUnit">
					<html:option label="typeName" value="typeId" />
				</html:select>
			</html:td>
			<html:td styleClass="edit-talbe-label" id="LMFCBOBHMKAAKKFPCPCKMOLLLFLHIFEKPOHJKANHFKOEABNOKMPLKPNILGAHKIBP" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.customerprice.priceunit#}" ></html:label>
			</html:td>
			<html:td  id="IOLIJHFAHLKJHCMJIGKNFFACMNKBIFKKGJJOAIIPEMBBCIECLFBPKJGJAIFKHJLJ" colspan="1" rowspan="1">
				<html:select id="priceUnit" name="priceUnit"  list="price_unit_list" isCascade="true"  cascadeValue="typeId">
					<html:option label="dicName" value="targetDicId" />
				</html:select>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" id="OGCEKHOAFGCCLHFOKIEMOGOMLICAHOKGNIGAGFEOAOAOBMIEOOBOGEAIMCKLHEAL" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.customerprice.pricestart#}" ></html:label>
			</html:td>
			<html:td  id="HNKKOAGAKCLPELBALHIEHHCBLKBCGFHEKPICJHCLLOGMBPPJJCMLOJFAFKLECLJL" colspan="1" rowspan="1">
				<html:text  id="priceStart"  name="priceStart" />
			</html:td>
			<html:td styleClass="edit-talbe-label" id="JEKFKCMMCNJNCEHPKOOHLICOEBHLCIOFKMEIHIGKHOAGLBMFJJFOCAALIKPCKKFJ" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.customerprice.priceend#}" ></html:label>
			</html:td>
			<html:td  id="KFJINBAHJABKLKBEBPBJCIGNKJGKJCCJPMOOFOLGBJCBIEOKIJMKMOFACNKOLGEE" colspan="1" rowspan="1">
				<html:text  id="priceEnd"  name="priceEnd" />
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" id="FCHIEIEKIAPLFFFOLAPGMFNGCLAABKBFMMMCBOAMNLMOHCLOABFLIOFCAICBLEJB" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.customerprice.customerprice#}" ></html:label>
			</html:td>
			<html:td  id="PNNLLLKAEBKOOKPMFABMHCHKCNHHBCBOBPMEKAHJLMMMPNGOJEKCPNKKBCOGLKLJ" colspan="1" rowspan="1">
				<html:text  id="customerPrice"  name="customerPrice" />
			</html:td>
			<html:td styleClass="edit-talbe-label" id="MCLEIMHIIOMMCHHHCIIHEKLMLKNEGPHHEEFCENKNBOENPEGOAKJJPGHLPLCEAKJG" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.customerprice.companyprice#}" ></html:label>
			</html:td>
			<html:td  id="ELNPNJECKJMOCPKPFLNNGIKIFNBMFHPJMKAHLBEIKCFCOEMJMHHLKCPMIPPILBBE" colspan="1" rowspan="1">
				<html:text  id="companyPrice"  name="companyPrice" />
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" id="NIACCCBNOCLCKCPFHHPBNKNABKCCGEJFGBGFOJBGNCIEBAKFNIEHPGOOKPKEANKM" colspan="1" rowspan="1">
				<html:label  label="{$jsp.htms.sales.customerprice.carrierprice#}" ></html:label>
			</html:td>
			<html:td  id="CGCGLMMNLFOKHFKKIBPPFJGMKNFKGIEKBKNFHKBKLCNGKEFHLKBKMEJHLIPGMAJE" colspan="1" rowspan="1">
				<html:text  id="carrierPrice"  name="carrierPrice" />
			</html:td>
			<html:td  id="CGCGLMMNLFOKHFKKIBPPFJGMKNFKGIEKBKNFHKBKLCNGKEFHLKBKMEJHLIPGMAJE" colspan="2" rowspan="1">
			</html:td>
			
		</html:tr>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('customerPriceForm')"/>
				<btn:return href="contoller.do?operation=listCustomerPrice"/>
			</html:td>
		</html:tr>
	</html:table>
	<com:validator formId="transPriceForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="customerPrice"  types="number-spot" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="companyPrice"  types="number-spot" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="carrierPrice"  types="number-spot" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="priceStart"  types="number-spot" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="priceEnd"  types="number-spot" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
		</com:validator>
</html:form>
