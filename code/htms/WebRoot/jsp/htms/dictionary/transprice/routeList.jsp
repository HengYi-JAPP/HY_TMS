<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="routeForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"   />
	<html:hidden id="operation" name="operation" value="listPriceRoute"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	
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
				<td   >
					<html:select  id="productId"  name="productId"  list="productList" >
					<html:option  value="productId"  label="productName" selected="$[cacheProductId]"></html:option>
					</html:select>
				</td>
				<td class="edit-talbe-label" >
					<html:label  label="{$jsp.htms.dictionary.route.factoryid#}" ></html:label>
				</td>
				<td   colspan="5">
					<html:select  id="factoryId"  name="factoryId"  list="factoryList" >
					<html:option  value="factoryId"  label="factoryName"  selected="$[cacheFactoryId]"></html:option>
					</html:select>
					<btn:search href="javascript:submit('routeForm')"/>
			
				<btn:reset href="javascript:cleanForm('routeForm')"/>
				</td>
			</tr>
		
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="routeList" bean="routeBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			
			<html:td  label="{$jsp.htms.dictionary.product.productname#}" property="productName" />
			<html:td  label="{$jsp.htms.dictionary.route.factoryid#}"  property="factoryName"/>
			<html:td  label="{$jsp.htms.dictionary.route.areaid#}"  property="areaName" />
			<html:td  label="客户运价"  >
				<html:text  id="batchCustomerPrice" name="batchCustomerPrice" value="" style="width:100%;height:100%;border:0;text-align:right;"/>				
				<html:hidden  id="productId" name="productId" value="$[routeBean.productId]"/>				
				<html:hidden  id="factoryId" name="factoryId" value="$[routeBean.factoryId]"/>
			</html:td>
			<html:td  label="承运商运价"  >
				<html:text  id="batchCarrierPrice" name="batchCarrierPrice" value="" style="width:100%;height:100%;border:0;text-align:right;"/>
			</html:td>
			<html:td  label="备注"  >
				<html:text  id="batchNotice" name="batchNotice" value="" style="width:100%;height:100%;border:0;text-align:right;"/>
			</html:td>
			<%--
			<html:td  label="Modify"><btn:modify href="contoller.do?operation=viewRoute&isModify=1&routeId=$[routeBean.routeId]&areaId=$[routeBean.areaId]"/></html:td>
			<html:td  label="Delete"><btn:delete href="contoller.do?operation=deleteRoute&routeId=$[routeBean.routeId]"/></html:td>
			 --%>
		</html:tr>
	</html:table>

	
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
</script>
