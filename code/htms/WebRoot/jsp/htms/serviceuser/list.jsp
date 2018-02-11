<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@ include file="../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="serviceUserForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listServiceUser"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.serviceuser.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1690" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="NINFKOLNIELHFKLFKPGIECHIEJFAHFCAOKPNHCOEHPIJNIKBEHJKLILAHKGHPKLN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.serviceuser.syscode#}" ></html:label>
			</td>
			<td  id="PPKBCCNLEBLNKLIOINFFGEPGLABHKFBLOOIOKPGAKPOKFKEMHNGFMEJAFFBPHBPM" colSpan="1" rowSpan="1">
				<html:text  id="sysCodeSH"  name="sysCodeSH" value="$[sysCodeSH]"/>
			</td>
			<td class="edit-talbe-label" id="AGNOKGGIPEFKNNEMCCOMCMAHLKLOJAKFHGMCIIBAEAGBJJIFHPPFIHHGEFHIGCHG" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.serviceuser.account#}" ></html:label>
			</td>
			<td  id="CIBNIOMMOKNIGOCCMIIKKOJEAKCBJHKHJOKGMCFKLKIKBKGEKEAMJEJKGLPLHLEN" colSpan="1" rowSpan="1">
				<html:text  id="accountSH"  name="accountSH" value="$[accountSH]"/>
				<btn:search href="javascript:submit('serviceUserForm')"/>
				<btn:reset href="javascript:cleanForm('serviceUserForm')"/>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<btn:new href="contoller.do?operation=toAddServiceUser"/>
				<btn:delete href="javascript:batch_deletes('serviceUserForm','suserId','','deleteServiceUser');" />
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="serviceUserList" bean="serviceUserBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="suserId" id="suserId" value="serviceUserBean.suserId" /></html:td>
			<html:td  label="{$jsp.htms.serviceuser.syscode#}">
				<html:a href="contoller.do?operation=viewServiceUser&suserId=$[serviceUserBean.suserId]"><html:value value="$[serviceUserBean.syscode]"></html:value> </html:a>
			</html:td>
			<html:td  label="{$jsp.htms.serviceuser.account#}">
				<html:a href="contoller.do?operation=viewServiceUser&suserId=$[serviceUserBean.suserId]"><html:value value="$[serviceUserBean.account]"></html:value> </html:a>
			</html:td>
			<html:td label="{$jsp.common.status.validate#}" >
						<com:switchbox varValue="serviceUserBean.isValidate" talbeName="TB_HTMS_SERVICEUSER" idValue="serviceUserBean.suserId" offValue="0" varName="isValidate" onValue="1"  idName="suserId"  offLabel="{$jsp.common.status.validate.invalidate#}" onLabel="{$jsp.common.status.validate.validate#}"   ajaxUrl="contoller.do" isSave="true"/>
															
				</html:td>
			<html:td  label="操作">
				<btn:modify href="contoller.do?operation=viewServiceUser&isModify=true&suserId=$[serviceUserBean.suserId]"/>
				<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteServiceUser&suserId=$[serviceUserBean.suserId]')"/>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="suserId" checkId="checkAll"/>
				<com:page formId="serviceUserForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
