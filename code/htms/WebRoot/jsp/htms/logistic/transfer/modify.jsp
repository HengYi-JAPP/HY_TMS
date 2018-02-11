<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean,com.mobilecn.utils.random.IntRandom" %>
<%@page import="com.zzy.htms.user.HtmsUserBean"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 

List<CustomerAddrBean> addrLists = (List<CustomerAddrBean>)request.getAttribute("addrLists");
String caddrId = request.getParameter("caddrId");
 HtmsUserBean userBean = (HtmsUserBean)request.getSession().getAttribute("userBean");
 int isTraders=userBean==null?0:userBean.getCustomerType();
%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/transfer/modify.js,js/MathCalculator.js"/>
<com:loader css="css/common/sub-table-list.css" switchbox="true"/>


<html:form id="modifyForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="doModifyTransfer"/>
	<html:hidden id="modifyTime" name="modifyTime" value="<%=tools.tool.getDateTime() %>"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>

	<html:hidden id="currentTransId" name="currentTransId" value="$[tranferViewBean.transId]"/>
	<html:hidden id="currentShipId" name="currentShipId" value="$[tranferViewBean.shipId]"/>
	
	
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.transfer.title.modify") %>' name="title"/>
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
			<td width="30%">
				<html:value  value="$[tranferViewBean.corderCode]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				是否加急
			</td>
			<td width="50%">
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
				<html:text id="shipCode" name="shipCode" value="$[tranferViewBean.shipCode]" readonly="true"  style="border:0px;"></html:text>
			</td>
			<td class="edit-talbe-label">
				<html:label label="{$jsp.htms.sales.customeraddr.address#}"></html:label>
			</td>
			<td>
				<html:value value="$[tranferViewBean.areaName]" />
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
		<tr class="trCell">
			<td class="edit-talbe-label">
				备注
			</td>
			<td colspan="3">
				<html:value value="$[tranferViewBean.shipNotice]" />
			</td>
		</tr>
	</table>
		
		
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				分拆细项信息（调拨单号：<html:value value="$[tranferViewBean.transferCode]"/> ）
			</html:td>
		</html:tr>
	</html:table>
	<html:table list="detailList" bean="detailBean" styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" isHead="true" >
		<html:tr headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
			<html:td label="行号" property="itemCode" style="width:80px;" width="80px"/>	
			<html:td label="工厂" property="factoryName"   width="80px"/>
			<html:td label="产品" property="productName"   width="80px"/>		
			<html:td label="物料" property="codetailCertificateDesc" width="220px" />
				
			<html:td label="SAP单价" property="freight"  width="70px"/>
			<html:td label="单价" property="unitPrice"  width="70px"/>
				<html:td  id="totlePostage" label="运费"  width="70px" >
			      
			</html:td>	
			<html:td label="当前重量" width="80px" style="text-align:right;">
				<html:hidden id="currentTransDetailId" name="currentTransDetailId" value="$[detailBean.transDetailId]"/>
				<html:hidden id="itemCode" name="itemCode" value="$[detailBean.codetailCertificate]"/>
				<html:text  id="appliableTon$[detailBean.itemCode]"  name="appliableTon" value="$[detailBean.applyTonNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
				<html:hidden  id="initAppliableTon$[detailBean.itemCode]"  name="initAppliableTon" value="$[detailBean.applyTonNum]" />
				<script>itemsNos[itemsNos.length]='<html:value value="$[detailBean.itemCode]"/>';</script>
			</html:td>	
			
			<html:td label="修改后重量"  width="80px">
				<html:text  id="splitTonNum$[detailBean.itemCode]"  name="splitTonNum" onchange="validateSplitTonNum('$[detailBean.itemCode]');" size="12" style="width:98%;text-align:right;"/>
			</html:td>
			<html:td label="当前包数" width="80px" style="text-align:right;">
				<html:text  id="appliablePack$[detailBean.itemCode]"  name="appliablePack" value="$[detailBean.applyPackNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
				<html:hidden  id="initAppliablePack$[detailBean.itemCode]"  name="initAppliablePack" value="$[detailBean.applyPackNum]" />
			</html:td>
			<html:td label="修改后包数" width="80px">
				<html:text  id="splitPackNum$[detailBean.itemCode]"  name="splitPackNum"  onchange="validateSplitPackNum('$[detailBean.itemCode]');" size="12" style="width:98%;text-align:right;"/>
			</html:td>
			<html:td label="备注">
				<html:text  id="splitNotice$[detailBean.itemCode]"  name="splitNotice"  value="$[detailBean.transDetailNotice]"  style="width:98%;" />
			</html:td>
		</html:tr>
	</html:table>
<script>

	
</script>
<html:table  styleClass="dgbackground" cellSpacing="0"  border="1"   style="width:100%; border-collapse: collapse;" align="center" >
		<html:tr headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
			<html:td rowspan="2" width="686px">合计</html:td>
				
			<html:td  width="80px" style="text-align:right;">
				
				<html:text  id="totalTon"  name="totalTon" value="$[tranferViewBean.applyTonNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
				<html:hidden  id="initTotalTon"  name="initTotalTon" value="$[tranferViewBean.applyTonNum]" />
			</html:td>	
			<html:td  width="80px">
				<html:text  id="splitTotalTon"  name="splitTotalTon"  value="0" readonly="true" size="12" style="width:98%;border:0px;text-align:right;"/>
			</html:td>
			<html:td  width="80px" style="text-align:right;">
				<html:text  id="totalPack"  name="totalPack" value="$[tranferViewBean.applyPackNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
				<html:hidden  id="initTotalPack"  name="initTotalPack" value="$[tranferViewBean.applyPackNum]" />
			</html:td>
			<html:td width="80px">
				<html:text  id="splitTotalPack"  name="splitTotalPack"  value="0" readonly="true" size="12" style="width:98%;border:0px;text-align:right;"/>
			</html:td>
			<html:td>&nbsp;
			</html:td>
		</html:tr>
		<html:tr headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
				
			<html:td colspan="2" style="text-align:center;">
				
				<html:value value="$[tranferViewBean.applyTonNum]"/>
			</html:td>	
			<html:td colspan="2"   style="text-align:center;">
				<html:value value="$[tranferViewBean.applyPackNum]"/>
			</html:td>
			<html:td>&nbsp;
			</html:td>
		</html:tr>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:void(0);"  onclick="javascript:validateForm();"/>
				<btn:return href="contoller.do?operation=listTransfer"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
