<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.zzy.htms.dictionary.transprice.TransPriceBean"%>
<%@page import="java.util.*"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@ page import="com.zzy.htms.dictionary.transprice.TranspriceRepository,com.zzy.htms.sales.customerprice.CustomerPriceUtils" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
Map<Object,Map<Object,Map<Object, List>>> onePricesMap=(Map<Object,Map<Object,Map<Object, List>>>)request.getAttribute("transpriceMap");
onePricesMap=onePricesMap==null?new HashMap<Object,Map<Object,Map<Object, List>>>():onePricesMap;

List<String> validateDateList=(List<String> )request.getAttribute("validateDateList");
validateDateList=validateDateList==null?new ArrayList<String>():validateDateList;
%>
<style>
<!--
a{text-decoration:none;color:}
-->
</style>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="transPriceForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"   />
	<html:hidden id="operation" name="operation" value="listTransPrice"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.transprice.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1650" class="edit-talbe">
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
			<td class="edit-talbe-label" >
					有效日期
				</td>
				<td colspan="3">
					<select  id="cacheValidateDate"  name="cacheValidateDate">
						<option  value=""  label=""  ></option>
					<%
					   String  cacheValidateDate=(String) request.getAttribute("cacheValidateDate");
					   for(int i=0,size=validateDateList.size();i<size;i++){ 
					      %>
						   <option  value="<%=validateDateList.get(i) %>"  ><%=validateDateList.get(i) %></option>
					    <%
						} 
						  %>
					</select>
			</td>
		</tr>
		<tr class="trCell">
				<td class="edit-talbe-label" >
					<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
				</td>
				<td  colspan="3">
					<!--<html:select  id="productId"  name="productId"  list="productList" >
					<html:option  value="productId"  label="productName" selected="$[cacheProductId]"></html:option>
					</html:select>
					-->
					<html:checkbox id="productIdSH"  name="productIdSH"   list="productList"  label="productName"  value="productId" />
				</td>
				<td class="edit-talbe-label" >
					<html:label  label="{$jsp.htms.dictionary.route.factoryid#}" ></html:label>
				</td>
				<td colspan="5">
					<!--<html:select  id="factoryId"  name="factoryId"  list="factoryList" >
					<html:option  value="factoryId"  label="factoryName"  selected="$[cacheFactoryId]"></html:option>
					</html:select>
				-->
				<html:checkbox id="factoryIdSH"  name="factoryIdSH"   list="factoryList"  label="factoryName"  value="factoryId" />
					<btn:search href="javascript:submit('transPriceForm')"/>
					<btn:reset href="javascript:cleanForm('transPriceForm')"/>
				</td>
			</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colspan="10" >
				<btn:new href="contoller.do?operation=toBatchAddTransPrice"/>
				<%--<btn:button name="批量调整运价" href="contoller.do?operation=toBatchAddTransPrice" typeId="batchAddRoute" value="批量调整运价" styleClass="button-self-style"/>--%>
				<btn:delete href="javascript:batch_deletes('transPriceForm','priceId','','deleteTransPrice');" />
				<btn:rollback href="contoller.do?operation=syncLocalHostCahce&syncType=TRANS_PRICE" value="加载"/>
			</td>
		</tr>
	</table>

	<table class=" background" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="headerStyle" >
			<td  rowspan="2" width="70px">产品名称</td>
			<td  rowspan="2" width="70px">出发地</td>
			<td  rowspan="2" width="250px"> 目的地</td>			
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
	TransPriceBean transBean = null,nestBean=null;
	List tempList=null;
	
	Set oneSet =onePricesMap.keySet(),towSet = null,threeSet=null;
	Iterator oneIt=oneSet.iterator(),towIt=null,threeIt=null;
	
	Map<Object,Map<Object, List>> towMap = null;
	Map<Object, List> threeMap=null;

	
	
	Object oneId = null,towId= null,threeId= null;
	int oneIndex = 0,towIndex= 0;
	int oneSize = 0,towSize= 0;
	while(oneIt.hasNext()){
		oneId=oneIt.next();
		towMap=onePricesMap.get(oneId);
		
		if(towMap==null||towMap.isEmpty()){
			continue;
		}
		
		oneIndex=0;
		oneSize=CustomerPriceUtils.getTowSize(towMap);
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
			towSize=CustomerPriceUtils.getOneSize(threeMap);
			//System.out.println("------------------------towSize="+towSize);	
			
			threeSet=threeMap.keySet();
			threeIt=threeSet.iterator();
			while(threeIt.hasNext()){
				threeId=threeIt.next();
				tempList=threeMap.get(threeId);
				
					if(tempList==null||tempList.isEmpty()){
						continue;
					}

					//System.out.println("------------------------fourSize="+tempList.size());
					for(int i=0,size=tempList.size();i<size;i++){	
						nestBean=(TransPriceBean)tempList.get(i);
						request.setAttribute("transPriceBean",nestBean);
					%>
						<tr class="alternatingItemStyle" class="headerStyle">
						<%if(oneIndex==0){ oneIndex++;%>
							<td rowspan="<%=oneSize %>"><%=nestBean.getProductName()%></td>
						<%} %>
						<%if(towIndex==0){ towIndex++;%>
							<td rowspan="<%=towSize %>"><%=nestBean.getFactoryName()%></td>
						<%} %>
						<%if(i==0){ %>
							<td style="text-align: left;" rowspan="<%=size %>"><%=nestBean.getAreaName()%></td>
						<%} %>
						<td><html:checkbox name="priceId" id="priceId" value="<%=nestBean.getPriceId() %>" /></td>
						<td>
							<html:a href="contoller.do?operation=viewTransPrice&isModify=0&priceId=$[transPriceBean.priceId]&checkRouteId=$[transPriceBean.routeId]&areaId=$[transPriceBean.areaId]">
								<%=nestBean.getTypeName()%>
							</html:a>
						</td>
						<td>
							<html:a href="contoller.do?operation=viewTransPrice&isModify=0&priceId=$[transPriceBean.priceId]&checkRouteId=$[transPriceBean.routeId]&areaId=$[transPriceBean.areaId]">
								<%=nestBean.getDicName()%>
							</html:a>
						</td>
						<td>
							<html:a href="contoller.do?operation=viewTransPrice&isModify=0&priceId=$[transPriceBean.priceId]&checkRouteId=$[transPriceBean.routeId]&areaId=$[transPriceBean.areaId]">
								<%=nestBean.getValidateDate()%>
							</html:a>
						</td>
						<td>
							<html:a href="contoller.do?operation=viewTransPrice&isModify=0&priceId=$[transPriceBean.priceId]&checkRouteId=$[transPriceBean.routeId]&areaId=$[transPriceBean.areaId]">
								<%=nestBean.getPriceStart()%>
							</html:a>
						</td>
						<td>
							<html:a href="contoller.do?operation=viewTransPrice&isModify=0&priceId=$[transPriceBean.priceId]&checkRouteId=$[transPriceBean.routeId]&areaId=$[transPriceBean.areaId]">
								<%=nestBean.getPriceEnd()%>
							</html:a>
						</td>
						<td>
							<html:a href="contoller.do?operation=viewTransPrice&isModify=0&priceId=$[transPriceBean.priceId]&checkRouteId=$[transPriceBean.routeId]&areaId=$[transPriceBean.areaId]">
								<%=nestBean.getCustomerPrice()%>
							</html:a>
						</td>
						
						<td>
							<html:a href="contoller.do?operation=viewTransPrice&isModify=0&priceId=$[transPriceBean.priceId]&checkRouteId=$[transPriceBean.routeId]&areaId=$[transPriceBean.areaId]">
								<%=nestBean.getCustomerOnePrice()%>
							</html:a>
						</td>
						
						<td>
							<html:a href="contoller.do?operation=viewTransPrice&isModify=0&priceId=$[transPriceBean.priceId]&checkRouteId=$[transPriceBean.routeId]&areaId=$[transPriceBean.areaId]">
								<%=nestBean.getCarrierPrice()%>
							</html:a>
						</td>
						
						<td>
							<html:a href="contoller.do?operation=viewTransPrice&isModify=0&priceId=$[transPriceBean.priceId]&checkRouteId=$[transPriceBean.routeId]&areaId=$[transPriceBean.areaId]">
								<%=nestBean.getCarrierOnePrice()%>
							</html:a>
						</td>
						<td width="136px">
						<btn:modify href="contoller.do?operation=viewTransPrice&isModify=1&priceId=$[transPriceBean.priceId]&checkRouteId=$[transPriceBean.routeId]&areaId=$[transPriceBean.areaId]"/>
						<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteTransPrice&priceId=$[transPriceBean.priceId]')"/>
						</td>
	
					</tr>
					<%
					}//for custPriceLists
			}//while threeMap
		}//while towMap
	}//while oneMap
	
	tools.tool.clear(tempList);
	tools.tool.clear(threeMap);
	tools.tool.clear(towMap);
	tools.tool.clear(onePricesMap);
	%>
	</table>
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkRouteId" checkId="checkAll"/>
				<com:page formId="transPriceForm" pageCtlName="pageCtl"/>
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

	var cacheValidateDate="<html:value value='$[cacheValidateDate]'/>";
	selectItemByValue("cacheValidateDate",cacheValidateDate);
</script>
