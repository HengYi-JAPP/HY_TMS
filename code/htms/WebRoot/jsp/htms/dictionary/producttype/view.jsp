<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="productTypeForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.producttype.title.view") %>' name="title"/>
	</jsp:include>
	<table id="1625" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="GHNBLLPHMHHKKEPOOAIILCGNENKPHFNEHLMCNKIHEKKKKJCINKIKNGJEPHMNLPHO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.producttype.typename#}" ></html:label>
			</td>
			<td  id="PKGFBPKJOEJJLPAPHCMIEHEEPNKFABMOKFLLPAOLEJOENOHEMFHAOPAOFJPEIKBA" colSpan="1" rowSpan="1">
				<html:value  value="$[productTypeViewBean.typeName]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KMOGMNJEEGLIPHHMBHNALJCJAIABCEGCGCJLKBAKIBFPGNKHEENFECIJIIECCIPG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.producttype.typecode#}" ></html:label>
			</td>
			<td  id="EJPMEPJEFOALMEKNIEPCFOGIKAOKGGOICNKHLCKLNPOPKBHNIOACLCKAJAECOCBA" colSpan="1" rowSpan="1">
				<html:value  value="$[productTypeViewBean.typeCode]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="NIJFPCOELOEMOEFKECAPGLKIFLLNOOEKJJBOFEBEJGEGKNOEICKHHHIOGHPFBCIN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.producttype.typedesc#}" ></html:label>
			</td>
			<td  id="PJCIEHCHEJAHEHNFMBJKGEAPBCLEIGNBKGOKFMGPNCHPMBLKJBGGBJAHMEGAPCGF" colSpan="1" rowSpan="1">
				<html:value  value="$[productTypeViewBean.typeDesc]" ></html:value>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listProductType"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
