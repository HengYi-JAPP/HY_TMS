<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="factoryForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="modifyFactory"/>
	<html:hidden name="isVlidate" id="isVlidate" value="1" /> 
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.factory.title.modify") %>' name="title"/>
	</jsp:include>
	<table id="1632" class="edit-talbe">
	<html:hidden id="factoryId" name="factoryId" value="factoryViewBean.factoryId"/>
		<tr class="trCell">
			<td class="edit-talbe-label" id="MPIIPHAKMEJOECHJLPOHPJCBINKHLLJEMFFACAIKMKAIOEGHICPEKKHELIONFICP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factoryname#}" ></html:label>
			</td>
			<td  id="PHKKMOKBEOGEGLKMHPJGKLHHCPJPEKFMBMJBHPLPHFEMMKPPNKEGMJMOBNFHCFAI" colSpan="1" rowSpan="1">
				<html:text id="factoryName"  name="factoryName"  value="$[factoryViewBean.factoryName]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="BMGJIFAGHCPCKIOLKFHNKJELHAECCIEEKCCAIPACMJKPHMLIFOAMOILBAMOIHGHK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factorycode#}" ></html:label>
			</td>
			<td  id="AJKCCJKNFLLFOICNKMGBNKMNCPBOFAKMEOPOEOLCPHOOHFIBLFOKHAEEAHIBKMAK" colSpan="1" rowSpan="1">
				<html:text id="factoryCode"  name="factoryCode"  value="$[factoryViewBean.factoryCode]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="AMPIAKOOFGICPMCPENNPKOBENHKHLMAGMMJNNNFBCCPMEHBFJEIKKLFFHJFGOLKK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factorycontactor#}" ></html:label>
			</td>
			<td  id="MCEBPKGKBIFIOHPMFHOKAOHKKHAJAFJPKBEAMIKKNKKNKNCFNNLEAKENKLHMBLKK" colSpan="1" rowSpan="1">
				<html:text id="factoryContactor"  name="factoryContactor"  value="$[factoryViewBean.factoryContactor]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GJALFLOBEGKKINOCELKMCGCHHFFHAOBNNCKHMHEJBCBOJFLJAJLBFNGMCKNFLNFA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factorytelphone#}" ></html:label>
			</td>
			<td  id="HKBPKOOIOOKGGMMEILJJFLCJIGNCOKIMBMKAINKJGACNNKLNFFOMLIAEAOFGHMEM" colSpan="1" rowSpan="1">
				<html:text id="factoryTelphone"  name="factoryTelphone"  value="$[factoryViewBean.factoryTelphone]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GKFCCONOAHFHFOAEAGIIEMIAKHCKHNBKOBKOPJPNHFLKOLBBNMCBKJHBFAANKKJP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factoryaddress#}" ></html:label>
			</td>
			<td  id="CFPNOAEFLIILPOCAPPGHELHHOFNGOFPBAKGKKLKKMLPGIHPHLHLKHAHKIIGEKHMK" colSpan="1" rowSpan="1">
				<html:text id="factoryAddress"  name="factoryAddress"  value="$[factoryViewBean.factoryAddress]" size="40" />
			</td>
		</tr>
		<tr class="trCell">
					<td class="edit-talbe-label" id="KAIBBNONHHKHOPCMKCGFEGKKHFEPNNBPFEMKAPLLOLAHIJOMJIMIJLICIJJMHKOP" colSpan="1" rowSpan="1">
					    <html:label label="{$jsp.common.status.validate#}"/>
					</td>
			        <td  id="KCAOHONEAIACMLIEKKGKKKLIIINMBEPEGCPPINCBKHHIJFBKNJJBCOAFKKMIGEAA" colSpan="1" rowSpan="1">
					    <com:switchbox varValue="factoryViewBean.isVlidate" talbeName="TB_HTMS_FACTORY" idValue="factoryViewBean.factoryId" 
					    offValue="0" varName="isVlidate" 
					    onValue="1"  idName="factoryId" 
					    offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"    ajaxUrl="contoller.do"/>									
					</td>
			</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KAIBBNONHHKHOPCMKCGFEGKKHFEPNNBPFEMKAPLLOLAHIJOMJIMIJLICIJJMHKOP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.factory.factorydesc#}" ></html:label>
			</td>
			<td  id="KCAOHONEAIACMLIEKKGKKKLIIINMBEPEGCPPINCBKHHIJFBKNJJBCOAFKKMIGEAA" colSpan="1" rowSpan="1">
				<html:textarea id="factoryDesc"  name="factoryDesc" cols="41" rows="5"  value="$[factoryViewBean.factoryDesc]"></html:textarea>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('factoryForm')"/>
				<btn:return href="contoller.do?operation=listFactory"/>
			</html:td>
		</html:tr>
	</html:table>
	<com:validator formId="factoryForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="factoryName"  types="isnull" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="factoryCode"  types="isnull,number-letter" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="factoryAddress"  types="null" event="onblur">
				<com:init size="40" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="factoryContactor"  types="null" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="factoryTelphone"  types="mobile" event="onblur">
				<com:init size="20" maxlength="11" ></com:init>
			</com:vElement>
		</com:validator>
</html:form>
