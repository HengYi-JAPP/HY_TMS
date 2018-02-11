<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../../common/impart/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/"; %>
<head><base href="<%=basePath%>">

</head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/table-list-new.css"/>
<html:form id="sendForm"  enctype="application/x-www-form-urlencoded"  action="contoller.do"  method="GET" loadCache="true" >
	<com:loader  simplendar="true"  />
	<html:hidden id="operation" name="operation" value="listSendToLogistics"/>
	<com:loader binder="true" checkall="true" switchbox="true" ajax="true" />
	<jsp:include page="../../../common/impart/table-banner-new.jsp">
		<jsp:param value='<%=tools.tool.getLocal("jsp.htms.logistic.send.title.list") %>' name="title"/>
	</jsp:include>
	<table id="1674" class="edit-talbe">
		<tr class="trCell">
			
			<td class="edit-talbe-label" id="JJLCNKKNNINNCGNMCFGNKBHKIMLMBLJJLMKPMKAOJPFFNBBIPPNOJCHKPMKLJPOK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.send.sendcode#}" ></html:label>
			</td>
			<td  id="MHMPJAGCIOCKAJPAIGBLNEOEKIBOMJKCJEEMNLEKJKKLFEJCOGFNKNKOLIGIKBHF" colSpan="1" rowSpan="1">
				<html:text  id="sendCodeSH"  name="sendCodeSH" value="$[sendCodeSH]" />
			</td>
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				运单编号
			</td>
			<td  style="text-align:left;" colSpan="1">
				<html:text  id="transportCodeSH"  name="transportCodeSH" value="$[transportCodeSH]" />
			</td>
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				sap调拨单号
			</td>
			<td  style="text-align:left;" colSpan="1">
				<html:text  id="sapCodeSH"  name="sapCodeSH" value="$[sapCodeSH]"  />
			</td>
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				客户名称
			</td>
			<td  style="text-align:left;" colSpan="1">
				<html:text  id="customerNameSH"  name="customerNameSH" value="$[customerNameSH]"  />
			</td>
			
		</tr>
		<tr class="trCell">
		    <td class="edit-talbe-label" id="JJLCNKKNNINNCGNMCFGNKBHKIMLMBLJJLMKPMKAOJPFFNBBIPPNOJCHKPMKLJPOK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.driver.drivername#}" ></html:label>
			</td>
			<td  id="MHMPJAGCIOCKAJPAIGBLNEOEKIBOMJKCJEEMNLEKJKKLFEJCOGFNKNKOLIGIKBHF" colSpan="1" rowSpan="1">
				<html:text  id="driverNameSH"  name="driverNameSH"  value="$[driverNameSH]" />
			</td>
			<td class="edit-talbe-label" id="JJLCNKKNNINNCGNMCFGNKBHKIMLMBLJJLMKPMKAOJPFFNBBIPPNOJCHKPMKLJPOK" colSpan="1" rowSpan="1">
				<html:label  label="{$jsp.htms.logistic.vehicle.vehicleno#}" ></html:label>
			</td>
			<td  id="MHMPJAGCIOCKAJPAIGBLNEOEKIBOMJKCJEEMNLEKJKKLFEJCOGFNKNKOLIGIKBHF" colSpan="1" rowSpan="1">
				<html:text  id="vehicleNoSH"  name="vehicleNoSH" value="$[vehicleNoSH]"  />
			</td>
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				状态
			</td>
			<td  style="text-align:left;" >
				
				<html:select id="sendStatusSH" name="sendStatusSH">
					<html:option label="未派车" value="0" selected="$[sendStatusSH]" />				
					<html:option label="已派车" value="1" selected="$[sendStatusSH]" />
					<html:option label="配送中" value="101" selected="$[sendStatusSH]" />
					<html:option label="已签收" value="102" selected="$[sendStatusSH]" />
				</html:select>
			</td>
			<td class="edit-talbe-label" id="CJEBKBEKENAMPEFKBAELOKKLPEBCFGKNIAEAOJOALNPLBMGIAJBKAJOPAABFLGNK" colSpan="1" rowSpan="1">
				承运商
			</td>
			<td  style="text-align:left;" colSpan="1">
				<html:select id="carrierIdSH" name="carrierIdSH"  list="carrierList">
					<html:option label="carrierName" value="carrierId" selected="$[carrierIdSH]"/>
				</html:select>
				<span style="float:right;">
					<btn:search href="javascript:submit('sendForm')"/>
					<btn:reset href="javascript:cleanForm('sendForm','detailTime')"/>
				</span>
			</td>
		</tr>
	</table>
	<table>
		<tr class="trCell">
			<td   class=""   id="manageBox" colSpan="6" rowSpan="1">
			<html:a href="javascript:void(0);" style="border:0;text-decoration:none;">
				<input type="button"  id="" name="" value="派车"  onclick="javascript:batchDelete('sendForm','checkSendId','','doSendCarToLogistics');" class="commonBtn">
			</html:a>
			</td>
		</tr>
	  </table>

	<html:table styleClass="dgbackground" cellSpacing="0"  border="1" id="userGrid_DataGrid1" style="width:100%; border-collapse: collapse;" align="center" list="sendList" bean="sendBean" isHead="true" >
		<html:tr styleClass="dgAlternatingItemStyle" headerStyleClass="dgHeaderStyle" onmouseover="onMouseMoveOverTableList(this)">
			<html:td label="<input type='checkbox' id='checkAll' />{$jsp.common.operation.selectall#}" width="80px"><html:checkbox name="checkSendId" id="checkSendId" value="$[sendBean.sendId]" /></html:td>
			<html:td  label="{$jsp.htms.logistic.send.sendcode#}"  property="" >
				<html:a href="contoller.do?operation=toViewSendTransportToLogistics&isModify=0&sendId=$[sendBean.sendId]">
				<html:value value="$[sendBean.sendCode]"></html:value>
				</html:a>
			</html:td>
			<html:td label="运单编号" property="transportCode"/>
				<html:td label="SAP调拨单号" property="sapTransCode"/>
			<html:td label="客户名称" property="customerName"   width="200px"/>
			<html:td  label="司机"  property="driverName" />
			<html:td  label="{$jsp.htms.logistic.driver.drivermobile#}"  property="driverMobile" />
			<html:td  label="{$jsp.htms.logistic.vehicle.vehicleno#}"  property="vehicleNo" />
			<html:td  label="派车时间"  property="sendTime" width="120px"/>
			<%--
			<html:td  label="{$jsp.htms.logistic.send.plantime#}"  property="planTime" width="130px" >
				<html:select id="detailTime" name="detailTime" style="border:0px;"  disabled="true">
					<html:option label=" 7:00- 8:00" value="7" selected="$[sendBean.detailTime]"/>
					<html:option label=" 8:00- 9:00" value="8" selected="$[sendBean.detailTime]"/>
					<html:option label=" 9:00-10:00" value="9" selected="$[sendBean.detailTime]"/>
					<html:option label="10:00-11:00" value="10" selected="$[sendBean.detailTime]"/>
					<html:option label="11:00-12:00" value="11" selected="$[sendBean.detailTime]"/>
					<html:option label="12:00-13:00" value="12" selected="$[sendBean.detailTime]"/>
					<html:option label="13:00-14:00" value="13" selected="$[sendBean.detailTime]"/>
					<html:option label="14:00-15:00" value="14" selected="$[sendBean.detailTime]"/>
					<html:option label="15:00-16:00" value="15" selected="$[sendBean.detailTime]"/>
					<html:option label="16:00-17:00" value="16" selected="$[sendBean.detailTime]"/>
					<html:option label="17:00-18:00" value="17" selected="$[sendBean.detailTime]"/>
					<html:option label="18:00-19:00" value="18" selected="$[sendBean.detailTime]"/>
					<html:option label="19:00-20:00" value="19" selected="$[sendBean.detailTime]"/>
					<html:option label="20:00-21:00" value="20" selected="$[sendBean.detailTime]"/>
					<html:option label="21:00-22:00" value="21" selected="$[sendBean.detailTime]"/>
				</html:select>
			</html:td>		 --%>	
			<html:td  label="重量"  property="applyTonNum"  width="80px"/>
			<html:td  label="包数"  property="applyPackNum"  width="60px"/>
			<html:td  label="状态"   width="55px">
				<logic:if condition="$[sendBean.sendStatus]==0">
					未派车
				</logic:if>
				<logic:if condition="$[sendBean.sendStatus]==1&&$[sendBean.transportStatus]!=102">
					已派车
				</logic:if>
				<logic:if condition="$[sendBean.sendStatus]==101&&$[sendBean.transportStatus]!=102">
					配送中
				</logic:if>
				<logic:if condition="$[sendBean.transportStatus]==102">
					已签收
				</logic:if>
			</html:td>
			<html:td  label="操作">
				<logic:if condition="$[sendBean.sendStatus]==0">
					<html:a href="contoller.do?operation=doSendCarToLogistics&checkSendId=$[sendBean.sendId]" style="border:0;text-decoration:none;">
					<input type="button"  id="" name="" value="派车"  class="commonBtn">
					</html:a>
				</logic:if>
				<logic:if condition="$[sendBean.sendStatus]==1&&$[sendBean.transportStatus]!=102">
					<html:a href="contoller.do?operation=canncelSendCar&sendId=$[sendBean.sendId]" style="border:0;text-decoration:none;">
					    <input type="button"  id="" name="" value="取消派车"  class="commonBtn" style="width: 80px;">
				    </html:a>
				</logic:if>
				<logic:if condition="$[sendBean.sendStatus]==101||$[sendBean.transportStatus]==102">
					<html:a href="contoller.do?operation=canncelSendLocationFlow&sendId=$[sendBean.sendId]" style="border:0;text-decoration:none;">
					    <input type="button"  id="" name="" value="取消配送"  class="commonBtn" style="width: 80px;">
				    </html:a>
				</logic:if>
			</html:td>
		</html:tr>
	</html:table>

	<table id="pageFooter" class="">
		<tr class="trCell">
			<td   class="pagination"   id="pagination" colSpan="1" rowSpan="1">
				<com:checkall targetName="checkSendId" checkId="checkAll"/>
				<com:page formId="sendForm" pageCtlName="pageCtl"/>
			</td>
		</tr>
	</table>
</html:form>
<jsp:include page="../../../common/invokeMessage.jsp" />