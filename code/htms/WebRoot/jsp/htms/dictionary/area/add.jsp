<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

 %>
<head>
<script type="text/javascript">
var basePath="<%=basePath%>";
</script>
<base href="<%=basePath%>">
</head>
<com:loader  js="js/common/common.js"/>
<com:loader js="jsp/htms/dictionary/route/area.js"/>
<com:loader css="css/common/sub-table-list.css" validator="true"  tree="true" switchbox="true"/>
<html:form id="areaForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="addArea"/>
	<html:hidden id="isValidate" name="isValidate" value="1"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true" tree="true" myWin="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.area.title.add") %>' name="title"/>
	</jsp:include>
	<table id="1639" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="KLOHICKMBLNCLMAOLEKEJHOPMAGHCCHIBMFFIOPKCGLHEGPGFECNBMKKKILKNEHK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.areacode#}" ></html:label>
			</td>
			<td  id="KCICJPEAHPEBJEKMLIBGOMBKHNEJNGGNKKEFKNHEMGHHJMGKHMMHHLIMFHKIBCKM" colSpan="1" rowSpan="1">
				<html:text  id="areaCode"  name="areaCode" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="OAPEFOOFLEANKHNINCFGFCOCJBFNAFEFJPEKMHCOCPHKGKOKPPKAGKAEIEIMFGIE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.areaname#}" ></html:label>
			</td>
			<td  id="KGNPKMOKBCJKINMNJIOPOIIFKOBMFAMMMPCKLOJIKAKLHIFJAJIGEKOKHJCKOJPI" colSpan="1" rowSpan="1">
				<html:text  id="areaName"  name="areaName" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="APBNKHOHOBOBMMGBPKBCOLKNPNEBNBFFFLHKHAINKNILPPPHCLMPILJOPHGHBGGH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.parentareaid#}" ></html:label>
			</td>
			<td  id="LBCOEEKHKIAKAHEENKLBILKKOPLHPKMEAEKJAIFNHMJKGHENEJGCAONFJOCCEKEL" colSpan="1" rowSpan="1">
				<html:hidden name="area" id="area"  value=""/>
				<html:hidden id="areaId" name="parentAreaId" value="0"/>
				<input type="text" name="orderArea" id="orderArea" value="" onblur="document.getElementById('area').value=this.value"/>	
				<btn:button name="Select" href="javascript:void(0);" onclick="selectArea()" typeId="selectArea" value='<%=tools.tool.getLocal("jsp.htms.dictionary.area.select") %>' styleClass="button-self-style"/>
			</td>
		</tr>
		
		<tr class="trCell">
			<td class="edit-talbe-label" id="CIPKKGMONMHKPFBIBJNNNBFFLLHBKEKKNKOEKAOMHKFNALELBNMHNPKNGPKMMGFC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.arearoute#}" ></html:label>
			</td>
			<td  id="GHKFHJKOEOOCENAIEMKPMNJKIOINEBCKFPGBPOCFFOICKGMACLHHKMGEKIGPANPK" colSpan="1" rowSpan="1">
				<html:text  id="areaRoute"  name="areaRoute" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label"  colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.isleaf#}" ></html:label>
			</td>
			<td  colSpan="1" rowSpan="1">
				<label>
					<input type="checkbox" onchange="this.nextElementSibling.value = (this.nextElementSibling.value==1)?0:1 " />
					<html:hidden name="isLeaf" value="0" />
				</label>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('areaForm')"/>
				<btn:return href="contoller.do?operation=listArea"/>
			</html:td>
		</html:tr>
	</html:table>
	<com:validator formId="areaForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="areaCode"  types="number-letter" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="areaName"  types="isnull" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
		</com:validator>
</html:form>
