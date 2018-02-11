<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="driverForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listDriverToLogistics"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.driver.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1690" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				承运商
			</td>
			<td  style="text-align:left;" >
				<html:select id="carrierIdSH" name="carrierIdSH"  list="carrierList">
					<html:option label="carrierName" value="carrierId" selected="$[carrierIdSH]"/>
				</html:select>
			</td>
			<td class="edit-talbe-label" id="NINFKOLNIELHFKLFKPGIECHIEJFAHFCAOKPNHCOEHPIJNIKBEHJKLILAHKGHPKLN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivercode#}" ></html:label>
			</td>
			<td  id="PPKBCCNLEBLNKLIOINFFGEPGLABHKFBLOOIOKPGAKPOKFKEMHNGFMEJAFFBPHBPM" colSpan="1" rowSpan="1">
				<html:text  id="driverCodeSH"  name="driverCodeSH"  value="$[driverCodeSH]"/>
			</td>
			<td class="edit-talbe-label" id="AGNOKGGIPEFKNNEMCCOMCMAHLKLOJAKFHGMCIIBAEAGBJJIFHPPFIHHGEFHIGCHG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivername#}" ></html:label>
			</td>
			<td  id="CIBNIOMMOKNIGOCCMIIKKOJEAKCBJHKHJOKGMCFKLKIKBKGEKEAMJEJKGLPLHLEN" colSpan="1" rowSpan="1">
				<html:text  id="driverNameSH"  name="driverNameSH"  value="$[driverNameSH]"/>
				<span style="float:right;">
					<btn:search href="javascript:submit('driverForm')"/>
					<btn:reset href="javascript:cleanForm('driverForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<btn:new href="contoller.do?operation=toAddDriverToLogistics"/>
				<btn:delete href="javascript:batchDelete('driverForm','checkDriverId','','deleteDriverToLogistics');" />
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="driverList" bean="driverBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="checkDriverId" id="checkDriverId" value="DriverBean.driverId" /></html:td>
			<html:td  label="{$jsp.htms.logistic.driver.drivercode#}">
				<html:a href="contoller.do?operation=viewDriverToLogistics&isModify=0&driverId=$[driverBean.driverId]"><html:value value="$[driverBean.driverCode]"></html:value> </html:a>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.driver.drivername#}">
				<html:a href="contoller.do?operation=viewDriverToLogistics&isModify=0&driverId=$[driverBean.driverId]"><html:value value="$[driverBean.driverName]"></html:value> </html:a>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.driver.driveridnum#}">
				<html:value value="$[driverBean.driverIdNum]"></html:value>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.driver.drivermobile#}">
				<html:value value="$[driverBean.driverMobile]"></html:value>
			</html:td>
			<html:td  label="操作">
				<btn:modify href="contoller.do?operation=viewDriverToLogistics&isModify=1&driverId=$[driverBean.driverId]"/>
				<btn:delete href="contoller.do?operation=deleteDriverToLogistics&driverId=$[driverBean.driverId]"/>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkDriverId" checkId="checkAll"/>
				<com:page formId="driverForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
