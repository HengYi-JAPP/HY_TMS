<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="customerForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true" />
	<html:hidden id="operation" name="operation" value="addCustomer"/>
	<html:hidden id="isValidate"  name="isValidate" value="1"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" validator="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.customer.title.add") %>' name="title"/>
	</jsp:include>
	<table id="1651" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="HKEPOOOLBKJELNGKHAENCEMGEKCKGOBCLJCGBHJEKJFGEPOPMBNJFHGKKKAEBNKC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customercode#}" ></html:label>
			</td>
			<td  id="PJJKNFMFHEOLCOOIACCFFLKNKPKNKJOKNNJIPEPHIFJBMANBAIBEGCAEEIIOEGHK" colSpan="1" rowSpan="1">
				<html:text  id="customerCode"  name="customerCode" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="MAEKLKBEPCOJBIBJAFKLEHLEOIENHIKGKGMKKPBOAENLAFPKKHGPPAKKCFONLALK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</td>
			<td  id="MFHCMNPEBJILLGNNENKAMHFPJBJFKJEAIBGHCOKJFHMAIHOKIANFMOKHGCLGJKCO" colSpan="1" rowSpan="1">
				<html:text  id="customerName"  name="customerName" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" >
				是否贸易商
			</td>
			<td>
				<com:switchbox boxId="customerType" varValue="0" talbeName="HTMS_CUSTOMER" idValue="customerId" offValue="0" varName="customerType" onValue="1"  idName="customerId"  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" isSave="false"/>
			</td>
		</tr>
		
		<tr class="trCell">
			<td class="edit-talbe-label" id="HNAPJJPFFBCIPCBLOEJGCPLILIBIAFMJHHGACPBCBBPPNJJNLFGOABMBILAAHEAC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customeramount#}" ></html:label>
			</td>
			<td  id="CHJOPBMHKEIAJLFIJGNCMLINLPAPHKGIPMABNGKIAIHIMAGKEKKALAOHJAONKCON" colSpan="1" rowSpan="1">
				<html:text  id="customerAmount"  name="customerAmount" />
			</td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="OGGKIJPNNOEJBMGMHJJJIBGKACHAKKLLLMKMIAGFEPLJOGJKHOKLEOCFAHGKCOIK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customernotice#}" ></html:label>
			</td>
			<td  id="OINNBGKHIIJPCCMIOALIFBGMIHOHFKMKMMEBPNBOELKLFLPGJHJHAKPBGLFKEKHL" colSpan="1" rowSpan="1">
				<html:textarea id="customerNotice"  name="customerNotice" cols="40" rows="5"></html:textarea>
			</td>
		</tr>
		
	</table>
	<html:table  cellSpacing="0"  align="center" isHead="false" >
		<html:tr >
			<html:td >
				<btn:save href="javascript:__vsubmit('customerForm')"/>
				<btn:return href="contoller.do?operation=listCustomer"/>
			</html:td>
		</html:tr>
	</html:table>
	<com:validator formId="customerForm" showNormal="true" submitValidate="true" >	
			<com:vElement id="customerCode"  types="isnull" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="customerName"  types="isnull" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
			<com:vElement id="customerAmount"  types="number-spot" event="onblur">
				<com:init size="20" maxlength="60" ></com:init>
			</com:vElement>
		</com:validator>
</html:form>
