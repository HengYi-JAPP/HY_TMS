<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.zzy.htms.sales.custorder.CustOrderBean"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

Map<String, Map<String, List<CustOrderBean>>> customerOrderListMap=(Map<String, Map<String, List<CustOrderBean>>>)request.getAttribute("customerOrderListMap");
customerOrderListMap=customerOrderListMap==null?new HashMap<String, Map<String, List<CustOrderBean>>>():customerOrderListMap;


//CustOrderBean customerBean=null,orderBean=null,detailBean=null;
List<CustOrderBean> detailList=null;
custOrderList
%>
<head><base href="<%=basePath%>">

</head>
<com:loader  js="js/common/common.js"/>
<com:loader  js="resources/jquery/jquery.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="custOrderForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<com:loader  simplendar="true"  />
	<html:hidden id="operation" name="operation" value="listCustOrder"/>
	<html:hidden id="applyStatus" name="applyStatus" value="2"/>
	<html:hidden id="shipDetailStatus" name="shipDetailStatus" value="2"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.custorder.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1662" class="edit-talbe">
		<tr class="trCell">
		    <td class="edit-talbe-label" id="HPOGKKLIKCIMBINFMANCKCGJBHHGKHBIIPGGNKLINKGAMAMPNBAIELOKKIHKECCM" colSpan="1" rowSpan="1">
				   客户名称
			</td>
			<td  id="AFMOOPFEKEGCJBEKNCMKCKFPGPAEMKGBOKCBBPKFOBGOHOEONIKBFKHBNMAKNFPK" colSpan="1" rowSpan="1">
				<html:text  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]"/>
			</td>		    
			<td class="edit-talbe-label" id="HPOGKKLIKCIMBINFMANCKCGJBHHGKHBIIPGGNKLINKGAMAMPNBAIELOKKIHKECCM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td  id="AFMOOPFEKEGCJBEKNCMKCKFPGPAEMKGBOKCBBPKFOBGOHOEONIKBFKHBNMAKNFPK" colSpan="1" rowSpan="1">
				<html:text  id="corderCodeSH"  name="corderCodeSH" value="$[corderCodeSH]"/>
			
				<btn:search href="javascript:submit('custOrderForm')"/>
				<btn:reset href="javascript:cleanForm('custOrderForm')"/>
			</td>
		</tr>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
			<%--
				<btn:new href="contoller.do?operation=toAddCustOrder"/>
				<btn:delete href="javascript:batchDelete('custOrderForm','checkCustOrderId','','deleteCustOrder');" /> --%>
				<btn:button   value="{$jsp.htms.logistic.transport.title.transportsyn#}"  name="{$jsp.htms.logistic.transport.title.transportsyn#}" typeId="orderSyn" href="contoller.do?operation=toAddOrderSyn" styleClass="button-self-style"/>	
			</td>
		</tr>
	</table>
	<table class="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="dgHeaderStyle" >
			<th width="180px" >客户名称</th>
			<%--<td>
			
			<table class="dgbackground" cellSpacing="0"  border="1"  style="width:100%; border-collapse: collapse;border-width: 0;border-style: hidden;" align="center">
				<tr class="dgHeaderStyle" > --%>
						<td width="100px">订单编号</td>
						
						<td width="60px">细项号</td>
						<td>物料</td>
						<td width="80px">订单数</td>
						<td width="80px">可申请数</td>
						<td width="80px">已申请数</td>
						<td width="120px">操作</td>
				
		</tr>
	<%
	//CustOrderBean custOrderBean = null,nestBean=null;
	//String mapId = null;
	CustOrderBean nestBean=null;
	//int jsize=0;
	boolean isCannel=false;
	//String customerCode=null,orderCode=null;
	Set set =customerOrderListMap.keySet(),detailSet=null;
	Iterator it = set.iterator(),detailIterator=null;
	Map<String, List<CustOrderBean>> orderDetailListMap=null;
	int customerSize=0,currentSize=0;
	int cusIndex=0,orderIndex=0;
	//System.out.println("customerOrderListMap size=================="+(customerOrderListMap==null?0:customerOrderListMap.size()));
	while(it.hasNext()){
		orderDetailListMap=customerOrderListMap.get(it.next());
		//System.out.println("orderDetailListMap size=================="+(orderDetailListMap==null?0:orderDetailListMap.size()));
		if(orderDetailListMap==null||orderDetailListMap.isEmpty()){
			continue;
		}
		
		detailSet=orderDetailListMap.keySet();
		detailIterator=detailSet.iterator();
		customerSize=0;
		while(detailIterator.hasNext()){
			detailList=orderDetailListMap.get(detailIterator.next());
			
		//System.out.println("detailList size=================="+(detailList==null?0:detailList.size()));
			currentSize=detailList==null?0:detailList.size();
			customerSize=customerSize+currentSize;
		}
		cusIndex=0;
		detailSet=orderDetailListMap.keySet();
		detailIterator=detailSet.iterator();
		while(detailIterator.hasNext()){
			orderIndex=0;
			detailList=orderDetailListMap.get(detailIterator.next());
				for(int d=0,dsize=(detailList==null?0:detailList.size());d<dsize;d++){
					nestBean=detailList.get(d);
					request.setAttribute("custOrderBean",nestBean);
					isCannel="1".equalsIgnoreCase(nestBean.getApplyStatus())?true:false;
				%>
					<tr class="dgAlternatingItemStyle" >
						<%if(cusIndex==0&&d==0){
							cusIndex++;
						 %>
						<td  style="text-align:left;" rowspan="<%=customerSize%>"><%= nestBean.getCustomerName()%></td>
					
						<%} %>
						<%if(d==0){
							//orderIndex++;
						 %>
						<td rowspan="<%= dsize%>"><%=nestBean.getCorderCode() %></td>
						<%} %>
						<html:hidden id="corderId" name="corderId" value="custOrderBean.corderId"/>
						<td>
							<html:a href="contoller.do?operation=viewCustOrder&isModify=0&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]">
							<%=nestBean.getCodetailCertificate() %>
							</html:a>
						</td>
						<td  style="text-align:left;">
							<html:a href="contoller.do?operation=viewCustOrder&isModify=0&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]">
							<%=nestBean.getCodetailCertificateDesc() %>
							</html:a>
						</td>
							<td  style="text-align:right;">
							<html:a href="contoller.do?operation=viewCustOrder&isModify=0&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]">
							<%=nestBean.getOrderAmount() %>
							</html:a>
						</td>
						<td style="text-align:right;"><%=nestBean.getAppliableAmount()%></td>
						<td style="text-align:right;"><%=nestBean.getAppliedAmount()%></td>
						
						<%if(d==0){
							orderIndex++;
						 %>
						<td rowspan="<%= dsize%>">
							<%if(nestBean.isAppliable()==true){ %>
							<btn:cancel href="contoller.do?operation=toApplyShip&corderId=$[custOrderBean.corderId]&customerCode=$[custOrderBean.customerCode]" name="申请" typeId="applybtn" value="申请"/>
							<%} %>
						</td>
						<%} %>
						<%--<td >
						<html:a href="contoller.do?operation=deleteCustOrder&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]">
							<button type="button" style="width: 65px;height: 24px;text-align: right;background-image: url(resources/images/buttons/check-return.gif)" <%=(isCannel?"disabled=\"true\"":"") %> >取消</button>
						</html:a>
						</td>
						<td >
						<btn:modify href="contoller.do?operation=viewCustOrder&isModify=1&corderId=$[custOrderBean.corderId]"/>
						</td>
						<td >
						<btn:delete href="contoller.do?operation=deleteCustOrder&corderId=$[custOrderBean.corderId]"/>
						</td>--%>
					</tr>
				<%}//for 
				
				
				
				}
				
				} %>
	</table>
	
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkCustOrderId" checkId="checkAll"/>
				<com:page formId="custOrderForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>

<%
tools.tool.clear(customerOrderListMap);
//tools.tool.clear(orderList);
tools.tool.clear(detailList);
 %>
