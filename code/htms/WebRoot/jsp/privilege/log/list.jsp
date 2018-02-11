<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@ include file="../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="logForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"   />
	<html:hidden id="operation" name="operation" value="listLog"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.privilege.log.list.title") %>' name="title"/>
	</jsp:include>
	<table id="1674" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="JJLCNKKNNINNCGNMCFGNKBHKIMLMBLJJLMKPMKAOJPFFNBBIPPNOJCHKPMKLJPOK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.privilege.log.logdesc#}" ></html:label>
			</td>
			<td  id="MHMPJAGCIOCKAJPAIGBLNEOEKIBOMJKCJEEMNLEKJKKLFEJCOGFNKNKOLIGIKBHF" colSpan="1" rowSpan="1">
				<html:text  id="logDescSH"  name="logDescSH" />
				<span style="float: right;">
					<btn:search href="javascript:submit('logForm')"/>
					<btn:reset href="javascript:cleanForm('logForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<btn:delete href="javascript:batch_deletes('logForm','logId','','deleteLog');" />
			</td>
		</tr>
	</table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="logList" bean="logViewBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="logId" id="logId" value="logViewBean.logId" /></html:td>
			<html:td  label="{$jsp.privilege.log.logcode#}"  property="logCode" />
			<html:td  label="{$jsp.privilege.log.logdesc#}"  property="logDesc" />
			<html:td  label="{$jsp.privilege.log.logtime#}"  property="logTime" />
			<html:td  label="查看" width="100px"><btn:view href="contoller.do?operation=viewLog&isModify=0&logId=$[logViewBean.logId]"/></html:td>
			<html:td  label="删除" width="100px"><btn:delete href="javascript:deleteRow('contoller.do?operation=deleteLog&logId=$[logViewBean.logId]')"/></html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="logId" checkId="checkAll"/>
				<com:page formId="logForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
