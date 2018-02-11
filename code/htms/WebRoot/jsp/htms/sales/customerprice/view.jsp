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
<html:form id="customerPriceForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"  />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.customerprice.title.view") %>' name="title"/>
	</jsp:include>
	<html:table id="1649" styleClass="edit-talbe" list="routeViewBean" bean="routeViewBean">
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" id="KGKKHGEGLJCIPKOKFEIKKKKHCEKPBJCCLAOAFMHCCNPFHFGFMGGAIGKEMIFIFOKH">
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</html:td>
			<html:td width="200px" id="FFLIBHMMFOMAICPNEFKPEHGCCGOJLGOKIBJNNKMIMPIMNNJCJHOPEJMJOPKILPJF" >
				<html:value value="$[customerPriceBean.customerName]"/>
			</html:td>
			<html:td styleClass="edit-talbe-label">
			<html:label label="{$jsp.htms.dictionary.transprice.route#}"></html:label>
			</html:td>
			<html:td  style="width:250px; text-align:left;vertical-align:middle;font-size:12px">
			<html:value value="$[routeViewBean.productName]"/>:
			<html:value value="$[routeViewBean.factoryName]"/>-><html:value value="<%=areaName %>"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="{$jsp.htms.dictionary.transprice.pricetype#}" ></html:label>
			</html:td>
			<html:td width="250px">
				<html:select id="priceType" name="priceType"  list="priceTypeBean" disabled="true">
					<html:option label="typeName" value="typeId" selected="$[customerPriceBean.priceType]"/>
				</html:select>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.dictionary.transprice.priceunit#}" ></html:label>
			</html:td>
			<html:td  >
				<html:select id="priceUnit" name="priceUnit"  list="priceUnitBean" disabled="true">
					<html:option label="dicName" value="targetDicId"  selected="$[customerPriceBean.priceUnit]"/>
				</html:select>
			</html:td>	
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td    styleClass="edit-talbe-label" >
				开始区间
			</html:td> 
			<html:td  >
				<html:value value="$[customerPriceBean.priceStart]"/>
			</html:td>
			<html:td styleClass="edit-talbe-label" >
				结束区间
			</html:td>
			<html:td width="250px">
				<html:value value="$[customerPriceBean.priceEnd]"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td    styleClass="edit-talbe-label" >
				计费模式
			</html:td> 
			<html:td  style="text-align:left;vertical-align:middle;font-size:12px">
				<html:hidden id="freightModel" name="freightModel" value="$[customerPriceBean.freightModel]"/>
				<html:radio id="singleModel" name="selFreightModel" label="按单价计算"  checked="true" onclick="selectFreightModel('singlePrice','1');" disabled="true"/>
				<html:radio id="allModel"  name="selFreightModel" label="按一口价计算" onclick="selectFreightModel('allPrice','2');" disabled="true"/>
			</html:td>
			<html:td styleClass="edit-talbe-label" >
				生效日期
			</html:td>
			<html:td width="250px">
				<html:value value="$[customerPriceBean.validateDate]"  />
			</html:td>
		</html:tr>
		
	</html:table>
	<div id="singlePrice" style="display:block;">
		<table  class="edit-talbe" >
		<tr>
			<td class="edit-talbe-label" >
				客户运价
			</td>
			<td width="250px">
				<html:value value="$[customerPriceBean.customerPrice]"/>
			</td>
			<td class="edit-talbe-label" >
				承运商运价
			</td>
			<td width="250px">
				<html:value value="$[customerPriceBean.carrierPrice]"/>
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
			<td  width="250px">
				<html:value  value="$[customerPriceBean.customerOnePrice]"/>
			</td>
			
			<td class="edit-talbe-label">
				承运商运价
			</td>
			<td  width="250px">
				<html:value value="$[customerPriceBean.carrierOnePrice]"/>
			</td>
		</tr>
	</table>
	</div>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listCustomerPrice"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>

<script type="text/javascript">
var freightModel="<html:value value='$[customerPriceBean.freightModel]'/>";
if(freightModel=='1'){
	selectFreightModel('singlePrice','1');
}
if(freightModel=='2'){
	selectFreightModel('allPrice','2');
}
var priceType="<html:value value='$[customerPriceBean.priceType]'/>";
var priceUnit="<html:value value='$[customerPriceBean.priceUnit]'/>";
selectItemByValue("priceType",priceType);
selectItemByValue("priceUnit",priceUnit);
</script>