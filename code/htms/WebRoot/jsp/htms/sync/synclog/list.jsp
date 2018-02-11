<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="logForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader   simplendar="true" />
	<html:hidden id="operation" name="operation" value="listSyncLog"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sync.synclog.title") %>' name="title"/>
	</jsp:include>
	<table id="1674" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="JJLCNKKNNINNCGNMCFGNKBHKIMLMBLJJLMKPMKAOJPFFNBBIPPNOJCHKPMKLJPOK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sync.synclog.salesNo#}" ></html:label>
			</td>
			<td  id="MHMPJAGCIOCKAJPAIGBLNEOEKIBOMJKCJEEMNLEKJKKLFEJCOGFNKNKOLIGIKBHF" colSpan="1" rowSpan="1">
				<html:text  id="salesNoSH"  name="salesNoSH" />
			</td>
			<td   class="search-box"   id="searchBox" colSpan="1" rowSpan="1">
				<btn:search href="javascript:submit('logForm')"/>
				<btn:reset href="javascript:cleanForm('logForm')"/>
			</td>
		</tr>
	</table>

    <br>
	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="logList" 
	bean="logViewBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" >
			<!-- <html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"> -->
			<!-- <html:checkbox name="synId" id="synId" value="logViewBean.synId" /> </html:td>-->
			<html:td  label="{$jsp.htms.sync.synclog.salesNo#}" >
				<html:a href="contoller.do?operation=viewSyncLog&isModify=0&synId=$[logViewBean.synId]">
					<html:value value="$[logViewBean.salesNo]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.sync.synclog.startTime#}" >
				<html:a href="contoller.do?operation=viewSyncLog&isModify=0&synId=$[logViewBean.synId]">
					<html:value value="$[logViewBean.startTime]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.sync.synclog.endTime#}" >
				<html:a href="contoller.do?operation=viewSyncLog&isModify=0&synId=$[logViewBean.synId]">
					<html:value value="$[logViewBean.endTime]"/>
				</html:a>
			</html:td>
			<html:td  label="{$jsp.htms.sync.synclog.useTime#}"  property="useTime" />
			
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="synId" checkId="checkAll"/>
				<com:page formId="logForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
