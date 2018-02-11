<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="productForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.product.title.view") %>' name="title"/>
	</jsp:include>
	<table id="1629" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="MFIMPIGILBNNKMICHBNMONLHOKKBCKBGJFKENPBOFKFHGFILMKJLLOHLGMKLKKEG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.producttype.typename#}" ></html:label>
			</td>
			<td  id="FEKNKIKPKFGFNKCKHLLLBHKIBFJNCCBKAMKBGCLIOCKBNLGOJJOPKOPAGLNJMOAK" colSpan="1" rowSpan="1">
				<html:select  id="typeId"  name="typeId"  list="productTypeList"  disabled="true" ><html:option  selected="$[productViewBean.typeId]"  value="typeId"  label="typeName" ></html:option></html:select>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="BIJKPENIIOHEKMBNJIJMEHNLOHHHJGKLFALCNMPEKBJFMJMFGCOKOPNPBFAHBPFH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
			</td>
			<td  id="CMEHGKCLOCPCAAJFMCLFIHKIOKKKABKGBEKCAIKKLPAKNKPCKBCOHEEMOGOCPBLA" colSpan="1" rowSpan="1">
				<html:value  value="$[productViewBean.productName]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="IIHABEJFAJEJFOOACECNLFKABKHNHINEPFFJIMOJPMOPAEGEAMOAKFAPIIPIAING" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productcode#}" ></html:label>
			</td>
			<td  id="MAKAKELPJLKOKBELIPHICPBBABPLMEFGEIOAGLBCPAKFAILIAOKAPFFKILAEPOEI" colSpan="1" rowSpan="1">
				<html:value  value="$[productViewBean.productCode]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="CPLEAACHJHBAAJMCMOPKBBILNAAOAPPAABAFBAOKKIJONHFOKEJGKHKMMIAFHPHH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.sapno#}" ></html:label>
			</td>
			<td  id="POFOOPLPLAMOLMMBBGNFEOEHKKIMIJEKIIOOOJNJJEMNKGMLFMECCHNPJECCOBKC" colSpan="1" rowSpan="1">
				<html:value  value="$[productViewBean.sapNo]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="BCKNMCFHPGEMAFFNIMJFHFLAGEFLIKIKJKNNCMJIFHBKIOPGAINAJCNIOBKBIMIH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productdesc#}" ></html:label>
			</td>
			<td  id="KCBAKMFKKCAMBFALCJFKHMFHECBOFIMOINAEMCJLKNECOEFBPFLLLFIJKLCFGOIG" colSpan="1" rowSpan="1">
				<html:value  value="$[productViewBean.productDesc]" ></html:value>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listProduct"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
