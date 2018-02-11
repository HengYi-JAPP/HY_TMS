<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="productForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="addProduct"/>
	<html:hidden id="isValidate" name="isValidate" value="1"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.product.title.add") %>' name="title"/>
	</jsp:include>
	<table id="1627" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="CKLPCNHJKJHFECEKKHLNJAMGBBGLHOAKAHPJKMBNGCFIGKCPCBJNGJGOOOPMCKEB" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.producttype.typename#}" ></html:label>
			</td>
			<td  id="CKHFEKPKFNHFNGOANNCEAHFILCEEMACPMNBLAPEIKJPEFIMFGNFKAPLHNMGKPMIM" colSpan="1" rowSpan="1">
				<html:select  id="typeId"  name="typeId"  list="productTypeList" ><html:option  value="typeId"  label="typeName" ></html:option></html:select>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="INLIFLOLACPKKEFBNEPKFCKFKIKKCKNBBEFPNPHIIAAJMLGFCOJFJFOJGPNMOJOI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
			</td>
			<td  id="JEOHKFMNNBALIJIAHHNNFONNHGNFPOIJCFOKJIGEHACKPKLBIEMGKELOOIGMGLGP" colSpan="1" rowSpan="1">
				<html:text  id="productName"  name="productName" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="MFNPCGBCLIFIMGAIGPHJCAKPHNHLKNAGKPPIMOLIBLHFEOKFCHEAKKAJGNGCKKON" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productcode#}" ></html:label>
			</td>
			<td  id="LNFLOLEPPGFLBOEPGPKGOHAKLPGHMECKMIJHKMLBKNKMPKHNGHFHNKOKICKIKPFE" colSpan="1" rowSpan="1">
				<html:text  id="productCode"  name="productCode" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="IGBLECPNPOKOOLPCMKAEEBBHKFCBFCKIAKPBHPJPACLOOKKLJHJBPKBEKHOCLKMI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.sapno#}" ></html:label>
			</td>
			<td  id="KBFFMPILEPMAKGAKCAOJOIGCCEBAHLAMIKOCKGIIOJOPCIJCKKOHLKEJPJMPKPPK" colSpan="1" rowSpan="1">
				<html:text  id="sapNo"  name="sapNo" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="POAJONIGEJGOAKMIFGNAGGHJOHHIAKMHBBJLNEIKCMOCHPIHKGFNBEKBIKALIIBK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productdesc#}" ></html:label>
			</td>
			<td  id="IBHLFKCOFKJNLNNGMKNIIILHGCKOCGEHMFIBMNJAIENIGGBHPLNFGNFFPJAKCOIH" colSpan="1" rowSpan="1">
				<html:textarea id="productDesc"  name="productDesc" cols="40" rows="5"></html:textarea>
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
			<com:vElement id="productCode"  types="number-letter" event="onblur">
				<com:init size="20" maxlength="30" ></com:init>
			</com:vElement>
			<com:vElement id="sapNo"  types="number" event="onblur">
				<com:init size="20" maxlength="30" ></com:init>
			</com:vElement>
		</com:validator>	
		
	
</html:form>
