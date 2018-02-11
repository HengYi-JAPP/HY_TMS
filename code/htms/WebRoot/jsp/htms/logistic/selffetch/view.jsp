<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean,com.mobilecn.utils.random.IntRandom" %>
<%@page import="com.zzy.htms.user.HtmsUserBean"%>
<%@page import="com.zzy.htms.logistic.transport.TransportBean"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 

List<CustomerAddrBean> addrLists = (List<CustomerAddrBean>)request.getAttribute("addrLists");
String caddrId = request.getParameter("caddrId");

%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/split/split.js,js/MathCalculator.js"/>
<com:loader css="css/common/sub-table-list.css" switchbox="true"/>

	
	
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='查看调拨单信息' name="title"/>
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
				<html:value  value="$[tranferViewBean.corderCode]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				是否加急
			</td>
			<td>
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
			<td width="52%">
				<html:value value="$[tranferViewBean.areaName]" />
				<html:value value="$[tranferViewBean.caddrDetail]" />
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
			   <logic:if condition="$[tranferViewBean.selfFetch]==1">
			              贸易商自提
			   </logic:if>
			   <logic:if condition="$[tranferViewBean.selfFetch]==9">
			              贸易商自提
			   </logic:if>
			   <logic:if condition="$[tranferViewBean.selfFetch]==2">
			              自备车自提
			   </logic:if>
			    <logic:if condition="$[tranferViewBean.selfFetch]==10">
			              自备车自提
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
				<html:value  value="$[tranferViewBean.fetchDriver]"  />
			</html:td>
			<html:td styleClass="edit-talbe-label">
				联系方式
			</html:td>
			<html:td width="52%">
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
	
	<html:table id="1667" styleClass="edit-talbe" >
		<html:tr styleClass="trCell">
			<html:td>
				细项信息
			</html:td>
		</html:tr>
	</html:table>
	<html:table list="detailList" bean="detailBean" styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" isHead="true" >
		<html:tr headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
			<html:td label="行号" property="itemCode" style="width:80px;" width="80px"/>	
			<html:td label="工厂" property="factoryName"   width="80px"/>
			<html:td label="产品" property="productName"   width="80px"/>		
			<html:td label="物料" property="codetailCertificateDesc" width="220px" />
			<html:td label="数量" width="80px" style="text-align:right;">
				<html:text  id="appliableTon$[detailBean.itemCode]"  name="appliableTon" value="$[detailBean.applyTonNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
							</html:td>	
			
		
			<html:td label="包数" width="80px" style="text-align:right;">
				<html:text  id="appliablePack$[detailBean.itemCode]"  name="appliablePack" value="$[detailBean.applyPackNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
			</html:td>
			
			<html:td label="备注">
				<html:value value="$[detailBean.transDetailNotice]" />
			</html:td>
		</html:tr>
	</html:table>
<html:table  styleClass="dgbackground" cellSpacing="0"  border="1"   style="width:100%; border-collapse: collapse;" align="center" >
		<html:tr headerStyleClass="dgHeaderStyle" styleClass="dgAlternatingItemStyle" >
			<html:td  width="469px">合计</html:td>
				
			<html:td  width="80px" style="text-align:right;">
				
				<html:text  id="totalTon"  name="totalTon" value="$[tranferViewBean.applyTonNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
							</html:td>	
			
			<html:td  width="80px" style="text-align:right;">
				<html:text  id="totalPack"  name="totalPack" value="$[tranferViewBean.applyPackNum]" size="12" readonly="true" style="width:98%;border:0px;text-align:right;"/>
							</html:td>
			
			<html:td>&nbsp;
			</html:td>
		</html:tr>
	</html:table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
			
				<btn:return href="contoller.do?operation=listSelfFtech"/>
			</html:td>
		</html:tr>
	</html:table>
