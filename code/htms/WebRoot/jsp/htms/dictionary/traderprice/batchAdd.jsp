<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.dictionary.product.ProductRepository,com.zzy.htms.dictionary.product.ProductBean" %>
<%@page import="com.zzy.htms.dictionary.factory.FactoryRepository,com.zzy.htms.dictionary.factory.FactoryBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Traderitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
 List<ProductBean>  productList=ProductRepository.getProductList();
 
 List<FactoryBean>  factoryList=FactoryRepository.getFactoryList();
 
request.setAttribute("productList",productList);
request.setAttribute("factoryList",factoryList);	
%>
<head><base href="<%=basePath%>"></head>

<com:loader  js="js/common/common.js,jsp/htms/dictionary/traderprice/traderprice.js,js/console/list/list.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="traderPriceForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="POST" >
	<com:loader  simplendar="true"  />
	<html:hidden id="operation" name="operation" value="toBatchAddTraderPrice"/>	
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='增加贸易商运价' name="title"/>
	</jsp:include>
	
	<html:table id="1647" styleClass="edit-talbe" list="routeViewBean" bean="routeViewBean">
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="计价方式" ></html:label>
			</html:td>
			<html:td width="180px">
				<html:select id="priceType" name="priceType"  list="price_type_list" isCascade="true" isCascadeSource="true" cascadeTarget="priceUnit">
					<html:option label="typeName" value="typeId" selected="$[cachePriceType]"/>
				</html:select>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				<html:label  label="计价单位" ></html:label>
			</html:td>
			<html:td  >
				<html:select id="priceUnit" name="priceUnit"  list="price_unit_list" isCascade="true"  cascadeValue="typeId">
					<html:option label="dicName" value="targetDicId" />
				</html:select>
			</html:td>			
			<html:td   style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="typeTip" style="font-size:12px;">请选择计价模式和单位。</font>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label"  colspan="1" rowspan="1">
				开始区间
			</html:td>
			<html:td >
				<html:text  id="priceStart"  name="priceStart" value="$[cachePriceStart]"/>
			</html:td>
			<html:td styleClass="edit-talbe-label" >
				结束区间
			</html:td>
			<html:td width="180px">
				<html:text  id="priceEnd"  name="priceEnd"  value="$[cachePriceEnd]"/>
			</html:td>
			<html:td style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="priceTip" style="font-size:12px;">开始区间须填写，为整数或保留两位小数。</font>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td    styleClass="edit-talbe-label" >
				计费模式
			</html:td>
			<html:td  style="text-align:left;vertical-align:middle;font-size:12px">
				<html:hidden id="freightModel" name="freightModel"  value="$[cacheFreightModel]"/>
				<html:radio id="singleModel" name="selFreightModel" label="按单价计算" onclick="document.getElementById('freightModel').value='1';" />
				<html:radio id="allModel"  name="selFreightModel" label="按一口价计算" onclick="document.getElementById('freightModel').value='2';"/>
			</html:td>
			<html:td styleClass="edit-talbe-label" >
				生效日期
			</html:td>
			<html:td width="180px">
				<com:simplendar id="validateDate" name="validateDate" defaultToday="true"  value="$[cacheValidateDate]"/>
			</html:td>
			<html:td style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="vdateTip" style="font-size:12px;">须指定生产日期。</font>
			</html:td>
		</html:tr>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td style="text-align:center;">
				<btn:search href="javascript:submit('traderPriceForm')"/>			
				<btn:reset href="javascript:cleanForm('traderPriceForm')"/>
				&nbsp;&nbsp;
			</html:td>
			<html:td style="text-align:center;">
				&nbsp;&nbsp;
				<btn:save href="javascript:void(0);" onclick="validateBatchTraderPrice(true,'addBatchTraderPrice');"/>
				<btn:return href="contoller.do?operation=listTraderPrice"/>
			</html:td>
		</html:tr>
	</html:table>
	

<table id="1638" class="edit-talbe">
		
		<tr class="trCell">
			<html:td  styleClass="edit-talbe-label">
				省
			</html:td>
			<html:td width="80px">
				<html:select id="provinceId" name="provinceId"  list="provinceList" isCascade="true" isCascadeSource="true" cascadeTarget="cityId">
					<html:option label="areaName" value="areaId" />
				</html:select>
			</html:td>
			
			<html:td styleClass="edit-talbe-label">
				市
			</html:td>
			<html:td width="100px">
				<html:select id="cityId" name="cityId"  list="cityList" isCascade="true" isCascadeSource="true" cascadeTarget="countyId"  cascadeValue="parentAreaId">
					<html:option label="areaName" value="areaId" />
				</html:select>
			</html:td>	
			<html:td styleClass="edit-talbe-label">
				区(县)
			</html:td>
			<html:td width="100px">
				<html:select id="countyId" name="countyId"  list="countyList" isCascade="true" isCascadeSource="true" cascadeTarget="countryId"  cascadeValue="parentAreaId">
					<html:option label="areaName" value="areaId" />
				</html:select>
			</html:td>	
			<html:td  styleClass="edit-talbe-label">
				乡镇、街道
			</html:td>
			<html:td width="100px">
				<html:select id="countryId" name="countryId"  list="countryList" isCascade="true"  cascadeValue="parentAreaId">
					<html:option label="areaName" value="areaId" />
				</html:select>
			</html:td>					
			
		</tr>
		<tr class="trCell">
				<td class="edit-talbe-label" >
					<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
				</td>
				<td  colspan="3" >
					<!--<html:select  id="productId"  name="productId"  list="productList" >
					<html:option  value="productId"  label="productName" selected="$[cacheProductId]"></html:option>
					</html:select>
					-->
					<html:checkbox id="productIdSH"  name="productIdSH"   list="productList"  label="productName"  value="productId" checkedList="checkProductList" checkedValue="productId"/>
				</td>
				<td class="edit-talbe-label" >
					<html:label  label="{$jsp.htms.dictionary.route.factoryid#}" ></html:label>
				</td>
				<td   colspan="3">
					<!--<html:select  id="factoryId"  name="factoryId"  list="factoryList" >
					<html:option  value="factoryId"  label="factoryName"  selected="$[cacheFactoryId]"></html:option>
					</html:select>
					-->
					<html:checkbox id="factoryIdSH"  name="factoryIdSH"   list="factoryList"  label="factoryName"  value="factoryId" checkedList="checkFactoryList" checkedValue="factoryId"/>
				</td>
			</tr>
		
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="routeList" bean="routeBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			
			<html:td  label="{$jsp.htms.dictionary.product.productname#}" property="productName" width="100px"/>
			<html:td  label="{$jsp.htms.dictionary.route.factoryid#}"  property="factoryName" width="100px"/>
			<html:td  label="{$jsp.htms.dictionary.route.areaid#}"  property="areaName" style="text-align: left;"/>
			<html:td  label="运价" width="80px" >
				<html:text  id="batchCustomerPrice" name="batchCustomerPrice" value=""  onblur="validatePrice(this);" style="width:100%;height:100%;border:0;text-align:right;"/>				
				<html:hidden  id="bindRouteId" name="bindRouteId" value="$[routeBean.routeId]"/>	
			</html:td>
			<%--
			<html:td  label="承运商运价"  width="80px"  >
				<html:text  id="batchCarrierPrice" name="batchCarrierPrice" value="" onblur="validatePrice(this);" style="width:100%;height:100%;border:0;text-align:right;"/>
			</html:td>
			--%>
			<html:td  label="备注" width="200px" >
				<html:text  id="batchNotice" name="batchNotice" value=""  style="width:100%;height:100%;border:0;text-align:right;"/>
			</html:td>
			<%--
			<html:td  label="Modify"><btn:modify href="contoller.do?operation=viewRoute&isModify=1&routeId=$[routeBean.routeId]&areaId=$[routeBean.areaId]"/></html:td>
			<html:td  label="Delete"><btn:delete href="contoller.do?operation=deleteRoute&routeId=$[routeBean.routeId]"/></html:td>
			 --%>
		</html:tr>
	</html:table>
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:page formId="traderPriceForm" pageCtlName="pricePageCtl"/>
			</td>
		</tr>
	</table>
</html:form>

<script type="text/javascript">
	var provinceId="<html:value value='$[cacheProvinceId]'/>";
	var cityId="<html:value value='$[cacheCityId]'/>";
	var countyId="<html:value value='$[cacheCountyId]'/>";
	var countryId="<html:value value='$[cacheCountryId]'/>";
	selectItemByValue("provinceId",provinceId);
	selectItemByValue("cityId",cityId);
	selectItemByValue("countyId",countyId);
	selectItemByValue("countryId",countryId);
	
	var freightModel="<html:value value='$[cacheFreightModel]'/>";
	if(freightModel=='1'||!freightModel){
		document.getElementById("singleModel").checked=true;
		document.getElementById("freightModel").value="1";
	}
	if(freightModel=='2'){
		document.getElementById("allModel").checked=true;
		document.getElementById("freightModel").value="2";
	}
	var cachePriceType="<html:value value='$[cachePriceType]'/>";
	var cachePriceUnit="<html:value value='$[cachePriceUnit]'/>";
	selectItemByValue("priceType",cachePriceType);
	selectItemByValue("priceUnit",cachePriceUnit);
	
	
</script>