<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="java.util.*"%>
<%@ page import="com.zzy.htms.sales.customerprice.CustomerPriceBean,com.zzy.htms.sales.customerprice.CustomerPriceUtils" %>
<%@page import="com.zzy.htms.sales.customer.CustomerBean"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
Map<Object,Map<Object,Map<Object,Map<Object, List>>>> onePricesMap=(Map<Object,Map<Object,Map<Object,Map<Object, List>>>>)request.getAttribute("custPricesMap");

onePricesMap=onePricesMap==null?new HashMap<Object,Map<Object,Map<Object,Map<Object, List>>>>():onePricesMap;

List<String> validateDateList=(List<String> )request.getAttribute("validateDateList");
validateDateList=validateDateList==null?new ArrayList<String>():validateDateList;

%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,,js/htms/common/common.js,jsp/htms/autocompleter/jquery.min.js,jsp/htms/autocompleter/jquery.autocompleter.js,jsp/htms/mobile/js/Ajax.js"/>
<com:loader css="css/common/table-list-new.css,jsp/htms/sales/customerprice/autocompleter.css"/>

<html:form id="customerPriceForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listCustomerPrice"/>
	<com:loader binder="true" checkall="true" switchbox="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.customerprice.title.list") %>' name="title"/>
	</jsp:include>

	<table id="1670" class="edit-talbe">
		<tr class="trCell">
				<td class="edit-talbe-label" >
					<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
				</td>
				<td  colspan="3">
				   <!-- 
					<html:select  id="customerId"  name="customerId"  list="customerList" >
					    <html:option  value="customerId"  label="customerName"  selected="$[cacheCustomerId]"></html:option>
					</html:select>
					 -->
				    <html:hidden  id="customerId"  name="customerId" value="$[cacheCustomerId]" />
				    <html:hidden  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]" />
				        <div class="field">
				                <input type="text" name="customerName" id="customerName"  onblur="closeAutoComplater()"  value="<html:value value='$[customerNameSH]' />" style="width: 220px;max_height:300px;"   placeholder="输入后自动匹配客户" maxlength="40" onclick="selectCustomer();" />
				         </div>
				</td>
				<td class="edit-talbe-label" >
					有效日期
				</td>
				<td colspan="3">
					<select  id="validateDate"  name="validateDate">
						<option  value=""  label=""  ></option>
					<%for(int i=0,size=validateDateList.size();i<size;i++){ %>
						<option  value="<%=validateDateList.get(i) %>"  ><%=validateDateList.get(i) %></option>
					<%} %>
					</select>
				</td>
				
			</tr>
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
				<td colspan="3" >
					<%--<html:select  id="productId"  name="productId"  list="productList" >
					<html:option  value="productId"  label="productName" selected="$[cacheProductId]"></html:option>
					</html:select>
					--%>
					<html:checkbox id="productIdSH"  name="productIdSH"   list="productList"  label="productName"  value="productId" checkedList="checkProductList" checkedValue="productId"/>
				</td>
				<td class="edit-talbe-label" >
					<html:label  label="{$jsp.htms.dictionary.route.factoryid#}" ></html:label>
				</td>
				<td colspan="3" width="45%;">
					<%--<html:select  id="factoryId"  name="factoryId"  list="factoryList" >
					<html:option  value="factoryId"  label="factoryName"  selected="$[cacheFactoryId]"></html:option>
					</html:select>
					--%>
					<html:checkbox id="factoryIdSH"  name="factoryIdSH"   list="factoryList"  label="factoryName"  value="factoryId" checkedList="checkFactoryList" checkedValue="factoryId"/>
					<btn:search href="javascript:submit('customerPriceForm')"/>
				<btn:reset href="javascript:document.getElementById('customerId').value=''; document.getElementById('customerNameSH').value='';cleanForm('customerPriceForm');"/>
				</td>
			</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colspan="8" >
				<btn:new href="contoller.do?operation=toBatchAddCustomerPrice"/>
				<%--<btn:button name="批量调整运价" href="contoller.do?operation=toBatchAddTransPrice" typeId="batchAddRoute" value="批量调整运价" styleClass="button-self-style"/>--%>
				<btn:delete href="javascript:batch_deletes('customerPriceForm','priceId','','deleteCustomerPrice');" />
				<btn:rollback href="contoller.do?operation=syncLocalHostCahce&syncType=CUSTOMER_PRICE" value="加载"/>
			</td>
		</tr>
	</table>

	<table class=" background" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="headerStyle" >
			
			<td rowspan="2" width="150px"> 客户名称</td>
			<td  rowspan="2" width="60px">产品名称</td>
			<td  rowspan="2" width="60px">出发地</td>
			<td  rowspan="2" width="160px"> 目的地</td>	
			<td  rowspan="2" width="50px" ><html:checkbox name="checkAll" id="checkAll" />全选</td>		
			<td rowspan="2" width="70px">方式</td>
			<td rowspan="2" width="50px">单位</td>
			<td rowspan="2" width="70px">生效日期</td>
			<td colspan="2">计价区间</td> 
			<td colspan="2">客户运价</td>
			<td  colspan="2">承运商运价</td>
			<%--<td rowspan="2">View</td> --%>
			<td rowspan="2" width="136px">操作</td>
		</tr>
		<tr class="headerStyle" >
			<td>开始</td>
			<td>结束</td>
			<td>单价</td>
			<td>一口价</td>
			<td>单价</td>
			<td>一口价</td>
		</tr>
	<%
	CustomerPriceBean custPriceBean = null,nestBean=null;
	List tempList=null;
	
	Set oneSet =onePricesMap.keySet(),towSet = null,threeSet=null,fourSet=null;
	Iterator oneIt=oneSet.iterator(),towIt=null,threeIt=null,fourIt=null;
	
	Map<Object,Map<Object,Map<Object, List>>> towMap = null;
	Map<Object,Map<Object, List>> threeMap=null;
	Map<Object, List> fourMap=null;
	
	CustomerPriceBean transBean=null;
	Object oneId = null,towId= null,threeId= null,fourId= null;
	int oneIndex = 0,towIndex= 0,threeIndex= 0,fourIndex= 0;
	int oneSize = 0,towSize= 0,threeSize= 0,fourSize= 0;
	while(oneIt.hasNext()){
		oneId=oneIt.next();
		towMap=onePricesMap.get(oneId);
		
		if(towMap==null||towMap.isEmpty()){
			continue;
		}
		
		oneIndex=0;
		oneSize=CustomerPriceUtils.getThreeSize(towMap);
		//System.out.println("------------------------oneSize="+oneSize);
		towSet=towMap.keySet();
		towIt=towSet.iterator();
		while(towIt.hasNext()){
			towId=towIt.next();
			threeMap=towMap.get(towId);
			if(threeMap==null||threeMap.isEmpty()){
				continue;
			}
			
			towIndex=0;
			towSize=CustomerPriceUtils.getTowSize(threeMap);
			//System.out.println("------------------------towSize="+towSize);	
			
			threeSet=threeMap.keySet();
			threeIt=threeSet.iterator();
			while(threeIt.hasNext()){
				threeId=threeIt.next();
				fourMap=threeMap.get(threeId);
				if(fourMap==null||fourMap.isEmpty()){
					continue;
				}
				threeIndex=0;
				threeSize=CustomerPriceUtils.getOneSize(fourMap);
				//System.out.println("------------------------threeSize="+threeSize);	
				
				fourSet=fourMap.keySet();
				fourIt=fourSet.iterator();
				while(fourIt.hasNext()){
					fourId=fourIt.next();
					tempList=fourMap.get(fourId);
					if(tempList==null||tempList.isEmpty()){
						continue;
					}

					//System.out.println("------------------------fourSize="+tempList.size());
					for(int i=0,size=tempList.size();i<size;i++){	
						nestBean=(CustomerPriceBean)tempList.get(i);
						request.setAttribute("custPriceBean",nestBean);
					%>
						<tr class="alternatingItemStyle" class="headerStyle">
						<%if(oneIndex==0){oneIndex++; %>
							<td rowspan="<%=oneSize %>">
								<p style="color: #000" title='<%=nestBean.getCustomerName()==null?"":nestBean.getCustomerName() %>' >
								<%=nestBean.getCustomerName()%>
								</p>
							</td>
						<%} %>
						<%if(towIndex==0){towIndex++; %>
							<td rowspan="<%=towSize %>"><%=nestBean.getProductName()%></td>
						<%} %>
						<%if(threeIndex==0){threeIndex++; %>
							<td rowspan="<%=threeSize %>"><%=nestBean.getFactoryName()%></td>
						<%} %>
						<%if(i==0){ %>
							
							<td style="text-align: left;" rowspan="<%=size %>">
								<p style="color: #000" title='<%=nestBean.getAreaName()==null?"":nestBean.getAreaName() %>' >
									<%=nestBean.getAreaName()%>
								</p>
							</td>
						<%} %>
						<td ><html:checkbox name="priceId" id="priceId" value="<%=nestBean.getPriceId() %>" /></td>
						<td>
							<html:a href="contoller.do?operation=viewCustomerPrice&isModify=0&priceId=$[custPriceBean.priceId]&checkRouteId=$[custPriceBean.routeId]&areaId=$[custPriceBean.areaId]">
								<%=nestBean.getTypeName()%>
							</html:a>
						</td>
						<td>
							<html:a href="contoller.do?operation=viewCustomerPrice&isModify=0&priceId=$[custPriceBean.priceId]&checkRouteId=$[custPriceBean.routeId]&areaId=$[custPriceBean.areaId]">
								<%=nestBean.getDicName()%>
							</html:a>
						</td>
						<td>
							<html:a href="contoller.do?operation=viewCustomerPrice&isModify=0&priceId=$[custPriceBean.priceId]&checkRouteId=$[custPriceBean.routeId]&areaId=$[custPriceBean.areaId]">
								<%=nestBean.getValidateDate()%>
							</html:a>
						</td>
						<td>
							<html:a href="contoller.do?operation=viewCustomerPrice&isModify=0&priceId=$[custPriceBean.priceId]&checkRouteId=$[custPriceBean.routeId]&areaId=$[custPriceBean.areaId]">
								<%=nestBean.getPriceStart()%>
							</html:a>
						</td>
						<td>
							<html:a href="contoller.do?operation=viewCustomerPrice&isModify=0&priceId=$[custPriceBean.priceId]&checkRouteId=$[custPriceBean.routeId]&areaId=$[custPriceBean.areaId]">
								<%=nestBean.getPriceEnd()%>
							</html:a>
						</td>
						<td>
							<html:a href="contoller.do?operation=viewCustomerPrice&isModify=0&priceId=$[custPriceBean.priceId]&checkRouteId=$[custPriceBean.routeId]&areaId=$[custPriceBean.areaId]">
								<%=nestBean.getCustomerPrice()%>
							</html:a>
						</td>
						
						<td>
							<html:a href="contoller.do?operation=viewCustomerPrice&isModify=0&priceId=$[custPriceBean.priceId]&checkRouteId=$[custPriceBean.routeId]&areaId=$[custPriceBean.areaId]">
								<%=nestBean.getCustomerOnePrice()%>
							</html:a>
						</td>
						
						<td>
							<html:a href="contoller.do?operation=viewCustomerPrice&isModify=0&priceId=$[custPriceBean.priceId]&checkRouteId=$[custPriceBean.routeId]&areaId=$[custPriceBean.areaId]">
								<%=nestBean.getCarrierPrice()%>
							</html:a>
						</td>
						
						<td>
							<html:a href="contoller.do?operation=viewCustomerPrice&isModify=0&priceId=$[custPriceBean.priceId]&checkRouteId=$[custPriceBean.routeId]&areaId=$[custPriceBean.areaId]">
								<%=nestBean.getCarrierOnePrice()%>
							</html:a>
						</td>
						<%--
						<td><%=nestBean.getDicName() %></td>
						<td><%=nestBean.getPriceStart() %></td>
						<td><%=nestBean.getPriceEnd() %></td>
						<td><%=nestBean.getCustomerPrice() %></td>						
						<td><%=nestBean.getCustomerOnePrice() %></td>
						<td><%=nestBean.getCarrierPrice() %></td>
						<td><%=nestBean.getCarrierOnePrice() %></td>
						 --%>
						<%--<td><btn:view href="contoller.do?operation=viewTransPrice&isModify=0&priceId=$[custPriceBean.priceId]&checkRouteId=$[custPriceBean.routeId]"/></td> --%>
						<td width="136px">
						<btn:modify href="contoller.do?operation=viewCustomerPrice&isModify=1&priceId=$[custPriceBean.priceId]&checkRouteId=$[custPriceBean.routeId]&areaId=$[custPriceBean.areaId]"/>
						<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteCustomerPrice&priceId=$[custPriceBean.priceId]')"/>
						</td>
	
					</tr>
					<%
					}//for custPriceLists
				}//while areaMap
			}//while factoryMap
		}//while productMap
	}//while custPricesMap
	
	

	tools.tool.clear(tempList);
	tools.tool.clear(fourMap);
	tools.tool.clear(threeMap);
	tools.tool.clear(towMap);
	tools.tool.clear(onePricesMap);
	%>
		

	</table>
	
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkRouteId" checkId="checkAll"/>
				<com:page formId="customerPriceForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>

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
           Ajax.get(basePath, params, function(msg){
	           	var jsonMsg = JSON.parse(msg);
	           	//console.log('jsonMsg=' + jsonMsg);
	           	$('#customerName').autocompleter({
			        highlightMatches: true,
			        source: jsonMsg,
			        template: '{{ label }} <span>({{ hex }})</span>',
			        //hint: true,
			        //empty: false,
			        //scroll:true,  
			        　     //max:10,　　　　　　　　　 //下拉项目的个数，default：10
　                                    // scrollHeight: 300,　 // 下拉框的高度， Default: 180
			        limit: 100,
			        callback: function (value, index,customer) {
			            //alert( "Value "+customer.label+"     "+customer.hex );
			            $('#customerId').attr("value",customer.hex);
			            $('#customerNameSH').attr("value",customer.label);
			        }
			    });
          });
          $('#customerName').autocompleter('close');
       }
       

	var provinceId="<html:value value='$[cacheProvinceId]'/>";
	var cityId="<html:value value='$[cacheCityId]'/>";
	var countyId="<html:value value='$[cacheCountyId]'/>";
	var countryId="<html:value value='$[cacheCountryId]'/>";
	selectItemByValue("provinceId",provinceId);
	selectItemByValue("cityId",cityId);
	selectItemByValue("countyId",countyId);
	selectItemByValue("countryId",countryId);

	var cacheValidateDate="<html:value value='$[cacheValidateDate]'/>";
	selectItemByValue("validateDate",cacheValidateDate);
</script>