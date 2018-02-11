<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean,com.mobilecn.utils.random.IntRandom" %>
<%@page import="com.zzy.htms.user.HtmsUserBean"%>
<%@page import="com.zzy.htms.logistic.transferdetail.TransferDetailBean" %>
<%@page import="com.zzy.htms.dictionary.transprice.TransPriceBean"%>
<%@page import="com.zzy.htms.services.business.FreightBean"  %>
<%@page import="com.zzy.htms.sales.customerprice.CustomerPriceBean"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 

List<CustomerAddrBean> addrLists = (List<CustomerAddrBean>)request.getAttribute("addrLists");
String caddrId = request.getParameter("caddrId");

List<TransferDetailBean> transferDetailList =(List<TransferDetailBean>) request.getAttribute("detailList");
transferDetailList=transferDetailList==null?new ArrayList<TransferDetailBean>():transferDetailList;

Map<String,TransPriceBean> transpriceMap =(Map<String,TransPriceBean>)request.getAttribute("transpriceMap");
transpriceMap=transpriceMap==null?new HashMap<String,TransPriceBean>():transpriceMap;
 
 
 Map<String,FreightBean> freightBeanMap =(Map<String,FreightBean>)request.getAttribute("freightBeanMap");
freightBeanMap=freightBeanMap==null?new HashMap<String,FreightBean>():freightBeanMap;

Map<String,CustomerPriceBean> customerPriceMap=(Map<String,CustomerPriceBean>) request.getAttribute("customerPriceMap");
 customerPriceMap=customerPriceMap==null?new HashMap<String,CustomerPriceBean>():customerPriceMap;
 
%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/split/split.js,js/MathCalculator.js"/>
<com:loader css="css/common/table-list.css" switchbox="true"/>
	
	
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='查看调拨单信息' name="title"/>
	</jsp:include>
	
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				订单信息
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
			</td>
			<td class="edit-talbe-label" >
				是否加急
			</td>
			<td width="350px">
				<com:switchbox boxId="isUrgent" varValue="$[tranferViewBean.isUrgent]" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName=""  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" isSave="false" disabled="true" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.customerid#}" ></html:label>
			</td>
			<td>
				<html:value  value="$[tranferViewBean.customerName]" ></html:value>
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
				<html:value  value="$[tranferViewBean.shipCode]" />
			</td>
			
			<td class="edit-talbe-label">
				业务员
			</td>
			<td >
				<html:value  value="$[tranferViewBean.saleMan]" />
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
				<html:value  value="$[tranferViewBean.shipApplyTime]" />
			</td>
			<td class="edit-talbe-label">
				审批时间
			</td>
			<td>
			    <html:value  value="$[tranferViewBean.approveAgreeTime]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				备注
			</td>
			<td colspan="3">
				<html:value value="$[tranferViewBean.shipNotice]" />
			</td>
		</tr>
	</table>
	<br>
	<table id="orderDetailInfo" class="edit-talbe" style="display:block">
		<tr class="trCell">
			<td  colSpan="4" >
				调拨单信息
			</td>
		</tr>
		<tr class="trCell">
		    <td class="edit-talbe-label">
				状态
			</td>
			<td width="350px">
				<logic:if condition="$[tranferViewBean.transStatus]==0">
					未分配
				</logic:if>
				<logic:if condition="$[tranferViewBean.transStatus]==1">
					已分配
				</logic:if>
				<logic:if condition="$[tranferViewBean.transStatus]==2">
					已排车
				</logic:if>
			</td>
			<td class="edit-talbe-label">
				分配时间
			</td>
			<td width="350px">
                 <html:value  value="${transportBean.createTime}" />
			</td>
			
		</tr>
		<logic:if condition="$[tranferViewBean.transStatus]==1||$[tranferViewBean.transStatus]==2">
					<tr class="trCell">
				
				<td class="edit-talbe-label"  >
					<html:label  label="{$jsp.htms.logistic.carrier.carriername#}" ></html:label>
				</td>
				<td   width="350px">
					<html:value  value="${transportBean.carrierName}"   />
				</td>
				<td class="edit-talbe-label" >
					<html:label  label="{$jsp.htms.sales.ship.shipnotice#}" ></html:label>
				</td>
				<td   rowSpan="1" width="350px">
					<html:value  value="${transportBean.transportNotice}" />
				</td>
			</tr>
		
		</logic:if>
		<logic:if condition="$[tranferViewBean.transStatus]==2">
			<tr class="trCell">
				
				<td class="edit-talbe-label"  >
					排车时间
				</td>
				<td   colspan="3">
					<html:value  value="${sendBean.createTime}"   />
				</td>
				
			</tr>
			
		</logic:if>
		
		
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
		<tr class="trCell">
			<td class="edit-talbe-label">
				备注
			</td>
			<td colspan="3">
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
	
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				分拆细项信息
			</html:td>
		</html:tr>
	</html:table>
	<html:table list="detailBeanList" bean="detailBean" styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" isHead="true" >
		<html:tr headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
			<html:td label="行号" property="itemCode" style="width:80px;" width="80px"/>	
			<html:td label="工厂" property="factoryName"   width="80px"/>
			<html:td label="产品" property="productName"   width="80px"/>		
			<html:td label="物料"  width="220px" >
                      <p title='<html:value value="$[detailBean.codetailCertificateDesc]" />'  >
	                       <html:value value="$[detailBean.codetailCertificateDesc]" />
	                  </p>     
			</html:td>
			<html:td label="SAP运费<br>(元/吨)" property="freight"  width="70px"/>
			<html:td label="单价" property="unitPrice"  width="70px"/>
			
			<html:hidden id="freight" value="$[freight]" />
			<html:hidden id="unitPrice" value="$[unitPrice]" />
			       
			<html:td  id="totlePostage" label="SAP运费"  property="transportTotalPrice" width="70px" />		
				
			<html:td label="数量" width="80px" style="text-align:right;">
				<html:text  id="appliableTon$[detailBean.itemCode]"  name="appliableTon" value="$[detailBean.applyTonNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>	
			<html:td label="包数" width="80px" style="text-align:right;">
				<html:text  id="appliablePack$[detailBean.itemCode]"  name="appliablePack" value="$[detailBean.applyPackNum]" size="12" 
				readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>
			<html:td label="备注">
				<html:value value="$[detailBean.transDetailNotice]" />
			</html:td>
		</html:tr>
	</html:table>
    <html:table  styleClass="dgbackground" cellSpacing="0"  border="1"   style="width:100%; border-collapse: collapse;" align="center" >
		<html:tr headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
			<html:td  width="686px">合计</html:td>
			<html:td  width="80px" style="text-align:right;">
				<html:text  id="totalTon"  name="totalTon" value="$[tranferViewBean.applyTonNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>		
			<html:td  width="80px" style="text-align:right;">
				<html:text  id="totalPack"  name="totalPack" value="$[tranferViewBean.applyPackNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>
			<html:td>
			    &nbsp;
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
	        <td  width="50px" rowspan="2">行号</td>	    
	        <td width="50px"  rowspan="2">工厂</td>   
	        <td width="50px"  rowspan="2">产品</td>
	       <td width="60px"  rowspan="2">数量</td>
	        <td width="150px"  rowspan="2">收货区域</td>
	       	<td width="90px"  rowspan="2">申请时间</td>
	       	
	        <td width="65px"  rowspan="2">计价方式</td>				
			<td width="40px"  rowspan="2">计价单位</td>	
			 <td width="60px" colspan="2">计价区间</td>		
	        <td width="60px"  colspan="2">客户运价</td>	
			<td width="60px"  colspan="2">承运商运价</td>	
			<td width="60px"  rowspan="2">客户运费</td>	
		<!-- 	<td width="60px"  rowspan="2">承运商运费</td>	 -->
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
 
	
<logic:if condition="$[transpriceBean.freightModel]==1||$[transpriceBean.freightModel]==2">
	     <html:table styleClass="edit-talbe"  >
	         <html:tr styleClass="trCell">
			<html:td   colspan="5" >
				自定义运价及运费信息
			</html:td>
		</html:tr>
		     <html:tr   >
	            <html:td    colspan="2"   styleClass="edit-talbe-label" >
					计费模式
				</html:td>
				<html:td   colspan="3">
					<logic:if condition="$[transpriceBean.freightModel]==1">
					       按单价计算
					</logic:if>
					<logic:if condition="$[transpriceBean.freightModel]==2">
					      按总价计算
					</logic:if>
				</html:td>
			</html:tr>
			<html:tr   >
				<html:td styleClass="edit-talbe-label"    colspan="2" >
					<html:label  label="{$jsp.htms.dictionary.transprice.pricetype#}" ></html:label>
				</html:td>
				<html:td width="180px">
					<html:value value="$[transpriceBean.typeName]"  />
				</html:td>
			    <html:td styleClass="edit-talbe-label">
					<html:label  label="{$jsp.htms.dictionary.transprice.priceunit#}" ></html:label>
				</html:td>
				<html:td  >
						<html:value value="$[transpriceBean.dicName]"  />
				</html:td>			
			</html:tr>
			
			<html:tr  id="weightRows" >
			     <html:td  width="100px"  styleClass="edit-talbe-label" >
				       客户运价
				</html:td>
				 <html:td   width="130px"    styleClass="edit-talbe-label" >
				         单价
				</html:td>
				<td   width="130px"  >
				    <html:value value="$[transpriceBean.customerPrice]"  />
				</td>	
				 <html:td   width="130px"    styleClass="edit-talbe-label" >
				         总价
				</html:td>
				<td colspan="3"  width="130px"   >
				    <html:value value="$[transpriceBean.customerOnePrice]"  />
				</td>	
			</html:tr>
			
			<!-- <html:tr    id="priceRows"  >
			  <html:td    styleClass="edit-talbe-label" >
				        承运商运价
				</html:td>
				 <html:td    styleClass="edit-talbe-label" >
				         单价
				</html:td>
				<td  >
				    <html:value value="$[transpriceBean.carrierPrice]"  />
				</td>	
				 <html:td    styleClass="edit-talbe-label" >
				        总价
				</html:td>
				<td  >
				    <html:value value="$[transpriceBean.carrierOnePrice]"   />
				</td>	
			</html:tr>
			-->
			<html:tr>
				 <html:td   colspan="2" styleClass="edit-talbe-label" >
				        运价备注
				</html:td>
				<td colspan="3" >
				    <html:value value="$[transpriceBean.priceNotice]"  />
				</td>	
			</html:tr>
			<html:tr>
				 <html:td   colspan="2" styleClass="edit-talbe-label" >
				        客户运费
				</html:td>
				<td colspan="3" >
				    <%=freightBean.getTotalFreight()==null?"":freightBean.getTotalFreight() %>
				</td>	
				<!-- 
				<td colspan="1" class="edit-talbe-label">
                                        承运商运费
 				</td>	
				<td colspan="1" >
				   <%=freightBean.getTotalCarrierFreight()==null?"":freightBean.getTotalCarrierFreight() %>
				</td>	 -->
			</html:tr>
			
			
			
		</html:table>
</logic:if>



<logic:if condition="$[tranferViewBean.transStatus]==2">
    	<br>
		<table   class="edit-talbe" style="display:block" >
		     <tr class="trCell">
				<td  colSpan="4" rowSpan="1">
				        排车信息
				</td>
			</tr>
			<tr class="trCell">
				<td class="edit-talbe-label" id="LMIJAEIJIIFCOAMEEPCKBKNLCGOLJOPLGMMBFAMJGCIKNBFLOHPIJHCBGEMNOGIO" >
					<html:label  label="{$jsp.htms.logistic.driver.drivername#}" ></html:label>
				</td>
				<td  width="350px">
					<html:value  value="$[sendBean.driverName]"  />
				</td>
				<td class="edit-talbe-label" id="LMIJAEIJIIFCOAMEEPCKBKNLCGOLJOPLGMMBFAMJGCIKNBFLOHPIJHCBGEMNOGIO" >
					<html:label  label="{$jsp.htms.logistic.driver.driveridnum#}" ></html:label>
				</td>
				<td   width="350px">
					<html:value  value="$[sendBean.driverIdNum]"  />
				</td>
				
		</tr>
		<tr class="trCell">
			
			<td class="edit-talbe-label" id="MKHGNHEMBKLMAALGKKPPJIFEKAAJLHGEGNPOAAACABMAKIFHOAOLLCPLKJKNCOPC" >
				<html:label  label="{$jsp.htms.logistic.driver.drivermobile#}" ></html:label>
			</td>
			<td  >
				<html:value  value="$[sendBean.driverMobile]"  />
			</td>
			<td class="edit-talbe-label" id="HIOEPKJKKJCBMOHNMFENEKAPLLJKLHGFIBOMMELBLPEGBJKCONJEKEKBLJOLMFAH" >
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleno#}" ></html:label>
			</td>
			<td  id="NKKKCHCKLCELIIOMKKALHIFMAFPKNEFPLAPFLPGCOFGNPKFFGNAOFEBGJGGMCLCH" >
				<html:value  value="$[sendBean.vehicleNo]"  />
			</td>
		</tr>
		
		<tr class="trCell">
		    <td  class="edit-talbe-label" >
		                 状态
		    </td>
		    <td >
		        <logic:if condition="$[sendBean.sendStatus]==0">
					未派车
				</logic:if>
				<logic:if condition="$[sendBean.sendStatus]==1">
					已派车
				</logic:if>
		    
		    </td>
		    <td  class="edit-talbe-label" >
		                 派车时间
		    </td>
		    <td colspan="3">
		        <html:value value="$[sendBean.sendTime]" />
		    </td>
		    
		</tr>
		
		<tr>
		    <td class="edit-talbe-label" id="GKEMIGAIHLGFKBFFENOFAMCCHHEKCGIFKEEJKBJLGFECEBJFKMNKOJOCAEOGIPKA" >
				<html:label  label="{$jsp.htms.logistic.senddetail.transdetailnotice#}" ></html:label>
			</td>
			<td  id="JKLHGLCOAJEGOHAFMFEBMNBANGAKKOAGKFBOJKKMKPKCJGFGMIJAPOKLMFCGNFLO" colSpan="3" rowSpan="1">
				<html:value  value="$[sendBean.sendNotice]"  />
			</td>
		</tr>
	</table>
</logic:if>	
	
	
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listTransferMerge&curPage=$[curPage]"/>
			</html:td>
		</html:tr>
	</html:table>
