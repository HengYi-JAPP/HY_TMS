<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean,com.mobilecn.utils.random.IntRandom" %>
<%@page import="com.zzy.htms.user.HtmsUserBean"%>
<%@page import="com.zzy.htms.logistic.transferdetail.TransferDetailBean,java.math.BigDecimal" %>
<%@page import="com.zzy.htms.dictionary.transprice.TransPriceBean"%>
<%@page import="com.zzy.htms.services.business.FreightBean"  %>
<%@page import="com.zzy.htms.sales.customerprice.CustomerPriceBean"  %>
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String transportCode = tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(10,99);
 HtmsUserBean userBean = (HtmsUserBean)request.getSession().getAttribute("userBean");
 int isTraders=userBean==null?0:userBean.getCustomerType();
 
 
List<TransferDetailBean> transferDetailList =(List<TransferDetailBean>) request.getAttribute("detailList");
transferDetailList=transferDetailList==null?new ArrayList<TransferDetailBean>():transferDetailList;

Map<String,TransPriceBean> transpriceMap =(Map<String,TransPriceBean>)request.getAttribute("transpriceMap");
transpriceMap=transpriceMap==null?new HashMap<String,TransPriceBean>():transpriceMap;

 Map<String,FreightBean> freightBeanMap =(Map<String,FreightBean>)request.getAttribute("freightBeanMap");
freightBeanMap=freightBeanMap==null?new HashMap<String,FreightBean>():freightBeanMap;

 Map<String,CustomerPriceBean> customerPriceMap=(Map<String,CustomerPriceBean>) request.getAttribute("customerPriceMap");
 customerPriceMap=customerPriceMap==null?new HashMap<String,CustomerPriceBean>():customerPriceMap;
%>
<head>
<base href="<%=basePath%>">
<script type="text/javascript">
    var basePath="<%=basePath%>";	
</script>
</head>

<com:loader  js="js/common/common.js,js/MathCalculator.js,js/htms/custorder/custorder.js,js/htms/transfer/assign.js,resources/simpleupload/jquery-min.js"/>
<com:loader css="css/common/sub-table-list.css" switchbox="true" ajax="true"   />
<com:loader js="js/split.js"/>
<html:form id="splitForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"    method="POST" >
	<html:hidden id="operation" name="operation" value="doTransferAssign"/>	
	<html:hidden id="transId" name="transId" value="$[tranferViewBean.transId]"/>
	<html:hidden id="currentShipId" name="currentShipId" value="$[tranferViewBean.shipId]"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="modifyTime" name="modifyTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="transportCode" name="transportCode" value="<%=transportCode %>"/>
	<html:hidden id="areaId" name="areaId" value="$[tranferViewBean.areaId]" />
	<html:hidden id="corderCode" name="corderCode" value="$[tranferViewBean.corderCode]"/>
	
	<html:hidden id="corderId" value="$[tranferViewBean.corderId]" />
	<html:hidden id="shipId" value="$[tranferViewBean.shipId]" />
		
	<com:loader  simplendar="true"   />
	<com:loader binder="true" checkall="true" switchbox="true"  />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='分配承运商' name="title"/>
	</jsp:include>
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				订单信息：<com:switchbox boxId="displayOrderDetail" varValue="1" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName="customerId"  offLabel="隐藏订单信息" onLabel="显示订单信息"  ajaxUrl="contoller.do" isSave="false" onBoxClick="showOrHideOrderDetail('displayOrderDetail','orderDetailInfo');"/>
			</html:td>
		</html:tr>
	</html:table>
	<table id="orderDetailInfo" class="edit-talbe" style="display:block">
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td width="350px">
				<html:value  value="$[tranferViewBean.corderCode]" ></html:value>
				(日期:<html:value value="$[tranferViewBean.custOrderCreateTime]"></html:value>)
			</td>
			<td class="edit-talbe-label">
				是否加急
			</td>
			<td  width="47%">
				<com:switchbox boxId="isUrgent" varValue="$[tranferViewBean.isUrgent]" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName=""  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" isSave="false" disabled="true" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.customerid#}" ></html:label>
			</td>
			<td>
				<html:value  value="$[tranferViewBean.customerName]" ></html:value>
				
				<html:hidden id="customerId"  value="$[tranferViewBean.customerId]" />
				
			</td>
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.custorder.customercode#}" ></html:label>
			</td>
			<td>
				<html:value  value="$[tranferViewBean.customerCode]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				申请编号
			</td>
			<td >
				<html:text id="shipCode" name="shipCode" value="$[tranferViewBean.shipCode]" readonly="true"  style="border:0px;"></html:text>
			</td>
			
			
			<td class="edit-talbe-label">
				业务员
			</td>
			<td >
				<html:text  value="$[tranferViewBean.saleMan]" readonly="true"  style="border:0px;"></html:text>
			</td>
		</tr>
		<tr class="trCell">
		    <td class="edit-talbe-label">
				<html:label label="{$jsp.htms.sales.customeraddr.address#}"  ></html:label>
			</td>
			<td colspan="3">
				<html:value value="$[tranferViewBean.areaName]" />
				<html:value value="$[tranferViewBean.caddrDetail]" />
				
			</td>
	    </tr>
		<tr class="trCell">
		    <td class="edit-talbe-label">
				联系人
			</td>
			<td >
				<html:value value="$[tranferViewBean.caddrContactor]" />
			</td>
			 <td class="edit-talbe-label">
				联系方式
			</td>
			<td >
				<html:value value="$[tranferViewBean.caddrTelephone]" />
			</td>
	    </tr>
	    <tr class="trCell">
			<td class="edit-talbe-label">
				申请时间
			</td>
			<td >
				<html:text  value="$[tranferViewBean.shipApplyTime]" readonly="true"  style="border:0px;"></html:text>
				
				<html:hidden id="applyTime"  value="$[tranferViewBean.shipApplyTime]" />
			</td>
			<td class="edit-talbe-label">
				审批时间
			</td>
			<td>
			    <html:text  value="$[tranferViewBean.approveAgreeTime]" readonly="true"  style="border:0px;"></html:text>
			</td>
		</tr>
		
		<tr class="trCell">
			<td class="edit-talbe-label">
				申请数
			</td>
			<td >
				<html:value  value="$[tranferViewBean.applyTonNum]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				申请包数
			</td>
			<td>
				<html:value  value="$[tranferViewBean.applyPackNum]" ></html:value>
			</td>
		</tr>
		
		
			
			
		<td class="edit-talbe-label" >
				客户余额
			</td>
			<td>
			
				<%
					List<TransferDetailBean> detailLit=(List<TransferDetailBean>)request.getAttribute("detailLit");
					String customerAmount=(String )request.getAttribute("customerAmount");
					//System.out.println("assign------------------- assign customerAmount:"+customerAmount);
					customerAmount=customerAmount==null||"".equals(customerAmount.trim())?"0":customerAmount;
					BigDecimal customerAmountNum = new BigDecimal(customerAmount);
					detailLit=detailLit==null?new ArrayList<TransferDetailBean>():detailLit;
					TransferDetailBean detailBean = null;
					BigDecimal freightNum=null,priceNum =null,moneyNum=null,totalMoney=new BigDecimal("0.0"),stockNum=null,applyNum=null,appliableAmount=null,C1000=new BigDecimal("1000.00"); 
					boolean enoughStock = true,enoughtMoney=true;
					for(int i=0,size=detailLit.size();i<size;i++){
						detailBean = (TransferDetailBean)detailLit.get(i);
						stockNum=new BigDecimal(detailBean.getStockNum());
						applyNum=new BigDecimal(detailBean.getApplyTonNum());
						appliableAmount=new BigDecimal(detailBean.getAppliableAmount());
						if(enoughStock==true){
							enoughStock=stockNum.compareTo(applyNum)>=0;
						}
						freightNum=new BigDecimal(detailBean.getFreight());
						
						priceNum=new BigDecimal(detailBean.getUnitPrice());
						
						//System.out.println("-------------------  freightNum:"+freightNum);
						//System.out.println("-------------------  priceNum:"+priceNum);
						/*运费单价加上产品单价,仍然按元/公斤的单价*/
						freightNum=freightNum.divide(C1000);
						priceNum=priceNum.add(freightNum);
						//System.out.println("-------------------  priceNum:"+priceNum);
						
						/*产品申请数量乘以单价得出产品和运费的价钱*/
						moneyNum=priceNum.multiply(applyNum);
						//System.out.println("-------------------  moneyNum:"+moneyNum);
						/*总价钱=各个行项的价钱之和*/
						//System.out.println("-------------------  totalMoney:"+totalMoney);
						totalMoney=totalMoney.add(moneyNum);
						//System.out.println("-------------------  totalMoney:"+totalMoney);
						
					}
					/*看客户余额是否足够*/
					enoughtMoney=customerAmountNum.compareTo(totalMoney)>=0;
					String moneyTips = "",stockTips="";
					if(enoughStock==false){
						stockTips="当前工厂该物料的库存不足。";
					}
					 if(enoughtMoney==false){
					   BigDecimal totalTransportMoney=new BigDecimal(0);
					   System.out.println("enoughtMoney==false-------------------  customerAmount:"+customerAmount+",totalMoney="+totalMoney+",totalTransportMoney="+totalTransportMoney);
					   totalTransportMoney=customerAmountNum.subtract(totalMoney);
						//moneyTips="请注意:当前客户的余额不足。";
						moneyTips="请注意:余额不足,差额为:"+totalTransportMoney;
						%>
						   <font color="red"><%=moneyTips %></font>
						<%
					}else{
					    String tips="余额充足"; 
					    %>
					       <%=tips %>
					    <% 
					}
					    %>
					
					 
			</td>
			<td class="edit-talbe-label">
				备注
			</td>
			<td >
				<html:value value="$[tranferViewBean.shipNotice]" />
			</td>
		</tr>
	</table>
	<logic:if condition="$[tranferViewBean.selfFetch]==1">
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				贸易商自提:<com:switchbox boxId="selfFetch" varValue="$[tranferViewBean.selfFetch]" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName="customerId"  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" isSave="false" onBoxClick="showOrHideOrderDetail('selfFetch','showFecthInfo');" disabled="true"/>
			</html:td>
		</html:tr>
	</html:table>
	<html:table id="showFecthInfo" styleClass="edit-talbe"  style="display:block;" >
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				提货司机
			</html:td>
			<html:td  width="300px">
				<html:value  value="$[tranferViewBean.fetchDriver]"  />
			</html:td>
			<html:td styleClass="edit-talbe-label">
				联系方式
			</html:td>
			<html:td >
				<html:value  value="$[tranferViewBean.fetchMobile]"  />
			</html:td>
		</html:tr>	
		<html:tr styleClass="trCell">
			
			<html:td styleClass="edit-talbe-label">
				车牌号
			</html:td>
			<html:td colspan="3">
				<html:value  value="$[tranferViewBean.fetchCar]"  />
			</html:td>
		</html:tr>	
	</html:table>
	</logic:if>
	
	
	<html:table list="detailList" bean="detailBean" styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" isHead="true" >
		<html:tr headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
			<html:td label="行号" property="itemCode"  width="108px"/>		
			<html:td label="工厂" property="factoryName"   width="80px">
			         <html:hidden id="factoryId$[detailBean.itemCode]" name="factoryId" value="$[detailBean.factoryId]" />
			</html:td>
			<html:td label="产品" property="productName"   width="80px">
			         <html:hidden id="productId$[detailBean.itemCode]" name="productId" value="$[detailBean.productId]" />
			</html:td>		
			
			<html:td label="物料" property="codetailCertificateDesc" width="253px" />
			<html:td label="SAP运费<br>(元/吨)" property="freight"  width="70px"/>
			<html:td label="单价" property="unitPrice"  width="70px"/>
			<html:td  id="totlePostage" label="运费"  width="70px" property="transportTotalPrice" />
			      
			<html:td label="库存" property="stockNum"  />
			<html:td label="数量" width="80px" style="text-align:right;">
				<html:hidden id="currentTransDetailId" name="currentTransDetailId" value="$[detailBean.transDetailId]"/>
				<html:hidden id="transDetailId$[detailBean.itemCode]"  value="$[detailBean.transDetailId]"/>
				<html:text  id="appliableTon$[detailBean.itemCode]"  name="appliableTon" value="$[detailBean.applyTonNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>	
			<html:td label="包数" width="80px" style="text-align:right;">
				<html:text  id="appliablePack$[detailBean.itemCode]"  name="appliablePack" value="$[detailBean.applyPackNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
			    
			    <script>itemsNos[itemsNos.length]='<html:value value="$[detailBean.itemCode]"/>';</script>
			</html:td>
			<html:td label="备注">
				<html:value  value="$[detailBean.transDetailNotice]" />
			</html:td>
		</html:tr>
	</html:table>
	
	<br>
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				预估运费信息：<logic:if condition="$[freightType]==1">当前运价类型&nbsp;&nbsp;正常运价</logic:if>
				                                  <logic:if condition="$[freightType]==2">当前运价类型&nbsp;&nbsp;客户运价</logic:if>
				                                  <logic:if condition="$[freightType]!=2&&$[freightType]!=1">无运价信息</logic:if>
			</html:td>
		</html:tr>
	</html:table>
	<table  class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
	    <tr style="height:15px;"  height="25px"  class="dgHeaderStyle" >
	        <td  width="60px" rowspan="2">行号</td>
	       
	        <td width="60px"  rowspan="2">产品</td>
	        <td width="60px"  rowspan="2">工厂</td>
	        <td width="60px"  rowspan="2">数量</td>
	        <td width="150px"  rowspan="2">目的地</td>
	       	<td width="90px"  rowspan="2">申请时间</td>
	        <td width="90px"  rowspan="2">计价方式</td>				
			<td width="70px"  rowspan="2">计价单位</td>	
			 <td width="90px" colspan="2">计价区间</td>		
	        <td width="60px"  colspan="2">客户运价</td>	
			<td width="60px"  colspan="2">承运商运价</td>	
			<td width="60px"  rowspan="2">客户运费</td>	
	    </tr>
        <tr  class="dgHeaderStyle"  height="25px">
            <td width="60px">开始</td>	
			<td width="60px">结束</td>	
			<td width="60px">单价</td>	
			<td width="60px">一口价</td>	
			<td width="60px">单价</td>	
			<td width="60px">一口价</td>	
		</tr>
	 <%
	     TransferDetailBean transDetailBean=null;
	     TransPriceBean transPriceBean=null;
	      CustomerPriceBean customerPriceBean=null;
	      FreightBean freightBean=null;
	      String totalFreight="",totalCarrierFreight="";
	     for(int i=0;i<transferDetailList.size();i++){
	           transDetailBean=(TransferDetailBean)  transferDetailList.get(i);
	           transPriceBean=(TransPriceBean) transpriceMap.get(transDetailBean.getTransDetailId()+"");
	           if(transPriceBean==null){
	              transPriceBean=new TransPriceBean();
	           }
	            customerPriceBean= (CustomerPriceBean) customerPriceMap.get(transDetailBean.getTransDetailId()+"");
	          if(customerPriceBean==null){
	              customerPriceBean=new CustomerPriceBean();
	           }
	            freightBean=(FreightBean) freightBeanMap.get(transDetailBean.getItemCode()+"");
	           if(freightBean==null){
	              freightBean=new FreightBean();
	           }
	           String dictName="",typeName="",priceStart="",priceEnd="",customePrice="",customerOnePrice="",carrierPrice="",carrierOnePrice="",freight="",carrierFreight="";
	           if(freightBean!=null&&freightBean.getFreightType()!=null&&(freightBean.getFreightType().equals("1"))){
	               typeName=transPriceBean.getTypeName()==null?"":transPriceBean.getTypeName();
	               dictName=transPriceBean.getDicName()==null?"":transPriceBean.getDicName();
				   priceStart=transPriceBean.getPriceStart()==null?"":transPriceBean.getPriceStart();
				   priceEnd=transPriceBean.getPriceEnd()==null?"":transPriceBean.getPriceEnd();
				   customePrice=transPriceBean.getCustomerPrice()==null?"":transPriceBean.getCustomerPrice();
				   customerOnePrice=transPriceBean.getCustomerOnePrice()==null?"":transPriceBean.getCustomerOnePrice();
				   carrierPrice=transPriceBean.getCarrierPrice()==null?"":transPriceBean.getCarrierPrice();
				   carrierOnePrice=transPriceBean.getCarrierOnePrice()==null?"":transPriceBean.getCarrierOnePrice();
				   
				   freight=freightBean.getPlanFreight()==null?"":freightBean.getPlanFreight();
				   carrierFreight=freightBean.getPlanCarrierFreight()==null?"":freightBean.getPlanCarrierFreight();
				   
				   totalFreight=freightBean.getPlanTotalFreight()==null?"":freightBean.getPlanTotalFreight();
				   totalCarrierFreight=freightBean.getPlanTotalCarrierFreight()==null?"":freightBean.getPlanTotalCarrierFreight();
	           }
	           if(freightBean!=null&&freightBean.getFreightType()!=null&&(freightBean.getFreightType().equals("2"))){
	               typeName=customerPriceBean.getTypeName()==null?"":customerPriceBean.getTypeName();
	               dictName=customerPriceBean.getDicName()==null?"":customerPriceBean.getDicName();
				   priceStart=customerPriceBean.getPriceStart()==null?"":customerPriceBean.getPriceStart();
				   priceEnd=customerPriceBean.getPriceEnd()==null?"":customerPriceBean.getPriceEnd();
				   customePrice=customerPriceBean.getCustomerPrice()==null?"":customerPriceBean.getCustomerPrice();
				   customerOnePrice=customerPriceBean.getCustomerOnePrice()==null?"":customerPriceBean.getCustomerOnePrice();
				   carrierPrice=customerPriceBean.getCarrierPrice()==null?"":customerPriceBean.getCarrierPrice();
				   carrierOnePrice=customerPriceBean.getCarrierOnePrice()==null?"":customerPriceBean.getCarrierOnePrice();
				   freight=freightBean.getFreightAmount()==null?"":freightBean.getFreightAmount();
				   carrierFreight=freightBean.getPlanCarrierFreight()==null?"":freightBean.getPlanCarrierFreight();
				   totalFreight=freightBean.getTotalFreight()==null?"":freightBean.getTotalFreight() ;
				   totalCarrierFreight= freightBean.getTotalCarrierFreight()==null?"":freightBean.getTotalCarrierFreight();
	           }
	          %>
	          <tr  style="height:30px;" >
                     <td style="text-align:center;" ><%=transDetailBean.getItemCode() %></td>	     
                     <td style="text-align:center;" ><%=transDetailBean.getFactoryName() %></td>	 
                     <td style="text-align:center;" ><%=transDetailBean.getProductName() %></td>	 
                     <td style="text-align:center;" ><%=transDetailBean.getApplyTonNum() %></td>	
                      <td style="text-align:center;" ><html:value value="$[tranferViewBean.areaName]" /></td>	
                       <td style="text-align:center;" ><html:value value="$[tranferViewBean.shipApplyTime]" /></td>	
                     <td style="text-align:center;" >
						<%=typeName %>
					</td>
					<td style="text-align:center;" >
						<%=dictName %>
					</td>
				     <td style="text-align:center;" >
				        <%=priceStart %>
					</td>
					<td style="text-align:center;" >
				        <%=priceEnd %>
					</td>
					<td style="text-align:center;" >
						<%=customePrice %>
					</td>
					<td style="text-align:center;" >
						<%=customerOnePrice %>
					</td>
					<td style="text-align:center;" >
						
						<%=carrierPrice %>
					</td>
					<td style="text-align:center;" >
						<%=carrierOnePrice %>
					</td>     
					<td style="text-align:right;" >						
						<%=freight %>
					</td>
					<!-- 
					<td style="text-align:right;" >
						<%=carrierFreight %>
					</td>    --> 
	          </tr>
	          <%
	     }
	 %>
	 
	 <tr height="25px">
	     <td  style="text-align:center;" colspan="3">合计</td>
	     <td style="text-align:right;"><html:text  id="totalTon"  name="totalTon" value="$[tranferViewBean.applyTonNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/></td>
	     <td  colspan="10"></td>
	     <td style="text-align:right;"><%=totalFreight %></td>
	    <!--   <td style="text-align:right;"><%=totalCarrierFreight %></td>  -->
	 </tr>
	 
</table>
	
	<table  class="edit-talbe" >
		<tr class="trCell">
			
			<td class="edit-talbe-label"  colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriername#}" ></html:label>
			</td>
			<td   width="300px">
				<html:select  id="currentCarrierId"  name="currentCarrierId"  list="carrierList"  ><html:option  value="carrierId"  label="carrierName" ></html:option></html:select>
			</td>
			<td class="edit-talbe-label" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.ship.shipnotice#}" ></html:label>
			</td>
			<td   rowSpan="1">
				<html:text  id="transportNotice" name="transportNotice"  style="width:150px"/>&nbsp;
			</td>
		</tr>
	</table>
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<td class="edit-talbe-label">
				是否自定义运价
			</td>
			<html:td>
				<!--<com:switchbox boxId="selfFetch" varValue="0" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName="customerId"  offLabel="贸易商自提" onLabel="贸易商自提"  ajaxUrl="contoller.do" isSave="false" onBoxClick="showOrHideOrderDetail('selfFetch','showFecthInfo');"/>
			-->
				<html:radio id="selfFetchOff" name="customPrice" value="0"  checked="checked" onchange="showOrHideOrderDetail('selfFetchOff','showFecthInfo');"/>否
				<html:radio id="selfFetchOn" name="customPrice"  value="1"  onchange="showOrHideOrderDetail('selfFetchOn','showFecthInfo');"/>是
			</html:td>
		</html:tr>
	</html:table>
	<html:table id="showFecthInfo" styleClass="edit-talbe"  style="display:none;" >
		<html:tr   >
            <html:td    colspan="2"   styleClass="edit-talbe-label" >
				计费模式<font color='red'>*</font>
			</html:td>
			<html:td  style="text-align:left;vertical-align:middle;font-size:12px" colspan="3">
				<html:hidden id="freightModel" name="freightModel"  />
				<html:radio id="singleModel" name="selFreightModel" label="按单价计算" onclick="changefreightModel('1') " />
				<html:radio id="allModel"  name="selFreightModel" label="按总价计算" onclick="changefreightModel('2')"/>
			</html:td>
		</html:tr>
		<html:tr   >
			<html:td styleClass="edit-talbe-label"    colspan="2" >
				<html:label  label="{$jsp.htms.dictionary.transprice.pricetype#}" ></html:label>
			</html:td>
			<html:td width="180px">
				<html:select id="priceType" name="priceType"  list="price_type_list"  disabled="true"  isCascade="true" isCascadeSource="true" cascadeTarget="priceUnit">
					<html:option label="typeName" value="typeId" selected="$[cachePriceType]"/>
				</html:select>
			</html:td>
		    <html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.dictionary.transprice.priceunit#}" ></html:label>
			</html:td>
			<html:td  >
					<html:select id="priceUnit" name="priceUnit"  list="price_unit_list" disabled="true" isCascade="true"  cascadeValue="typeId">
					<html:option label="dicName" value="targetDicId" />
				</html:select>
			</html:td>			
		</html:tr>
		
		<html:tr  id="weightRows" >
		     <html:td    styleClass="edit-talbe-label" >
			       客户运价
			</html:td>
			 <html:td    styleClass="edit-talbe-label" >
			         单价
			</html:td>
			<td >
			    <html:text  id="customerPrice"  name="customerPrice"  disabled="true"/>
			</td>	
			 <html:td    styleClass="edit-talbe-label" >
			         总价
			</html:td>
			<td colspan="3" >
			    <html:text  id="customerOnePrice"  name="customerOnePrice"   disabled="true"/>
			</td>	
		</html:tr>
		
		<html:tr    id="priceRows"  >
		  <html:td    styleClass="edit-talbe-label" >
			        承运商运价
			</html:td>
			 <html:td    styleClass="edit-talbe-label" >
			         单价
			</html:td>
			<td  >
			    <html:text  id="carrierPrice"  name="carrierPrice"  disabled="true"/>
			</td>	
			 <html:td    styleClass="edit-talbe-label" >
			        总价
			</html:td>
			<td  >
			    <html:text  id="carrierOnePrice"  name="carrierOnePrice"   disabled="true"/>
			</td>	
		</html:tr>
		 
		<html:tr>
			 <html:td   colspan="2" styleClass="edit-talbe-label" >
			        运价备注<font color='red'>*</font>
			</html:td>
			<td colspan="3" >
			    <html:textarea  id="priceNotice"  name="priceNotice"  style="width:400px;" cols="1" rows="3" ></html:textarea>
			</td>	
		</html:tr>
	</html:table>
	
	<script><!--
	
	function changefreightModel(modelValue){
		document.getElementById('freightModel').value=modelValue;
		if(modelValue=='1'){
		    document.getElementById('customerPrice').disabled=false;
		    document.getElementById('priceType').disabled=false;
		    document.getElementById('priceUnit').disabled=false;
		    document.getElementById('carrierPrice').disabled=false;
		    
		    document.getElementById('customerOnePrice').disabled=true;
		    document.getElementById('carrierOnePrice').disabled=true;
		}
		if(modelValue=='2'){
		    document.getElementById('customerPrice').disabled=true;
		    document.getElementById('priceType').disabled=true;
		    document.getElementById('priceUnit').disabled=true;
		    document.getElementById('carrierPrice').disabled=true;
		     
		    document.getElementById('customerOnePrice').disabled=false;
		    document.getElementById('carrierOnePrice').disabled=false;
		}
	}
	
	function submitCheck(){
		var enoughStock = "<%=enoughStock%>";
		var enoughtMoney = "<%=enoughtMoney%>";
		var moneyTips = "<%=moneyTips%>";
		var stockTips="<%=stockTips%>";
		var stockResult=true,moneyResult=true,applyResult=true;
		
	
		if(enoughtMoney=='false'){
			confirmTip(moneyTips,function(){
				if(enoughStock=='false'){
				    confirmTip(stockTips,
					    function(){
					       customFreight();},
					    function(){
					 
					});
				}else{
					customFreight(); 
				}
			},function(){});
			
		/*	moneyResult=confirm(moneyTips);
			if(moneyResult==false){
				return;
			}*/
			return;
		}
		if(enoughStock=='false'){
			confirmTip(stockTips,function(){customFreight();},function(){});
			
		
		/*	stockResult=confirm(stockTips);
			if(stockResult==false){
				return;
			}*/
			return;
		}
		customFreight();
	}
	
	function customFreight(){
		var customPrice=document.getElementById("selfFetchOn").checked;
		if(customPrice){		    
		    var freightModel=document.getElementById('freightModel').value;
			if(freightModel==null||freightModel==""){
			    //alert("计费模式不能为空");
			    alertTip("计费模式不能为空");
			    return ;
			}
		    var reg = /(^$)|(^\d+(\.\d{0,3})?$)/;
		    if(freightModel=='1'){
			    var priceType=document.getElementById('priceType').value;
				if(priceType==null||priceType==""){
				  //  alert("计价方式不能为空");
				  alertTip("计价方式不能为空");
				    return ;
				}
				var priceUnit=document.getElementById('priceUnit').value;
				if(priceUnit==null||priceUnit==""){
				  //  alert("计价单位不能为空");
				   alertTip("计价单位不能为空");
				    return ;
				}
				var customerPrice=document.getElementById('customerPrice').value;
				if(customerPrice==null||customerPrice==""){
				 //   alert("客户运价 单价不能为空");
				 	 alertTip("客户运价 单价不能为空");
				    return ;
				}
				
			    if(!reg.test(customerPrice)){
				//	alert("请重新输入客户运价 单价，为整数或带3位小数的数");
					 alertTip("请重新输入客户运价 单价，为整数或带3位小数的数");
					document.getElementById("customerPrice").style.color="red";
					return false;
				}
				
				
				var carrierPrice=document.getElementById('carrierPrice').value;
				if(carrierPrice==null||carrierPrice==""){
				    alertTip("承运商运价 单价不能为空");
				    return ;
				}
				
			    if(!reg.test(carrierPrice)){
					alertTip("请重新输入承运商运价 单价，为整数或带3位小数的数");
					document.getElementById("carrierPrice").style.color="red";
					return false;
				}
				
		    }
		    if(freightModel=='2'){
		        var customerOnePrice=document.getElementById('customerOnePrice').value;
				if(customerOnePrice==null||customerOnePrice==""){
				    //alert("客户运价 总价不能为空");
				    alertTip("客户运价 总价不能为空");
				    return ;
				}
				 if(!reg.test(customerOnePrice)){
					//alert("请重新输入客户运价 总价，为整数或带3位小数的数");
					document.getElementById("customerOnePrice").style.color="red";
					alertTip("请重新输入客户运价 总价，为整数或带3位小数的数");
					return false;
				}
				
				var carrierOnePrice=document.getElementById('carrierOnePrice').value;
				if(carrierOnePrice==null||carrierOnePrice==""){
				    alertTip("承运商运价 总价不能为空");
				    return ;
				}
				 if(!reg.test(carrierOnePrice)){
					alertTip("请重新输入承运商运价 总价，为整数或带3位小数的数");
					document.getElementById("carrierOnePrice").style.color="red";
					return false;
				}
		    }
			var priceNotice=$('#priceNotice').val();
			if(priceNotice==null||priceNotice==""||priceNotice.length==0){
			   // alert("备注不能为空");
			   alertTip("备注不能为空");
			    return ;
			}
		    
		}
		
		validateAsign();
	}
	
	--></script>
	
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:void(0);"  onclick="javascript:submitCheck();"/>
				<btn:return href="contoller.do?operation=listTransfer"/>
			</html:td>
		</html:tr>
	</html:table>
	
</html:form>

