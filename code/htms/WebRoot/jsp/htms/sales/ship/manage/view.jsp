<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean,com.mobilecn.utils.random.IntRandom" %>
<%@page import="com.zzy.htms.user.HtmsUserBean"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
 HtmsUserBean userBean = (HtmsUserBean)request.getSession().getAttribute("userBean");
 int isTraders=userBean==null?0:userBean.getCustomerType();
%>
<head>
<base href="<%=basePath%>">
<%String shipCode = tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(10,99); %>
</head>
<com:loader  js="js/common/common.js,js/MathCalculator.js,js/htms/custorder/custorder.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="custOrderForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"   />
	<html:hidden id="operation" name="operation" value="doShipApply"/>
	<html:hidden id="isValidate" name="isValidate" value="1"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="shipDetailStatus" name="shipDetailStatus" value="2"/>
	<html:hidden id="applyStatus" name="applyStatus" value="2"/>
	<html:hidden id="corderId" name="corderId" value="$[custOrderViewBean.corderId]"/>
	<html:hidden id="orderCode" name="orderCode" value="$[custOrderViewBean.corderId]"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.ship.title.add") %>' name="title"/>
	</jsp:include>
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				订单信息：<com:switchbox boxId="displayOrderDetail" varValue="1" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName="customerId"  offLabel="隐藏订单信息" onLabel="显示订单信息"  ajaxUrl="contoller.do" isSave="false" onBoxClick="showOrHideOrderDetail('displayOrderDetail','orderDetailInfo');"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是否加急：<com:switchbox boxId="isUrgent" varValue="0" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName=""  offLabel="不加急" onLabel="加急"  ajaxUrl="contoller.do" isSave="false" />
				
			</html:td>
		</html:tr>
	</html:table>
	<table id="orderDetailInfo" class="edit-talbe" style="display:block">
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td width="300px">
				<html:value  value="$[custOrderViewBean.corderCode]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.custorder.fetchfactory#}" ></html:label>
			</td>
			<td>
				<html:value  value="$[custOrderViewBean.fetchFactory]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.customeraddr.customerid#}" ></html:label>
			</td>
			<td>
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
			<html:td styleClass="edit-talbe-label">
				申请编号
			</html:td>
			<html:td >
				<html:text id="shipCode" name="shipCode" value="<%=shipCode %>" readonly="true"  style="border:0px;"></html:text>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				<html:label label="{$jsp.htms.sales.customeraddr.address#}"></html:label>
			</html:td>
			<html:td>
				<html:select list="addrLists" id="caddrId" name="caddrId">
					<html:option label="areaName" value="caddrId" selected="true"></html:option>
				</html:select>
				<btn:new href="contoller.do?operation=toAddNewAddress&isApply=1&corderId=$[custOrderViewBean.corderId]&customerCode=$[custOrderViewBean.customerCode]"/>
				<span id="caddrIdTip" style="font-size:12px;color:red;"></span>
			</html:td>
		</html:tr>
	</table>
	<%if(isTraders==1){ %>
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				<com:switchbox boxId="selfFetch" varValue="0" talbeName="" idValue="" offValue="0" varName="" onValue="1"  idName="customerId"  offLabel="贸易商自提" onLabel="贸易商自提"  ajaxUrl="contoller.do" isSave="false" onBoxClick="showOrHideOrderDetail('selfFetch','showFecthInfo');"/>
			</html:td>
		</html:tr>
	</html:table>
	<html:table id="showFecthInfo" styleClass="edit-talbe"  style="display:none;" >
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
				提货司机
			</html:td>
			<html:td  width="300px">
				<html:text id="fetchDriver" name="fetchDriver" value="" ></html:text>
				<span id="fetchDriverTip" style="font-size:12px;color:red;"></span>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				联系方式
			</html:td>
			<html:td >
				<html:text id="fetchMobile" name="fetchMobile" value="" ></html:text>				
				<span id="fetchMobileTip" style="font-size:12px;color:red;"></span>
			</html:td>
		</html:tr>	
		<html:tr styleClass="trCell">
			
			<html:td styleClass="edit-talbe-label">
				车牌号
			</html:td>
			<html:td colspan="3">
				<html:text id="fetchCar" name="fetchCar" value="" ></html:text>
				<span id="fetchCarTip" style="font-size:12px;color:red;"></span>
			</html:td>
		</html:tr>	
	</html:table>
	<%} %>
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				发货申请信息：
			</html:td>
		</html:tr>
	</html:table>
	<html:table list="orderDetailList" bean="detailBean" styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" isHead="true" >
		<html:tr headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
			<html:td label="行号" property="codetailCertificate" style="width:80px;" width="80px"/>			
			<html:td label="物料" property="codetailCertificateDesc"  style="width:120px;" width="120px"/>		
			<html:td label="工厂" property="meterialFactory"   width="80px"/>
				
			<html:td label="可申请数" width="80px" style="text-align:right;">
				<html:hidden id="codetailId" name="codetailId" value="$[detailBean.codetailId]"/>
				<html:hidden id="itemCode" name="itemCode" value="$[detailBean.codetailCertificate]"/>
				<html:text  id="appliableAmount$[detailBean.codetailCertificate]"  name="appliableAmount" value="$[detailBean.appliableAmount]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
				<html:hidden  id="initAppliableAmount$[detailBean.codetailCertificate]"  name="initAppliableAmount" value="$[detailBean.appliableAmount]" />
				<script>itemsNos[itemsNos.length]='<html:value value="$[detailBean.codetailCertificate]"/>';</script>
			</html:td>	
			<html:td label="已申请数" width="80px" style="text-align:right;">
				<html:text  id="appliedAmount$[detailBean.codetailCertificate]"  name="appliedAmount" value="$[detailBean.appliedAmount]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
				<html:hidden  id="initAppliedAmount$[detailBean.codetailCertificate]"  name="initAppliedAmount" value="$[detailBean.appliedAmount]" />
			</html:td>
			<html:td label="申请吨数"  width="80px">
				<html:text  id="applyTonNum$[detailBean.codetailCertificate]"  name="applyTonNum" onblur="validateApplyTonNum('$[detailBean.codetailCertificate]');" size="12" style="width:98%;text-align:right;"/>
			</html:td>
			<html:td label="申请包数" width="80px">
				<html:text  id="applyPackNum$[detailBean.codetailCertificate]"  name="applyPackNum" onblur="validateApplyPackNum('$[detailBean.codetailCertificate]');" size="12" style="width:98%;text-align:right;"/>
			</html:td>
			<html:td label="备注">
				<html:text  id="shipNotice"  name="shipNotice" style="width:98%;" />
			</html:td>
		</html:tr>
	</html:table>

	
	
	
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:void(0)" onclick="validateForm();" id="_save" />
				<btn:return href="contoller.do?operation=listCustOrder"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>