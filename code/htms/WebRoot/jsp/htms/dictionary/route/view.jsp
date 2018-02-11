<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
String currentAreaId=request.getParameter("areaId");
AreaRepository rep = new AreaRepository();
String areaName = (String)rep.getFullAreaName(currentAreaId,"",true);
areaName=areaName==null?"":areaName;
%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="routeForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"  />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.route.title.view") %>' name="title"/>
	</jsp:include>
	<table id="1637" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="PGPKFPJOAJIHEBPGKIGLBEIKKANHAKICHKFJBFLIAAHEHKGKMFJACGBMOOFJNCAP" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
			</td>
			<td  id="HKBOOGJJACBABMKLAKCNKLCEHJFEAJCKLOBOEIKCKPLBMFKCEOFHGLJCPIGEKJCF" colSpan="1" rowSpan="1">
				<html:value  value="$[productViewBean.productName]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="KMAJKPJKPONPIKAKPLJCNINMMNJABONLKEHKHMNIGAOKOIILGOMGNPEBHCIMEFGI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.route.factoryid#}" ></html:label>
			</td>
			<td  id="MANAFLPNHOHMOMIFAGEHPKOBECANGIGIIBHPKJAEFBIIKIBANPNAKKBKNEBPEBKM" colSpan="1" rowSpan="1">
				<html:value  value="$[factoryViewBean.factoryName]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="CFPJLBPFCICGPLIGLMIFCEHOFIKINNEPIHAPMJMFKKHNEHJCJLFBBIEKILOBKHGB" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.route.areaid#}" ></html:label>
			</td>
			<td  id="KKOKHNOFAINKCKIBEONIMJBPJNPEJPOHLAPPIHCMJICNBBLFLOKLJFKBIOKKLCCA" colSpan="1" rowSpan="1">
				<html:value  value="<%=areaName %>" ></html:value>	
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listRoute"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
