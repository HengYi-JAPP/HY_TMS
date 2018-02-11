<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../../common/impart/taglib.jsp"%>
<%@ page import="com.zzy.htms.sales.ship.ShipBean" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 


Map<String, Map<String,Map<String,List<ShipBean>>>> customerOrderShipListMap=(Map<String, Map<String,Map<String,List<ShipBean>>>>)request.getAttribute("customerOrderShipListMap");
customerOrderShipListMap=customerOrderShipListMap==null?new HashMap<String, Map<String,Map<String,List<ShipBean>>>>():customerOrderShipListMap;

%>
<%!
	Set set = null,orderSet=null,detailSet=null;
	Iterator it = null,orderIt=null,detailIt=null;
	String key = null,orderKey=null,detailKey=null;
	 Map<String,Map<String,List<ShipBean>>> orderShipMap = null;
	 Map<String,List<ShipBean>> detailShipMap=null;
	 List<ShipBean> shipLists = null;
	 int cusSize=0,orderSize=0,detailSize=0;
	public int getCusSize(Map<String,Map<String,List<ShipBean>>> orderShipMap ){
		int cusSize=0;
		if(orderShipMap==null||orderShipMap.isEmpty()){
			return cusSize;
		}
	
		orderSet=orderShipMap.keySet();
		orderIt=orderSet.iterator();
		while(orderIt.hasNext()){
			orderKey =(String)orderIt.next();
			detailShipMap=orderShipMap.get(orderKey);
			if(detailShipMap==null||detailShipMap.isEmpty()){
				continue;
			}
			detailSet=detailShipMap.keySet();
			detailIt=detailSet.iterator();
			while(detailIt.hasNext()){
				detailKey =(String)detailIt.next();
				shipLists=detailShipMap.get(detailKey);
				if(shipLists==null||shipLists.isEmpty()){
					continue;
				}
				cusSize=cusSize+shipLists.size();					
			}//while detailShipMap
		}//while orderShipMap
		return cusSize;
	}
	
	public int getOrderSize(Map<String,List<ShipBean>> detailShipMap ){
		int orderSize=0;
		if(detailShipMap==null||detailShipMap.isEmpty()){
			return orderSize;
		}
		detailSet=detailShipMap.keySet();
		detailIt=detailSet.iterator();
		while(detailIt.hasNext()){
			detailKey =(String)detailIt.next();
			shipLists=detailShipMap.get(detailKey);
			if(shipLists==null||shipLists.isEmpty()){
				continue;
			}
			orderSize=orderSize+shipLists.size();					
		}//while detailShipMap
		return orderSize;
	}
	%>
<head>
<base href="<%=basePath%>">

</head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list.css"/>
<html:form id="shipForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" >
	<html:hidden id="operation" name="operation" value="managerListShip"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../../common/impart/table-banner.jsp">
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
				<btn:search href="javascript:submit('shipForm')"/>
				<btn:reset href="javascript:cleanForm('shipForm')"/>
			</td>
		</tr>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="4" rowSpan="1">
				<%--<btn:new href="javascript:batchDelete('shipForm','checkCorderId','','toAddShip');"/>
				<btn:delete href="javascript:batchDelete('shipForm','checkCorderId','','deleteShip');" />--%>
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
			<td width="170px">客户名称</td>
			<td width="60px">订单</td>
			<td width="60px">行号</td>
			<td width="80px">申请编号</td>
			<td>物料名称</td>
			<td width="50px">吨数</td>
			<td width="50px">包数</td>
			<td>送货地址</td>
			<td width="50px">状态</td>
			<td width="80px">操作</td>
		</tr>
	
	<%
	ShipBean shipBean = null,nestBean=null;
	int cusIndex=0,orderIndex=0,detailIndex=0,applyStatus=0;
	set = customerOrderShipListMap.keySet();
	it = set.iterator();
	String applyStatusDesc=null;
	while(it.hasNext()){
		key =(String)it.next();
		orderShipMap=customerOrderShipListMap.get(key);
		if(orderShipMap==null||orderShipMap.isEmpty()){
			continue;
		}
		cusIndex=0;
		cusSize=this.getCusSize(orderShipMap);
		//System.out.println("-----------------------------orderShipMap cusSize="+cusSize+",  cusKey="+key+",size="+(orderShipMap==null?0:orderShipMap.size()));
		
		orderSet=orderShipMap.keySet();
		orderIt=orderSet.iterator();		
		while(orderIt.hasNext()){
			orderKey =(String)orderIt.next();
			detailShipMap=orderShipMap.get(orderKey);
			if(detailShipMap==null||detailShipMap.isEmpty()){
				continue;
			}
			orderIndex=0;
			orderSize =this.getOrderSize(detailShipMap);
			//System.out.println("-----------------------------detailShipMap orderSize="+orderSize+", orderKey="+orderKey+",size="+(detailShipMap==null?0:detailShipMap.size()));
			detailSet=detailShipMap.keySet();
			detailIt=detailSet.iterator();
			while(detailIt.hasNext()){
				detailKey =(String)detailIt.next();
				shipLists=detailShipMap.get(detailKey);
				//System.out.println("-----------------------------shipLists detailKey="+detailKey+",size="+(shipLists==null?0:shipLists.size()));
				if(shipLists==null||shipLists.isEmpty()){
					continue;
				}
				for(int i=0,size=shipLists.size();i<size;i++){
					nestBean=shipLists.get(i);
					request.setAttribute("custOrderBean",nestBean);
					applyStatus=nestBean.getApplyStatus();
					applyStatusDesc="";
					if(applyStatus==-1){applyStatusDesc="已撤消";}
					if(applyStatus==0){applyStatusDesc="未通过";}
					if(applyStatus==1){applyStatusDesc="通过";}
					if(applyStatus==2){applyStatusDesc="审批中";}
				%>
				<tr class="dgAlternatingItemStyle" >
					<%if(cusIndex==0){cusIndex++; %>
					<td rowspan="<%=cusSize %>" width="170px" style="text-align:left;"><%=nestBean.getCustomerName()%></td>
					<%} %>
					<%--<td><html:a href="contoller.do?operation=viewShip&isModify=0&shipId=$[shipBean.shipId]&caddrId=$[shipBean.caddrId]"><%=nestBean.getCorderCode() %></html:a></td> --%>
					<%if(orderIndex==0){orderIndex++; %>
					<td rowspan="<%=orderSize %>" width="80px"><%=nestBean.getCorderCode()%></td>
					<%} %>
					<%if(i==0){ %>
					<td rowspan="<%=size %>"  width="80px"><%=nestBean.getCodetailCertificate()%></td>
					<%} %>
					
					<td width="80px">
						<html:a href="contoller.do?operation=managerViewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getShipCode() %>
						</html:a>
					</td>
					<td style="word-wrap:break-word;word-break:break-all;word-wrap:break-word;">
						<html:a href="contoller.do?operation=managerViewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getCodetailCertificateDesc() %>
						</html:a>
					</td>
					<td width="50px" style="text-align:right;">
						<html:a href="contoller.do?operation=managerViewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getApplyTonNum()%>
						</html:a>
					</td>
					<td width="50px" style="text-align:right;">
						<html:a href="contoller.do?operation=managerViewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getApplyPackNum() %>
						</html:a>
					</td>
					<td  style="text-align:left;">
						<html:a href="contoller.do?operation=managerViewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getAreaName() %><%=nestBean.getCaddrDetail() %>
						</html:a>
					</td>
					<td width="50px" id="status" name="status">
					<html:hidden id="applyStatus" name="applyStatus" value="$[shipBean.applyStatus]"/>
					<%=applyStatusDesc %>
					</td>
					<td width="80px">
					<%if(applyStatus==2){ %>
						<html:a href="contoller.do?operation=managerCancelShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]&applyTonNum=$[custOrderBean.applyTonNum]">
							<button type="button" style="width: 65px;height: 24px;text-align: right;background-image: url(resources/images/buttons/check-return.gif)"  >撤消</button>
						</html:a>
					<%} %>
					</td>
					<%--<html:td  label="查看"><btn:view href="contoller.do?operation=viewShip&isModify=0&shipId=$[shipBean.shipId]"/></html:td>
					<html:td  label="修改"><btn:modify href="contoller.do?operation=viewShip&isModify=1&shipId=$[shipBean.shipId]"/></html:td>
					<html:td  label="删除"><btn:delete href="contoller.do?operation=deleteShip&shipId=$[shipBean.shipId]"/></html:td>

				--%></tr>
			<%
				}//for
			}//while detailShipMap
		}//while orderShipMap
	}//while customerOrderShipListMap
	
	

	 tools.tool.clear(customerOrderShipListMap);
	 tools.tool.clear(shipLists);
	 tools.tool.clear(orderShipMap);
	 tools.tool.clear(detailShipMap);
	
	%>
	
	</table>
	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkShipId" checkId="checkAll"/>
				<com:page formId="shipForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
