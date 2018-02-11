<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.logistic.transfer.TransferBean,com.zzy.htms.logistic.transferdetail.TransferDetailBean,com.zzy.htms.logistic.transfer.TransferDetailUtils,java.math.BigDecimal,com.mobilecn.utils.random.IntRandom"%>
<%@page import="com.zzy.htms.dictionary.transprice.TransPriceBean"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
Map<String,Map<String,Map<String, List<TransferBean>>>> transfersMap=(Map<String,Map<String,Map<String, List<TransferBean>>>>)request.getAttribute("transfersMap");
transfersMap=transfersMap==null?new HashMap<String,Map<String,Map<String, List<TransferBean>>>>():transfersMap;

Map<String,List<TransferDetailBean>> transferDetailMap =(Map<String,List<TransferDetailBean>>)request.getAttribute("transferDetailMap");
transferDetailMap=transferDetailMap==null?new HashMap<String,List<TransferDetailBean>>():transferDetailMap;

Map<String,List<TransPriceBean>> transpriceMap =(Map<String,List<TransPriceBean>>)request.getAttribute("transpriceMap");
transpriceMap=transpriceMap==null?new HashMap<String,List<TransPriceBean>>():transpriceMap;

%>
<head><base href="<%=basePath%>">
<script type="text/javascript"> 	

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

</script>
</head>
<com:loader  js="js/common/common.js,resources/jquery/jquery.js"/>
<com:loader css="css/common/table-list.css"  myWin="true"/>
<html:form id="transferMergeForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader   validator="true"   />
	<html:hidden id="operation" name="operation" value="doMergeTransfer"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="modifyTime" name="modifyTime" value="<%=tools.tool.getDateTime() %>"/>

	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='申请单拼车' name="title"/>
	</jsp:include>
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<td>申请列表</td>	
		</tr>
	</table>
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<td>送货地址</td>	
			<td width="150px">客户名称</td>	
			<td width="60px">联系人</td>	
			<td width="90px">电话</td>				
			<td width="70px">订单号</td>		
			<td width="40px">行号</td>
			<td width="40px">工厂</td>
			<td width="120px">物料</td>
			<td width="50px">数量</td>
			<td width="40px">包数</td>
		
			<td width="80px">运单号</td>	
		</tr>
		
		<%
		
		List<TransferDetailBean> detailList =null;
		String sportId=null;
		TransferDetailBean detailBean = null;
		
		List<TransferBean> transportLists =null;
		Set transportSet=null,factorySet=null,materialSet=null,orderSet=null,applySet=null;
		Iterator transportIt=null,factoryIt=null,materialIt=null,orderIt=null,applyIt=null;
		int transportIndex=0,factoryIndex=0,materialIndex=0,orderIndex=0,applyIndex=0;
		int transportSize=0,factorySize=0,materialSize=0,orderSize=0,applySize=0;
		Map<String,Map<String,Map<String,Map<String, List<TransferBean>>>>> factoryMap = null;
		Map<String,Map<String,Map<String, List<TransferBean>>>> materialMap=null;
		Map<String,Map<String, List<TransferBean>>> orderMap=null;
		Map<String, List<TransferBean>> applyMap=null;
		int transStatus=0,isDefault=0;
		BigDecimal  tonNum=new BigDecimal("0.00"),packNum=new BigDecimal("0.00");
		String applyTonNum=null,applyPackNum=null;
	
		TransferBean transferBean=null;
		String transportId = null,areaId=null,factoryId=null,materialId=null,orderId=null,applyCode=null;
		//System.out.println("---------------------------------->transfersMap Size:"+(transfersMap==null?0:transfersMap.size()));
		transportSet=transfersMap.keySet();
		transportIt=transportSet.iterator();
		while(transportIt.hasNext()){
			transportId = (String)transportIt.next();
			orderMap=transfersMap.get(transportId);
					//System.out.println("---------------------------------->orderMap Size:"+(orderMap==null?0:orderMap.size()));
					if(orderMap==null||orderMap.isEmpty()){
						continue;
					}
					
					transportIndex=0;
					transportSize=TransferDetailUtils.getMaterialSize(orderMap,transferDetailMap);
					//System.out.println("---------------------------------->materialSize:"+materialSize);
					
					orderSet=orderMap.keySet();
					orderIt=orderSet.iterator();
					while(orderIt.hasNext()){
						orderId = (String)orderIt.next();
						applyMap=orderMap.get(orderId);
						//System.out.println("---------------------------------->applyMap Size:"+(applyMap==null?0:applyMap.size()));
						if(applyMap==null||applyMap.isEmpty()){
							continue;
						}
						
						
						orderIndex=0;
						orderSize=TransferDetailUtils.getOrderSize(applyMap,transferDetailMap);
						//System.out.println("---------------------------------->orderSize:"+orderSize);
					
						applySet=applyMap.keySet();
						applyIt=applySet.iterator();
						while(applyIt.hasNext()){
							applyCode = (String)applyIt.next();
							transportLists=applyMap.get(applyCode);
							//System.out.println("---------------------------------->transportLists Size:"+(transportLists==null?0:transportLists.size()));
							if(transportLists==null||transportLists.isEmpty()){
								continue;
							}
							for(int i=0,isize=transportLists.size();i<isize;i++){
								transferBean = transportLists.get(i);
								transStatus=0;//transferBean.getTransStatus();
								//isDefault=transferBean.getIsDefault();
								applyTonNum =transferBean.getApplyTonNum();
								applyTonNum=applyTonNum==null||"".equals(applyTonNum.trim())?"0.00":applyTonNum;
								applyPackNum =transferBean.getApplyPackNum();
								applyPackNum=applyPackNum==null||"".equals(applyPackNum.trim())?"0.00":applyPackNum;
								tonNum=tonNum.add(new BigDecimal(applyTonNum));
								packNum=packNum.add(new BigDecimal(applyPackNum));
								request.setAttribute("transferBean",transferBean);
								
								sportId=transferBean.getTransId()+"";
								detailList=transferDetailMap.get(sportId);
								if(detailList!=null){
									for(int n=0,nsize=detailList.size();n<nsize;n++){
										detailBean = detailList.get(n);
								%>
									
									<tr>
										<%if(transportIndex==0){ transportIndex++;%>	
										<td style="text-align:left;" rowspan="<%=transportSize %>"><%=transferBean.getAreaName()+transferBean.getCaddrDetail() %></td>
										<% }%>	
										
										
									    <%if(orderIndex==0){ orderIndex++;%>
										
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<%=transferBean.getCustomerName() %>
										</td>
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<%=transferBean.getCaddrContactor() %>
										</td>
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<%=transferBean.getCaddrTelephone() %>
										</td>
									
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											
											<%=transferBean.getCorderCode() %>
										</td>
										<% }%>	
											<td width="80px" style="height:28px;"><%=detailBean.getItemCode() %></td>
												<td width="80px" ><%=detailBean.getFactoryName() %></td>
												<%-- <td width="80px"><%=detailBean.getProductName() %></td>--%>	
												<td><%=detailBean.getCodetailCertificateDesc() %></td>
												<td width="60px" style="text-align:right;"><%=detailBean.getApplyTonNum() %></td>
												<td width="60px" style="text-align:right;"><%=detailBean.getApplyPackNum() %></td>
										      
										<%if(n==0){ %>	
											
										<html:hidden  id="transferId"  name="transferId" value="$[transferBean.transId]"/>											
										<td style="text-align:center;height:35px;" rowspan="<%=n==0?nsize:1 %>">
											<%=transferBean.getTransferCode() %>
											
										</td>
										<% }%>	
									
												
									</tr>
								<%
								
											}%>
									<html:hidden  id="shipId"  name="shipId" value="<%=String.valueOf(transferBean.getShipId()) %>"/>
											<%
										}
							}//for transportLists
						}//while applyMap
					}//while orderMap
				//}//while materialMap
			//}//while factoryMap
		}//while transfersMap
		/*
		tools.tool.clear(transportLists);		
		tools.tool.clear(applyMap);
		tools.tool.clear(orderMap);
		tools.tool.clear(transfersMap);*/
	%>
	<tr>
										
		<td style="text-align:center;height:35px;font-weight:700;" colspan="8">提货数量合计</td>
		<td style="text-align:right;font-weight:700;"><html:text id="sendTonNum" name="sendTonNum" value="<%=tonNum%>" style="width:100%;border:0px;font-weight:700;text-align:right;"/></td>
		<td style="text-align:right;font-weight:700;"><html:text id="sendPackNum" name="sendPackNum" value="<%=packNum%>" style="width:100%;border:0px;font-weight:700;text-align:right;"/></td>
		<td ></td>
	</tr>
	</table>
	
	<br>
	
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<td>运费列表</td>	
		</tr>
	</table>
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" height="35px" >
			<td  width="160px" rowspan="2">送货地址</td>	
			<td width="120px"  rowspan="2">客户名称</td>	
			<td width="90px"  rowspan="2">计价方式</td>				
			<td width="70px"  rowspan="2">计价单位</td>		
			<td width="60px"  colspan="2">客户运价</td>	
			<td width="60px"  colspan="2">承运商运价</td>	
			<td width="40px"  rowspan="2">行号</td>
			<td width="40px"  rowspan="2">工厂</td>
			<td width="50px"  rowspan="2">数量</td>
			<td width="40px"  rowspan="2">包数</td>
		</tr>
		<tr  class="dgHeaderStyle"  height="35px"  >
			<td width="60px">单价</td>	
			<td width="60px">一口价</td>	
			<td width="60px">单价</td>	
			<td width="60px">一口价</td>	
		</tr>
	
		<%
		
		
	    /* detailList =null;
		 sportId=null;
		 detailBean = null;
		
		 transportLists =null;
		 transportSet=null;factorySet=null;materialSet=null;orderSet=null;applySet=null;
		 transportIt=null;factoryIt=null;materialIt=null;orderIt=null;applyIt=null;
		 transportIndex=0;factoryIndex=0;materialIndex=0;orderIndex=0;applyIndex=0;
		 transportSize=0;factorySize=0;materialSize=0;orderSize=0;applySize=0;
		 factoryMap = null;
		 materialMap=null;
		 orderMap=null;
		 applyMap=null;
		 transStatus=0;isDefault=0;
		 tonNum=new BigDecimal("0.00");packNum=new BigDecimal("0.00");
		 applyTonNum=null;applyPackNum=null;
	
		 transferBean=null;
		 transportId = null;areaId=null;factoryId=null;materialId=null;orderId=null;applyCode=null;*/
		//System.out.println("---------------------------------->transfersMap Size:"+(transfersMap==null?0:transfersMap.size()));
		 tonNum=new BigDecimal("0.00");packNum=new BigDecimal("0.00");
		transportSet=transfersMap.keySet();
		transportIt=transportSet.iterator();
		List<TransPriceBean> transPriceList =null;
		TransPriceBean transPriceBean=null;
		while(transportIt.hasNext()){
			transportId = (String)transportIt.next();
			orderMap=transfersMap.get(transportId);
					//System.out.println("---------------------------------->orderMap Size:"+(orderMap==null?0:orderMap.size()));
					if(orderMap==null||orderMap.isEmpty()){
						continue;
					}
					
					transportIndex=0;
					transportSize=TransferDetailUtils.getMaterialSize(orderMap,transferDetailMap);
					
					orderSet=orderMap.keySet();
					orderIt=orderSet.iterator();
					while(orderIt.hasNext()){
						orderId = (String)orderIt.next();
						applyMap=orderMap.get(orderId);
						if(applyMap==null||applyMap.isEmpty()){
							continue;
						}
						
						
						orderIndex=0;
						orderSize=TransferDetailUtils.getOrderSize(applyMap,transferDetailMap);
					
						applySet=applyMap.keySet();
						applyIt=applySet.iterator();
						while(applyIt.hasNext()){
							applyCode = (String)applyIt.next();
							transportLists=applyMap.get(applyCode);
							//System.out.println("--------------------------------transportLists Size:"+(transportLists==null?0:transportLists.size()));
							if(transportLists==null||transportLists.isEmpty()){
								continue;
							}
							for(int i=0,isize=transportLists.size();i<isize;i++){
								transferBean = transportLists.get(i);
								transStatus=0;
								applyTonNum =transferBean.getApplyTonNum();
								applyTonNum=applyTonNum==null||"".equals(applyTonNum.trim())?"0.00":applyTonNum;
								applyPackNum =transferBean.getApplyPackNum();
								applyPackNum=applyPackNum==null||"".equals(applyPackNum.trim())?"0.00":applyPackNum;
								tonNum=tonNum.add(new BigDecimal(applyTonNum));
								packNum=packNum.add(new BigDecimal(applyPackNum));
								request.setAttribute("transferBean",transferBean);
								
								sportId=transferBean.getTransId()+"";
							
								transPriceList=(List<TransPriceBean>) transpriceMap.get(sportId);
								transPriceList=transPriceList==null?new ArrayList<TransPriceBean>():transPriceList;
								
								
								if(transPriceList!=null&&transPriceList.size()>0&&transPriceList.get(0)!=null){
								//  System.out.println("--------------------------------transportLists 12345 Size: "+ transPriceList.get(0));
								   transPriceBean = transPriceList.get(0);
								}else{
								//System.out.println("--------------------------------transportLists 323433 Size:"+(transportLists==null?0:transportLists.size()));
							
								   transPriceBean = new TransPriceBean(); 
								}		
														
								detailList=transferDetailMap.get(sportId);
								if(detailList!=null){
									for(int n=0,nsize=detailList.size();n<nsize;n++){
										detailBean = detailList.get(n);
								%>
									
									<tr>
										<%if(transportIndex==0){ transportIndex++;%>	
										<td style="text-align:left;" rowspan="<%=transportSize %>"><%=transferBean.getAreaName()+transferBean.getCaddrDetail() %></td>
										<% }%>	
										
										
									    <%if(orderIndex==0){ orderIndex++;%>
										
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<%=transferBean.getCustomerName()==null?"":transferBean.getCustomerName() %>
										</td>
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<%=transPriceBean.getTypeName()==null?"":transPriceBean.getTypeName() %>
										</td>
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<%=transPriceBean.getDicName()==null?"":transPriceBean.getDicName() %>
										</td>
									
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											
											<%=transPriceBean.getCustomerPrice()==null?"":transPriceBean.getCustomerPrice() %>
										</td>
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<%=transPriceBean.getCustomerOnePrice()==null?"":transPriceBean.getCustomerOnePrice() %>
										</td>
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											
											<%=transPriceBean.getCarrierPrice()==null?"":transPriceBean.getCarrierPrice() %>
										</td>
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<%=transPriceBean.getCarrierOnePrice()==null?"":transPriceBean.getCarrierOnePrice() %>
										</td>
										<% }%>	
											<td width="80px" style="height:28px;"><%=detailBean.getItemCode() %></td>
												<td width="80px" ><%=detailBean.getFactoryName() %></td>
												<td width="60px" style="text-align:right;"><%=detailBean.getApplyTonNum() %></td>
												<td width="60px" style="text-align:right;"><%=detailBean.getApplyPackNum() %></td>
										    
										<%if(n==0){ %>	
										
										<% }%>	
									
												
									</tr>
								<%
								
											}%>
								
											<%
										}
							}//for transportLists
						}//while applyMap
					}//while orderMap
				//}//while materialMap
			//}//while factoryMap
		}//while transfersMap
		
		tools.tool.clear(transportLists);		
		tools.tool.clear(applyMap);
		tools.tool.clear(orderMap);
		tools.tool.clear(transfersMap);
	%>
	<tr>
										
		<td style="text-align:center;height:35px;font-weight:700;" colspan="10">提货数量合计</td>
		<td style="text-align:right;font-weight:700;"><html:text id="sendTonNum" name="sendTonNum" value="<%=tonNum%>" style="width:100%;border:0px;font-weight:700;text-align:right;"/></td>
		<td style="text-align:right;font-weight:700;"><html:text id="sendPackNum" name="sendPackNum" value="<%=packNum%>" style="width:100%;border:0px;font-weight:700;text-align:right;"/></td>
	</tr>
	</table>
		<br>
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<td>运价信息</td>	
		</tr>
	</table>
	
	
   <html:table id="1647" styleClass="edit-talbe" list="routeViewBean" bean="routeViewBean">
		<html:tr   >
            <html:td    colspan="2"   styleClass="edit-talbe-label" >
				计费模式<font color='red'>*</font>
			</html:td>
			<html:td  style="text-align:left;vertical-align:middle;font-size:12px" colspan="3">
				<html:hidden id="freightModel" name="freightModel"  />
				<html:radio id="singleModel" name="selFreightModel" label="按单价计算" onclick="changefreightModel('1') " />
				<html:radio id="allModel"  name="selFreightModel" label="按一口价计算" onclick="changefreightModel('2')"/>
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
			         一口价
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
			        一口价
			</html:td>
			<td  >
			    <html:text  id="carrierOnePrice"  name="carrierOnePrice"   disabled="true"/>
			</td>	
		</html:tr>
		<html:tr>
			 <html:td   colspan="2" styleClass="edit-talbe-label" >
			        备注<font color='red'>*</font>
			</html:td>
			<td colspan="3" >
			    <html:textarea  id="priceNotice"  name="priceNotice"  style="width:400px;" cols="1" rows="3" ></html:textarea>
			</td>	
		</html:tr>
	</html:table>
	<script>
	function validatePriceForm(){
	    var freightModel=document.getElementById('freightModel').value;
		if(freightModel==null||freightModel==""){
		    alertTip("计费模式不能为空");
		    return ;
		}
	    var reg = /(^$)|(^\d+(\.\d{0,3})?$)/;
	    if(freightModel=='1'){
		    var priceType=document.getElementById('priceType').value;
			if(priceType==null||priceType==""){
			    alertTip("计价方式不能为空");
			    return ;
			}
			var priceUnit=document.getElementById('priceUnit').value;
			if(priceUnit==null||priceUnit==""){
			    alertTip("计价单位不能为空");
			    return ;
			}
			var customerPrice=document.getElementById('customerPrice').value;
			if(customerPrice==null||customerPrice==""){
			    alertTip("客户运价 单价不能为空");
			    return ;
			}
			
		    if(!reg.test(customerPrice)){
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
			    alertTip("客户运价 一口价不能为空");
			    return ;
			}
			 if(!reg.test(customerOnePrice)){
				alertTip("请重新输入客户运价 一口价，为整数或带3位小数的数");
				document.getElementById("customerOnePrice").style.color="red";
				return false;
			}
			var carrierOnePrice=document.getElementById('carrierOnePrice').value;
			if(carrierOnePrice==null||carrierOnePrice==""){
			    alertTip("承运商运价 一口价不能为空");
			    return ;
			}
			 if(!reg.test(carrierOnePrice)){
				alertTip("请重新输入承运商运价 一口价，为整数或带3位小数的数");
				document.getElementById("carrierOnePrice").style.color="red";
				return false;
			}
	    }
		var priceNotice=$('#priceNotice').val();
		if(priceNotice==null||priceNotice==""||priceNotice.length==0){
		    alertTip("备注不能为空");
		    return ;
		}
		document.getElementById("transferMergeForm").submit();
	}
	</script>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:void(0);" onclick="javascript: validatePriceForm();"/>
				<btn:return href="contoller.do?operation=listTransferPrice"/>
			</html:td>
		</html:tr>
	</html:table>
	<com:validator formId="transferMergeForm" showNormal="false" submitValidate="true" >
		<com:vElement id="driverMobile"  types="mobile" event="onblur">
			<com:init size="15" maxlength="11"></com:init>
		</com:vElement>
	</com:validator>
</html:form>
