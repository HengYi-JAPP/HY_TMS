<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="custOrderForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"  />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.custorder.title.view") %>' name="title"/>
	</jsp:include>
	<table id="1661" class="edit-talbe">
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
		
		<tr class="trCell">
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.custorderdetail.codetailcertificatedesc#}" ></html:label>
			</td>
			<td>
				<html:value  value="$[custOrderViewBean.codetailCertificateDesc]" ></html:value>
			</td>
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.custorderdetail.meterialno#}" ></html:label>
			</td>
			<td>
				<html:value  value="$[custOrderViewBean.meterialNo]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
					<html:label  label="{$jsp.htms.sales.custorderdetail.orderamount#}" ></html:label>
			</td>
			<td  rowSpan="1">
				<html:text id="orderAmount" name="orderAmount" value="$[custOrderViewBean.orderAmount]" readonly="true" style="border:0px;"></html:text>
			</td>
			<td class="edit-talbe-label">
					包数
			</td>
			<td rowSpan="1">
				<html:text id="orderAmount" name="orderAmount" value="$[custOrderViewBean.projectVolume]" readonly="true" style="border:0px;"></html:text>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
					<html:label  label="{$jsp.htms.sales.custorderdetail.appliableamount#}" ></html:label>
			</td>
			<td colSpan="1" rowSpan="1">
				<logic:if condition="$[custOrderViewBean.appliableAmount]==''">
					<html:text id="showAppliableAmount" name="showAppliableAmount" value="$[custOrderViewBean.orderAmount]" readonly="true" style="border:0px;"></html:text>
				</logic:if>
				<logic:if condition="$[custOrderViewBean.appliableAmount]!=''">
					<html:text id="showAppliableAmount" name="showAppliableAmount" value="$[custOrderViewBean.appliableAmount]" readonly="true" style="border:0px;"></html:text>
				</logic:if>
				
			</td>
			<td class="edit-talbe-label">
				<html:label  label="{$jsp.htms.sales.custorderdetail.appliedamount#}" ></html:label>
			</td>
			<td colSpan="1" rowSpan="1">
				<html:text id="showAppliedAmount" name="showAppliedAmount" value="$[custOrderViewBean.appliedAmount]" readonly="true"  style="border:0px;"></html:text>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label">
					运费
			</td>
			<td  rowSpan="1">
				<html:text id="freight" name="freight" value="$[custOrderViewBean.freight]" readonly="true" style="border:0px;"></html:text>
			</td>
			<td class="edit-talbe-label">
					单价
			</td>
			<td rowSpan="1">
				<html:text id="unitPrice" name="unitPrice" value="$[custOrderViewBean.unitPrice]" readonly="true" style="border:0px;"></html:text>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listCustOrder"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
