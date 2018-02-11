<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.logistic.transport.TransportBean,com.zzy.htms.logistic.transportdetail.TransportDetailBean,com.zzy.htms.logistic.transport.SportDetailUtils,java.math.BigDecimal,com.mobilecn.utils.random.IntRandom"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
Map<String,Map<String,Map<String, List<TransportBean>>>> transportsMap=(Map<String,Map<String,Map<String, List<TransportBean>>>>)request.getAttribute("transportsMap");
transportsMap=transportsMap==null?new HashMap<String,Map<String,Map<String, List<TransportBean>>>>():transportsMap;

Map<String,List<TransportDetailBean>> transportDetailMap =(Map<String,List<TransportDetailBean>>)request.getAttribute("transportDetailMap");
transportDetailMap=transportDetailMap==null?new HashMap<String,List<TransportDetailBean>>():transportDetailMap;

String driverCode= tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(10,99);
String sendCode= tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(10,99);
String vehicleCode= tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(10,99);
%>
<head><base href="<%=basePath%>">

</head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"  myWin="true"/>
<html:form id="transportForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader   validator="true"/>
	<html:hidden id="operation" name="operation" value="doAssignTransportToLogistics"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="modifyTime" name="modifyTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="driverCode" name="driverCode" value="<%=driverCode %>"/>
	<html:hidden id="vehicleCode" name="vehicleCode" value="<%=vehicleCode %>"/>
	<html:hidden id="sendCode" name="sendCode" value="<%=sendCode %>"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='运单排车' name="title"/>
	</jsp:include>
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<td>提货运单列表</td>	
		</tr>
	</table>
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<td>送货地址</td>	
			<%--<td width="80px">提货工厂</td>
			<td width="120px">物料号</td> --%>
			<td width="150px">客户</td>	
			<td width="60px">联系人</td>	
			<td width="90px">电话</td>				
			<td width="70px">订单号</td>		
			<td width="40px">行号</td>
			<td width="40px">工厂</td>
			<%-- <td width="40px">产品</td> --%>
			<td width="120px">物料</td>
			<td width="50px">数量</td>
			<td width="40px">包数</td>
			<td width="130px">装运点</td>
			<%--<td width="80px">调拨单号</td>	 --%>
			<td width="80px">运单号</td>	
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
		Map<String,Map<String,Map<String,Map<String, List<TransportBean>>>>> factoryMap = null;
		Map<String,Map<String,Map<String, List<TransportBean>>>> materialMap=null;
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
			/**System.out.println("---------------------------------->factoryMap Size:"+(factoryMap==null?0:factoryMap.size()));
			if(factoryMap==null||factoryMap.isEmpty()){
				continue;
			}
			
			transportIndex=0;
			transportSize=TransportUtils.getAreaSize(factoryMap);
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
				factorySize=TransportUtils.getFatorySize(materialMap);
				System.out.println("---------------------------------->factorySize:"+factorySize);
			
				materialSet=materialMap.keySet();
				materialIt=materialSet.iterator();
				while(materialIt.hasNext()){
					materialId = (String)materialIt.next();
					orderMap=materialMap.get(materialId);**/
					//System.out.println("---------------------------------->orderMap Size:"+(orderMap==null?0:orderMap.size()));
					if(orderMap==null||orderMap.isEmpty()){
						continue;
					}
					
					transportIndex=0;
					transportSize=SportDetailUtils.getMaterialSize(orderMap,transportDetailMap);
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
										<td style="text-align:left;" rowspan="<%=transportSize %>"><%=transportBean.getAreaName() %></td>
										<% }%>	
										
										
										<%if(orderIndex==0){ orderIndex++;%>
										
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<%=transportBean.getCustomerName() %>
										</td>
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<%=transportBean.getCaddrContactor() %>
										</td>
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<%=transportBean.getCaddrTelephone() %>
										</td>
									
										<td style="text-align:center;" rowspan="<%=orderSize %>">
											<html:hidden id="sapTransCode" name="sapTransCode" value="$[transportBean.sapTransCode]" />
											<%=transportBean.getCorderCode() %>
										</td>
										<% }%>	
											<td width="80px" style="height:28px;"><%=detailBean.getItemCode() %></td>
												<td width="80px" ><%=detailBean.getFactoryName() %></td>
												<%-- <td width="80px"><%=detailBean.getProductName() %></td>--%>	
												<td><%=detailBean.getCodetailCertificateDesc() %></td>
												<td width="60px" style="text-align:right;"><%=detailBean.getApplyTonNum() %></td>
												<td width="60px" style="text-align:right;"><%=detailBean.getApplyPackNum() %></td>
										        <td width="60px" style="text-align:right;"><%=(detailBean.getShipPointDesc()==null?"":detailBean.getShipPointDesc()) %></td>
										<%if(n==0){ %>	
										
										
										<%-- 
										
										<td style="text-align:center;" rowspan="<%=n==0?nsize:1 %>"><%=transportBean.getTransferCode() %></td>
										
										--%>		
										<html:hidden  id="transferId"  name="transferId" value="$[transportBean.transId]"/>											
										<td style="text-align:center;height:35px;" rowspan="<%=n==0?nsize:1 %>">
											<%=transportBean.getTransportCode() %>
											<html:hidden  id="transportId"  name="transportId" value="$[transportBean.transportId]"/>
										</td>
										<% }%>	
									
												
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
										
		<td style="text-align:center;height:35px;font-weight:700;" colspan="8">提货数量合计</td>
		<td style="text-align:right;font-weight:700;"><html:text id="sendTonNum" name="sendTonNum" value="<%=tonNum%>" style="width:100%;border:0px;font-weight:700;text-align:right;"/></td>
		<td style="text-align:right;font-weight:700;"><html:text id="sendPackNum" name="sendPackNum" value="<%=packNum%>" style="width:100%;border:0px;font-weight:700;text-align:right;"/></td>
		<td colspan="2"></td>
	</tr>
	</table>
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<td>排车信息</td>	
		</tr>
	</table>
	<script>
	function setDriver(driverId,driverName,driverIdNum,driverMobile){
		document.getElementById("selectDriverId").value=driverId;
		document.getElementById("driverName").value=driverName;
		document.getElementById("driverIdNum").value=driverIdNum;
		document.getElementById("driverMobile").value=driverMobile;
		
	}
	function setVehicle(vehicleId,vehicleNo){
		document.getElementById("selectVehicleId").value=vehicleId;
		document.getElementById("vehicleNo").value=vehicleNo;
	}
	var tempCacheValue = '';
	function onFocusCacheValue(focusObj){
		tempCacheValue=focusObj.value+"";
	}
	function onBlurDriver(focusObj){
		if(focusObj.value==tempCacheValue){
			return;
		}else{
			document.getElementById("selectDriverId").value='';
		}
	}
	function onBlurVechile(focusObj){
		if(focusObj.value==tempCacheValue){
			return;
		}else{
			document.getElementById("selectVehicleId").value='';
		}
	}
	var isSubmitForm=true;
	function validateForm(){
		var driverName=document.getElementById("driverName");
		var driverIdNum=document.getElementById("driverIdNum");
		var driverMobile=document.getElementById("driverMobile");
		var vehicleNo=document.getElementById("vehicleNo");
		var carrierId=document.getElementById("carrierId");
		var tempValue =carrierId.value; 
		tempValue=tempValue.replace(/ /g,'');
		if(!tempValue||tempValue==''){
			//alert("请选择承运商。");
			alertTip("请选择承运商。");
			carrierId.focus();
			return;
		}
		var tempValue =driverName.value; 
		tempValue=tempValue.replace(/ /g,'');
		if(!tempValue||tempValue==''){
			//alert("请输入司机姓名。");
			alertTip("请输入司机姓名。");
			driverName.focus();
			return;
		}
		
		tempValue =driverIdNum.value; 
		tempValue=tempValue.replace(/ /g,'');
		if(tempValue&&tempValue!=''){
			var regex =/^(^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{2}([0-9]|x|X)$)|(^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}([0-9]|x|X)$)$/;
			if(regex.test(tempValue)==false){
			//alert("请输入正确的身份证号码。");
			alertTip("请输入正确的身份证号码。");
			driverIdNum.focus();
			return;
			}
			
		}
		
		tempValue =driverMobile.value; 
		tempValue=tempValue.replace(/ /g,'');
		if(!tempValue||tempValue==''){
			//alert("请输入司机手机号。");
			alertTip("请输入司机手机号。");
			driverMobile.focus();
			return;
		}
		
		tempValue =vehicleNo.value; 
		tempValue=tempValue.replace(/ /g,'');
		if(!tempValue||tempValue==''){
		//	alert("请输入车牌号。");
		alertTip("请输入车牌号。");
			vehicleNo.focus();
			return;
		}
		
		var vehicleNoVal = vehicleNo.value
		vehicleNoVal = vehicleNoVal.replace(/ /g,'');
		document.getElementById("vehicleNo").value = vehicleNoVal;
		//submit('transportForm');
		if(isSubmitForm){
			isSubmitForm = false;
			__vsubmit('transportForm');
		}
	}
	</script>
	<table id="1679" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				承运商
			</td>
			<td  style="text-align:left;">
				<html:select id="carrierId" name="carrierId"  list="carrierList">
					<html:option label="carrierName" value="carrierId" />
				</html:select>
			</td>
			<td class="edit-talbe-label" id="HIOEPKJKKJCBMOHNMFENEKAPLLJKLHGFIBOMMELBLPEGBJKCONJEKEKBLJOLMFAH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleno#}" ></html:label>
			</td>
			<td  id="NKKKCHCKLCELIIOMKKALHIFMAFPKNEFPLAPFLPGCOFGNPKFFGNAOFEBGJGGMCLCH" colSpan="1" rowSpan="1">
				<%--<html:select  id="vehicleId"  name="vehicleId"  list="vehicleList" ><html:option  value="vehicleId"  label="vehicleNo" ></html:option></html:select>--%>
				<html:text  id="vehicleNo"  name="vehicleNo" value=""  onfocus="onFocusCacheValue(this);" onblur="onBlurVechile(this);"/>
				<html:hidden  id="selectVehicleId"  name="selectVehicleId" value=""/>
				<html:a href="javascript:void(0);" onclick="__myWin.createWebWindow({winId:'selectVehicleWin',title:'选择车辆',content:'$[basePath]contoller.do?operation=selectVehicle4SendToLogistics',intLeft:10 ,intTop:10 ,intWidth:800 ,intHeight:600,isResize: true,isFullScreen: false});" style="width: 50px;height:24px;border-style:none;background-repeat:no-repeat;background-color:transparent;color: #2889c4;font-size: 14px;cursor:pointer;border: 1px solid #77b8df;border-radius: 4px;padding: 0 10px;
				">选择</html:a>
			</td>
			<td class="edit-talbe-label" id="LMIJAEIJIIFCOAMEEPCKBKNLCGOLJOPLGMMBFAMJGCIKNBFLOHPIJHCBGEMNOGIO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivername#}" ></html:label>
			</td>
			<td  id="KFFAJKCAOLOOGJNPGKEFKAGEGKMFACEKECBCHKGGJPLPOCMPEIIIKFFEAKEALGHN" colSpan="1" rowSpan="1">
				<%--<html:select  id="driverId"  name="driverId"  list="driverList" bean="driverList" onchange="change(this)">
					<html:option  value="driverId"  label="driverName" id="driverList.driverMobile" ></html:option>
				</html:select>--%>
				<html:text  id="driverName"  name="driverName" value="" onfocus="onFocusCacheValue(this);" onblur="onBlurDriver(this);"/>
				<html:hidden  id="selectDriverId"  name="selectDriverId" value=""/>
				<html:a href="javascript:void(0);" onclick="__myWin.createWebWindow({winId:'selectDriverWin',title:'选择司机',content:'$[basePath]contoller.do?operation=selectDriver4SendToLogistics',intLeft:10 ,intTop:10 ,intWidth:800 ,intHeight:600,isResize: true,isFullScreen: false});" style="width: 50px;height:24px;border-style:none;background-repeat:no-repeat;background-color:transparent;color: #2889c4;font-size: 14px;cursor:pointer;border: 1px solid #77b8df;border-radius: 4px;padding: 0 10px;
				">选择</html:a>
			</td>
			
			
		</tr>
		<tr class="trCell">
			
			<td class="edit-talbe-label" id="LMIJAEIJIIFCOAMEEPCKBKNLCGOLJOPLGMMBFAMJGCIKNBFLOHPIJHCBGEMNOGIO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.driveridnum#}" ></html:label>
			</td>
			<td  id="KFFAJKCAOLOOGJNPGKEFKAGEGKMFACEKECBCHKGGJPLPOCMPEIIIKFFEAKEALGHN" colSpan="1" rowSpan="1">
				<html:text  id="driverIdNum"  name="driverIdNum" value="" onfocus="onFocusCacheValue(this);" onblur="onBlurDriver(this);"/>
			</td>
			<td class="edit-talbe-label" id="MKHGNHEMBKLMAALGKKPPJIFEKAAJLHGEGNPOAAACABMAKIFHOAOLLCPLKJKNCOPC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivermobile#}" ></html:label>
			</td>
			<td  id="LGILOLGLNOHBNJPAFEIPOACBGGINKFPKAJEECNCCCCKHIJIPGIPFLLPGLBKJJHIG" colSpan="3" rowSpan="1">
				<html:text  id="driverMobile"  name="driverMobile" value="" onfocus="onFocusCacheValue(this);" onblur="onBlurDriver(this);"/>
			</td>
			
		</tr>
		<%--<tr class="trCell">
			<td class="edit-talbe-label" id="HIOEPKJKKJCBMOHNMFENEKAPLLJKLHGFIBOMMELBLPEGBJKCONJEKEKBLJOLMFAH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleno#}" ></html:label>
			</td>
			<td  id="NKKKCHCKLCELIIOMKKALHIFMAFPKNEFPLAPFLPGCOFGNPKFFGNAOFEBGJGGMCLCH" colSpan="1" rowSpan="1">
				
				<html:text  id="vehicleNo"  name="vehicleNo" value=""  onfocus="onFocusCacheValue(this);" onblur="onBlurVechile(this);"/>
				<html:hidden  id="selectVehicleId"  name="selectVehicleId" value=""/>
				<html:a href="javascript:void(0);" onclick="__myWin.createWebWindow({winId:'selectDriverWin',title:'选择车辆',content:'$[basePath]contoller.do?operation=selectVehicle4Send',intLeft:10 ,intTop:10 ,intWidth:800 ,intHeight:600,isResize: true,isFullScreen: false});">选择</html:a>
			</td>
			<td class="edit-talbe-label" id="ANKKBCKCPKCPKMIAFOGIGGBKBJAOIJCKEJPGHBCKHKHMOGGMHPINKGOKFLEKPNNI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.send.plantime#}" ></html:label>
			</td>
			<td  id="LFKJNEBIJNMIPFNKPPAKBPKALOJAMKGEGPKPAPMLIGNKMNOCKPFPAMEPCNEHMFKM" colSpan="1" rowSpan="1">
				<com:simplendar  id="planTime"  name="planTime"  defaultToday="true" />
				<html:select id="detailTime" name="detailTime">
					<html:option label=" 7:00- 8:00" value="7" selected="true"/>
					<html:option label=" 8:00- 9:00" value="8"/>
					<html:option label=" 9:00-10:00" value="9"/>
					<html:option label="10:00-11:00" value="10"/>
					<html:option label="11:00-12:00" value="11"/>
					<html:option label="12:00-13:00" value="12"/>
					<html:option label="13:00-14:00" value="13"/>
					<html:option label="14:00-15:00" value="14"/>
					<html:option label="15:00-16:00" value="15"/>
					<html:option label="16:00-17:00" value="16"/>
					<html:option label="17:00-18:00" value="17"/>
					<html:option label="18:00-19:00" value="18"/>
					<html:option label="19:00-20:00" value="19"/>
					<html:option label="20:00-21:00" value="20"/>
					<html:option label="21:00-22:00" value="21"/>
				</html:select>
			</td>
			<td class="edit-talbe-label" id="GKEMIGAIHLGFKBFFENOFAMCCHHEKCGIFKEEJKBJLGFECEBJFKMNKOJOCAEOGIPKA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.senddetail.transdetailnotice#}" ></html:label>
			</td>
			<td  id="JKLHGLCOAJEGOHAFMFEBMNBANGAKKOAGKFBOJKKMKPKCJGFGMIJAPOKLMFCGNFLO" colSpan="3" rowSpan="1">
				<html:text  id="sendNotice"  name="sendNotice" value=""/>
			</td>
		</tr> --%>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:void(0);" onclick="javascript:validateForm();"/>
				<btn:return href="contoller.do?operation=listTransportToLogistics"/>
			</html:td>
		</html:tr>
	</html:table>
	<com:validator formId="transportForm" showNormal="false" submitValidate="true" >
		<com:vElement id="driverMobile"  types="mobile" event="onblur">
			<com:init size="15" maxlength="11"></com:init>
		</com:vElement>
	</com:validator>
</html:form>
