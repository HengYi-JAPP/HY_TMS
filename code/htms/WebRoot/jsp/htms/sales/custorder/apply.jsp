<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean,com.zzy.htms.sales.customeraddr.CustomerAddrBean,com.mobilecn.utils.random.IntRandom" %>
<%@page import="com.zzy.htms.user.HtmsUserBean"%>
<%@page import="com.zzy.htms.sales.custorderdetail.CustOrderDetailBean"%>
<%@page import="com.zzy.htms.logistic.selffetchcar.SelfFetchCarBean"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 HtmsUserBean userBean = (HtmsUserBean)request.getSession().getAttribute("userBean");
 int isTraders=userBean==null?0:userBean.getCustomerType();
 request.setAttribute("isTraders",isTraders);
 List<CustomerAddrBean> addrLists= (List<CustomerAddrBean>)request.getAttribute("addrLists");
 addrLists=addrLists==null?new ArrayList<CustomerAddrBean>():addrLists;
 
List<HtmsUserBean> fetchList = (List<HtmsUserBean>)request.getAttribute("fetchList");
List<CustOrderDetailBean> orderDetailList = (List<CustOrderDetailBean>)request.getAttribute("orderDetailList");
HtmsUserBean fetchBean = null;
CustOrderDetailBean custOrderDetailBean = null;
Boolean isFetch = false;
String detailFactoryId = null;
String factoryId = null;
if((fetchList!=null&&!fetchList.isEmpty())&&(orderDetailList!=null&&!orderDetailList.isEmpty())){
	for(int i=0;i<orderDetailList.size();i++){
		custOrderDetailBean = orderDetailList.get(i);
		detailFactoryId = custOrderDetailBean.getFactoryId();
		for(int j=0;j<fetchList.size();j++){
			fetchBean = fetchList.get(j);
			factoryId = fetchBean.getFactoryId();
			if(detailFactoryId.equals(factoryId)){
				isFetch = true;
				break;
			}else{
				isFetch = false;
			}
		}
		if(isFetch==false){
			break;
		}
	}
	request.setAttribute("isFetch",isFetch);
}

boolean defaultFetch = false;
if(isTraders==1){
}else{
  defaultFetch=true;
  isFetch=true;
}
%>

<head>
<script type="text/javascript">
	var basePath="<%=basePath%>";
</script>
<base href="<%=basePath%>">
<%String shipCode = tools.tool.DateUtil.getFormatDate("MMddHHmmss")+tools.tool.getRandomUUID(2).toUpperCase(); %>
</head>
<script src="resources/simpleupload/jquery-min.js" ></script>
<script src="jsp/htms/mobile/js/Ajax.js" ></script>
<com:loader  js="js/common/common.js,js/MathCalculator.js"/>
<script src="js/htms/custorder/custorder.js" ></script>

<script type="text/javascript">
	function addressChange(addObj){		
		 var areaId=$("#caddrId option:selected").attr("id");
		 $("#areaId").attr("value",areaId);
	}
	function loadDriverAndMobile(){
	     var customerId=$("#customerId").val();
	     var fetchCar=$("#fetchCar").val();
	     if(customerId==null||customerId==""){
	         alertTip("获取客户信息为空，调用失败!");
	     }else
	     if(fetchCar==null||fetchCar==""){
	         alertTip("请先选择车辆信息!");
	     }else{
		     var basePath = basePath + '/controller.do';
			 var parmas = {operation:'ajaxGetDefultDriverAndMobile',"customerId":customerId,"fetchCar":fetchCar};
		     $.ajax({
			    url:basePath,
			    type:'POST', //GET
			    async:false,    //或false,是否异步
			    data:parmas,
			    timeout:5000,    //超时时间
			    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
			    success:function(data,textStatus,jqXHR){
					if("1"==data.isSuccess){
					    $("#fetchDriver").attr("value",data.driver);
					    $("#fetchMobile").attr("value",data.mobile);
					}else{
					    alertTip(data.msg);
					}
			    },
			    error:function(xhr,textStatus){
			    	result=false;
			    }
			});
		}
	}
</script>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="custOrderForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"   validator="true"/>
	<html:hidden id="operation" name="operation" value="doShipApply"/>
	<html:hidden id="isValidate" name="isValidate" value="1"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="shipDetailStatus" name="shipDetailStatus" value="2"/>
	<html:hidden id="applyStatus" name="applyStatus" value="2"/>
	<html:hidden id="corderId" name="corderId" value="$[custOrderViewBean.corderId]"/>
	<html:hidden id="orderCode" name="orderCode" value="$[custOrderViewBean.corderCode]"/>
	<html:hidden id="customerCode" name="customerCode" value="$[custOrderViewBean.customerCode]"/>
	
	<com:loader binder="true" checkall="true" switchbox="true"  />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.ship.title.add") %>' name="title"/>
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
			<td class="edit-talbe-label"  width="180px">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td width="300px">
				<html:value  value="$[custOrderViewBean.corderCode]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				是否加急
			</td>
			<td>
				<!--<com:switchbox boxId="isUrgent" varValue="0" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName=""  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" isSave="false" />
				-->
				<html:radio id="isUrgent" name="isUrgent" value="0" checked="checked"/>否
				<html:radio id="isUrgent" name="isUrgent" value="1"/>是
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.customerid#}" ></html:label>
			</td>
			<td>
			    <html:hidden  id="customerId" name="customerId"  value="$[custOrderViewBean.customerId]" />
				<html:value  value="$[custOrderViewBean.customerName]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.custorder.customercode#}" ></html:label>
			</td>
			<td>
				<html:value  value="$[custOrderViewBean.customerCode]" ></html:value>
			</td>
		</tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				物流备注
			</html:td>
			<html:td width="35%">
			<%-- 申请编号	<html:text id="shipCode" name="shipCode" value="<%=shipCode %>" readonly="true"  style="border:0px;"></html:text>--%>
			<html:text  id="ordreNotice"  name="ordreNotice" style="width:300px;"/>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				<html:label label="{$jsp.htms.sales.customeraddr.address#}"></html:label>
			</html:td>
			<html:td width="50%">
			
				<select  id="caddrId" name="caddrId" onchange="addressChange(this)" style="width: 400px;">
				<%
				CustomerAddrBean addrBean =null;
				String areaIdStr="";
				for(int i=0,size=addrLists.size();i<size;i++){ 
				addrBean=addrLists.get(i);
				if(i==0){
				   areaIdStr=addrBean.getAreaId()+"";
				}
				%>
					<option id="<%=addrBean.getAreaId() %>" value="<%=addrBean.getCaddrId() %>"  <%=i==0?"selected='true'":"" %>><%=addrBean.getAreaName() %></option>
					<%} %>
				</select>
				<html:hidden id="areaId" name="areaId" value="<%=areaIdStr %>"/>
				<btn:new href="contoller.do?operation=toAddNewAddress&isApply=1&corderId=$[custOrderViewBean.corderId]&customerCode=$[custOrderViewBean.customerCode]"/>
				<span id="caddrIdTip" style="font-size:12px;color:red;"></span>
			</html:td>
		</html:tr>
		<%--
		<tr class="trCell">
			<td class="edit-talbe-label">
				备注
			</td>
			<td colspan="3">
				<html:text  id="ordreNotice"  name="ordreNotice" style="width:300px;"/>
			</td>
		</tr> --%>
	</table>
	 <!-- 提交的时候，此字段需要按照自提类型做设置  默认为0    贸易商自提为1    自备车自提为2-->
     <html:hidden id="selfFetch" name="selfFetch" value="0"/>
	<%
	if(isFetch==true){
	%>
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<td class="edit-talbe-label">
				<% 
			       if(isTraders==1){
			    %>
				    是否自提
			    <% 
			    }else{
			    %>
			           是否客户自备车自提
			    <% 
			    }
			     %>
			</td>
			<html:td>
				<%
				
				  // System.out.println(" customerCode  customerCode: defaultFetch"+defaultFetch);
				   if(isTraders==1){
				   %>
				       <html:radio id="selfFetchOff" name="selfFetch1" value="0"  checked="checked" onchange="showOrHideOrderDetail('selfFetchOff','showFecthInfo');"/>否
				       <html:radio id="selfFetchOn" name="selfFetch1"  value="1"   onchange="showOrHideOrderDetail('selfFetchOn','showFecthInfo');"/>是
				   <%
				   }else{
				   %>
				        <html:radio id="selfFetchOff" name="selfFetch2" value="0" checked="checked" onchange="showOrHideOrderDetail('selfFetchOff','showFecthInfo');"/>否
			       	    <html:radio id="selfFetchOn" name="selfFetch2" value="2"  onchange="showOrHideOrderDetail('selfFetchOn','showFecthInfo');"/>是
				   <%
				   }
				 %>
				
			</html:td>
		</html:tr>
	</html:table>
	<%} %>
	
	<html:table id="showFecthInfo" styleClass="edit-talbe"    style="display:none;">
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				提货司机
			</html:td>
			<html:td  width="35%">
				<html:text id="fetchDriver" name="fetchDriver" value="" ></html:text>
				<span id="fetchDriverTip" style="font-size:12px;color:red;"></span>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				联系方式
			</html:td>
			<html:td width="50%">
				<html:text id="fetchMobile" name="fetchMobile" value="" ></html:text>				
				<span id="fetchMobileTip" style="font-size:12px;color:red;"></span>
			</html:td>
		</html:tr>	
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				车牌号
			</html:td>
			<html:td colspan="3">
			    <% 
			       if(isTraders==1){
			    %>
				    <html:text id="fetchCar" name="fetchCar" value="" ></html:text>
			    <% 
			    }else{
			    %>
					<select  id="fetchCar" name="fetchCar" >
				     <%
					    List<SelfFetchCarBean> selfFetchCarList=(List<SelfFetchCarBean>)request.getAttribute("selfFetchCarList");
						if (selfFetchCarList != null&&selfFetchCarList.size()==1){
						    for(SelfFetchCarBean  fetchBean1:selfFetchCarList){
							%>
							     <option value="ZB-<%=fetchBean1.getVehicleNo() %>"  selected="selected" ><%=fetchBean1.getVehicleNo() %></option>
							<%
							}
						}else	if (selfFetchCarList != null&&selfFetchCarList.size()>1){
							%>
							     <option value="" >--请选择车牌号--</option>
							<%
							for(SelfFetchCarBean  fetchBean2:selfFetchCarList){
							%>
							     <option value="ZB-<%=fetchBean2.getVehicleNo() %>" ><%=fetchBean2.getVehicleNo() %></option>
							<%
							}
						}
			        %>
				 </select>
				 
				 <input type="button"   onclick="loadDriverAndMobile()"   class="button-custom-style"   value="加载"  />
			    <% 
			    }
			     %>
				<span id="fetchCarTip" style="font-size:12px;color:red;"></span>
			</html:td>
		</html:tr>	
	</html:table>
	
	
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				发货申请信息：
			</html:td>
		</html:tr>
	</html:table>
	<html:table list="orderDetailList" bean="detailBean" styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" isHead="true" >
		<html:tr id="applyTrInfor$[detailBean.codetailCertificate]" headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
			<html:td label="行号" property="codetailCertificate"  width="60px" />
			<html:td label="工厂" property="factoryName"   width="45px"/>
			<html:td label="产品" property="productName"   width="45px"/>	
			<html:td label="装运点" property="shipPointDesc"   width="150px"/>
			<html:td label="物料" property="codetailCertificateDesc"   width="180px"/>
			<html:td label="订单数" width="80px" style="text-align:right;">
				<html:text  id="orderAmount"  name="orderAmount" value="$[detailBean.orderAmount]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>	
			<html:td label="建议可申请数"   width="80px" >
					<html:text   value="$[detailBean.marketAvailableNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
					<html:hidden id="marketAvailableNum$[detailBean.codetailCertificate]"  value="$[detailBean.marketAvailableNum]" />
			</html:td>
			<html:td label="可申请数" width="80px" style="text-align:right;">
				<html:hidden id="codetailId" name="codetailId" value="$[detailBean.codetailId]"/>
				<html:hidden id="codetailId$[detailBean.codetailCertificate]"  value="$[detailBean.codetailId]"/>
				<html:hidden id="itemCode$[detailBean.codetailCertificate]" name="itemCode" value="$[detailBean.codetailCertificate]"/>
				<html:hidden id="productId$[detailBean.codetailCertificate]" name="productId" value="$[detailBean.productId]"/>				
				<html:hidden id="factoryId$[detailBean.codetailCertificate]" name="factoryId" value="$[detailBean.factoryId]"/>
				
				<html:hidden id="shipPoint$[detailBean.codetailCertificate]" name="factoryId$[detailBean.codetailCertificate]" value="$[detailBean.shipPoint]"/>
				
				<html:text  id="appliableAmount$[detailBean.codetailCertificate]"  name="appliableAmount" value="$[detailBean.appliableAmount]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
				<html:hidden  id="initAppliableAmount$[detailBean.codetailCertificate]"  name="initAppliableAmount" value="$[detailBean.appliableAmount]" />
				<script>itemsNos[itemsNos.length]='<html:value value="$[detailBean.codetailCertificate]"/>';</script>
			</html:td>	
			<td  width="80px" style="text-align:right;display:none;">
				<html:text  id="appliedAmount$[detailBean.codetailCertificate]"  name="appliedAmount" value="$[detailBean.appliedAmount]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
				<html:hidden  id="initAppliedAmount$[detailBean.codetailCertificate]"  name="initAppliedAmount" value="$[detailBean.appliedAmount]" />
			</td>
			<html:td label="申请数"  width="80px">
				<html:text  id="applyTonNum$[detailBean.codetailCertificate]"  name="applyTonNum" onblur="validateApplyTonNum('$[detailBean.codetailCertificate]');" size="12" style="width:98%;text-align:right;"/>
			</html:td>
			<html:td label="订单包数" width="80px" style="text-align:right;">
				<html:value value="$[detailBean.projectVolume]" />
			</html:td>
			<html:td label="包数" width="80px">
				<html:text  id="applyPackNum$[detailBean.codetailCertificate]"  name="applyPackNum" onblur="validateApplyPackNum('$[detailBean.codetailCertificate]');" size="12" style="width:98%;text-align:right;"/>
			</html:td>
			<html:td label="仓库备注">
				<html:text  id="shipNotice"  name="shipNotice" style="width:98%;" maxlength="100"/>
			</html:td>
		</html:tr>
	</html:table>

	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
			     <!-- 
				     <btn:save href="javascript:void(0)" onclick="validateForm('$[isTraders]','$[isFetch]');" id="_save" />
				 -->
				<input type="button" onclick="validateForm('<%=isTraders %>','<%=isFetch %>','<%=defaultFetch %>')" value="保存"  class="button-custom-style" />
				<btn:return href="contoller.do?operation=listCustOrder"/>
				
			</html:td>
		</html:tr>
	</html:table>
	
	<com:validator formId="custOrderForm" showNormal="false" submitValidate="true" >
		<com:vElement id="fetchMobile"  types="mobile" event="onblur">
			<com:init size="15" maxlength="11"></com:init>
		</com:vElement>
	</com:validator>
	
</html:form>