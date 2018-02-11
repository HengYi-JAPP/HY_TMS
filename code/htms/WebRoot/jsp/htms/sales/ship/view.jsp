<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean,com.mobilecn.utils.random.IntRandom" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<head>
<base href="<%=basePath%>">
<%String shipCode = tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(10,99); %>
</head>
<com:loader  js="js/common/common.js,js/MathCalculator.js,js/htms/custorder/custorder.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="custOrderForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"   />
	<html:hidden id="operation" name="operation" value="doShipApply"/>
	<html:hidden id="isValidate" name="isValidate" value="1"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="shipDetailStatus" name="shipDetailStatus" value="2"/>
	<html:hidden id="applyStatus" name="applyStatus" value="2"/>
	<html:hidden id="corderId" name="corderId" value="$[shipViewBean.corderId]"/>
	<html:hidden id="orderCode" name="orderCode" value="$[shipViewBean.corderId]"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='查看发货申请' name="title"/>
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
			<td width="300px">
				<html:value  value="$[shipViewBean.corderCode]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				是否加急
			</td>
			<td>
				<com:switchbox boxId="isUrgent" varValue="$[shipViewBean.isUrgent]" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName=""  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" isSave="false" disabled="true"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.customerid#}" ></html:label>
			</td>
			<td>
				<html:value  value="$[shipViewBean.customerName]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.custorder.customercode#}" ></html:label>
			</td>
			<td>
				<html:value  value="$[shipViewBean.customerCode]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				申请编号
			</td>
			<td >
				<html:text id="shipCode" name="shipCode" value="$[shipViewBean.shipCode]" readonly="true"  style="border:0px;"></html:text>
			</td>
			<td class="edit-talbe-label" >
				<html:label label="{$jsp.htms.sales.customeraddr.address#}"></html:label>
			</td>
			<td width="52%">
				<html:value value="$[custAddrBean.areaName]" />
				<html:value value="$[custAddrBean.caddrDetail]" />
				<html:value value="$[custAddrBean.caddrContactor]" />
				<html:value value="$[custAddrBean.caddrTelephone]" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				申请数
			</td>
			<td >
				<html:value  value="$[shipViewBean.applyTonNum]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				申请包数
			</td>
			<td>
				<html:value  value="$[shipViewBean.applyPackNum]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				备注
			</td>
			<td >
				<html:value value="$[shipViewBean.shipNotice]" />
			</td>
			<td class="edit-talbe-label">
				预估运费
			</td>
			<td >
				<html:value value="$[shipViewBean.planFreight]" />
			</td>
		</tr>
	</table>
	<logic:if condition="$[shipViewBean.selfFetch]>0">
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				 <logic:if condition="$[shipViewBean.selfFetch]==1">
				          贸易商自提
				 </logic:if>
				 <logic:if condition="$[shipViewBean.selfFetch]==9">
				          贸易商自提
				 </logic:if>
				 <logic:if condition="$[shipViewBean.selfFetch]==2">
				          客户自备车自提
				 </logic:if>
				 <logic:if condition="$[shipViewBean.selfFetch]==10">
				          客户自备车自提
				 </logic:if>
			</html:td>
		</html:tr>
	</html:table>
	<html:table id="showFecthInfo" styleClass="edit-talbe"  style="display:block;" >
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				提货司机
			</html:td>
			<html:td  width="300px">
				<html:value  value="$[shipViewBean.fetchDriver]"/>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				联系方式
			</html:td>
			<html:td width="52%">	
				<html:value   value="$[shipViewBean.fetchMobile]"/>
			</html:td>
		</html:tr>	
		<html:tr styleClass="trCell">
			
			<html:td styleClass="edit-talbe-label">
				车牌号
			</html:td>
			<html:td colspan="3">
				<html:value   value="$[shipViewBean.fetchCar]"/>
			</html:td>
		</html:tr>	
	</html:table>
	</logic:if>
	<logic:if condition="$[shipViewBean.applyStatus]==3">
	<html:table styleClass="edit-talbe">
		<html:tr styleClass="trCell">
			<html:td  colspan="4" rowspan="1">
			        排车信息
			</html:td>
		</html:tr>
	</html:table>
	<html:table styleClass="edit-talbe" list="sendList" bean="sendBean">
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="SAP调拨单号" ></html:label>
			</html:td>
			<html:td>
				<html:value value="$[sendBean.sapTransCode]"></html:value>
			</html:td>
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="{$jsp.htms.logistic.driver.drivername#}" ></html:label>
			</html:td>
			<html:td width="52%">
				<html:value value="$[sendBean.driverName]"></html:value>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleno#}" ></html:label>
			</html:td>
			<html:td>
				<html:value value="$[sendBean.vehicleNo]"></html:value>
			</html:td>
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="{$jsp.htms.logistic.driver.drivermobile#}" ></html:label>
			</html:td>
			<html:td width="52%">
				<html:value value="$[sendBean.driverMobile]"></html:value>
			</html:td>
		</html:tr>
		<html:tr>
			<html:td colspan="4" rowspan="1">
			</html:td>
		</html:tr>
	</html:table>
	</logic:if>
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				发货申请信息：
			</html:td>
		</html:tr>
	</html:table>
	<html:table list="shipDetailList" bean="detailBean" styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" isHead="true" >
		<html:tr headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
			<html:td label="行号" property="itemCode" style="width:80px;" width="80px"/>		
			<html:td label="工厂" property="factoryName"   width="80px"/>
			<html:td label="产品" property="productName"   width="80px"/>		
			<html:td label="物料" property="codetailCertificateDesc"  />
			<html:td label="订单数"  width="80px">
				<html:text  id="orderAmount"  name="orderAmount" value="$[detailBean.orderAmount]" size="12"  readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>
			<html:td label="申请数"  width="80px">
				<html:text  id="applyTonNum$[detailBean.codetailCertificate]"  name="applyTonNum" value="$[detailBean.applyTonNum]" size="12"  readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>
			<html:td label="包数" width="80px">
				<html:text  id="applyPackNum$[detailBean.codetailCertificate]"  name="applyPackNum" value="$[detailBean.applyPackNum]" readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>	
			<html:td label="备注">
				<html:text  id="shipNotice"  name="shipNotice"  value="$[detailBean.shipDetailNotice]" readonly="true" style="width:98%;border:0px;text-align:left;"/>
			</html:td>
		</html:tr>
	</html:table>

	
	
	
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				
				<btn:return href="contoller.do?operation=listShip"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>