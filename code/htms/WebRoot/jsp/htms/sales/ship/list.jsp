<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<%@ page import="com.zzy.htms.sales.ship.ShipBean,com.zzy.htms.sales.ship.ShipPageUtil" %>

<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; 


//Map<String, Map<String,Map<String,List<ShipBean>>>> customerOrderShipListMap=(Map<String, Map<String,Map<String,List<ShipBean>>>>)request.getAttribute("customerOrderShipListMap");
//customerOrderShipListMap=customerOrderShipListMap==null?new HashMap<String, Map<String,Map<String,List<ShipBean>>>>():customerOrderShipListMap;
List<ShipBean> shipLists=(List<ShipBean>)request.getAttribute("myApplyShipList");
shipLists= shipLists==null?new ArrayList<ShipBean>():shipLists;
%>

<head>
<base href="<%=basePath%>">

</head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<jsp:include page="../../../common/invokeMessage.jsp" />
<html:form id="shipForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" loadCache="true" >
	<html:hidden id="operation" name="operation" value="listShip"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" simplendar="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.sales.ship.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1670" class="edit-talbe">
		<tr class="trCell">
			<td class="edit-talbe-label" id="LKOKHHFIBBFMNJBFNLGIBOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.customer.customername#}" ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEJNKMNKEMCOMMHPCJJJKCAOMBFAPKOINKLGNOK" colSpan="1" rowSpan="1">
				<html:text  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]" />
			</td>
			<td class="edit-talbe-label" id="HPOGKKLIKCIMBINFMANCKCGJBHHGKHBIIPGGNKLINKGAMAMPNBAIELOKKIHKECCM" colSpan="1" rowSpan="1">
				物料
			</td>
			<td  id="AFMOOPFEKEGCJBEKNCMKCKFPGPAEMKGBOKCBBPKFOBGOHOEONIKBFKHBNMAKNFPK" colSpan="1" rowSpan="1">
				<html:text  id="codetailCertificateDescSH"  name="codetailCertificateDescSH" value="$[codetailCertificateDescSH]"/>
			</td>
			<td class="edit-talbe-label" id="HPOGKKLIKCIMBINFMANCKCGJBHHGKHBIIPGGNKLINKGAMAMPNBAIELOKKIHKECCM" colSpan="1" rowSpan="1">
				状态
			</td>
			<td  id="AFMOOPFEKEGCJBEKAPPPLYSTATUSBPKFOBGOHOEONIKBFKHBNMAKNFPK" colSpan="1" rowSpan="1">
				<html:select  id="applyStatusSH" name="applyStatusSH">
				      <html:option label="待审批"      value="0"     selected="$[applyStatusSH]"  />
				      <html:option label="待物流分配"   value="1"     selected="$[applyStatusSH]" />
				      <html:option label="待排车"      value="2"     selected="$[applyStatusSH]"  />
				      <html:option label="已排车"      value="3"     selected="$[applyStatusSH]"  />
				      <html:option label="未通过"      value="901"   selected="$[applyStatusSH]"  />
				      <html:option label="已撤消"      value="902"   selected="$[applyStatusSH]"  />
				      <html:option label="物流拒绝"    value="903"   selected="$[applyStatusSH]"  />
				</html:select  >
			</td>
			</tr>
			<tr>
			<td class="edit-talbe-label" id="LKOKHHFIBBFMNJBFNLGIBOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.sales.custorder.cordercode#}" ></html:label>
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEJNKMNKEMCOMMHPCJJJKCAOMBFAPKOINKLGNOK" colSpan="1" rowSpan="1">
				<html:text  id="corderCodeSH"  name="corderCodeSH" value="$[corderCodeSH]"/>
			
			</td>
			 <td class="edit-talbe-label" id="HPOGKKLIKCIMBINFMANCKCGJBHHGKHBIIPGGNKLINKGAMAMPNBAIELOKKIHKECCM" colSpan="1" rowSpan="1">
				申请日期
			</td>
			<td  id="AFMOOPFEKEGCJBEKNCMKCKFPGPAEMKGBOKCBBPKFOBGOHOEONIKBFKHBNMAKNFPK" colSpan="1" rowSpan="1">
				<com:simplendar  id="applyTimeSH"  name="applyTimeSH"  value="$[applyTimeSH]" />
				
			</td>
			<td class="edit-talbe-label" id="HPOGKKLIKCIMBINFMANCKCGJBHHGKHBIIPGGNKLINKGAMAMPNBAIELOKKIHKECCM" colSpan="1" rowSpan="1">
				销售组
			</td>
			<td  id="AFMOOPFEKEGCJBEKNCMKCKFPGPAEMKGBOKCBBPKFOBGOHOEONIKBFKHBNMAKNFPK" colSpan="1" rowSpan="1">
				<html:text  id="saleGroupSH"  name="saleGroupSH"  value="$[saleGroupSH]" />
			</td>
			</tr>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="6" rowSpan="1">
			<span style="float:right;">
				<btn:search href="javascript:submit('shipForm')"/>
				<btn:reset href="javascript:cleanForm('shipForm')"/>
				<%--<btn:new href="javascript:batchDelete('shipForm','checkCorderId','','toAddShip');"/>
				<btn:delete href="javascript:batchDelete('shipForm','checkCorderId','','deleteShip');" />--%>
			</span>
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
	
	<table class="background" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;margin-top: 10px;" align="center">
		<tr  class="HeaderStyle" >
			<td width="160px">客户名称</td>
			<td width="70px">订单编号</td>
			<td width="80px">申请编号</td>
			<td width="120px">申请时间</td>
			<td width="50px">数量</td>
			<td width="50px">包数</td>
			<td>送货地址</td>
			<td width="50px">联系人</td>
			<td width="70px">电话</td>
			<td width="60px">状态</td>
			<td width="80px">操作</td>
		</tr>
	
	<%
	
				ShipBean shipBean = null,nestBean=null;
				int applyStatus=0;
				String applyStatusDesc="";
				for(int i=0,size=shipLists.size();i<size;i++){
					nestBean=shipLists.get(i);
					request.setAttribute("custOrderBean",nestBean);
					applyStatus=nestBean.getApplyStatus();
					applyStatusDesc="";
					if(applyStatus==903){applyStatusDesc="物流拒绝";}//物流拒绝
					if(applyStatus==902){applyStatusDesc="已撤消";}
					if(applyStatus==901){applyStatusDesc="未通过";}
					if(applyStatus==0){applyStatusDesc="待审批";}//初始状态
					if(applyStatus==1){applyStatusDesc="待物流分配";}//已经通过但没有分派给承商或分拆
					if(applyStatus==2){applyStatusDesc="待排车";}//已经通过，已经分派给承商
					if(applyStatus==3){applyStatusDesc="已排车";}
					String corderCode = nestBean.getCorderCode().replaceFirst("^0*","");
				%>
				<tr class="alternatingItemStyle" >
					
					<td  width="160px" style="text-align:left;"><%=nestBean.getCustomerName()%></td>
				
					<%--<td><html:a href="contoller.do?operation=viewShip&isModify=0&shipId=$[shipBean.shipId]&caddrId=$[shipBean.caddrId]"><%=nestBean.getCorderCode() %></html:a></td> --%>
				
					<td  width="70px"><%=corderCode%></td>
					
					
					
					<td width="70px">
						<html:a href="contoller.do?operation=viewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getShipCode() %>
						</html:a>
					</td>
					<td width="110px">
						<html:a href="contoller.do?operation=viewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getCreateTime() %>
						</html:a>
					</td>
					<td width="50px" style="text-align:right;">
						<html:a href="contoller.do?operation=viewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getApplyTonNum()%>
						</html:a>
					</td>
					<td width="50px" style="text-align:right;">
						<html:a href="contoller.do?operation=viewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getApplyPackNum() %>
						</html:a>
					</td>
					<td  style="text-align:left;">
						<html:a href="contoller.do?operation=viewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getAreaName() %><%=nestBean.getCaddrDetail() %>
						</html:a>
					</td>
					<td width="50px" style="text-align:left;">
						<html:a href="contoller.do?operation=viewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getCaddrContactor() %>
						</html:a>
					</td>
					<td width="70px" style="text-align:left;">
						<html:a href="contoller.do?operation=viewShipApply&corderId=$[custOrderBean.corderId]&codetailId=$[custOrderBean.codetailId]&shipId=$[custOrderBean.shipId]&shipDetailId=$[custOrderBean.shipDetailId]">
						<%=nestBean.getCaddrTelephone() %>
						</html:a>
					</td>
					<td width="50px" id="status" name="status">
					<html:hidden id="applyStatus" name="applyStatus" value="$[shipBean.applyStatus]"/>
					<%=applyStatusDesc %>
					</td>
					<td width="80px">
					<%if(applyStatus==0){ %>
						<html:a href="contoller.do?operation=cancelShipApply&shipId=$[custOrderBean.shipId]">
							<button type="button" class="commonBtn" >撤消</button>
						</html:a>
					<%} %>
					<%if(applyStatus==902){ %>
						<btn:delete href="contoller.do?operation=deleteCancelShip&shipId=$[custOrderBean.shipId]"/>
					<%} %>
					</td>
					<%--<html:td  label="查看"><btn:view href="contoller.do?operation=viewShip&isModify=0&shipId=$[shipBean.shipId]"/></html:td>
					<html:td  label="修改"><btn:modify href="contoller.do?operation=viewShip&isModify=1&shipId=$[shipBean.shipId]"/></html:td>
					<html:td  label="删除"></html:td>

				--%></tr>
			<%
				}//for
		/**	}//while detailShipMap
		}//while orderShipMap
	}//while customerOrderShipListMap
	
	

	 tools.tool.clear(customerOrderShipListMap);
	 tools.tool.clear(shipLists);
	 tools.tool.clear(orderShipMap);
	 tools.tool.clear(detailShipMap);
	**/
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
<jsp:include page="../../../common/invokeMessage.jsp" />
