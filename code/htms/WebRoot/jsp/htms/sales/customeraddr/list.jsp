<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.zzy.htms.sales.customeraddr.CustomerAddrBean"%>
<%@page import="java.util.*"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ include file="../../../common/impart/common.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
List<CustomerAddrBean> customerRouteLists=(List<CustomerAddrBean> )request.getAttribute("customerRouteLists");
customerRouteLists=customerRouteLists==null?new ArrayList<CustomerAddrBean>():customerRouteLists;
Map<String, List<CustomerAddrBean>> customerListMap=(Map<String, List<CustomerAddrBean>> )request.getAttribute("customerListMap");
customerListMap=customerListMap==null?new HashMap<String, List<CustomerAddrBean>>():customerListMap;
%>
<head>
<base href="<%=basePath%>">
<script type="text/javascript">
	function modifyDefault(caddrId,name){
		$.ajax({     
	        url: "contoller.do?operation=modifyDefault&isModify=1&customerId="+name+"&caddrId="+caddrId,
	        type: "POST",
	        dataType: "json",
	        success: function (msg){
	            
	        }
	    });
		
	}
</script>
</head>
<com:loader  js="js/common/common.js,js/htms/common/common.js,resources/simpleupload/jquery-min.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="customerAddrForm"  enctype="application/x-www-form-urlencoded" loadCache="true" action="contoller.do"  method="GET" >
	<com:loader  simplendar="true" />
	<html:hidden id="operation" name="operation" value="listCustomerAddr"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.customeraddr.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1646" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="KMKJGMOBHKMEOKHPEHLHCEKEGIKPLKGJCNKHLPLLPCBLAHGKJIHOBKKPKIGOKHOK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customeraddr.customerid#}" ></html:label>
			</td>
			<td  id="ENEICPPNLLCFBGIKPIKNFKMFKAJIFNMGLIICOHHNKNJNLLBKBJFMLFKOOHCLFFFC" colSpan="1" rowSpan="1">
				<html:text  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]" />
				<span style="float:right;">
					<btn:search href="javascript:submit('customerAddrForm')"/>
					<btn:reset href="javascript:cleanForm('customerAddrForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<btn:new  href="contoller.do?operation=toAddCustomerAddr" />
				<btn:delete href="javascript:batch_deletes('customerAddrForm','caddrId','','deleteCustomerAddr');" />
			</td>
		</tr>
	</table>
	<%--

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="customerAddrList" bean="customerAddrBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="checkCustomerAddrId" id="checkCustomerAddrId" value="customerAddrBean.caddrId" /></html:td>
			<html:td  label="{$jsp.htms.sales.customeraddr.customerid#}"  property="customerName" />
			<html:td  label="{$jsp.htms.sales.customeraddr.caddrdetail#}" >
				<html:value value="customerAddrBean.areaName"></html:value>
				<html:value value="customerAddrBean.caddrDetail"></html:value>
			</html:td>
			<html:td  label="{$jsp.htms.sales.customeraddr.customeraddr#}"  property="caddrContactor" />
			<html:td  label="{$jsp.htms.sales.customeraddr.caddrtelephone#}"  property="caddrTelephone" />
			<html:td label="{$jsp.htms.sales.customeraddr.isdefault#}" >
					<com:switchbox varValue="customerAddrBean.isDefault" talbeName="TB_HTMS_CUSTOMERADDR" idValue="customerAddrBean.caddrId" offValue="0" varName="isDefault" onValue="1"  idName="caddrId"  offLabel="{$jsp.htms.sales.customeraddr.offdefault#}" onLabel="{$jsp.htms.sales.customeraddr.ondefault#}"   ajaxUrl="contoller.do" isSave="true"/>
			</html:td>
			<html:td  label="View"><btn:view href="contoller.do?operation=viewCustomerAddr&isModify=0&caddrId=$[customerAddrBean.caddrId]&areaId=$[customerAddrBean.areaId]"/></html:td>
			<html:td  label="Modify"><btn:modify href="contoller.do?operation=viewCustomerAddr&isModify=1&caddrId=$[customerAddrBean.caddrId]&areaId=$[customerAddrBean.areaId]"/></html:td>
			<html:td  label="Delete"><btn:delete href="contoller.do?operation=deleteCustomerAddr&caddrId=$[customerAddrBean.caddrId]"/></html:td>
		</html:tr>
	</html:table>

	--%>
	<table class="background" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="headerStyle" >
			
			<th width="180px">客户名称</th>
			<th width="60px" ><html:checkbox name="checkAll" id="checkAll" />全选</th>
			
			<th>客户详细地址</th>
			<th style="width: 80px;">联系人</th>
			<th style="width: 100px;">联系方式</th>
			<th style="width: 30px;">默认</th>
			<th style="width:180px;">操作</th>
		</tr>
	<%
	CustomerAddrBean customerAddrBean = null,nestBean=null;
	String mapId = null;
	List<CustomerAddrBean> customerLists=null;
	int jsize=0;
	for(int i=0,size=customerRouteLists.size();i<size;i++){
		customerAddrBean=customerRouteLists.get(i);
		mapId=customerAddrBean.getMapId();
		customerLists=customerListMap.get(mapId);
		jsize=customerLists==null?0:customerLists.size();
	%>
				<%
				for(int j=0;j<jsize;j++){
					nestBean=customerLists.get(j);
					request.setAttribute("customerAddrBean",nestBean);
				%>
					<tr class="alternatingItemStyle" >
						<%if(j==0){ %>
						<td rowspan="<%=jsize %>"><%=customerAddrBean.getCustomerName() %></td>
						<%} %>
						<td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="caddrId" id="caddrId" value="$[customerAddrBean.caddrId]"/></td>
						
						<td style="text-align:left">
							<html:a  href="contoller.do?operation=viewCustomerAddr&isModify=0&caddrId=$[customerAddrBean.caddrId]&areaId=$[customerAddrBean.areaId]&customerId=$[customerAddrBean.customerId]">
								<%=nestBean.getAreaName() %>,<%=nestBean.getCaddrDetail() %>
							</html:a>
						</td>
						<td>
						<%=nestBean.getCaddrContactor() %></td>
						<td><%=nestBean.getCaddrTelephone() %></td>
						<form >
						<td id="defaultValue" name="defaultValue" >
						<html:radio  id="isDefault" name="$[customerAddrBean.customerId]" value="$[customerAddrBean.isDefault]" checked="1" onchange="modifyDefault('$[customerAddrBean.caddrId]',this.name);"/>
						</td>
						<%--<html:td style="width:68px;" label="View"><btn:view href="contoller.do?operation=viewCustomerAddr&isModify=0&caddrId=$[customerAddrBean.caddrId]&areaId=$[customerAddrBean.areaId]&checkCustomerAddrId=$[customerAddrBean.customerId]"/></html:td>--%>
						<html:td >
						<btn:modify href="contoller.do?operation=viewCustomerAddr&isModify=1&caddrId=$[customerAddrBean.caddrId]&areaId=$[customerAddrBean.areaId]&customerId=$[customerAddrBean.customerId]"/>
						<btn:delete href="javascript:deleteRow('contoller.do?operation=deleteCustomerAddr&caddrId=$[customerAddrBean.caddrId]')"/>
						</html:td>
					</tr>
				<%} %>
	<%} %>
	</table>
	
	
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="caddrId" checkId="checkAll"/>
				<com:page formId="customerAddrForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
