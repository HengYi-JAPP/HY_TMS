<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.dictionary.product.ProductRepository,com.zzy.htms.dictionary.product.ProductBean" %>
<%@page import="com.zzy.htms.dictionary.factory.FactoryRepository,com.zzy.htms.dictionary.factory.FactoryBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 

 List<ProductBean>  productList=ProductRepository.getProductList();
 
 List<FactoryBean>  factoryList=FactoryRepository.getFactoryList();
 
request.setAttribute("productList",productList);
request.setAttribute("factoryList",factoryList);	
%>
<head><base href="<%=basePath%>"></head>

<com:loader  js="js/common/common.js,jsp/htms/autocompleter/jquery.min.js,jsp/htms/autocompleter/jquery.autocompleter.js,jsp/htms/mobile/js/Ajax.js,/jsp/htms/sales/customerprice/custprice.js,js/console/list/list.js"/>
<com:loader css="css/common/sub-table-list.css,jsp/htms/sales/customerprice/autocompleter.css"/>

<script type="text/javascript">
      var basePath = "<%=basePath %>" + '/controller.do';
      function closeAutoComplater(){
         console.log("close");
         $('#customerName').autocompleter('close');
      }
      
      
      var getDataStatus=false;
      function selectCustomer(){
	      if(!getDataStatus){
	           getAllData();
	           getDataStatus=true;
	      }
       }
       
       function getAllData(){
           var params = {operation:'SELECUSTOMER'};
           
           Ajax.post(basePath, params, function(msg){
	           	var jsonMsg = JSON.parse(msg);
	           	//console.log('jsonMsg=' + jsonMsg);
	           	$('#autocompleter').autocompleter({
			        highlightMatches: true,
			        source: jsonMsg,
			        template: '{{ label }} <span>({{ hex }})</span>',
			        //hint: true,
			        //empty: false,
			        //scroll:true,  
			        　     // max:10,　　　　　　　　　 //下拉项目的个数，default：10
　                                    // scrollHeight: 300,　 // 下拉框的高度， Default: 180
			        limit: 100,
			        callback: function (value, index,customer) {
			            //alert( "Value "+customer.label+"     "+customer.hex );
			            $('#customerId').attr("value",customer.hex);
			            $('#customerNameSH').attr("value",customer.label);
			        }
			    });
          });
          
          $('#autocompleter').autocompleter('close');
       }
</script>


<html:form id="transPriceForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="POST" >
	<com:loader  simplendar="true"   />
	<html:hidden id="operation" name="operation" value="toBatchAddCustomerPrice"/>	
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<com:loader binder="true" checkall="true" switchbox="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.transprice.title.add") %>' name="title"/>
	</jsp:include>
	
	<html:table id="1647" styleClass="edit-talbe" list="routeViewBean" bean="routeViewBean">
		<html:tr styleClass="trCell">
			<html:td  styleClass="edit-talbe-label" >
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</html:td>
			<html:td colspan="3" style="text-align:left;vertical-align:middle;font-size:12px">
				    <html:hidden  id="customerId"  name="customerId" value="$[cacheCustomerId]" />
				    <html:hidden  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]" />
			        <div class="field">
			                <input type="text" name="autocompleter" id="autocompleter"  value="<html:value value='$[customerNameSH]' />"   style="width: 220px;max_height:300px;"   placeholder="输入后自动匹配客户" maxlength="40" onclick="selectCustomer();" />
			         </div>
				
			</html:td>
			<html:td   style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="customerTip" style="font-size:12px;">请选择客户。</font>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="{$jsp.htms.dictionary.transprice.pricetype#}" ></html:label>
			</html:td>
			<html:td width="180px">
				<html:select id="priceType" name="priceType"  list="price_type_list" isCascade="true" isCascadeSource="true" cascadeTarget="priceUnit">
					<html:option label="typeName" value="typeId" selected="$[cachePriceType]"/>
				</html:select>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.dictionary.transprice.priceunit#}" ></html:label>
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
				<html:text  id="priceStart"  name="priceStart" />
			</html:td>
			<html:td styleClass="edit-talbe-label" >
				结束区间
			</html:td>
			<html:td width="180px">
				<html:text  id="priceEnd"  name="priceEnd"  />
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
				<com:simplendar id="validateDate" name="validateDate"  defaultToday="true"  value="$[cacheValidateDate]"/>
			</html:td>
			<html:td style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="vdateTip" style="font-size:12px;">须指定生产日期。</font>
			</html:td>
		</html:tr>
	
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td style="text-align:center;">
				<btn:search href="javascript:submit('transPriceForm')"/>			
				<btn:reset href="javascript:document.getElementById('customerId').value=''; document.getElementById('customerNameSH').value='';cleanForm('transPriceForm')"/>
				&nbsp;&nbsp;
			</html:td>
			<html:td style="text-align:center;">
				&nbsp;&nbsp;
				<btn:save href="javascript:void(0);" onclick="validateBatchCustomerPrice(true,'addBatchTransPrice');"/>
				<btn:return href="contoller.do?operation=listCustomerPrice"/>
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
				<td   >
					<!--<html:select  id="productId"  name="productId"  list="productList" >
					<html:option  value="productId"  label="productName" selected="$[cacheProductId]"></html:option>
					</html:select>
					-->
					<html:checkbox id="productIdSH"  name="productIdSH"   list="productList"  label="productName"  value="productId" checkedList="checkProductList" checkedValue="productId"/>
				</td>
				<td class="edit-talbe-label" >
					<html:label  label="{$jsp.htms.dictionary.route.factoryid#}" ></html:label>
				</td>
				<td   colspan="5">
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
			<html:td  label="客户运价" width="80px" >
				<html:text  id="batchCustomerPrice" name="batchCustomerPrice" value=""  onblur="validatePrice(this);" style="width:100%;height:100%;border:0;text-align:right;"/>				
				<html:hidden  id="bindRouteId" name="bindRouteId" value="$[routeBean.routeId]"/>	
			</html:td>
			<html:td  label="承运商运价"  width="80px"  >
				<html:text  id="batchCarrierPrice" name="batchCarrierPrice" value="" onblur="validatePrice(this);" style="width:100%;height:100%;border:0;text-align:right;"/>
			</html:td>
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
				<com:page formId="transPriceForm" pageCtlName="pricePageCtl"/>
				
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