<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="productForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="modifyProduct"/>
	<html:hidden id="isValidate" name="isValidate" value="productViewBean.isValidate"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.product.title.modify") %>' name="title"/>
	</jsp:include>
	<table id="1628" class="edit-talbe">
	<html:hidden id="productId" name="productId" value="$[productViewBean.productId]"/>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GCPEPGHKAPHGLOGBCFEBMKNPGOFMNNKHOKENBKLLOKBKAKKKCCFNIOFGBNENBAFE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.producttype.typename#}" ></html:label>
			</td>
			<td  id="HLHNGJLBKGKOFJACOBKOOJHPJPPANPBEAPFHCAGGLBAFLGFIKHCEIJHHJCGKIGLK" colSpan="1" rowSpan="1">
				<html:select  id="typeId"  name="typeId"  list="productTypeList" ><html:option  selected="$[productViewBean.typeId]"  value="typeId"  label="typeName" ></html:option></html:select>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="GLMPJIBKMLIHNLGFOOFPGMCLIGKHCCMKJGANGBMFMEKNLPEGIECALAPCAPLABMGJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
			</td>
			<td  id="MHKOMIPGEPHLMAKHAGLEBLCNNIFHCHPOCKFHFIEFHHOELNJHPLPAOLOPGMNJGAFB" colSpan="1" rowSpan="1">
				<html:text  id="productName"  name="productName"  value="$[productViewBean.productName]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="ECFNBNOIHCBGFLALOJHEIKEKMJKIEHNFCKHLKCHNPONKOHMLACKMBLFPKHKKBGAJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productcode#}" ></html:label>
			</td>
			<td  id="LCBMBLPBGNKAOIFJIOKIJJFMEKHPLIIPKCGCCMNHNEGJNJAAOJCLOAOGPNOJKPAG" colSpan="1" rowSpan="1">
				<html:text  id="productCode"  name="productCode"  value="$[productViewBean.productCode]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="HNAGKLEACFANPIHEIGGNIJKCENACLIPHBKKOIILKPOIOGJNNHPCFHKKNKHCEHPJJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.sapno#}" ></html:label>
			</td>
			<td  id="GELKENLPKIFNGHCFPGMGCGMKONKIPFJNOKNNKALHLFBAAMOAEHCJGOBKJEBHGNMM" colSpan="1" rowSpan="1">
				<html:text  id="sapNo"  name="sapNo"  value="$[productViewBean.sapNo]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="HHPBBPMGOGAMPFFICLFLOLHNHLOOLLBOJGEKKLFAFLGCNAEGEKOKPLMGOAKBEJKK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productdesc#}" ></html:label>
			</td>
			<td  id="FJFAKOAHNPKKKFPGCCNIGEPPAKNECFMKHECHKNGBMPPPPLKEANKNFEKCAOCKHHKF" colSpan="1" rowSpan="1">
				<html:textarea id="productDesc"  name="productDesc" cols="40" rows="5" value="$[productViewBean.productDesc]"></html:textarea>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('productForm')"/>
				<btn:return href="contoller.do?operation=listProduct"/>
			</html:td>
		</html:tr>
	</html:table>
		<com:validator formId="productForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="productName"  types="isnull" event="onblur">
				<com:init size="20" maxlength="30" ></com:init>
			</com:vElement>
			<com:vElement id="productCode"  types="number-letter " event="onblur">
				<com:init size="20" maxlength="30" ></com:init>
			</com:vElement>
			<com:vElement id="sapNo"  types="number" event="onblur">
				<com:init size="20" maxlength="30" ></com:init>
			</com:vElement>
		</com:validator>	
</html:form>
