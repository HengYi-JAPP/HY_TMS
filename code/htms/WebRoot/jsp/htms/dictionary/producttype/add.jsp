<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="productTypeForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="addProductType"/>
	<html:hidden id="isValidate" name="isValidate" value="1"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.producttype.title.add") %>' name="title"/>
	</jsp:include>
	<table id="1623" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="GAENJJFBOPJCLAOJKKKKIKJCBAKOFFEKOMKONKOKFEEKBHMEFCKHMONABCKPEJNB" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.producttype.typename#}" ></html:label>
			</td>
			<td  id="PBHOOEHMGNFKKNFCPJCACLNCMFGFKEAJKGJACKHKNJKIENJEPGPLKLEKOMCAJBMB" colSpan="1" rowSpan="1">
				<html:text  id="typeName"  name="typeName" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NGHLKKCKNKJNKMAFBICJHJAIKHCPPKBKNHBAAPLNHLJICKNLCKOMHHJKKHKLBBGG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.producttype.typecode#}" ></html:label>
			</td>
			<td  id="FAABOIGHHHOLHEKBIOAEKENKEAAGMCLCJGPJNAKIEABEAMPBHPIKAANLKKMPFGJF" colSpan="1" rowSpan="1">
				<html:text  id="typeCode"  name="typeCode" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KKEGKPOKLHHGLKOAJAFKKJCKEMNMHOAECLMIKFKKBPKEEAGNIJCBKGFOABEPKBPK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.producttype.typedesc#}" ></html:label>
			</td>
			<td  id="ONFBFECKGGFKAKPBNIJHNPLOKGEAKPFFLHGBEKKKLIFGKLBNIHGKLKKKCEKPGKCA" colSpan="1" rowSpan="1">
				<html:textarea id="typeDesc"  name="typeDesc" cols="40" rows="5"></html:textarea>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('productTypeForm')"/>
				<btn:return href="contoller.do?operation=listProductType"/>
			</html:td>
		</html:tr>
	</html:table>
	<com:validator formId="productTypeForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="typeName"  types="isnull" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="typeCode"  types="number-letter" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
		</com:validator>	
</html:form>