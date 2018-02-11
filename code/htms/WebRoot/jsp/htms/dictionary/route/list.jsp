<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
 

%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="routeForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"  />
	<html:hidden id="operation" name="operation" value="listRoute"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.route.title.list") %>' name="title"/>
	</jsp:include>
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
					--><html:checkbox id="productIdSH"  name="productIdSH"   list="productList"  label="productName"  value="productId" />
				</td>
				<td class="edit-talbe-label" >
					<html:label  label="{$jsp.htms.dictionary.route.factoryid#}" ></html:label>
				</td>
				<td  width="42%" colspan="3">
					<!--<html:select  id="factoryId"  name="factoryId"  list="factoryList" >
					<html:option  value="factoryId"  label="factoryName"  selected="$[cacheFactoryId]"></html:option>
					</html:select>
					--><html:checkbox id="factoryIdSH"  name="factoryIdSH"   list="factoryList"  label="factoryName"  value="factoryId" />
					<btn:search href="javascript:submit('routeForm')"/>
			
				<btn:reset href="javascript:cleanForm('routeForm')"/>
				
				</td>
			</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="9" rowSpan="1">
				<%--<btn:new href="contoller.do?operation=toAddRoute"/>--%>
				<btn:new  href="contoller.do?operation=toBatchAddRoute" />
				<btn:delete href="javascript:batch_deletes('routeForm','routeId','','deleteRoute');" />
				<btn:rollback href="contoller.do?operation=syncLocalHostCahce&syncType=ROUTE" value="加载"/>
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="routeList" bean="routeBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="routeId" id="routeId" value="routeBean.routeId" /></html:td>
			<html:td  label="{$jsp.htms.dictionary.product.productname#}" >
				<html:a href="contoller.do?operation=viewRoute&isModify=0&routeId=$[routeBean.routeId]&areaId=$[routeBean.areaId]">
					<html:value value="$[routeBean.productName]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.dictionary.route.factoryid#}"  >
				<html:a href="contoller.do?operation=viewRoute&isModify=0&routeId=$[routeBean.routeId]&areaId=$[routeBean.areaId]">
					<html:value value="$[routeBean.factoryName]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.dictionary.route.areaid#}"  property="areaName" style="text-align: left;"/>
			
			<html:td  label="操作">
			<btn:modify href="contoller.do?operation=viewRoute&isModify=1&routeId=$[routeBean.routeId]&areaId=$[routeBean.areaId]"/>
			<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteRoute&routeId=$[routeBean.routeId]')"/>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="routeId" checkId="checkAll"/>
				<com:page formId="routeForm" pageCtlName="pageCtl"/>
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
</script>
