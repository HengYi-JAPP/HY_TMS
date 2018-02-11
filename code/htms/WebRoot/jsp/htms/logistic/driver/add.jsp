<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="consts.PropKey"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<cext:dic typeCode="<%=PropKey.SEX_TYPE_DIC%>" scope="request"/>
<html:form id="driverForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="addDriver"/>
	<html:hidden id="isValidate" name="isValidate" value="1" />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.driver.title.add") %>' name="title"/>
	</jsp:include>
	<table id="1687" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="COEGCACONNEMECLABPCOKHBKCFKPAAKCKKFBHHGIIPHBPAPLBMOALLNKJJNCIBHK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriername#}" ></html:label>
			</td>
			<td  id="FKKIGNLGHKNAKNNBAOLGAPBEMMGPCKLCOECJJAEKJMOCFIIBHHGEIFFCJNIKPKMN" colSpan="1" rowSpan="1">
				<html:select  id="carrierId"  name="carrierId"  list="carrierList" ><html:option label="carrierName" value="carrierId"></html:option></html:select>
			</td>
			<td class="edit-talbe-label" id="EIFOBBFOEIEIKKKLNOCEFMHHAKFAOIGLIGBAAAONBKJPCNKLOJPIKFLGPKCECKPL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivercode#}" ></html:label>
			</td>
			<td  id="MOAHHBJNHABAKKGKPCLOCELHKNBBMALFEFFHIKIMMILBCJNHBKPCCKIFGAEMMABH" colSpan="1" rowSpan="1">
				<html:text  id="driverCode"  name="driverCode" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="LIIABOGHIIIGLAOJMKIJJILMECPHCIBHJKJPGCJKEKFHIKCOEMPKHOGNPCFEMCBJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivername#}" ></html:label>
			</td>
			<td  id="GFCMGGKMKKBEPPBENGAACINJGECONCHFFBLBKPLKLFOCCPGPFJJBJCLMJEFKLKBP" colSpan="1" rowSpan="1">
				<html:text  id="driverName"  name="driverName"/>
			</td>
			<td class="edit-talbe-label" id="NOKHOAIEKHMKKIJIFLLJNAOFEFLFABALOIHBPEBMEEFNJNIMNGCEOKBIAKJCCOHA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driveridnum#}" ></html:label>
			</td>
			<td  id="OMFAPKFAHKGKCCHJPAKIKLCKCHFKKHALLMINJPPMLKCHHHBOEOCKBCLOGOMBNINJ" colSpan="1" rowSpan="1">
				<html:text  id="driverIdNum"  name="driverIdNum" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="MKHGNHEMBKLMAALGKKPPJIFEKAAJLHGEGNPOAAACABMAKIFHOAOLLCPLKJKNCOPC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivermobile#}" ></html:label>
			</td>
			<td  id="LGILOLGLNOHBNJPAFEIPOACBGGINKFPKAJEECNCCCCKHIJIPGIPFLLPGLBKJJHIG" colSpan="1" rowSpan="1">
				<html:text  id="driverMobile"  name="driverMobile" />
			</td>
			<td class="edit-talbe-label" id="GJPCGBPIKKCOECLKKHOGALCKBGKAHBLKGOIHLMEPBOAEKGMAAIJELIHMICOBKHCE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driverweixin#}" ></html:label>
			</td>
			<td  id="MJPLMJNEEFNOFLGKKHHHCFKMPFOOEFBLCJPHCNAEEFEMPJKPAIAIHKBOFNCKOPKH" colSpan="1" rowSpan="1">
				<html:text  id="driverWeiXin"  name="driverWeiXin" size="15"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="IOKKPNLPGPFIFBGFGGJCMECKLPPOMPEJIGHAPNBBECPMCNNEBJIFCKMEHACHBCNK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driversex#}" ></html:label>
			</td>
			<td  id="IFONJOAJKIFPMMEHBBEOMNMGAJIFFKALOEBLNEOGMJIJOGGAKLLKKBNBCCKAFCPM" colSpan="1" rowSpan="1">
				<html:select id="driverSex" name="driverSex"  list="<%=PropKey.SEX_TYPE_DIC%>">
					<html:option label="dicName" value="dicId" />
				</html:select>
			</td>
			<td class="edit-talbe-label" id="AAEEPBEJMKKLKCJAMILJKEFAHKJMKNEKIMBLPLLINMLBPIOOKCEONCOAFPKKKKPN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driveryear#}" ></html:label>
			</td>
			<td  id="LMKAPJOFLNBFIHHPBBNMBNHBPFPCKKNCGBIACLJPJOAJEOIAKCMJIFKLPHPMCKCM" colSpan="1" rowSpan="1">
				<html:text  id="driverYear"  name="driverYear" size="5"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="LKIOKFOEGLLHNOCJKKHFOCNBLAACKGCPLOHFOLKHAIEKFPAHKCIBKHCKIBKKILEH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driveraddress#}" ></html:label>
			</td>
			<td  id="KILMGLBPCKCIHFGKFOILMMINHFAIGECNOKLCOMJOKELMNBKLGBKKHKECKHNOBNNK" colSpan="3" rowSpan="1">
				<html:text  id="driverAddress"  name="driverAddress" size="45"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KIPKIBGNOEAALIGKHOIGKFGELABKLLCEABJMAEOOHFNOPMOKCENOKENHOMPPCJPP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivernotice#}" ></html:label>
			</td>
			<td  id="GJJKOACLPNFGIHOEPBOEGGEMMAILFNJBAHKALMJHEAMHMHPJGKCBAHAEHHFAIIBK" colSpan="3" rowSpan="1">
				<html:textarea id="driverNotice"  name="driverNotice" cols="40" rows="5"></html:textarea>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('driverForm')"/>
				<btn:return href="contoller.do?operation=listDriver"/>
			</html:td>
		</html:tr>
	</html:table>
	
	<com:validator formId="driverForm" showNormal="true" submitValidate="true" >
		<com:vElement id="driverName"  types="isnull" event="onblur">
			<com:init size="15" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="driverCode"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="driverMobile"  types="mobile" event="onblur">
			<com:init size="15" maxlength="11"></com:init>
		</com:vElement>
		<com:vElement id="driverIdNum"  types="isidcard" event="onblur">
			<com:init size="20" maxlength="18"></com:init>
		</com:vElement>
	</com:validator>
</html:form>
