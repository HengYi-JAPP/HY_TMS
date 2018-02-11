<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
	
%>
<head><base href="<%=basePath%>"></head>

<com:loader  js="js/common/common.js,jsp/htms/dictionary/transprice/transprice.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="transPriceForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"  />
	
	<html:hidden id="operation" name="operation" value="addTransPrice"/>
	<html:hidden id="createTime" name="createTime" value="<%=tools.tool.getDateTime() %>"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true"/>
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.transprice.title.add") %>' name="title"/>
	</jsp:include>
	
	<html:table id="1647" styleClass="edit-talbe" list="routeViewBean" bean="routeViewBean">
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label">
			<html:label label="{$jsp.htms.dictionary.transprice.route#}"></html:label>
			</html:td>
			<html:td  colspan="4"  style="text-align:left;vertical-align:middle;font-size:12px">
			<html:value value="routeViewBean.productName"/>:
			<html:value value="routeViewBean.factoryName"/>-><html:value value="routeViewBean.areaName"/>
			<html:hidden id="checkRouteId" name="checkRouteId" value="routeViewBean.routeId"/>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label" >
				<html:label  label="{$jsp.htms.dictionary.transprice.pricetype#}" ></html:label>
			</html:td>
			<html:td width="180px">
				<html:select id="priceType" name="priceType"  list="price_type_list" isCascade="true" isCascadeSource="true" cascadeTarget="priceUnit">
					<html:option label="typeName" value="typeId" />
				</html:select>
			</html:td>
			<html:td styleClass="edit-talbe-label">
				<html:label  label="{$jsp.htms.dictionary.transprice.priceunit#}" ></html:label>
			</html:td>
			<html:td  >
				<html:select id="priceUnit" name="priceUnit"  list="price_unit_list" isCascade="true"  cascadeValue="typeId">
					<html:option label="dicName" value="targetDicId" />
				</html:select>
			</html:td>			
			<html:td   style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="typeTip" style="font-size:12px;">请选择计价模式和单位。</font>
			</html:td>
		</html:tr>
		<%--
		<html:tr styleClass="trCell">
			<html:td colspan="5" rowspan="1" style="text-align:left;vertical-align:middle;font-size:14px;">
				计价区间
			</html:td>
		</html:tr> --%>
		<html:tr styleClass="trCell">
			<html:td styleClass="edit-talbe-label"  colspan="1" rowspan="1">
				开始区间
			</html:td>
			<html:td >
				<html:text  id="priceStart"  name="priceStart" />
			</html:td>
			<html:td styleClass="edit-talbe-label" >
				结束区间
			</html:td>
			<html:td width="180px">
				<html:text  id="priceEnd"  name="priceEnd" />
			</html:td>
			<html:td style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="priceTip" style="font-size:12px;">开始区间须填写，为整数或保留两位小数。</font>
			</html:td>
		</html:tr>
		<html:tr styleClass="trCell">
			<html:td    styleClass="edit-talbe-label" >
				计费模式
			</html:td>
			<html:td  style="text-align:left;vertical-align:middle;font-size:12px">
				<html:hidden id="freightModel" name="freightModel" value="1"/>
				<html:radio id="singleModel" name="selFreightModel" label="按单价计算" checked="true" onclick="selectFreightModel('singlePrice','1');" />
				<html:radio id="allModel"  name="selFreightModel" label="按一口价计算" onclick="selectFreightModel('allPrice','2');"/>
			</html:td>
			<html:td styleClass="edit-talbe-label" >
				生效日期
			</html:td>
			<html:td width="180px">
				<com:simplendar id="validateDate" name="validateDate" defaultToday="true"/>
			</html:td>
			<html:td style="text-align:left;vertical-align:middle;font-size:12px">
				<font id="vdateTip" style="font-size:12px;">须指定生产日期。</font>
			</html:td>
		</html:tr>
		
	</html:table>
	<div id="singlePrice" style="display:block;">
		<table  class="edit-talbe" >
		<tr>
			<td class="edit-talbe-label" >
				客户运价
			</td>
			<td width="180px">
				<html:text  id="customerPrice"  name="customerPrice" />
			</td>
			<td class="edit-talbe-label" >
				承运商运价
			</td>
			<td width="180px">
				<html:text  id="carrierPrice"  name="carrierPrice" />
			</td>
			<td  style="text-align:left;vertical-align:middle;font-size:12px;">
				<font id="singleTip" style="font-size:12px;">请填写运价，为整数或保留两位小数。</font>
			</td>
		</tr>
		</table>
	</div>
	<div id="allPrice" style="display:none;">
		<table  class="edit-talbe" >
		<tr >	
			<td class="edit-talbe-label">
				客户运价
			</td>
			<td  width="180px">
				<html:text  id="customerOnePrice"  name="customerOnePrice" />
			</td>
			
			<td class="edit-talbe-label">
				承运商运价
			</td>
			<td  width="180px">
				<html:text  id="carrierOnePrice"  name="carrierOnePrice" />
			</td>
			<td  style="text-align:left;vertical-align:middle;font-size:12px;">
				<font id="allTip" style="font-size:12px;">请填写运价，为整数或保留两位小数。</font>
			</td>
		</tr>
	</table>
	</div>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:validateTransPrice(true)"/>
				<btn:return href="contoller.do?operation=listTransPrice"/>
			</html:td>
		</html:tr>
	</html:table>
	
</html:form>
