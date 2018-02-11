<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.logistic.transport.TransportBean,com.zzy.htms.logistic.transport.TransportUtils"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<%@page import="com.zzy.htms.dictionary.area.AreaBean" %>

<%@page import="com.zzy.htms.dictionary.product.ProductRepository" %>

<%@page import="com.zzy.htms.dictionary.factory.FactoryRepository,com.zzy.htms.dictionary.factory.FactoryBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%

List<FactoryBean> checkFactoryList=( List<FactoryBean>)request.getAttribute("checkFactoryList");
//System.out.println("\n\n\n\n ===============================>checkFactoryList:"+checkFactoryList);
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 List<AreaBean> provinceList =AreaRepository.getRootNodeList();
 request.setAttribute("provinceList",provinceList); 
 List<TransportBean> transportLists=( List<TransportBean>)request.getAttribute("transportLists");
transportLists=transportLists==null?new ArrayList<TransportBean>():transportLists;
request.setAttribute("productList",ProductRepository.getProductList());
request.setAttribute("factoryList",FactoryRepository.getFactoryList());  

%>
<head><base href="<%=basePath%>">
<script>


function TransportBean(id,value){
	var trans=this;
	trans.transId=id;
	trans.applyTon=value?value:"0.00";
}
var transList=[];
function getTransBean(currId){
	var tansBean = null;
	for(var i=0;i<transList.length;i++){
		tansBean=transList[i];
		//alert("tansBean.transId="+tansBean.transId+",currId="+currId);
		if(tansBean.transId&&tansBean.transId==currId){
			return tansBean;
		}
	}
	return null;
}
function changeAssignValue(assignObj,assignId){
	if(!assignObj||!assignId){
	//alert("!assignObj||!assignId");
		return;
	}
	var tansBean = getTransBean(assignId);
	if(!tansBean){
	//alert("(!tansBean)");
		return;
	}
	//alert("tansBean.applyTon="+tansBean.applyTon);
	 var assignValue=tansBean&&tansBean.applyTon?tansBean.applyTon:"0.0";
	 var transportTonNum=document.getElementById("transportTonNum").value;
	 transportTonNum=transportTonNum?transportTonNum:"0.0";
 
	 if(assignObj.checked==true){
	 	transportTonNum=calculator.add(transportTonNum,assignValue);
	 }
	 if(assignObj.checked==false){
	 	transportTonNum=calculator.sub(transportTonNum,assignValue);
	 }
	  showCurrentTonNumTip(transportTonNum);
	 document.getElementById("transportTonNum").value=transportTonNum;
}

function assignAllValue(assignObj){
	if(assignObj.checked==false){
		document.getElementById("transportTonNum").value="0.00";
		return;
	}
	var checkTransports=document.getElementsByName("checkTransportId");
	if(!checkTransports||checkTransports.length==0){return}
	
	var transportTonNum=document.getElementById("transportTonNum").value;
 	transportTonNum=transportTonNum?transportTonNum:"0.0";
 	var  assignValue=assignValue?assignValue:"0.0";
 	var tansBean = null;
	for(var i=0;i<checkTransports.length;i++){	
		var tansBean = getTransBean(checkTransports[i].id);	
		assignValue=tansBean&&tansBean.applyTon?tansBean.applyTon:"0.0";
		transportTonNum=calculator.add(transportTonNum,assignValue);
	}
	 showCurrentTonNumTip(transportTonNum);
	 document.getElementById("transportTonNum").value=transportTonNum;
	
}

function showCurrentTonNumTip(tonNum){
	 //var tonNum=document.getElementById("transportTonNum").value;
	 if(parseFloat(tonNum)>0){
	 	document.getElementById("currentTonNumTip").style.display="block";
	 }else{
	 	document.getElementById("currentTonNumTip").style.display="none";
	 }
}

function toAssign(){
	var tonNum=document.getElementById("transportTonNum").value;
	 if(parseFloat(tonNum)==0||parseFloat(tonNum)<0){
	 	alertTip("请选择您要分配的调拨单。");
	 	return;
	 }
	 //if(parseFloat(tonNum)>40000){
	 //	alert("您选择的调拨单累计吨数据超过了40吨，车辆不能装载，请重新选择。");
	 //	return;
	 //}
	 batchDelete('transportForm','checkTransportId','','toAssignTransport');
}

function ShowOrHideMenu(objId) {
    try {
        var menu = document.getElementById(objId);
        if (menu.style.display != "none") {
            menu.style.display = "none";
           // menu.style.width="1010px";
           // document.getElementById("contentDiv").style.width="1010px";;
        }
        else {
            menu.style.display = "";
        }
    }
    catch (ee) {
        alertTip(ee.massage);
    }
}
 </script>
 <style type="text/css">

 </style>
</head>
<com:loader  js="js/common/common.js,js/MathCalculator.js"/>
<com:loader css="css/common/table-list-new.css"/>

<html:form id="transportForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" loadCache="true" >
	<com:loader  simplendar="true" ajax="true" asyncSelect="true" />
	<html:hidden id="operation" name="operation" value="listTransport"/>
	<com:loader binder="true" checkall="true" switchbox="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.transport.title.list") %>' name="title"/>
	</jsp:include>
	<table  class="edit-talbe" >
	<tr class="trCell">
			<td class="edit-talbe-label"  colSpan="1" rowSpan="1">
				工厂
			</td>
			<td  style=" font-size: 14px;"  colSpan="3" rowSpan="1">
				<html:checkbox id="factoryIdSH"  name="factoryIdSH"   list="factoryList"  label="factoryName"  value="factoryId" />
			</td>
			<td class="edit-talbe-label"  style=" font-size: 14px;"  colSpan="1" rowSpan="1">
				产品
			</td>
			<td  style=" font-size: 14px;"  colSpan="3" rowSpan="1">
				<html:checkbox id="productIdSH"  name="productIdSH"  list="productList"  label="productName"  value="productId"  />
			</td>
		</tr>
		<tr class="trCell">
			<td  class="edit-talbe-label">
				省
			</td>
			<td width="80px">
				<html:select id="provinceId" name="provinceId"  list="provinceList" isCascade="true" isCascadeSource="true" cascadeTarget="cityId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
					<html:option label="areaName" value="areaId" />
				</html:select>
			</td>
			
			<td class="edit-talbe-label">
				市
			</td>
			<td width="100px">
				<html:select id="cityId" name="cityId"   isCascade="true" isCascadeSource="true" cascadeTarget="countyId"  cascadeValue="parentAreaId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
					
				</html:select>
			</td>	
			<td class="edit-talbe-label">
				区(县)
			</td>
			<td width="100px">
				<html:select id="countyId" name="countyId"  isCascade="true" isCascadeSource="true" cascadeTarget="countryId"  cascadeValue="parentAreaId"  isCascadeAsync="true" asyncLabel="areaName" asyncValue="areaId" asyncClass="com.zzy.htms.dictionary.area.SelectAsyncAreaLoader">
				
				</html:select>
			</td>	
			<td  class="edit-talbe-label">
				乡镇、街道
			</td>
			<td width="100px">
				<html:select id="countryId" name="countryId"   isCascade="true"  cascadeValue="parentAreaId">
				</html:select>
			</td>					
			
		</tr>
		
		
		<tr class="trCell">
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				客户
			</td>
			<td  id="KMNKFEEMJGCGOAAFHCKIGEOPEBLMOALKIILJKBJIABHGFKEONCCHLPOMBKNEBAIE" colSpan="1" rowSpan="1">
				<html:text  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]" />
			</td>
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				联系人
			</td>
			<td  id="KMNKFEEMJGCGOAAFHCKIGEOPEBLMOALKIILJKBJIABHGFKEONCCHLPOMBKNEBAIE" colSpan="1" rowSpan="1">
				<html:text  id="caddrContactorSH"  name="caddrContactorSH" value="$[caddrContactorSH]"/>
			</td>
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				分配时间
			</td>
			<td  id="KMNKFEEMJGCGOAAFHCKIGEOPEBLMOALKIILJKBJIABHGFKEONCCHLPOMBKNEBAIE" colSpan="1" rowSpan="1">
				<com:simplendar  id="assignDateSH"  name="assignDateSH"  value="$[assignDateSH]" />
			</td>
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				排车时间
			</td>
			<td  style="text-align:left;">
				<com:simplendar  id="sendCarDateSH"  name="sendCarDateSH"   value="$[sendCarDateSH]"  />
				
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				车牌号
			</td>
			<td  style="text-align:left;">
				<html:text  id="carNoSH"  name="carNoSH" value="$[carNoSH]" />
			</td>
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				订单号
			</td>
			<td  id="KMNKFEEMJGCGOAAFHCKIGEOPEBLMOALKIILJKBJIABHGFKEONCCHLPOMBKNEBAIE" colSpan="1" rowSpan="1">
				<html:text  id="corderCodeSH"  name="corderCodeSH" value="$[corderCodeSH]" />
			</td>
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				调拨单号
			</td>
			<td  id="KMNKFEEMJGCGOAAFHCKIGEOPEBLMOALKIILJKBJIABHGFKEONCCHLPOMBKNEBAIE" colSpan="1" rowSpan="1">
				<html:text  id="sapTransCodeSH"  name="sapTransCodeSH" value="$[sapTransCodeSH]" />
			</td>
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				运单号
			</td>
			<td  id="KMNKFEEMJGCGOAAFHCKIGEOPEBLMOALKIILJKBJIABHGFKEONCCHLPOMBKNEBAIE" colSpan="1" rowSpan="1">
				<html:text  id="transportCodeSH"  name="transportCodeSH" value="$[transportCodeSH]" />
			</td>
			
		</tr>
		<tr class="trCell">
		     <!-- <td    class="edit-talbe-label" >
		                    合并状态
		      </td>
		      <td   style="text-align:left;" >
		          <html:select  id="isMergerSH" name="isMergerSH" >
					 <html:option label="已合并" value="1" selected="$[isMergerSH]"></html:option>
					 <html:option label="未合并" value="0" selected="$[isMergerSH]"></html:option>
					 <html:option label="取消合并" value="-1" selected="$[isMergerSH]"></html:option>
				  </html:select>
		      </td>
		      <td    class="edit-talbe-label" >
		                   合并组号
		      </td>
		      <td   style="text-align:left;" >
		          <html:text id="mergerGroupSH" name="mergerGroupSH" value="$[mergerGroupSH]"  style="width:95px;"  />
		      </td> -->
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				状态
			</td>
			<td  style="text-align:left;" colSpan="2">
				<html:select id="transportStatusSH" name="transportStatusSH">
					<html:option label="未排车" value="0" selected="$[transportStatusSH]" />
					<html:option label="已排车" value="1" selected="$[transportStatusSH]" />					
					<html:option label="已派车" value="2" selected="$[transportStatusSH]" />
					<html:option label="已签收" value="102" selected="$[transportStatusSH]" />
				</html:select>
			<td  style="text-align:left;" colSpan="5">
					<span style="float:left;">
						<btn:search href="javascript:submit('transportForm')"/>
						<btn:reset href="javascript:cleanForm('transportForm');"/>
					</span>
			</td>
			
		</tr>
	</table>
	<table  style="width: 100%;border-spacing: 0;padding:3px 0;">
		<tr class="trCell">
			<td   class=""   id="manageBox" >
				<div style="float:left;display:inline;">
					<div style="float:left;">
						<html:a href="javascript:toAssign();">
						<input type="button"  id="" name="" value="排车" class="commonBtn" >
						</html:a>
					</div>
					
				</div>
			</td>
			<td colspan="5"  rowSpan="1" width="200px;">
			<div style="float:left;display:inline;">
				<div style="float:left;">
				
				
				</div>
				<div style="float:left;">
					<span id="currentTonNumTip" style="display:none;color:red;">当前分配数量：<html:text id="transportTonNum" name="transportTonNum" value="0" style="border:0px;color:red;" readonly="readonly"/></span>
				</div>
			</div>
			</td>
			<td colspan="1"  rowSpan="1" width="90px">
				<html:a href="jsp/htms/export/exportCarrierFreight.jsp" style="border:0;text-decoration:none;">
					<input type="button"  id="" name="" value="导出"  class="commonBtn">
				</html:a>
			</td>
			<td colspan="1"  rowSpan="1">
				
			</td>
		</tr>
</table>
<div style="width:100%;text-align:left; float:left;overflow-x:scroll;overflow-y:hidden;" >
		<table  id="contentDiv" align="left" cellSpacing="0"  border="0"  style="float:left;display:block;border-collapse: collapse;">
			<tr  align="left" style="border:0px;margin:0px;padding:0px;">
				<td  align="left" style="border:0px;margin:0px;padding:0px;">
						<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="border-collapse: collapse;min-width:1022px" align="center">
						<tr  class="dgHeaderStyle" >
							<td    style="text-align:center;white-space: nowrap;min-width:60px">操作</td>
							<td  style="text-align:center;white-space: nowrap;min-width:30px">
							    &nbsp;
							</td>
							<td  style="text-align:center;white-space: nowrap;min-width:40px">
							    <html:checkbox id="checkAll"  name="checkAll" onchange="assignAllValue(this)" />
							</td>
							<td  style="text-align:center;white-space: nowrap;min-width:40px">加急</td>
							<!--  <td style="text-align:center;white-space: nowrap;min-width:45px">合并状态</td>
	    	                <td style="text-align:center;white-space: nowrap;min-width:45px">合并组号</td> -->
							<td style="text-align:center;white-space: nowrap;min-width:50px">状态</td>
							
							<td  style="text-align:center;white-space: nowrap;min-width:80px">调拨单号</td>	
							<td   style="text-align:center;white-space: nowrap;min-width:120px">
								分配时间
							</td>
							
							<td  style="white-space: nowrap; min-width:150px">送货地址</td>				
							<td  style="text-align:center;white-space: nowrap;min-width:50px">工厂</td>
							<td  style="text-align:center;white-space: nowrap;min-width:50px">产品</td>
							<td  style="text-align:center;white-space: nowrap;min-width:50px">重量</td>
							<td  style="text-align:center;white-space: nowrap;min-width:50px">包数</td>								
							<td style="text-align:center;white-space: nowrap;min-width:70px"">车牌</td>
							<td style="text-align:center;white-space: nowrap;min-width:70px"">司机</td>
							<td style="text-align:center;white-space: nowrap;min-width:70px"">业务员备注</td>
							<td style="text-align:center;white-space: nowrap;min-width:70px"">物流备注</td>
							
							<td   style="text-align:center;white-space: nowrap;min-width:120px">客户</td>
							<td  style="text-align:center;white-space: nowrap;min-width:70px ">联系人</td>				
							<td  style="text-align:center;white-space: nowrap;min-width:70px">电话</td>	
							<td  style="text-align:center;white-space: nowrap;min-width:70px">装运点</td>	
							<td  style="text-align:center;white-space: nowrap;min-width:70px">物料</td>	
							<td style="text-align:center;white-space: nowrap;min-width:80px">订单号</td>									
							<td  style="text-align:center;white-space: nowrap;min-width:90px">运单号</td>
						</tr>
						
						<%
						int transportStatus=0,isDefault=0,sendStatus=0;
						TransportBean transportBean=null;
						
						String sendTip="";
						for(int i=0,isize=transportLists.size();i<isize;i++){
							transportBean = transportLists.get(i);
							transportStatus=transportBean.getTransportStatus();
							//sendStatus=transportBean.getSendStatus();
							//isDefault=transportBean.getIsDefault();
							sendTip="未排车";
							sendTip=transportStatus==1?"已排车":sendTip;
							sendTip=transportStatus==2?"已派车":sendTip;
							sendTip=transportStatus==102?"已签收":sendTip;
							request.setAttribute("transportBean",transportBean);
							%>
								<tr>
								
									<td  style="white-space: nowrap; ">
										<%if(transportStatus==0){//没有分配承运商的可以分拆 %>
										<html:a href="contoller.do?operation=toAssignTransport&checkTransportId=$[transportBean.transportId]" style="border:0;text-decoration:none;">
										<input type="button"  id="" name="" value="排车"  class="commonBtn">
										</html:a>
										<%} %>
										<%if(transportStatus==1){//分配承运商未排车的可以取消 %>
											<btn:cancel  href="contoller.do?operation=canncelAssignTransport&transportId=$[transportBean.transportId]&sapTransCode=$[transportBean.sapTransCode]"  />
										<%} %>
									</td>
									<td style="white-space: nowrap; text-align:center; ">
									    <%if(transportStatus>=1){ //已经排车的车辆能查看车辆跟踪的状态 %>
									        <html:a href="contoller.do?operation=trackTransfer&transId=$[transportBean.transId]&returnOperation=listTransport">
										       <img src="images/htms/transfer/gps.png"  title="追踪"  height="25" width="25" />
										     </html:a> 
										  <%} %>
									</td>
									 <td style="white-space: nowrap; text-align:center; ">
									<%if(transportStatus==0){ %>
									<html:checkbox onchange="changeAssignValue(this,this.id);" name="checkTransportId" id="transId_$[transportBean.transportId]" value="$[transportBean.transportId]" />
									<script type="text/javascript">transList[transList.length]=new TransportBean('transId_<%=transportBean.getTransportId()%>','<%=transportBean.getApplyTonNum()%>');</script>
									<%} %>
									</td>	
									<td  style="text-align:center;white-space: nowrap;" >
										<%if(transportBean.getIsUrgent()==0){ %>
										       <img src="images/htms/green.png"  height="12" width="12" />
										<%}	if(transportBean.getIsUrgent()==1){ %>
										       <img src="images/htms/red.png" height="12" width="12" />
										<%} %>
									</td>
								<!-- 	
								        <td    style="text-align:center;white-space: nowrap;" >
										   	 <%if(transportBean.getIsMerger().equals("1")){//合并状态可以解除合并 %>
										   	             已合并
										   	 <%} %>		
										</td>
										<td    style="text-align:center;white-space: nowrap;"  >
										     <%=transportBean.getMergerGroup() %>
										</td> 
								-->
									<td  style="text-align:center;white-space: nowrap;"><%=sendTip%></td>
									<td style="text-align:center;white-space: nowrap;">
									<html:a style="text-decoration:none;" href="contoller.do?operation=toViewAssignTransport&transportId=$[transportBean.transportId]">
									<%=transportBean.getSapTransCode() %>
									</html:a>
									</td>
									<td  style="text-align:center;white-space: nowrap;"  >
										<%=transportBean.getCreateTime()%>
									</td>
									
									<td style="text-align:left;white-space: nowrap;"><%=transportBean.getAreaName()%></td>
									<td style="text-align:left;white-space: nowrap;">
									<html:a style="text-decoration:none;" href="contoller.do?operation=toViewAssignTransport&transportId=$[transportBean.transportId]">
									<%=transportBean.getFactoryName() %>
									</html:a>
									</td>
									<td style="text-align:left;white-space: nowrap;">
									<html:a style="text-decoration:none;" href="contoller.do?operation=toViewAssignTransport&transportId=$[transportBean.transportId]">
									<%=transportBean.getProductName() %>
									</html:a>
									</td>
									<td style="text-align:right;line-height:28px;white-space: nowrap;">
									<html:a style="text-decoration:none;" href="contoller.do?operation=toViewAssignTransport&transportId=$[transportBean.transportId]">
									<%=transportBean.getApplyTonNum()%>
									</html:a>
									</td>
									<td  style="text-align:right;"><html:a style="text-decoration:none;" href="contoller.do?operation=toViewAssignTransport&transportId=$[transportBean.transportId]"><%=transportBean.getApplyPackNum() %></html:a></td>
									<td style="text-align:left;white-space: nowrap;"><%=transportBean.getCarNo() %></td>
									<td  style="text-align:left;white-space: nowrap;"><%=transportBean.getDriverName() %></td>
									<td  style="text-align:left;white-space: nowrap;">
									    <%=transportBean.getShipNotice()==null?"":transportBean.getShipNotice() %>
									</td>
									
									<td  style="text-align:left;white-space: nowrap;">
									    <%=transportBean.getTransportNotice()==null?"":transportBean.getTransportNotice() %>
									</td>
									
									<td style="line-height:28px;text-align:left;white-space: nowrap;" ><%=transportBean.getCustomerName() %></td>
									<td   style="text-align:left;white-space: nowrap; "><%=transportBean.getCaddrContactor()%></td>				
									<td   style="text-align:left;white-space: nowrap; "><%=transportBean.getCaddrTelephone() %></td>	
									
									<td   style="text-align:left;white-space: nowrap; "><%=transportBean.getShipPointDesc()==null?"":transportBean.getShipPointDesc() %></td>	
									<td   style="text-align:left;white-space: nowrap; "><%=transportBean.getCodetailCertificateDesc() %></td>	
																		
									<td style="text-align:center;white-space: nowrap;"><%=transportBean.getCorderCode() %></td>
									<td style="text-align:center;white-space: nowrap;"><%=transportBean.getTransportCode() %></td>
								</tr>
							<%
						}//for transportLists
						//tools.tool.clear(transportLists);
					%>
					</table>
				</td>
		
		<td>&nbsp;</td>
			</tr>
		</table>
		</div>
	<table id="pageFooter" class="" style="width:100%;">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkTransportId" checkId="checkAll"/>
				<com:page formId="transportForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>

</html:form>

<style type="text/css">
.edit-talbe-label {
  width: 80px;
  background: #f1f1f1;
  font-size: 12px;
  text-align: right;
  min-width: 80px;
}
</style>
<script type="text/javascript">
	var provinceId="<html:value value='$[provinceId]'/>";
	var cityId="<html:value value='$[cityId]'/>";
	var countyId="<html:value value='$[countyId]'/>";
	var countryId="<html:value value='$[countryId]'/>";
	selectItemByValue("provinceId",provinceId);
	selectItemByValue("cityId",cityId);
	selectItemByValue("countyId",countyId);
	selectItemByValue("countryId",countryId);
</script>

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