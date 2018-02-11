<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.logistic.transport.TransportBean,com.zzy.htms.logistic.transportdetail.TransportDetailBean,com.zzy.htms.logistic.transport.SportDetailUtils,java.math.BigDecimal,com.mobilecn.utils.random.IntRandom"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
Map<String,Map<String,Map<String, List<TransportBean>>>> transportsMap=(Map<String,Map<String,Map<String, List<TransportBean>>>>)request.getAttribute("transportsMap");
transportsMap=transportsMap==null?new HashMap<String,Map<String,Map<String, List<TransportBean>>>>():transportsMap;

Map<String,List<TransportDetailBean>> transportDetailMap =(Map<String,List<TransportDetailBean>>)request.getAttribute("transportDetailMap");
transportDetailMap=transportDetailMap==null?new HashMap<String,List<TransportDetailBean>>():transportDetailMap;
%>
<head><base href="<%=basePath%>">
<style type='text/css'>
@media print{.printhide{display:none}}
</style>
<script language=javascript>          
var printIt = function(){      
　　      //wb.execwb(6,6)   ;  
        window.print();//update by liuguocheng  
}    
</script> 
</head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"  myWin="true"/>
	<div class="printhide">
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.send.title.view") %>' name="title"/>
	</jsp:include>
	</div>
	<div id="div3">
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<td>提货运单列表</td>	
		</tr>
	</table>
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<td>送货地址</td>	
			<td width="100px">订单号</td>
			<td width="120px">调拨单号</td>	
			<td width="120px">运单号</td>
			<td width="80px">行号</td>
			<td width="80px">工厂</td>
			<td width="80px">产品</td>
			<td width="60px">数量</td>
			<td width="60px">包数</td>
		</tr>
		
		<%
		List<TransportDetailBean> detailList =null;
		String sportId=null;
		TransportDetailBean detailBean = null;
		
		List<TransportBean> transportLists =null;
		Set transportSet=null,factorySet=null,materialSet=null,orderSet=null,applySet=null;
		Iterator transportIt=null,factoryIt=null,materialIt=null,orderIt=null,applyIt=null;
		int transportIndex=0,factoryIndex=0,materialIndex=0,orderIndex=0,applyIndex=0;
		int transportSize=0,factorySize=0,materialSize=0,orderSize=0,applySize=0;
		//Map<String,Map<String,Map<String,Map<String, List<TransportBean>>>>> factoryMap = null;
		//Map<String,Map<String,Map<String, List<TransportBean>>>> materialMap=null;
		Map<String,Map<String, List<TransportBean>>> orderMap=null;
		Map<String, List<TransportBean>> applyMap=null;
		int transStatus=0,isDefault=0;
		BigDecimal  tonNum=new BigDecimal("0.00"),packNum=new BigDecimal("0.00");
		String applyTonNum=null,applyPackNum=null;
	
		TransportBean transportBean=null;
		String transportId = null,areaId=null,factoryId=null,materialId=null,orderId=null,applyCode=null;
		//System.out.println("---------------------------------->transportsMap Size:"+(transportsMap==null?0:transportsMap.size()));
		transportSet=transportsMap.keySet();
		transportIt=transportSet.iterator();
		while(transportIt.hasNext()){
			transportId = (String)transportIt.next();
			orderMap=transportsMap.get(transportId);
			//System.out.println("---------------------------------->orderMap Size:"+(orderMap==null?0:orderMap.size()));
			/*if(factoryMap==null||factoryMap.isEmpty()){
				continue;
			}
			
			transportIndex=0;
			transportSize=SportDetailUtils.getAreaSize(factoryMap);
			System.out.println("---------------------------------->transportSize:"+transportSize);
			
			factorySet=factoryMap.keySet();
			factoryIt=factorySet.iterator();
			while(factoryIt.hasNext()){
				factoryId = (String)factoryIt.next();
				materialMap=factoryMap.get(factoryId);
				System.out.println("---------------------------------->materialMap Size:"+(materialMap==null?0:materialMap.size()));
				if(materialMap==null||materialMap.isEmpty()){
					continue;
				}
			
				factoryIndex=0;
				factorySize=SportDetailUtils.getFatorySize(materialMap);
				System.out.println("---------------------------------->factorySize:"+factorySize);
			
				materialSet=materialMap.keySet();
				materialIt=materialSet.iterator();
				while(materialIt.hasNext()){
					materialId = (String)materialIt.next();
					orderMap=materialMap.get(materialId);
					**/
					//System.out.println("---------------------------------->orderMap Size:"+(orderMap==null?0:orderMap.size()));
					if(orderMap==null||orderMap.isEmpty()){
						continue;
					}
					
					transportIndex=0;
					transportSize=SportDetailUtils.getMaterialSize(orderMap,transportDetailMap);
					//System.out.println("---------------------------------->transportSize:"+transportSize);
					
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
						orderSize=SportDetailUtils.getOrderSize(applyMap,transportDetailMap);
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
								transportBean = transportLists.get(i);
								transStatus=0;//transportBean.getTransStatus();
								//isDefault=transportBean.getIsDefault();
								applyTonNum =transportBean.getApplyTonNum();
								applyTonNum=applyTonNum==null||"".equals(applyTonNum.trim())?"0.00":applyTonNum;
								applyPackNum =transportBean.getApplyPackNum();
								applyPackNum=applyPackNum==null||"".equals(applyPackNum.trim())?"0.00":applyPackNum;
								tonNum=tonNum.add(new BigDecimal(applyTonNum));
								packNum=packNum.add(new BigDecimal(applyPackNum));
								request.setAttribute("transportBean",transportBean);
								
								sportId=transportBean.getTransportId()+"";
								detailList=transportDetailMap.get(sportId);
								if(detailList!=null){
									for(int n=0,nsize=detailList.size();n<nsize;n++){
										detailBean = detailList.get(n);
								%>
									<tr>
										<%if(transportIndex==0){ transportIndex++;%>	
										<td style="text-align:left;" rowspan="<%=transportSize %>"><%=transportBean.getAreaName()+transportBean.getCaddrDetail() %></td>
										<% }%>	
										
										<%if(orderIndex==0){ orderIndex++;%>	
										<td style="text-align:center;" rowspan="<%=orderSize %>"><%=transportBean.getCorderCode() %></td>
										<% }%>	
										
										<%if(n==0){ %>	
										<td style="text-align:center;" rowspan="<%=n==0?nsize:1 %>"><%=transportBean.getTransferCode() %></td>
										<html:hidden  id="transferId"  name="transferId" value="$[transportBean.transId]"/>
											
													
										<td style="text-align:center;height:35px;" rowspan="<%=n==0?nsize:1 %>">
											<%=transportBean.getTransportCode() %>
											<html:hidden  id="transportId"  name="transportId" value="$[transportBean.transportId]"/>
										</td>
										<% }%>
										<td width="80px" style="height:28px;"><%=detailBean.getItemCode() %></td>
										<td width="80px" ><%=detailBean.getFactoryName() %></td>
										<td width="80px"><%=detailBean.getProductName() %></td>
										<td width="60px" style="text-align:right;"><%=detailBean.getApplyTonNum() %></td>
										<td width="60px" style="text-align:right;"><%=detailBean.getApplyPackNum() %></td>
										
									</tr>
								<%
				
									}
								}		
							}//for transportLists
						}//while applyMap
					}//while orderMap
				//}//while materialMap
			//}//while factoryMap
		}//while transportsMap
		
		tools.tool.clear(transportLists);		
		tools.tool.clear(applyMap);
		tools.tool.clear(orderMap);
		//tools.tool.clear(materialMap);
		//tools.tool.clear(factoryMap);
		tools.tool.clear(transportsMap);
	%>
	<tr>
										
		<td style="text-align:center;height:35px;font-weight:700;" colspan="7">提货数量合计</td>
		<td style="text-align:right;font-weight:700;"><html:text id="sendTonNum" name="sendTonNum" value="<%=tonNum%>" style="width:100%;border:0px;font-weight:700;text-align:right;"/></td>
		<td style="text-align:right;font-weight:700;"><html:text id="sendPackNum" name="sendPackNum" value="<%=packNum%>" style="width:100%;border:0px;font-weight:700;text-align:right;"/></td>
		
	</tr>
	</table>
	<logic:if notNull="sendBean">
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<td>排车信息</td>	
		</tr>
	</table>
	
	<table id="1679" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="HIOEPKJKKJCBMOHNMFENEKAPLLJKLHGFIBOMMELBLPEGBJKCONJEKEKBLJOLMFAH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleno#}" ></html:label>
			</td>
			<td  id="NKKKCHCKLCELIIOMKKALHIFMAFPKNEFPLAPFLPGCOFGNPKFFGNAOFEBGJGGMCLCH" colSpan="1" rowSpan="1">
				<html:value  value="$[sendBean.vehicleNo]"  />
			</td>
			<td class="edit-talbe-label" id="LMIJAEIJIIFCOAMEEPCKBKNLCGOLJOPLGMMBFAMJGCIKNBFLOHPIJHCBGEMNOGIO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivername#}" ></html:label>
			</td>
			<td  id="KFFAJKCAOLOOGJNPGKEFKAGEGKMFACEKECBCHKGGJPLPOCMPEIIIKFFEAKEALGHN" colSpan="1" rowSpan="1">
				<html:value  value="$[sendBean.driverName]"  />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="LMIJAEIJIIFCOAMEEPCKBKNLCGOLJOPLGMMBFAMJGCIKNBFLOHPIJHCBGEMNOGIO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driveridnum#}" ></html:label>
			</td>
			<td  id="KFFAJKCAOLOOGJNPGKEFKAGEGKMFACEKECBCHKGGJPLPOCMPEIIIKFFEAKEALGHN" colSpan="1" rowSpan="1">
				<html:value  value="$[sendBean.driverIdNum]"  />
			</td>
			<td class="edit-talbe-label" id="MKHGNHEMBKLMAALGKKPPJIFEKAAJLHGEGNPOAAACABMAKIFHOAOLLCPLKJKNCOPC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivermobile#}" ></html:label>
			</td>
			<td  id="LGILOLGLNOHBNJPAFEIPOACBGGINKFPKAJEECNCCCCKHIJIPGIPFLLPGLBKJJHIG" colSpan="1" rowSpan="1">
				<html:value  value="$[sendBean.driverMobile]"  />
			</td>
		</tr>
	</table>
	</logic:if>
	</div>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
			<div class="printhide">
				<btn:return href="contoller.do?operation=listSend"/>
				<btn:localprint onclick="printIt();"/>
			</div>	
			</html:td>
		</html:tr>
	</html:table>



