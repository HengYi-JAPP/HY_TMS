<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="customerForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<com:loader  simplendar="true" />
	<html:hidden id="operation" name="operation" value="listCustomer"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.customer.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1654" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="HCNIKOAFEBHKHJOHGHBFEFHKCFHPPOAIKLOHLEJOAFHKGKKEFNFJJBIOLPCFBBJA" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customercode#}" ></html:label>
			</td>
			<td  id="KGEJOFNBFIOOOAGKKFMJBNKBFPMKGGEPEMAHHHLJGKPFGCBNEJIBGEHANMCHPBNO" colSpan="1" rowSpan="1" >
				<html:text  id="customerCodeSH"  name="customerCodeSH" value="$[customerCodeSH]" />
			</td>
			<td class="edit-talbe-label" id="CEKAMFEKJFCKOKMKMEKIJKNNLOKJJAJGAHKPJJCPJNONOKIOEKKKHAGPJAGNBJPC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</td>
			<td  id="BJNKIIFMINPHBNJKNIMHHIENJHGCMAFMIKLKCAKPJPCCIIBMJEENEIFOKNJKAJLO" colSpan="1" rowSpan="1" >
				<html:text  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]" />
				<span style="float:right;">
					<btn:search href="javascript:submit('customerForm')"/>
					<btn:reset href="javascript:cleanForm('customerForm')"/>
				</span>
			</td>
		</tr>
		<%--<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<btn:new href="contoller.do?operation=toAddCustomer"/>
				<btn:delete href="javascript:batchDelete('customerForm','checkCustomerId','','deleteCustomer');" />
			</td>
		</tr>
	--%></table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;margin-top: 10px;" align="center" list="customerList" bean="customerBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<%--<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="checkCustomerId" id="checkCustomerId" value="CustomerBean.customerId" /></html:td>--%>
			<html:td  label="{$jsp.htms.sales.customer.customercode#}" >
					<html:a  href="contoller.do?operation=viewCustomer&isModify=0&customerId=$[customerBean.customerId]">
						<html:value value="$[customerBean.replaceCustomerCode]"/>
					</html:a>
			</html:td>
			<html:td width="250px"  label="{$jsp.htms.sales.customer.customername#}">
					<html:a  href="contoller.do?operation=viewCustomer&isModify=0&customerId=$[customerBean.customerId]">
						<html:value value="$[customerBean.customerName]"/>
					</html:a>
			</html:td>
			
			<html:td  label="贸易商">
					<com:switchbox boxId="customerType" varValue="$[customerBean.customerType]" talbeName="HTMS_CUSTOMER" idValue="customerId" offValue="0" varName="customerType" onValue="1"  idName="customerId"  offLabel="否" onLabel="是"  ajaxUrl="contoller.do" isSave="false" hideBox="true"/>
			</html:td>
			<html:td  label="{$jsp.htms.sales.customer.customeramount#}"  property="customerAmount" />			
			<html:td  label="{$jsp.htms.sales.customer.customernotice#}"  property="customerNotice" />
			<%--
			<html:td  label="View"><btn:view href="contoller.do?operation=viewCustomer&isModify=0&customerId=$[customerBean.customerId]"/></html:td> --%>
			<%--<html:td  label="操作">
				<btn:modify href="contoller.do?operation=viewCustomer&isModify=1&customerId=$[customerBean.customerId]"/>
				<btn:delete href="contoller.do?operation=deleteCustomer&customerId=$[customerBean.customerId]"/>
			</html:td>
		--%></html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkCustomerId" checkId="checkAll"/>
				<com:page formId="customerForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
