<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@ page import="com.zzy.htms.sales.ship.ShipBean,com.zzy.htms.sales.ship.ShipPageUtil,com.zzy.htms.sales.shipdetail.ShipDetailBean" %>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<%@page import="com.zzy.htms.dictionary.product.ProductRepository" %>
<%@page import="com.zzy.htms.dictionary.factory.FactoryRepository,com.zzy.htms.dictionary.factory.FactoryBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
//List<AreaBean> provinceList =AreaRepository.getRootNodeList();
//request.setAttribute("provinceList",provinceList); 
request.setAttribute("productList",ProductRepository.getProductList());
request.setAttribute("factoryList",FactoryRepository.getFactoryList());  
//Map<String, Map<String,Map<String,List<ShipBean>>>> customerOrderShipListMap=(Map<String, Map<String,Map<String,List<ShipBean>>>>)request.getAttribute("customerOrderShipListMap");
//customerOrderShipListMap=customerOrderShipListMap==null?new HashMap<String, Map<String,Map<String,List<ShipBean>>>>():customerOrderShipListMap;

List<String> shipList=(List<String>)request.getAttribute("shipList");
shipList= shipList==null?new ArrayList<String>():shipList;

Map<String,List<ShipDetailBean>> shipListMap = (Map<String,List<ShipDetailBean>>)request.getAttribute("shipListMap");
shipListMap=shipListMap==null?new HashMap<String,List<ShipDetailBean>>():shipListMap;

String warnMessage = (String) request.getAttribute("INVOKE_MESSAGE");
warnMessage=warnMessage==null?"":warnMessage;
%>
<style>
<!--

-->
</style>
<head>
<base href="<%=basePath%>">

</head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="approveShipForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET"  loadCache="true">
	<html:hidden id="operation" name="operation" value="listApproveShip"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" asyncSelect="true" simplendar="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.ship.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1670" class="edit-talbe">
		
		<tr class="trCell">
			<td class="edit-talbe-label" id="LKOKHHFIBBFMNJBFNLGIBOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEJNKMNKEMCOMMHPCJJJKCAOMBFAPKOINKLGNOK" colSpan="1" rowSpan="1">
				<html:text  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]" />
			</td>
			<td class="edit-talbe-label" id="LKOKHHFIBBFMNJBFNLGIBOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				业务员
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEJNKMNKEMCOMMHPCJJJKCAOMBFAPKOINKLGNOK" colSpan="1" rowSpan="1">
				<html:text  id="saleManSH"  name="saleManSH" value="$[saleManSH]" />
			</td>
			<td class="edit-talbe-label" id="LKOKHHFIBBFMNJBFNLGIBOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEJNKMNKEMCOMMHPCJJJKCAOMBFAPKOINKLGNOK" colSpan="1" rowSpan="1">
				<html:text  id="corderCodeSH"  name="corderCodeSH" value="$[corderCodeSH]" />
			</td>
			
			<td class="edit-talbe-label" id="LKOKHHFIBBFPRODUCTPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				是否加急
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJPRODUCTCODEOMMHPCJJJKCAOMBFAPKOINKLGNOK"  colSpan="1">
				<html:select id="isUrgentSH" name="isUrgentSH">
					<html:option label="是" value="1" selected="$[isUrgentSH]" />
					<html:option label="否" value="0" selected="$[isUrgentSH]" />
				</html:select>
			
		    </td>
	    </tr>
		<tr  class="trCell">
			<td class="edit-talbe-label" id="LKOKHHFIBBFPRODUCTPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.route.factoryid#}" ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJPRODUCTCODEOMMHPCJJJKCAOMBFAPKOINKLGNOK"  colSpan="3" style="font-size:14px;">
				<html:checkbox id="factoryIdSH"  name="factoryIdSH"   list="factoryList"  label="factoryName"  value="factoryId"  />
			</td>
			<td class="edit-talbe-label" id="LKOKHHFIBBFMFACTORYOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEFACTORYCODEPCJJJKCAOMBFAPKOINKLGNOK"  colSpan="3" style="font-size:14px;">
				<html:checkbox id="productIdSH"  name="productIdSH"  list="productList"  label="productName"  value="productId" />
			</td>	
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="LKOKHHFIBBFMNJBFNLGIBOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				物料
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEJNKMNKEMCOMMHPCJJJKCAOMBFAPKOINKLGNOK" colSpan="1" rowSpan="1">
				<html:text  id="meterialDescSH"  name="meterialDescSH" value="$[meterialDescSH]" />
			</td>	
			<td class="edit-talbe-label" id="LKOKHHFIBBFPRODUCTPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				状态
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJPRODUCTCODEOMMHPCJJJKCAOMBFAPKOINKLGNOK"  colSpan="1">
				<html:select id="shipStatusSH" name="shipStatusSH">
					<html:option label="待审批" value="0" selected="$[shipStatusSH]"/>
					<html:option label="待物流分配" value="1" selected="$[shipStatusSH]"/>					
					<html:option label="待排车" value="2" selected="$[shipStatusSH]"/>					
					<html:option label="已排车" value="3" selected="$[shipStatusSH]"/>
					<html:option label="驳回" value="901" selected="$[shipStatusSH]"/>
				</html:select>			
		    </td>
		    <td class="edit-talbe-label" id="LKOKHHFIBBFMNJBFNLGIBOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				开始日期
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEJNKMNKEMCOMMHPCJJJKCAOMBFAPKOINKLGNOK" colSpan="1" rowSpan="1">
				<com:simplendar  id="startDateSH"  name="startDateSH"   value="$[startDateSH]"  />
			</td>	
			<td class="edit-talbe-label" id="LKOKHHFIBBFPRODUCTPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				结束日期
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJPRODUCTCODEOMMHPCJJJKCAOMBFAPKOINKLGNOK"  colSpan="1">
				<com:simplendar  id="endDateSH"  name="endDateSH"   value="$[endDateSH]"  />			
		    </td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="LKOKHHFIBBFPRODUCTPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				是否缺包
			</td>
			<td   id="manageBox" colSpan="1" rowSpan="1">
				<html:select id="shortStockSH" name="shortStockSH">
					<html:option label="是" value="1" selected="$[shortStockSH]" />
					<html:option label="否" value="0" selected="$[shortStockSH]" />
				</html:select>
				
		    </td>
			<td   id="manageBox" colSpan="6" rowSpan="1">
				<span style="float:right;">
					<btn:search href="javascript:submit('approveShipForm')"/>
					<btn:reset href="javascript:cleanForm('approveShipForm')"/>	
		    	</span>
		    </td>
		</tr>
		
	</table>
	
	<table class="background" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;margin-top: 10px;" align="center">
		<tr  class="headerStyle" >
			<td width="30px">加急</td>
			
			<td width="60px">业务员</td>		
			<td width="170px">客户名称</td>			
			<td width="120px">申请时间</td>	
			<td width="70px">订单编号</td>
			<td width="80px">申请编号</td>
			<td width="50px">行号</td>
			<td width="40px">工厂</td>					
			<td width="40px">产品</td>				
			<td >物料</td>
			<td width="50px">数量</td>
			<td width="50px">包数</td>
			<td width="60px">状态</td>
			<td width="70px">操作</td>
		</tr>
	
	<%
				ShipDetailBean shipBean = null,nestBean=null;
				int applyStatus=0;
				String applyStatusDesc="";
				String shipCode=null,itemCode=null;
				List<ShipDetailBean> detailList = null;
				for(int i=0,size=shipList.size();i<size;i++){
					shipCode=shipList.get(i);
					detailList=shipListMap.get(shipCode);
					if(detailList==null||detailList.isEmpty()){
						continue;
					}
					for(int n=0,nsize=detailList.size();n<nsize;n++){
						nestBean=detailList.get(n);
					request.setAttribute("custOrderBean",nestBean);
					applyStatus=nestBean.getApplyStatus();
					applyStatusDesc="";
					itemCode=nestBean.getCodetailCertificate();
					//itemCode=itemCode==null?"":itemCode;
					//itemCode=itemCode.replaceAll("0000","");
				
					if(applyStatus==903){applyStatusDesc="物流拒绝";}//物流拒绝
					if(applyStatus==902){applyStatusDesc="已撤消";}
					if(applyStatus==901){applyStatusDesc="未通过";}
					if(applyStatus==0){applyStatusDesc="待审批";}//初始状态
					if(applyStatus==1){applyStatusDesc="待物流分配";}//已经通过但没有分派给承商或没有分拆
					if(applyStatus==2){applyStatusDesc="待排车";}//已经通过，已经分派给承商或分拆
					if(applyStatus==3){applyStatusDesc="已排车";}
					String corderCode = nestBean.getCorderCode().replaceFirst("^0*","");
				%>
				<tr class="alternatingItemStyle" >
					<%if(n==0){ %>
					<td  style="text-align:center;white-space: nowrap;" rowspan="<%=nsize %>" >
						<%if(nestBean.getIsUrgent()==0){ %>
						       <img src="images/htms/green.png"  height="12" width="12" />
						<%}	if(nestBean.getIsUrgent()==1){ %>
						       <img src="images/htms/red.png" height="12" width="12" />
						<%} %>
					</td>					
					<td width="80px" rowspan="<%=nsize %>"><%=nestBean.getSaleMan() %></td>	
					<td  width="170px" style="text-align:left;" rowspan="<%=nsize %>"><%=nestBean.getCustomerName()%></td>
					<td width="80px" rowspan="<%=nsize %>"><%=nestBean.getCreateTime() %></td>
					<td width="80px" rowspan="<%=nsize %>"><%=corderCode%></td>
					<td width="80px" rowspan="<%=nsize %>">
						<html:a href="contoller.do?operation=viewApproveShip&shipId=$[custOrderBean.shipId]">
						<%=nestBean.getShipCode() %>
						</html:a>
					</td>
					
					<%} %>		
					<td width="80px"><%=itemCode %></td>
					<td width="80px"><%=nestBean.getFactoryName() %></td>
					<td width="80px"><%=nestBean.getProductName()%></td>
					<td width="80px"><%=nestBean.getCodetailCertificateDesc()%></td>
					<td width="50px" style="text-align:right;">
						<html:a href="contoller.do?operation=viewApproveShip&shipId=$[custOrderBean.shipId]">
						<%=nestBean.getApplyTonNum()%>
						</html:a>
					</td>
					<td width="50px" style="text-align:right;">
						<html:a href="contoller.do?operation=viewApproveShip&shipId=$[custOrderBean.shipId]">
						<%=nestBean.getApplyPackNum() %>
						</html:a>
					</td>
					<%if(n==0){ %>
					
					<td width="50px"  rowspan="<%=nsize %>">
					<html:hidden id="applyStatus" name="applyStatus" value="$[shipBean.applyStatus]"/>
					<%=applyStatusDesc %>
					</td>
					<td width="80px" rowspan="<%=nsize %>">
					<%if(applyStatus==0){ %>
						<btn:audit id="approve" name="approve"  href="contoller.do?operation=toApproveShip&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]"/>
					<%} %>
					<%if(applyStatus==1){ %>
						<html:a href="contoller.do?operation=cancelShipApprove&shipId=$[custOrderBean.shipId]" style="border:0;text-decoration:none;">
							<input type="button"  id="" name="" value="撤消"  class="commonBtn">							
						</html:a>
					<%} %>
					</td>
					<%} %>
				</tr>
			<%
					}//for detailList
			}//for
		%>
	
	</table>
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkShipId" checkId="checkAll"/>
				<com:page formId="approveShipForm" pageCtlName="pageCtl"/>
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
	var message="<%=warnMessage %>";
	if(message!=null&&message!=""){
	    alertTip(message);
	}
</script>
