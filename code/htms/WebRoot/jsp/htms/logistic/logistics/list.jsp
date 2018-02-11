<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="logisticsForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listLogistics"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.logistics.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1710" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="EPOKJKMOFFKHBNCBJINFIGGJBGCAMFBNANEMOGOFLOINJJPMEPOJCLMOBLENGLFO" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticsname#}" ></html:label>
			</td>
			<td  id="PKBAHNMEFPGNCECBNOKKMNMIELKOLKBGGOLPIMNJJBOKOKEKGJMECFJHGAPENKFF" colSpan="1" rowSpan="1">
				<html:text  id="logisticsNameSH"  name="logisticsNameSH" value="$[logisticsNameSH]" />
			</td>
			<td class="edit-talbe-label" id="OCHABAPOKIIEGIPJFJAEJHKKKBNMAONJLPENIJEJOBFHBLJKABKIAMHEIBJNPJKM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticscode#}" ></html:label>
			</td>
			<td  id="LLMPPCHPNCCHNPJENNMNGLOKIEPBNOBOPAJFJLCLMKKBNMKCELJKOIHONFKHLGHJ" colSpan="1" rowSpan="1">
				<html:text  id="logisticsCodeSH"  name="logisticsCodeSH" value="$[logisticsCodeSH]" />
			</td>
			<td class="edit-talbe-label" id="LOGISTICSADDRESSSHLABEL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticsaddress#}" ></html:label>
			</td>
			<td  id="LOGISTICSADDRESSSH" colSpan="1" rowSpan="1">
				<html:text  id="logisticsAddressSH"  name="logisticsAddressSH"  value="$[logisticsAddressSH]" />
				
			</td>
			<td class="edit-talbe-label" id="LOGISTICSCODESHLABEL" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.logistics.logisticscontactor#}" ></html:label>
			</td>
			<td  id="LOGISTICSCODESH" colSpan="1" rowSpan="1">
				<html:text  id="logisticsContactorSH"  name="logisticsContactorSH"  value="$[logisticsContactorSH]" />
		</tr>
		<tr class="trCell">
			<td   class="search-box"   id="searchBox" colSpan="8" rowSpan="1">
				<span style="float:right;">
					<btn:search href="javascript:submit('logisticsForm')"/>
					<btn:reset href="javascript:cleanForm('logisticsForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="8" rowSpan="1">
				<btn:new href="contoller.do?operation=toAddLogistics"/>
				<btn:delete href="javascript:batchDelete('logisticsForm','checkLogisticsId','','deleteLogistics');" />
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="logisticsList" bean="logisticsBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="checkLogisticsId" id="checkLogisticsId" value="LogisticsBean.logisticsId" /></html:td>
			<html:td  label="{$jsp.htms.logistic.logistics.logisticsname#}">
				<html:a href="contoller.do?operation=viewLogistics&isModify=0&logisticsId=$[logisticsBean.logisticsId]">
					<html:value value="$[logisticsBean.logisticsName]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.logistics.logisticscode#}"  >
				<html:a href="contoller.do?operation=viewLogistics&isModify=0&logisticsId=$[logisticsBean.logisticsId]">
					<html:value value="$[logisticsBean.logisticsCode]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.logistics.logisticsaddress#}"  >
				<html:a href="contoller.do?operation=viewLogistics&isModify=0&logisticsId=$[logisticsBean.logisticsId]">
					<html:value value="$[logisticsBean.logisticsAddress]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.logistics.logisticscontactor#}"  >
				<html:a href="contoller.do?operation=viewLogistics&isModify=0&logisticsId=$[logisticsBean.logisticsId]">
					<html:value value="$[logisticsBean.logisticsContactor]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.logistic.logistics.logisticstelephone#}"  >
				<html:a href="contoller.do?operation=viewLogistics&isModify=0&logisticsId=$[logisticsBean.logisticsId]">
					<html:value value="$[logisticsBean.logisticsTelephone]"/>
				</html:a>
			</html:td>
			
			<html:td  label="操作">
				<btn:modify href="contoller.do?operation=viewLogistics&isModify=1&logisticsId=$[logisticsBean.logisticsId]"/>
				<btn:delete href="contoller.do?operation=deleteLogistics&logisticsId=$[logisticsBean.logisticsId]"/>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkLogisticsId" checkId="checkAll"/>
				<com:page formId="logisticsForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
