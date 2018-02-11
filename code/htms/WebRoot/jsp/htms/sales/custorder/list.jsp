<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.zzy.htms.sales.custorder.CustOrderBean"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

 Map<String, List<CustOrderBean>> customerOrderListMap=(Map<String, List<CustOrderBean>>)request.getAttribute("customerOrderListMap");
customerOrderListMap=customerOrderListMap==null?new HashMap<String, List<CustOrderBean>>():customerOrderListMap;

List<String> orderKeyList=(List<String>)request.getAttribute("orderKeyList");
orderKeyList=orderKeyList==null?new  ArrayList<String>():orderKeyList;

//CustOrderBean customerBean=null,orderBean=null,detailBean=null;
List<CustOrderBean> detailList=null;
%>
<head><base href="<%=basePath%>">

</head>
<com:loader  js="js/common/common.js"/>
<com:loader  js="resources/jquery/jquery.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="custOrderForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" loadCache="true" >
	<com:loader  simplendar="true"  />
	<html:hidden id="operation" name="operation" value="listCustOrder"/>
	<html:hidden id="applyStatus" name="applyStatus" value="2"/>
	<html:hidden id="shipDetailStatus" name="shipDetailStatus" value="2"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.custorder.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1662" class="edit-talbe">
		<tr class="trCell">
		    <td class="edit-talbe-label" id="HPOGKKLIKCIMBINFMANCKCGJBHHGKHBIIPGGNKLINKGAMAMPNBAIELOKKIHKECCM" colSpan="1" rowSpan="1">
				   客户名称
			</td>
			<td  id="AFMOOPFEKEGCJBEKNCMKCKFPGPAEMKGBOKCBBPKFOBGOHOEONIKBFKHBNMAKNFPK" colSpan="1" rowSpan="1" >
				<html:text  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]"/>
			</td>		    
			<td class="edit-talbe-label" id="HPOGKKLIKCIMBINFMANCKCGJBHHGKHBIIPGGNKLINKGAMAMPNBAIELOKKIHKECCM" colSpan="1" rowSpan="1">
				物料
			</td>
			<td  id="AFMOOPFEKEGCJBEKNCMKCKFPGPAEMKGBOKCBBPKFOBGOHOEONIKBFKHBNMAKNFPK" colSpan="1" rowSpan="1">
				<html:text  id="codetailCertificateDescSH"  name="codetailCertificateDescSH" value="$[codetailCertificateDescSH]"/>
			</td>
		</tr>
		<tr class="trCell">
		    	    
			<td class="edit-talbe-label" id="HPOGKKLIKCIMBINFMANCKCGJBHHGKHBIIPGGNKLINKGAMAMPNBAIELOKKIHKECCM" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td  id="AFMOOPFEKEGCJBEKNCMKCKFPGPAEMKGBOKCBBPKFOBGOHOEONIKBFKHBNMAKNFPK" colSpan="1" rowSpan="1">
				<html:text  id="corderCodeSH"  name="corderCodeSH" value="$[corderCodeSH]"/>
			</td><td class="edit-talbe-label" id="HPOGKKLIKCIMBINFMANCKCGJBHHGKHBIIPGGNKLINKGAMAMPNBAIELOKKIHKECCM" colSpan="1" rowSpan="1">
				下单日期
			</td>
			<td  id="AFMOOPFEKEGCJBEKNCMKCKFPGPAEMKGBOKCBBPKFOBGOHOEONIKBFKHBNMAKNFPK" colSpan="1" rowSpan="1">
				<com:simplendar  id="orderTimeSH"  name="orderTimeSH"  value="$[orderTimeSH]" />
				<span style="float: right;">
				<btn:search href="javascript:submit('custOrderForm')" />
				<btn:reset href="javascript:cleanForm('custOrderForm')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
			<%--
				<btn:new href="contoller.do?operation=toAddCustOrder"/>
				<btn:delete href="javascript:batchDelete('custOrderForm','checkCustOrderId','','deleteCustOrder');" /> --%>
				<btn:button   value="{$jsp.htms.logistic.transport.title.transportsyn#}"  name="{$jsp.htms.logistic.transport.title.transportsyn#}" typeId="orderSyn" href="contoller.do?operation=toAddOrderSyn" style="height: 29px;width: 88px;background-color: #e0eff9;padding: 0px 25px;font-size: 14px;border-radius: 4px;border: 1px solid;cursor:pointer;border-style:none;background-repeat:no-repeat;background-image:url(resources/images/newbuttons/ordersyn.png);background-position-x: 5px;background-position-y: 9px;background-size: 15px;color:#2889f4;"/>	
			</td>
		</tr>
	</table>
	<table class="background" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center">
		<tr  class="headerStyle" >
			<td width="180px" >客户</td>
			<td width="60px">订单号</td>
			
			<td width="70px">下单时间</td>
			<td width="45px">细项</td>			
			<td width="50px">工厂</td>
			<td>物料</td>
			<td width="60px">订单数</td>
			<td width="70px">可申请数</td>
			<td width="60px">包数</td>
			<td width="60px">运费</td>
			<td width="60px">单价</td>
			<td width="80px">操作</td>
				
		</tr>
	<%
	//CustOrderBean custOrderBean = null,nestBean=null;
	//String mapId = null;
	CustOrderBean nestBean=null;
	//int jsize=0;
	boolean isCannel=false;

		for(int i=0,size=orderKeyList.size();i<size;i++){
			detailList=customerOrderListMap.get(orderKeyList.get(i));
			if(detailList==null||detailList.isEmpty()){
				continue;
			}
				for(int d=0,dsize=(detailList==null?0:detailList.size());d<dsize;d++){
					nestBean=detailList.get(d);
					request.setAttribute("custOrderBean",nestBean);
					isCannel="1".equalsIgnoreCase(nestBean.getApplyStatus())?true:false;
					String corderCode = nestBean.getCorderCode().replaceFirst("^0*","");
					String codetailCertificate = nestBean.getCodetailCertificate().replaceFirst("^0*","");
					
				%>
					<tr class="alternatingItemStyle" >
						<%if(d==0){
						 %>
						<td  style="text-align:left;" rowspan="<%=dsize%>"><%= nestBean.getCustomerName()%></td>
						
						<td  rowspan="<%= dsize%>"><%=corderCode %></td>
						<td  rowspan="<%= dsize%>" style="text-align:right;"><%=nestBean.getCreateTime()%></td>
						<%} %>
						<html:hidden id="corderId" name="corderId" value="custOrderBean.corderId"/>
						<td>
							<html:a href="contoller.do?operation=viewCustOrder&isModify=0&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]">
							<%=codetailCertificate %>
							</html:a>
						</td>
						<td  style="text-align:left;">
							<html:a href="contoller.do?operation=viewCustOrder&isModify=0&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]">
							<%=nestBean.getFactoryName() %>
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
						<td  style="text-align:right;">
							<%=nestBean.getProjectVolume() %>
						</td>
						<td  style="text-align:right;">
							<%=nestBean.getFreight() %>
						</td>
						<td  style="text-align:right;">
							<%=nestBean.getUnitPrice() %>
						</td>
						<%if(d==0){
						 %>
						<td rowspan="<%= dsize%>">
							<%//if(nestBean.isAppliable()==true){ %>
							<btn:active href="contoller.do?operation=toApplyShip&corderId=$[custOrderBean.corderId]&customerCode=$[custOrderBean.customerCode]" name="申请" typeId="applybtn" value="申请"/>
							<%//} %>
						</td>
						<%} %>
					</tr>
				<%}//for 
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
<jsp:include page="../../../common/invokeMessage.jsp" />
<%

tools.tool.clear(customerOrderListMap);
tools.tool.clear(orderKeyList);
tools.tool.clear(detailList);
 %>
