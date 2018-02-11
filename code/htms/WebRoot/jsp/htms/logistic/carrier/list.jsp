<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="carrierForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listCarrier"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.carrier.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1694" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="KCEOEHKFGMKAINHINNEKKMMLAMONLABJNJCOILIMEFCPHCKCOAOHNCABKEPPJILE" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriername#}" ></html:label>
			</td>
			<td  id="PHFNMIEIGNJHJPKHFMCAMFOPAAOOOCPCPMNHMPMLEKIHKLNBKGBBCPPKGPEGNFNC" colSpan="1" rowSpan="1">
				<html:text  id="carrierNameSH"  name="carrierNameSH" value="$[carrierNameSH]" />
			</td>
			<td class="edit-talbe-label" id="MANIJGBECLNLHEIIANMLPPJLPIEJKPGHIIEIKMBEKCKFFAEKAJAGCKGNPIOLEGLI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriercode#}" ></html:label>
			</td>
			<td  id="KFFKGMKBMAMPEMNFCIAACJIAKPNEPLGNCEMFOBFNMLNKKKFFGLAPKCABKFKBAGCB" colSpan="1" rowSpan="1">
				<html:text  id="carrierCodeSH"  name="carrierCodeSH"  value="$[carrierCodeSH]" />
			</td>
			<td class="edit-talbe-label" id="MANIJGBECLNLHEIIANMLPPJLPIEJKPGHIIEIKMBEKCKFFAEKAJAGCKGNPIOLEGLI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carrierarea#}" ></html:label>
			</td>
			<td  id="KFFKGMKBMAMPEMNFCIAACJIAKPNEPLGNCEMFOBFNMLNKKKFFGLAPKCABKFKBAGCB" colSpan="1" rowSpan="1">
				<html:text  id="carrierAreaSH"  name="carrierAreaSH"  value="$[carrierAreaSH]" />
			</td>
			<td class="edit-talbe-label" id="MANIJGBECLNLHEIIANMLPPJLPIEJKPGHIIEIKMBEKCKFFAEKAJAGCKGNPIOLEGLI" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.carrier.carriercontactor#}" ></html:label>
			</td>
			<td  id="KFFKGMKBMAMPEMNFCIAACJIAKPNEPLGNCEMFOBFNMLNKKKFFGLAPKCABKFKBAGCB" colSpan="1" rowSpan="1">
				<html:text  id="carrierContactorSH"  name="carrierContactorSH"  value="$[carrierContactorSH]" />
			</td>
		</tr>
		<tr class="trCell">
			<td   class="search-box"   id="searchBox" colSpan="8" rowSpan="1">
				<span style="float:right;">
					<btn:search href="javascript:submit('carrierForm')"/>
					<btn:reset href="javascript:cleanForm('carrierForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="8" rowSpan="1">
				<btn:new href="contoller.do?operation=toAddCarrier"/>
				<btn:delete href="javascript:batch_deletes('carrierForm','carrierId','','deleteCarrier');" />
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="carrierList" bean="carrierBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="carrierId" id="carrierId" value="CarrierBean.carrierId" /></html:td>
			<html:td  label="{$jsp.htms.logistic.carrier.carriername#}" >
				<html:a href="contoller.do?operation=viewCarrier&isModify=0&carrierId=$[carrierBean.carrierId]">
					<html:value value="$[carrierBean.carrierName]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.carrier.carriercode#}">
				<html:a href="contoller.do?operation=viewCarrier&isModify=0&carrierId=$[carrierBean.carrierId]">
					<html:value value="$[carrierBean.carrierCode]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.carrier.carrierarea#}">
				<html:a href="contoller.do?operation=viewCarrier&isModify=0&carrierId=$[carrierBean.carrierId]">
					<html:value value="$[carrierBean.carrierArea]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.carrier.carriercontactor#}">
				<html:a href="contoller.do?operation=viewCarrier&isModify=0&carrierId=$[carrierBean.carrierId]">
					<html:value value="$[carrierBean.carrierContactor]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.carrier.carriertelephone#}">
				<html:a href="contoller.do?operation=viewCarrier&isModify=0&carrierId=$[carrierBean.carrierId]">
					<html:value value="$[carrierBean.carrierTelephone]"/>
				</html:a>
			</html:td>
			
			<html:td  label="操作">
				<btn:modify href="contoller.do?operation=viewCarrier&isModify=1&carrierId=$[carrierBean.carrierId]"/>
				<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteCarrier&carrierId=$[carrierBean.carrierId]')"/>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="carrierId" checkId="checkAll"/>
				<com:page formId="carrierForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
