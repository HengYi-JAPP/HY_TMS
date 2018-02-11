<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<%@page import="com.zzy.htms.dictionary.area.AreaRepository" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 
List list=AreaRepository.getRootNodeList();
request.setAttribute("areaTreeList",AreaRepository.getRootNodeList());
%>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js,js/htms/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="areaForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listArea"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" tree="true"/>
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.dictionary.area.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1642" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="LOLILKBELCFIBONAOBKNMJHBAFMCCHMFHPNGBAKEJIIHKAJMKNHBIBEFMNOGIEKC" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.dictionary.area.areaname#}" ></html:label>
			</td>
			<td  id="KNGKFICBHPJHGPIGBABIICJOAOJCGPKABPKKHOKMBCJMMHIPCGAAHKOIKJMPPKCI" colSpan="1" rowSpan="1">
				<html:text  id="areaNameSH"  name="areaNameSH" />
				<span style="float:right;">
					<btn:search href="javascript:submit('areaForm')"/>
					<btn:reset href="javascript:cleanForm('areaForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table style="border: 1px solid #d9dfe5;width: 100%">
		<tr class="trCell" >
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<btn:new href="contoller.do?operation=toAddArea"/>
				<btn:delete href="javascript:batch_deletes('areaForm','checkAreaId','','deleteArea',true);" />
				<!-- <btn:rollback href="contoller.do?operation=toLoadArea" value="加载"/> -->
				<btn:rollback href="contoller.do?operation=syncLocalHostCahce&syncType=AREA" value="加载"/> 
				
			</td>
		</tr>
	</table>

	<%--<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="areaList" bean="areaBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="checkAreaId" id="checkAreaId" value="AreaBean.areaId" /></html:td>
			<html:td  label="{$jsp.htms.dictionary.area.parentareaid#}"  property="parentAreaId" />
			<html:td  label="{$jsp.htms.dictionary.area.areaname#}"  property="areaName" />
			<html:td  label="{$jsp.htms.dictionary.area.arealevel#}"  property="areaLevel" />
			<html:td  label="View"><btn:view href="contoller.do?operation=viewArea&isModify=0&areaId=$[areaBean.areaId]"/></html:td>
			<html:td  label="Modify"><btn:modify href="contoller.do?operation=viewArea&isModify=1&areaId=$[areaBean.areaId]"/></html:td>
			<html:td  label="Delete"><btn:delete href="contoller.do?operation=deleteArea&areaId=$[areaBean.areaId]"/></html:td>
		</html:tr>
	</html:table>

	--%>
	<com:tree treeList="areaTreeList" treeName="myTree" useCheckBox="true" chooseStyle="down" treeNodeId="areaId" cacheElementName="checkAreaId" appendNodeOperation="true" useNodeImage="true" expandAll="0" useLink="true" isAsync="true" asyncDataLodaerClass="com.zzy.htms.dictionary.area.AsyncAreaLoader">
		<com:treeOpration href="contoller.do?operation=viewArea&isModify=1" name="{$jsp.common.operation.modify#}" idPrefix="modify_"  target="_self" ></com:treeOpration>
		<com:treeNodeMap name="areaName" nodeId="areaId" parentId="parentAreaId" url="contoller.do?operation=viewArea" openType="_self"  level="areaLevel"/>									
	</com:tree>
	<%--<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkAreaId" checkId="checkAll"/>
				<com:page formId="areaForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
--%></html:form>
