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
<head><base href="<%=basePath%>"></head>

<com:loader  js="js/common/common.js,jsp/htms/dictionary/transprice/transprice.js"/>
<com:loader css="css/common/sub-table-list.css"/>
	<com:loader  simplendar="true"  />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.transprice.title.view") %>' name="title"/>
	</jsp:include>
	
	<html:table id="1647" styleClass="edit-talbe" list="routeViewBean" bean="routeViewBean">
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
			<html:label label="{$jsp.htms.dictionary.transprice.route#}"></html:label>
			</html:td>
			<html:td  colspan="3"  style="text-align:left;vertical-align:middle;font-size:12px">
			<html:value value="$[routeViewBean.productName]"/>:
			<html:value value="$[routeViewBean.factoryName]"/>-><html:value value="<%=areaName %>"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="{$jsp.htms.dictionary.transprice.pricetype#}" ></html:label>
			</html:td>
			<html:td width="180px">
				<html:select id="priceType" name="priceType"  list="priceTypeBean"  disabled="true">
					<html:option label="typeName" value="typeId" selected="$[transPriceViewBean.priceType]"/>
				</html:select>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.dictionary.transprice.priceunit#}" ></html:label>
			</html:td>
			<html:td  >
				<html:select id="priceUnit" name="priceUnit"  list="priceUnitBean"  disabled="true">
					<html:option label="dicName" value="targetDicId"  selected="$[transPriceViewBean.priceUnit]"/>
				</html:select>
			</html:td>	
		</html:tr>
		<%--
		<html:tr styleClass="trCell">
			<html:td colspan="5" rowspan="1" style="text-align:left;vertical-align:middle;font-size:14px;">
				计价区间
			</html:td>
		</html:tr> --%>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label"  colspan="1" rowspan="1">
				开始区间
			</html:td>
			<html:td >
				<html:value  value="$[transPriceViewBean.priceStart]"/>
			</html:td>
			<html:td styleClass="edit-talbe-label" >
				结束区间
			</html:td>
			<html:td width="180px">
				<html:value  value="$[transPriceViewBean.priceEnd]"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td    styleClass="edit-talbe-label" >
				计费模式
			</html:td> 
			<html:td  style="text-align:left;vertical-align:middle;font-size:12px">
				<html:hidden id="freightModel" name="freightModel" value="$[transPriceViewBean.freightModel]"/>
				<html:radio id="singleModel" name="selFreightModel" label="按单价计算"  checked="true" onclick="selectFreightModel('singlePrice','1');" disabled="true"/>
				<html:radio id="allModel"  name="selFreightModel" label="按一口价计算" onclick="selectFreightModel('allPrice','2');" disabled="true"/>
			</html:td>
			<html:td styleClass="edit-talbe-label" >
				生效日期
			</html:td>
			<html:td width="180px">
				<html:value value="$[transPriceViewBean.validateDate]" />
			</html:td>
		</html:tr>
		
	</html:table>
	<div id="singlePrice" style="display:block;">
		<table  class="edit-talbe" >
		<tr>
			<td class="edit-talbe-label" >
				客户运价
			</td>
			<td width="180px">
				<html:value value="$[transPriceViewBean.customerPrice]"/>
			</td>
			<td class="edit-talbe-label" >
				承运商运价
			</td>
			<td width="180px">
				<html:value value="$[transPriceViewBean.carrierPrice]"/>
			</td>
			
		</tr>
		</table>
	</div>
	<div id="allPrice" style="display:none;">
		<table  class="edit-talbe" >
		<tr >	
			<td class="edit-talbe-label">
				客户运价
			</td>
			<td  width="180px">
				<html:value  value="$[transPriceViewBean.customerOnePrice]"/>
			</td>
			
			<td class="edit-talbe-label">
				承运商运价
			</td>
			<td  width="180px">
				<html:value value="$[transPriceViewBean.carrierOnePrice]"/>
			</td>
		</tr>
	</table>
	</div>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listTransPrice"/>
			</html:td>
		</html:tr>
	</html:table>
<script type="text/javascript">
var freightModel="<html:value value='$[transPriceViewBean.freightModel]'/>";
if(freightModel=='1'){
	selectFreightModel('singlePrice','1');
}
if(freightModel=='2'){
	selectFreightModel('allPrice','2');
}
var priceType="<html:value value='$[transPriceViewBean.priceType]'/>";
var priceUnit="<html:value value='$[transPriceViewBean.priceUnit]'/>";
selectItemByValue("priceType",priceType);
selectItemByValue("priceUnit",priceUnit);
</script>
