<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<html:form id="customerForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true" />
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.customer.title.view") %>' name="title"/>
	</jsp:include>
	<table id="1653" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="POGFLJMCEGLHLFJOCKBKMNFHHMGNJPBJPBEKFNIPONMABAMNKKOGJHBHNBLKMAKG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customercode#}" ></html:label>
			</td>
			<td  id="EKOKJPLNELKHIKNOCAAPBFKAGIFKBJONJLCHJOJEENEAIAKLPNGEBHLHGAMKKOEP" colSpan="1" rowSpan="1">
				<html:value  value="$[customerViewBean.customerCode]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="HGHHJGECHPJJBFOGJFPFGHGOBKICMFCILKPJLPAEOKMCCOCILIFPOJHMENFIBGKH" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</td>
			<td  id="KKILPBAKBHJBKBKCOJEHAHLIMPGGCOHCALIGBNCMJNGLNKGHBNOLACOPNKEJCLKL" colSpan="1" rowSpan="1">
				<html:value  value="$[customerViewBean.customerName]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" >
				是否贸易商
			</td>
			<td>
				<com:switchbox boxId="customerType" varValue="$[customerViewBean.customerType]" talbeName="HTMS_CUSTOMER" idValue="customerId" offValue="0" varName="customerType" onValue="1"  idName="customerId"  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" disabled="true"/>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="MONNCALOMKPFKKFCKCKHKGBKFHIHKEHLAEGLECIGEHKPHKEBGMOEJGMJCPGPINGM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customeramount#}" ></html:label>
			</td>
			<td  id="PIILAJOLJFPJCGMNKKHGCGKBENCEPGKOHCCLEMKAIHCKOKEIFNAPOKBANGGPMOEC" colSpan="1" rowSpan="1">
				<html:value  value="$[customerViewBean.customerAmount]" ></html:value>
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="MKEGFKENBHPJIMEKMLOCMOGMKPCFKIJBGBEEMIGHKMECGBOEEMMHEBBFLKMKNAIJ" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customernotice#}" ></html:label>
			</td>
			<td  id="LOBPBCNOJHNKLGGIMHOJJJPKCIFJKAIPIMOOKPCJEIKMKKJHECAKFCMKGNGGKMLO" colSpan="1" rowSpan="1">
				<html:value  value="$[customerViewBean.customerNotice]" ></html:value>
			</td>
		</tr>
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:return href="contoller.do?operation=listCustomer"/>
			</html:td>
		</html:tr>
	</html:table>
</html:form>
