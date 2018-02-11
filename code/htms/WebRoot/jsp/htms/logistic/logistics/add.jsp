<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="logisticsForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="addLogistics"/>
	<html:hidden id="isValidate" name="isValidate" value="1" />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.logistics.title.add") %>' name="title"/>
	</jsp:include>
	<table id="1707" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="NPNCGAJHHEKOKIEAIAJLMPMJPLIOGJGBMMPJKIPLOOBAANFJGINCINAPNGJHIKIH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticsname#}" ></html:label>
			</td>
			<td  id="NFPCJNMKIBONFCLFHNCKFIKCEKNEKEKLANKKBIBFLAHGOFLFKKFPKFBEIJNGHOHI" colSpan="1" rowSpan="1">
				<html:text  id="logisticsName"  name="logisticsName"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="JBJKNMGJMPCIOBMAECHKOLAFGNFFLFMBIBGPMIEOMCALKJIEINKBOBAALAPNFKGC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticscode#}" ></html:label>
			</td>
			<td  id="KCCGBJCAJOPGIPLEBHEAPKGPKAKOLGHIFBNIMMIAFAHBHBONOKEEBHCNGHAOCPAE" colSpan="1" rowSpan="1">
				<html:text  id="logisticsCode"  name="logisticsCode" />
			</td>
		</tr>
		
		<tr class="trCell">
			<td class="edit-talbe-label" id="BEEIOCAKAFLKIFBGCKBHIOJBGHFLBABAOCLOIIAOKOBMIOIHMBPNNJMNONHGEEKP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticscontactor#}" ></html:label>
			</td>
			<td  id="JJFNCAEBKCGINIJLINOBMPLKFONNJOMGMAOPHFLEEPMNELJPMKFAKBKJABHKFBOA" colSpan="1" rowSpan="1">
				<html:text  id="logisticsContactor"  name="logisticsContactor" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GFGGONNEELPGGJBKLFPEALAKFOKBJLNOGAPBENKHFIELNNHIKNGLGAPILJLHMKMM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticstelephone#}" ></html:label>
			</td>
			<td  id="BKFKBHELIFHLGFFIGIAECGKKHFCIBILJGFAKMMLNKMBGGEBPPMKGBPKMLJKFMKGI" colSpan="1" rowSpan="1">
				<html:text  id="logisticsTelephone"  name="logisticsTelephone" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="AHKKHBACCNNNKINFCICEKLLNEJPLBHHHECGNIKAHILKKKCKCBNGIBFKJKKKOOIOO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticsaddress#}" ></html:label>
			</td>
			<td  id="KIPAKKAPJAEEFOOAKGBJKMLOICJNKPGNMBMKMKKCEEFKJOOFAHAJJOFCKIEGBCNH" colSpan="1" rowSpan="1">
				<html:text  id="logisticsAddress"  name="logisticsAddress" size="40"/>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('logisticsForm')"/>
				<btn:return href="contoller.do?operation=listLogistics"/>
			</html:td>
		</html:tr>
	</html:table>
	
	<com:validator formId="logisticsForm" showNormal="true" submitValidate="true" >
		<com:vElement id="logisticsName"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="logisticsCode"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="logisticsContactor"  types="isnull" event="onblur">
			<com:init size="20" maxlength="60"></com:init>
		</com:vElement>
		<com:vElement id="logisticsTelephone"  types="number" event="onblur">
			<com:init size="20" maxlength="11"></com:init>
		</com:vElement>
	</com:validator>
</html:form>
