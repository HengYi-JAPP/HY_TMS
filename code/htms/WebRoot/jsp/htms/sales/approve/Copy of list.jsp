<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ page import="com.zzy.htms.sales.ship.ShipBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 

List<ShipBean> shipRouteLists=(List<ShipBean> )request.getAttribute("shipRouteLists");
shipRouteLists=shipRouteLists==null?new ArrayList<ShipBean>():shipRouteLists;
Map<String, List<ShipBean>> shipListMap=(Map<String, List<ShipBean>> )request.getAttribute("shipListMap");
shipListMap=shipListMap==null?new HashMap<String, List<ShipBean>>():shipListMap;

%>
<style>
<!--

-->
</style>
<head>
<base href="<%=basePath%>">
<script type="text/javascript">
	window.onload=function(){
		var status = document.getElementsByName("status");
		var approve=document.getElementsByName("approve");
		for(var i=0;i<status.length;i++){
		var applyStatus=document.getElementById("applyStatus").value;
			if(applyStatus=="1"){
				status[i].innerHTML="已通过审批"
					approve[i].disabled=true; 
			}
			if(applyStatus=="0"){
				status[i].innerHTML="已撤销审批"
			}
			if(applyStatus=="-1"){
				status[i].innerHTML=""
			}
			if(applyStatus=="2"){
				status[i].innerHTML="待审批"
			}
		}
	}
</script>
</head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="approveShipForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="listApproveShip"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.ship.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1670" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="LKOKHHFIBBFMNJBFNLGIBOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEJNKMNKEMCOMMHPCJJJKCAOMBFAPKOINKLGNOK" colSpan="1" rowSpan="1">
				<html:text  id="customerNameSH"  name="customerNameSH" />
			</td>
			<td class="edit-talbe-label" id="LKOKHHFIBBFMNJBFNLGIBOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEJNKMNKEMCOMMHPCJJJKCAOMBFAPKOINKLGNOK" colSpan="1" rowSpan="1">
				<html:text  id="corderCodeSH"  name="corderCodeSH" />
			</td>
		<tr class="trCell">
			<td   class="search-box"   id="searchBox" colSpan="4" rowSpan="1">
				<btn:search href="javascript:submit('approveShipForm')"/>
				<btn:reset href="javascript:cleanForm('approveShipForm')"/>
			</td>
		</tr>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<%--<btn:new href="javascript:batchDelete('approveShipForm','checkCorderId','','toAddShip');"/>
				<btn:delete href="javascript:batchDelete('approveShipForm','checkCorderId','','deleteShip');" />--%>
			</td>
		</tr>
	</table><%--

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="shipList" bean="shipBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="checkShipId" id="checkShipId" value="ShipBean.shipId" /></html:td>
			<html:td  label="{$jsp.htms.sales.custorder.cordercode#}"  property="corderCode" />
			<html:td  label="{$jsp.htms.sales.customer.customername#}"  property="customerName" />
			<html:td  label="{$jsp.htms.sales.ship.shipcode#}"  property="shipCode" />
			<html:td  label="{$jsp.htms.sales.ship.applytonnum#}"  property="applyTonNum" />
			<html:td  label="{$jsp.htms.sales.ship.applypacknum#}"  property="applyPackNum" />
			<html:td  label="{$jsp.htms.sales.ship.shipnotice#}"  property="shipNotice" />
			<html:td  label="查看"><btn:view href="contoller.do?operation=viewShip&isModify=0&shipId=$[shipBean.shipId]"/></html:td>
			<html:td  label="修改"><btn:modify href="contoller.do?operation=viewShip&isModify=1&shipId=$[shipBean.shipId]"/></html:td>
			<html:td  label="删除"><btn:delete href="contoller.do?operation=deleteShip&shipId=$[shipBean.shipId]"/></html:td>
		</html:tr>
	</html:table>
	--%>
	
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<th width="170px">客户名称</th>
			<td>
			<table class="dgbackground" cellSpacing="0"  border="1"  style="width:100%; border-collapse: collapse;border-width: 0;border-style: hidden;" align="center">
				<tr class="dgHeaderStyle" >
						<td>订单编号</td>
						<td>申请吨数</td>
						<td>申请包数</td>
						<td>单备注说明</td>
						<td>申请状态</td>
						<td>审批</td>
						<td>撤销审批</td>
						<%--<td>修改</td>
						<td>删除</td>
					--%></tr>
				</table>
			</td>
		</tr>
	<%
	ShipBean shipBean = null,nestBean=null;
	String mapId = null;
	List<ShipBean> shipLists=null;
	int jsize=0;
	for(int i=0,size=shipRouteLists.size();i<size;i++){
		shipBean=shipRouteLists.get(i);
		mapId=shipBean.getMapId();
		shipLists=shipListMap.get(mapId);
		jsize=shipLists==null?0:shipLists.size();
	%>
		<tr class="dgAlternatingItemStyle" class="dgHeaderStyle">
			<td><%=shipBean.getCustomerName()%></td>
			<td>
				<%if(jsize>0){ %>
				<table class="dgbackground" cellSpacing="0"  border="1"  style="width:100%; border-collapse: collapse;border-width: 0;border-style: hidden;"  align="center">
				<%
				for(int j=0;j<jsize;j++){
					nestBean=shipLists.get(j);
					request.setAttribute("shipBean",nestBean);
				%>
					<tr class="dgAlternatingItemStyle" >
						<td><html:a href="contoller.do?operation=viewApproveShip&isModify=0&shipId=$[shipBean.shipId]&caddrId=$[shipBean.caddrId]"><%=nestBean.getCorderCode() %></html:a></td>
						<td><%=nestBean.getApplyTonNum()%></td>
						<td><%=nestBean.getApplyPackNum() %></td>
						<td><%=nestBean.getShipNotice() %></td>
						<td id="status" name="status">
						<html:hidden id="applyStatus" name="applyStatus" value="$[shipBean.applyStatus]"/>
						<%=nestBean.getApplyStatus() %>
						</td>
						<html:td  label="审批"><btn:audit id="approve" name="approve" href="contoller.do?operation=approveShip&shipId=$[shipBean.shipId]&caddrId=$[shipBean.caddrId]"/></html:td>
						<html:td><btn:untoauditing href="contoller.do?operation=untoauditShip&shipId=$[shipBean.shipId]"/> </html:td>
						<%--<html:td  label="修改"><btn:modify href="contoller.do?operation=viewShip&isModify=1&shipId=$[shipBean.shipId]"/></html:td>
						<html:td  label="删除"><btn:delete href="contoller.do?operation=deleteShip&shipId=$[shipBean.shipId]"/></html:td>
	
					--%></tr>
				<%} %>
				</table>
				<%}else{ %>
				<table class="dgbackground" cellSpacing="0"  border="1"  style="width:100%; border-collapse: collapse;border-width: 0;border-style: hidden;" align="center">
				<tr class="dgAlternatingItemStyle">
						<td>订单编号</td>
						<td>申请吨数</td>
						<td>申请包数</td>
						<td>单备注说明</td>
						<td>申请状态</td>
						<td>审批</td>
						<td>撤销审批</td>
						<%--<td>修改</td>
						<td>删除</td>
					--%></tr>
				</table>
				<%} %>
			</td>
		</tr>
	<%} %>
	</table>
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkShipId" checkId="checkAll"/>
				<com:page formId="approveShipForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
