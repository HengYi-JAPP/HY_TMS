<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 
String currentAreaId=request.getParameter("areaId");
AreaRepository rep = new AreaRepository();
String areaName = (String)rep.getFullAreaName(currentAreaId,"",true);
areaName=areaName==null?"":areaName;
 %>
<head>
<script type="text/javascript">
var basePath="<%=basePath%>";
</script>
<base href="<%=basePath%>">
</head>
<com:loader  js="js/common/common.js" validator="true" simpleUpload="true" myWin="true"/>
<com:loader css="css/common/sub-table-list.css"/>
<com:loader js="jsp/htms/dictionary/route/area.js"/>
<html:form id="routeForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"  />
	<html:hidden id="operation" name="operation" value="modifyRoute"/>
	<html:hidden id="isValidate" name="isValidate" value="routeViewBean.isValidate"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.route.title.modify") %>' name="title"/>
	</jsp:include>
	<table id="1636" class="edit-talbe">
	<html:hidden id="routeId" name="routeId" value="$[routeViewBean.routeId]"/>
		<tr class="trCell">
			<td class="edit-talbe-label" id="CAMNPLNAOAIIFJPMOHFGFIGHKAFKEGKEMJOKIFKFCHGNNLAPGKILIKCHHEMKALBB" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
			</td>
			<td  id="NKIICNEEOKCKKGGEJPJKIAEGFKOLGKCKEHOBFKPJOFKFOHNPGAAPJPAAGEGKIPGM" colSpan="1" rowSpan="1">
				<html:select  id="productId"  name="productId"  list="productList" style="width:65px;"><html:option  selected="$[routeViewBean.productId]"  value="productId"  label="productName" ></html:option></html:select>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="BMLFPKJLMNBOKMGJNKBGENPKFMHBEHMJHCNJKEFABEKNKFICAKCFGPFEEFKGALEE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.route.factoryid#}" ></html:label>
			</td>
			<td  id="MNGALJCLHKMPAELGKKKCEIMFNCCKIEKGKMKIMACMFOFBPKKKLHOAHKIAMEPFKKCK" colSpan="1" rowSpan="1">
				<html:select  id="factoryId"  name="factoryId"  list="factoryList" style="width:65px;"><html:option  selected="$[routeViewBean.factoryId]"  value="factoryId"  label="factoryName" ></html:option></html:select>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="PONPCKHJAPBLLBJGIKJEEJFGEHLLNEJKKICIMMGEFNIIJPKNGOILBKCBMFJLJKNK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.route.areaid#}" ></html:label>
			</td>
			<td  id="OKKOCNMIGAHMMOCJAJGHBKHGEMLGMMBAKICLHKKGLOHCEBCEHEEGFELJBKKNIFPF" colSpan="1" rowSpan="1">
				<html:hidden name="area" id="area"  value=""/>
							
				<html:hidden id="areaId" name="areaId" value="$[areaViewBean.areaId]"/>	
				<html:text name="orderArea" id="orderArea" value="<%=areaName %>" onblur="document.getElementById('area').value=this.value" style="width:260px;"/>
				<btn:button name="Select" href="javascript:void(0);" onclick="selectArea()" typeId="selectArea" value='<%=tools.tool.getLocal("jsp.htms.dictionary.area.select") %>' styleClass="button-self-style"/>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:submit('routeForm')"/>
				<btn:return href="contoller.do?operation=listRoute"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
