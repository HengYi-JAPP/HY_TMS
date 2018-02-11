<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@ page import="com.zzy.htms.logistic.transfer.TransferBean,com.zzy.htms.logistic.transfer.TransferUtils" %>
<%@page import="com.zzy.htms.logistic.transport.TransportBean,com.zzy.htms.logistic.transport.TransportUtils"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>
<%@page import="com.zzy.htms.dictionary.product.ProductRepository,com.zzy.htms.dictionary.product.ProductBean" %>
<%@page import="com.zzy.htms.dictionary.factory.FactoryRepository,com.zzy.htms.dictionary.factory.FactoryBean" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

Map<String, List<TransferBean>> transferDetailListMap=(Map<String, List<TransferBean>>)request.getAttribute("transferDetailListMap");
transferDetailListMap=transferDetailListMap==null?new HashMap<String, List<TransferBean>>():transferDetailListMap;

List<String> transferKeyList=(List<String>)request.getAttribute("transferKeyList");
transferKeyList=transferKeyList==null?new  ArrayList<String>():transferKeyList;


List<TransferBean> detailList=null;
	
 List<AreaBean> provinceList =AreaRepository.getRootNodeList();
 request.setAttribute("provinceList",provinceList); 
 
 List<ProductBean>  productList=ProductRepository.getProductList();
 
 List<FactoryBean>  factoryList=FactoryRepository.getFactoryList();
 
request.setAttribute("productList",productList);
request.setAttribute("factoryList",factoryList); 
%>

<head>
<script type="text/javascript"> 	
var basePath="<%=basePath%>"; 
window.onload=function(){
	var transportCreateTime = document.getElementsByName("transportCreateTime");
	var sendTime = document.getElementsByName("sendTime");
	var sapTransCode = document.getElementsByName("sapTransCode");
	for(var i = 0; i<transportCreateTime.length; i++ ){
			var beginDate = new Date(transportCreateTime[i].innerHTML);
			var endDate = new Date(sendTime[i].innerHTML);
			var compareSend = Math.abs(endDate-beginDate)/1000/60/60;
			var sysDate = new Date();
			var compareSys = Math.abs(sysDate-beginDate)/1000/60/60;
	       	if(compareSend>2){
	       		sapTransCode[i].style.color="red";
	       };   
	       if(compareSys>2&&(transportCreateTime[i].innerHTML==''||sendTime[i].innerHTML=='')){
	       	sapTransCode[i].style.color="red";
	       };       
	}
}
</script>
 <style type="text/css">
    table{width:1523px;}
 </style>
<base href="<%=basePath%>">
</head>
<com:loader  js="js/common/common.js,js/MathCalculator.js,js/console/list/list.js,resources/date/WdatePicker.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="carrierCheckForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" loadCache="true">
	<com:loader  simplendar="true"  ajax="true" asyncSelect="true" />
	<html:hidden id="operation" name="operation" value="listCarrierCheck"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='车队考核列表' name="title"/>
	</jsp:include>
	
	
	<table id="1706" class="edit-talbe" style="width:1785px;"  >
	     <tr class="trCell" style="width:100%" >
	        <td class="edit-talbe-label" id="INACNKJLAKCPMKIEMCELIAMHJOKCKKEAHNNCLFLFINJCACGOBKNMGGFOGKLJJKMI" >
				<html:label  label="加急订单" ></html:label>
			</td>
			<td  id="OEPPIOFKCKEHPGIBNKNLOICMEIJLKKKPMOFLBLKMCBMLKOPJNNLCBBIELCMJKHMN" colSpan="1" rowSpan="1">
				<html:select  id="isUrgentSH" name="isUrgentSH" >
					<html:option label="是" value="1" selected="$[isUrgentSH]"></html:option>
					<html:option label="否" value="0" selected="$[isUrgentSH]"></html:option>
				</html:select>
			</td>
			<td class="edit-talbe-label" id="AKJKHMEALEFHKMKJHPNONJCILKPKCHPOPOBABNOCKBOKGABMFNCALPICOBEIKOOK" >
				申请编号
			</td>
			<td  id="KPLOGMBLICMOLOJNNCBFKGEPPEJFNIFGMOLCNBFFKOHEIJMPMNEIFECJCBAKLIAJ" >
				<html:text id="shipCodeSH" name="shipCodeSH" value="$[shipCodeSH]"/>
			</td>
			<td class="edit-talbe-label" id="AKJKHMEALEFHKMKJHPNONJCILKPKCHPOPOBABNOCKBOKGABMFNCALPICOBEIKOOK" >
				SAP调拨单号
			</td>
			<td  id="KPLOGMBLICMOLOJNNCBFKGEPPEJFNIFGMOLCNBFFKOHEIJMPMNEIFECJCBAKLIAJ" >
				<html:text id="sapTransCodeSH" name="sapTransCodeSH" value="$[sapTransCodeSH]"/>
			</td>
	        <td class="edit-talbe-label" id=""  colSpan="1" rowSpan="1" >
			       客户名称
			</td>
			<td  id="customerNameID" >
				<html:text id="customerNameSH" name="customerNameSH" value="$[customerNameSH]"/>
			</td>
			<td class="edit-talbe-label" id="" >
			       承运商
			</td>
			<td  id="saleManSH" width="22%">
				<html:select  id="carrierIdSH"  name="carrierIdSH"  list="carrierList"  >
				    <html:option  value="carrierId"  label="carrierName" selected="$[carrierIdSH]"></html:option>
				</html:select>
			</td>
		</tr>
		
		
	    <tr class="trCell">
	        <td class="edit-talbe-label" id="INACNKJLAKCPMKIEMCELIAMHJOKCKKEAHNNCLFLFINJCACGOBKNMGGFOGKLJJKMI" >
				 调拨单状态
			</td>
			<td  id="OEPPIOFKCKEHPGIBNKNLOICMEIJLKKKPMOFLBLKMCBMLKOPJNNLCBBIELCMJKHMN"  colSpan="1" rowSpan="1">
				<html:select  id="transStatusSH" name="transStatusSH" >
					<html:option label="已分配" value="1" selected="$[transStatusSH]"></html:option>
					<html:option label="已排车" value="2" selected="$[transStatusSH]"></html:option>
				</html:select>
			</td>
			<td class="edit-talbe-label" colSpan="1" rowSpan="1">
				是否超时
			</td>
			<td   colSpan="1" rowSpan="1">
				<html:select  id="carrierCheckSH" name="carrierCheckSH" >
					<html:option label="未超时" value="0" selected="$[carrierCheckSH]"></html:option>
					<html:option label="超时" value="1" selected="$[carrierCheckSH]"></html:option>
				</html:select>
			</td>
			<td class="edit-talbe-label" colSpan="1" rowSpan="1">
				排车时间
			</td>
			<td  style="text-align:left;">
				<com:simplendar  id="sendCarDateSH"  name="sendCarDateSH"   value="$[sendCarDateSH]"  />
			</td>
			<td class="edit-talbe-label" colSpan="1" rowSpan="1">
				派车时间
			</td>
			<td  style="text-align:left;" colSpan="3">
				<com:simplendar  id="sendTimeSH"  name="sendTimeSH"   value="$[sendTimeSH]"  />
			</td>
			<!--  <td  class="edit-talbe-label"  colSpan="1" rowSpan="1">
				省
			</td>
			<td  >
				<html:select id="provinceId" name="provinceId"  list="provinceList" isCascade="true" isCascadeSource="true" cascadeTarget="cityId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
					<html:option label="areaName" value="areaId" />
				</html:select>
			</td>
			
			<td class="edit-talbe-label"  colSpan="1" rowSpan="1">
				市
			</td>
			<td  width="100px">
				<html:select id="cityId" name="cityId"   isCascade="true" isCascadeSource="true" cascadeTarget="countyId"  cascadeValue="parentAreaId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
					
				</html:select>
			</td>	
			<td class="edit-talbe-label"  colSpan="1" rowSpan="1">
				区(县)
			</td>
			<td  >
				<html:select id="countyId" name="countyId"  isCascade="true" isCascadeSource="true" cascadeTarget="countryId"  cascadeValue="parentAreaId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
				
				</html:select>
			</td>	
			<td  class="edit-talbe-label" colSpan="1" rowSpan="1">
				乡镇、街道
			</td>
			<td >
				<html:select id="countryId" name="countryId"   isCascade="true"  cascadeValue="parentAreaId">
				</html:select>
			</td>					
			-->
		</tr>
	    <tr class="trCell">
			<td class="edit-talbe-label" id="LKOKHHFIBBFPRODUCTPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" >
				<html:label  label="{$jsp.htms.dictionary.route.factoryid#}"  ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJPRODUCTCODEOMMHPCJJJKCAOMBFAPKOINKLGNOK" style=" font-size: 14px;" colSpan="3" rowSpan="1">
				<html:checkbox id="factoryIdSH"  name="factoryIdSH"   list="factoryList"  label="factoryName"  value="factoryId"  checkedList="checkFactoryList" checkedValue="factoryId" checked=""  />
			</td>	
			
			<td class="edit-talbe-label" id="LKOKHHFIBBFMFACTORYOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" >
				<html:label  label="{$jsp.htms.dictionary.product.productname#}" ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEFACTORYCODEPCJJJKCAOMBFAPKOINKLGNOK" style=" font-size: 14px;" colSpan="1" rowSpan="1">
				  <html:checkbox id="productIdSH"  name="productIdSH"  list="productList"  label="productName"  value="productId" property="productIdSH" accesskey="productIdSH" checkedList="checkProductList" checkedValue="productId" />
		
			</td>	
			<td  class="edit-talbe-label" colSpan="1" rowSpan="1">
				业务员
			</td>
			<td >
				<html:text id="saleManSH" name="saleManSH" value="$[saleManSH]"/>
			</td>	
			<td  class="edit-talbe-label" colSpan="1" rowSpan="1">
				车牌号
			</td>
			<td >
				<html:text id="carCodeSH" name="carCodeSH" value="$[carCodeSH]"/>
			</td>	
		</tr>
		 <tr class="trCell" style="width:100%" >
		      <td   class="edit-talbe-label" >
		                      分配时间
		      </td>
		      <td   colSpan="4" >
		                       从
		           <html:text id="startTimeSH" name="startTimeSH"    value="$[startTimeSH]" styleClass="Wdate" onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width:145px;" />
		                       到
		           <html:text id="endTimeSH" name="endTimeSH"  value="$[endTimeSH]"    styleClass="Wdate" onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width:145px;"/>
		      </td>
		      <td width="212px;">
		      	<jsp:include page="../../export/exportCarrierCheck.jsp">
					<jsp:param value='' name=""/>
				</jsp:include>
		      </td>
		      <td    id="searchBox" colSpan="6" rowSpan="1"  align="left" >
		      		
		           <btn:search id="searchCarrierCheck" href="javascript:submit('carrierCheckForm')"/>
				   <btn:reset id="resetCarrierCheck" href="javascript:cleanForm('carrierCheckForm')"/>
		     </td>
		 </tr>
		 
	</table>
	<table id="tb" class=" background" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%;text-align:left;overflow-x:scroll;overflow-y:hidden;float:left;border-collapse: collapse;margin-top: 10px;">
		<tr  class="headerStyle" >
	    	<td width="40px">加急</td>
	    	<!-- 
	    	<td width="120px">审批时间</td>
	    	 -->
	    	<td width="100px">申请编号</td>	
			<td width="100px">SAP调拨单号</td>
			<td width="140px">承运商名称</td>
			<td width="130px">分配时间</td>
			<td width="130px">排车时间</td>
			<td width="130px">派车时间</td>
			<td width="180px">客户名称</td>
			<td  width="280px">送货地址</td>	
			
			<td width="50px">产品</td>
			
			<td width="50px">SAP运费<br>(元/吨)</td>
			
			<td width="50px">运费</td>
			
			<td width="50px">数量</td>
			<td width="50px">包数</td>
			
			<td width="50px">工厂</td>
			
			<td width="130px">装运点</td>
			
			<td width="60px">状态</td>
			
			<td width="60px">业务员</td>
		</tr>
	<%
	    TransferBean transBean=null;
		int transStatus=0,isDefault=0,isUrgent=0,selfFetch=0;
		for(int i=0,size=transferKeyList.size();i<size;i++){
			detailList=transferDetailListMap.get(transferKeyList.get(i));
				for(int d=0,dsize=(detailList==null?0:detailList.size());d<dsize;d++){
				
				
				
					transBean=detailList.get(d);
					request.setAttribute("transferBean",transBean);
					
					String corderCode = transBean.getCorderCode().replaceFirst("^0*","");
					String shipCode = transBean.getShipCode().replaceFirst("^0*","");
					String transferCode=transBean.getTransferCode().replaceFirst("^0*","");
					
					isDefault=transBean.getIsDefault();
					isUrgent=transBean.getIsUrgent();
					selfFetch=transBean.getSelfFetch();
					transStatus=transBean.getTransStatus();
					
				%>
					<tr class="alternatingItemStyle"   onclick="onMouseMoveOverTableList(this)">
						<%if(d==0){
						 %>
						 
						                <td style="text-align:center;"  rowspan="<%=dsize %>" >
											<%if(isUrgent==0){ %>
											       <img src="images/htms/green.png"  height="18" width="18" />
											<%}	if(isUrgent==1){ %>
											       <img src="images/htms/red.png" height="18" width="18" />
											<%} %>
										</td>
										<!-- 
										<td width="80px"  rowspan="<%=dsize %>" ><%=transBean.getCreateTime() %></td>
										 -->
										<td style="text-align:center;" rowspan="<%=dsize %>">
										       <%=shipCode %>
										</td>
									
										<td id="sapTransCode" name="sapTransCode" style="text-align:center;line-height:28px;"  rowspan="<%=dsize %>"><%=transBean.getSapTransCode() %></td>
										<td  style="text-align:center;line-height:28px;"  rowspan="<%=dsize %>"><%=transBean.getCarrierName() %></td>
										
										
										<td id="transportCreateTime" name="transportCreateTime" width="80px"  rowspan="<%=dsize %>" ><%=transBean.getTransportCreateTime() %></td>
							            <td width="80px"  rowspan="<%=dsize %>" ><%=transBean.getSendCreateTime() %></td>
							            <td id="sendTime" name="sendTime" width="80px"  rowspan="<%=dsize %>" ><%=transBean.getSendTime() %></td>
										
										<td style="text-align:left;"   rowspan="<%=dsize %>" ><%=transBean.getCustomerName() %></td>
										
											
									   <td style="text-align:left;"   rowspan="<%=dsize  %>">
										         <%=transBean.getAreaName()+transBean.getCaddrDetail()%>
										 </td>
									
							<%} %>
							
										 <td > <%=transBean.getProductName() %> </td>
									     <td style="text-align:right;" ><%=transBean.getFreight() %></td>
										 <td  style="text-align:right;"><%=transBean.getTransportTotalPrice() %></td>
										 
										 <td style="text-align:right;" >
										         <%=transBean.getDetailApplyTonNum() %>
										 </td>
																		    
									     <td style="text-align:right;" >
									             <%=transBean.getDetailApplyPackNum() %>
									     </td>
						       
						                 <td > <%=transBean.getFactoryName() %> </td>
						                 
						                 <td> 
							                  <p title='<%=transBean.getShipPointDesc()==null?"":transBean.getShipPointDesc() %>' >
							                  <%=transBean.getShipPointDesc()==null?"":transBean.getShipPointDesc() %>
							                  </p>     
						                 </td> 
						                 
						                 
						               
						      <%if(d==0){%>
						      
						              <td   rowspan="<%=dsize %>">
						                   <%
						                      //String transStatus=transBean.getTransStatus();
						                      if(transStatus==1){ %>
											       已分配
											<%}	if(transStatus==2){ %>
											       已排车
											<%} %>
						              </td>
						               
						      
						      
						               <td width="80px"  rowspan="<%=dsize %>" ><%=transBean.getSaleMan() %></td>
						              
						      <%} %>
						  
					</tr>
				<%} //for 
				} %>
	</table>
	
	
	
	
	
	
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" >
				<com:checkall targetName="checkTransferId" checkId="checkAll"/>
				<com:page formId="carrierCheckForm" pageCtlName="pageCtl"/>
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
<jsp:include page="../../../common/invokeMessage.jsp" />
<%
String SAP_INVOKE_MESSAGE=(String)request.getAttribute("SAP_INVOKE_MESSAGE"); 
SAP_INVOKE_MESSAGE=SAP_INVOKE_MESSAGE==null||"".equals(SAP_INVOKE_MESSAGE.trim())?"":SAP_INVOKE_MESSAGE;
SAP_INVOKE_MESSAGE=SAP_INVOKE_MESSAGE.replaceAll("'","\"");
//System.out.println("SAP_INVOKE_MESSAGESAP_INVOKE_MESSAGESAP_INVOKE_MESSAGESAP_INVOKE_MESSAGESAP_INVOKE_MESSAGE===:"+SAP_INVOKE_MESSAGE);
%>
<script type="text/javascript"> 	
var SAP_INVOKE_MESSAGE='<%=SAP_INVOKE_MESSAGE%>';
if(SAP_INVOKE_MESSAGE!=null&&SAP_INVOKE_MESSAGE!='null'&&SAP_INVOKE_MESSAGE!=''){
alertTip(SAP_INVOKE_MESSAGE);
}
</script>
