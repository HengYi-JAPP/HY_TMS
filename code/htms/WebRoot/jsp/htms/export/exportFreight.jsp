<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.zzy.htms.dictionary.factory.FactoryRepository" %>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@ include file="../../common/impart/export.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%String path = request.getContextPath();String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String forward="jsp/htms/export/exportFreight.jsp";
request.setAttribute("factoryList",FactoryRepository.getFactoryList());  
 %>
<head><base href="<%=basePath%>"></head>
<com:loader  js="js/common/common.js"/>
<com:loader css="css/common/sub-table-list.css"/>
<style>
<!--
/* 列表样式 */
.dataTable{ border:1px solid #CCCCCC; font-size:12px; padding-left:2px;table-layout:fixed;}/* 整个table 样式 */
/* 列表标题行tr 样式 */
.titleRow {  height:40px;background-color: #3b9dd8;color: #fff;}
/* 列表标题行tr 样式 */
.headerRow {  height:40px; background-color:#009ad6;  }
/* th 样式 */
.headerRow td{ height:40px; font-size:12px; text-align:center; color:#000000; font-weight:bold; border:1px solid #CCCCCC;}/* td样式 */
/* td 样式（奇数行）  */
.dataRow {}
/* 样式（偶数行样式） */
.dataRow td{ height:25px; font-size:12px;  border:1px solid #CCCCCC;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;}/* 样式（偶数行样式） */

-->
</style>
<script type="text/javascript">
<!--
//var oneSubmit=true;
function exportEvent(exportId,viewHtml){
var formAction = "";
if(!exportId){
	return;
}
if(viewHtml){
	document.getElementById("viewHtml").value='true';
}else{
	document.getElementById("viewHtml").value='false';
}

var factoryName = document.getElementsByName("factoryIdSH");
var factoryIds = "";
for(var i=0;i<factoryName.length;i++){
	if(factoryName[i].checked == true){
		factoryIds+=factoryName[i].value+",";
	}
}
if(factoryIds.length>0){
	factoryIds = factoryIds.substr(0, factoryIds.length - 1);
	document.getElementById("factoryIds").value = factoryIds;
}


document.getElementById("excelExportId").value=exportId;
//if(oneSubmit){
	document.getElementById("excelExportForm").submit();
	//oneSubmit=false;
	//window.setTimeout(reload,1000); 
//}


}
function syncSapInvoiceFreight(){
document.getElementById("operation").value="syncSapInvoiceFreight";
document.getElementById("excelExportForm").action="contoller.do";
document.getElementById("excelExportForm").submit();
}
function reload(){
	window.location.reload();
}
//3秒后自动跳转到登录页面


//-->
</script>
<html:form id="excelExportForm"    action="excelExportServlet"  method="POST" >
	<jsp:include page="../../common/impart/table-banner-new.jsp">
		<jsp:param value='运费导出' name="title"/>
	</jsp:include>
	<com:loader  simplendar="true" />
	
	<html:hidden id="excelExportId" name="excelExportId" value=""/>
	<html:hidden id="viewHtml" name="viewHtml" value=""/>
	<html:hidden id="operation" name="operation" value=""/>
	<table id="1670" class="edit-talbe">
		<tr class="trCell">
			
		    <td class="edit-talbe-label" id="LKOKHHFIBBFMNJBFNLGIBOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				开始日期
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEJNKMNKEMCOMMHPCJJJKCAOMBFAPKOINKLGNOK" colSpan="1" rowSpan="1">
				<com:simplendar  id="startDateSH"  name="startDateSH"   defaultToday="true" value="$[startDateSH]"/>
			</td>	
			<td class="edit-talbe-label" id="LKOKHHFIBBFPRODUCTPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				结束日期
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJPRODUCTCODEOMMHPCJJJKCAOMBFAPKOINKLGNOK"  colSpan="1">
				<com:simplendar  id="endDateSH"  name="endDateSH"   defaultToday="true" value="$[endDateSH]"/>	
		    </td>
		</tr>
		<tr class="trCell">
			<td class="edit-talbe-label" id="LKOKHHFIBBFMNJBFNLGIBOIEJGIGGLNKCPOJIMKGOOKGAKLABGGKNFGKFKBPCGPN" colSpan="1" rowSpan="1">
				工厂
			</td>
			<td  id="CGGINOICJCBAPAMBBMOLNKMIJGEJNKMNKEMCOMMHPCJJJKCAOMBFAPKOINKLGNOK" colSpan="1" rowSpan="1">
				<html:checkbox id="factoryIdSH"  name="factoryIdSH"   list="factoryList"  label="factoryName"  value="factoryId"/>
				<html:hidden id="factoryIds" name="factoryIds" value=""/>
			</td>	
		</tr>
		<tr class="trCell">
		
			<td   id="manageBox" colSpan="6" rowSpan="1">
			      	<comp:viewExport  servletPath="excelExportServlet" exportId="exportFreight" btnName="查看运费"  useForm="true" onclick="exportEvent('exportFreight',true);" forward="<%=forward %>" splitShow="true"></comp:viewExport>
			   	<btn:button   value="SAP过帐运费同步"  name="SAP过帐运费同步" typeId="orderSyn" href="javascript:void(0);" styleClass="button-self-style" onclick="syncSapInvoiceFreight();"/>
				 <comp:excelExport  fileName="运费表" servletPath="excelExportServlet" exportId="exportFreight" btnName="导出运费"  useForm="true" onclick="exportEvent('exportFreight');" forward="<%=forward %>" >
			   		<comp:excelSheet   sheetName="运费表" order="3" title="所有运费列表" titleAlign="center" titleBlod="true"  >
			   			<comp:excelSheetCol order="1" dataCol="SAPCODE" excelCol="调拨单号" headerBlod="true" ></comp:excelSheetCol>
			   			<comp:excelSheetCol order="3" dataCol="CUSTOMERNAME" excelCol="客户" headerBlod="true" ></comp:excelSheetCol>
			   			<comp:excelSheetCol order="5" dataCol="SALEMAN" excelCol="业务员" headerBlod="true" ></comp:excelSheetCol>			   						   			
			   			<comp:excelSheetCol order="7" dataCol="SALEORG" excelCol="销售组织" headerBlod="true" ></comp:excelSheetCol>
						<comp:excelSheetCol order="9" dataCol="FACTORYID" excelCol="工厂" headerBlod="true">				
				   			<comp:excelSheetColOperate order="1"  type="replace" repaceClass="com.zzy.taglib.export.htms.business.FactoryReplaceBusiness"/>
						</comp:excelSheetCol>			
						<comp:excelSheetCol order="11" dataCol="PRODUCTID" excelCol="产品" headerBlod="true">
							<comp:excelSheetColOperate order="1"  type="replace" repaceClass="com.zzy.taglib.export.htms.business.ProductReplaceBusiness"/>
				   		</comp:excelSheetCol>	
				   		<comp:excelSheetCol order="13" dataCol="AREAID" excelCol="地址" headerBlod="true">
							<comp:excelSheetColOperate order="1"  type="replace" repaceClass="com.zzy.taglib.export.business.AreaReplaceBusiness"/>
						</comp:excelSheetCol>
								
						<comp:excelSheetCol order="15" dataCol="FREIGHTTYPE" excelCol="计费类型" headerBlod="true">			
							<comp:excelSheetColOperate order="1" tragetCol="" replace="正常计费" type="replace" find="1"/>
				   			<comp:excelSheetColOperate order="2" tragetCol="" replace="特殊客户" type="replace" find="2"/>
							<comp:excelSheetColOperate order="3" tragetCol="" replace="指定运价" type="replace" find="3"/>
							<comp:excelSheetColOperate order="4" tragetCol="" replace="贸易商运价" type="replace" find="4"/>
					        <comp:excelSheetColOperate order="5" tragetCol="" replace="自备车自提运价" type="replace" find="5"/>
						</comp:excelSheetCol>
						<comp:excelSheetCol order="17" dataCol="FREIGHTSTYLE" excelCol="计费方式" headerBlod="true">
							<comp:excelSheetColOperate order="1" tragetCol="" replace="按重量计" type="replace" find="6"/>
						</comp:excelSheetCol>
						<comp:excelSheetCol order="19" dataCol="FREIGHTMODEL" excelCol="计费模式" headerBlod="true"></comp:excelSheetCol>
						<comp:excelSheetCol order="21" dataCol="TONUM" excelCol="计费重量(千克)" headerBlod="true"  sumCol="true" align="right"></comp:excelSheetCol>
						<comp:excelSheetCol order="23" dataCol="FREIGHTPRICE" excelCol="客户单价" headerBlod="true" align="right"></comp:excelSheetCol>
						<comp:excelSheetCol order="25" dataCol="TOTALFREIGHT" excelCol="客户运费" sumCol="true" headerBlod="true" align="right"></comp:excelSheetCol>
						<comp:excelSheetCol order="27" dataCol="SAPCODE" excelCol="承运商" headerBlod="true" refSqlName="carrier" refColName="CARRIERNAME"></comp:excelSheetCol>
						<comp:excelSheetCol order="29" dataCol="CARRIERPRICE" excelCol="承运商单价(元)" headerBlod="true" align="right"></comp:excelSheetCol>
						<comp:excelSheetCol order="31" dataCol="TOTALCARRIERFREIGHT" excelCol="承运商运费(元)" sumCol="true" headerBlod="true" align="right"></comp:excelSheetCol>
						<comp:excelSheetCol order="33" dataCol="SPANDFREIGHT" excelCol="运费差额" sumCol="true" headerBlod="true" align="right">
							<comp:excelSheetColOperate order="1" tragetCol="TOTALCARRIERFREIGHT"  sourceCol="TOTALFREIGHT" type="subtract" />
						</comp:excelSheetCol>
						<comp:excelSheetCol order="35" dataCol="INVOICEFREIGHT" excelCol="开票运费" sumCol="true" headerBlod="true" align="right"></comp:excelSheetCol>
						<comp:excelSheetCol order="35" dataCol="INVOICETONNUM" excelCol="开票实际重量" sumCol="true" headerBlod="true" align="right"></comp:excelSheetCol>
						
						<comp:excelSheetCol order="37" dataCol="SAPCODE" excelCol="车牌号" headerBlod="true" refSqlName="carNo,fetchCar" refColName="VEHICLENO,FETCHCAR"></comp:excelSheetCol>
						<comp:excelSheetCol order="39" dataCol="CREATETIME" excelCol="订单创建日期"  headerBlod="true" align="center"></comp:excelSheetCol>
						<%--<comp:excelSheetCol order="41" dataCol="SHIPTIME" excelCol="下单日期" headerBlod="true" align="center"></comp:excelSheetCol>--%>
						<comp:excelSheetCol order="41" dataCol="SAPCODE" excelCol="SAP创建日期" headerBlod="true" refSqlName="assignTime" refColName="CREATETIME"></comp:excelSheetCol>
					    <comp:excelSheetCol order="35" dataCol="INVOICETIME" excelCol="开票时间" headerBlod="true" align="center"></comp:excelSheetCol>
						<comp:excelSheetCol order="50" dataCol="PRICENOTICE" excelCol="备注" headerBlod="true" align="center"></comp:excelSheetCol>
					
						<comp:excelSheetSql>
						Select Distinct Transfer.Transid, Sapcode, Tb_Htms_Custorder.Customername, Tb_Htms_Custorder.Saleman,
								Tb_Htms_Custorder.Createtime, Tb_Htms_Ship.Createtime As Shiptime, Tb_Htms_Custorder.Saleorg,
								Tb_Htms_Freight.Routeid, Transfer.Factoryid, Transfer.Productid, Tb_Htms_Customeraddr.Areaid, Freighttype,
								Freightstyle, Tb_Htms_Freight.Freightmodel, Tb_Htms_Freight.Priceid, Freightprice, Totalfreight,
								Tb_Htms_Freight.Carrierprice, Totalcarrierfreight, Invoicefreight, Invoicetonnum, Invoicetime,
								Tb_Htms_Transfer_Price.Pricenotice, Sum(Tb_Htms_Freight.Applytonnum) As Tonum
							From (Select Tb_Htms_Transfer.*,Route.factoryid,route.productid 
										 From Tb_Htms_Transfer  Left Join  ( Select Distinct Transid, Factoryid, Productid From Tb_Htms_Transferdetail Order By Transid ) Route On 
							       Tb_Htms_Transfer.Transid =	Route.Transid  
										 Where To_Date(Substr(Createtime, 0, 10), 'YYYY-MM-DD') >=   To_Date('$[startDateSH]', 'YYYY-MM-DD') And
											   To_Date(Substr(Createtime, 0, 10), 'YYYY-MM-DD') <=   To_Date('$[endDateSH]', 'YYYY-MM-DD' )
											   <if test="'$[factoryIdSH]'!=''">
												   And Route.factoryid in ($[factoryIds])
											   </if>
							              ) Transfer
							Left Join Tb_Htms_Freight On Transfer.Saptranscode = Tb_Htms_Freight.Sapcode
							Left Join Tb_Htms_Transfer_Price On Tb_Htms_Transfer_Price.Transid = Transfer.Transid
							Left Join Tb_Htms_Ship On Transfer.Shipid = Tb_Htms_Ship.Shipid
							Left Join Tb_Htms_Custorder On Tb_Htms_Custorder.Corderid = Tb_Htms_Ship.Corderid
							Left Join Tb_Htms_Customeraddr On Tb_Htms_Ship.Caddrid = Tb_Htms_Customeraddr.Caddrid
							
							Where Isestimate = 0 And Tb_Htms_Freight.Isvalidate = 1
							
							Group By Transfer.Transid, Sapcode, Customername, Tb_Htms_Custorder.Createtime, Saleman, Tb_Htms_Ship.Createtime,
											 Saleorg, Tb_Htms_Freight.Routeid, Transfer.Factoryid, Transfer.Productid, Tb_Htms_Customeraddr.Areaid, Freighttype,
											 Freightstyle, Tb_Htms_Freight.Freightmodel, Tb_Htms_Freight.Priceid, Freightprice, Totalfreight,
											 Tb_Htms_Freight.Carrierprice, Totalcarrierfreight, Invoicefreight, Invoicetonnum, Invoicetime,
											 Tb_Htms_Transfer_Price.Pricenotice
							Order By Sapcode
						
						</comp:excelSheetSql>
						<comp:excelSheetRefSql name="carrier">
						select t.saptranscode as SAPCODE,c.carriername from tb_htms_transfer t,tb_htms_carrier c,tb_htms_transport p
						where t.transid=p.transid 
						AND p.carrierid=c.carrierid 
						AND t.saptranscode IN(
							SELECT DISTINCT SAPCODE
							FROM TB_HTMS_FREIGHT 
							WHERE 
							ISESTIMATE = 0 AND TB_HTMS_FREIGHT.ISVALIDATE=1 
							GROUP BY SAPCODE
						)
						 AND to_date(SUBSTR(t.createtime, 0, 10), 'YYYY-MM-DD') >=
			               to_date('$[startDateSH]', 'YYYY-MM-DD')
			           	 AND to_date(SUBSTR(t.createtime, 0, 10), 'YYYY-MM-DD') <=
			               to_date('$[endDateSH]', 'YYYY-MM-DD')
						GROUP BY t.saptranscode,c.carriername
						</comp:excelSheetRefSql>
						
						<comp:excelSheetRefSql name="carNo">
						select t.saptranscode as SAPCODE,v.vehicleno
						from tb_htms_transfer t,tb_htms_transport p,tb_htms_transportsend ps,tb_htms_send s,tb_htms_vehicle v
												where t.transid=p.transid 
												AND p.transportid=ps.transportid 
						            AND ps.sendid=s.sendid 
						            and s.vehicleid=v.vehicleid
								AND t.saptranscode IN(
									SELECT DISTINCT SAPCODE
									FROM TB_HTMS_FREIGHT 
									WHERE 
									ISESTIMATE = 0 AND TB_HTMS_FREIGHT.ISVALIDATE=1 
									GROUP BY SAPCODE
								)
								AND  to_date(SUBSTR(t.createtime,0,10) ,'YYYY-MM-DD') >= to_date('$[startDateSH]' ,'YYYY-MM-DD')
								AND  to_date(SUBSTR(t.createtime,0,10) ,'YYYY-MM-DD')<=to_date('$[endDateSH]' ,'YYYY-MM-DD') 
								GROUP BY t.saptranscode,v.vehicleno
						</comp:excelSheetRefSql>
						<comp:excelSheetRefSql name="fetchCar">
						select t.saptranscode as SAPCODE,t.fetchcar from tb_htms_transfer t where t.selffetch=9
						AND t.saptranscode IN(
							SELECT DISTINCT SAPCODE
							FROM TB_HTMS_FREIGHT 
							WHERE 
							ISESTIMATE = 0 AND TB_HTMS_FREIGHT.ISVALIDATE=1 
							GROUP BY SAPCODE
						)
						AND  to_date(SUBSTR(t.createtime,0,10) ,'YYYY-MM-DD') >= to_date('$[startDateSH]' ,'YYYY-MM-DD')
						AND  to_date(SUBSTR(t.createtime,0,10) ,'YYYY-MM-DD')<=to_date('$[endDateSH]' ,'YYYY-MM-DD')
						GROUP BY t.saptranscode,t.fetchcar
						</comp:excelSheetRefSql>
						<comp:excelSheetRefSql name="assignTime">
						select t.saptranscode as SAPCODE,substr(p.createtime,0,10) as createtime from tb_htms_transfer t,tb_htms_transport p
						where t.transid=p.transid 
						AND t.saptranscode IN(
							SELECT DISTINCT SAPCODE
							FROM TB_HTMS_FREIGHT 
							WHERE 
							ISESTIMATE = 0 AND TB_HTMS_FREIGHT.ISVALIDATE=1 
							GROUP BY SAPCODE
						)
						AND  to_date(SUBSTR(t.createtime,0,10) ,'YYYY-MM-DD') >= to_date('$[startDateSH]' ,'YYYY-MM-DD')
						AND  to_date(SUBSTR(t.createtime,0,10) ,'YYYY-MM-DD')<=to_date('$[endDateSH]' ,'YYYY-MM-DD')
						GROUP BY t.saptranscode,p.createtime
						</comp:excelSheetRefSql>
			   		</comp:excelSheet>
			   <%--		
			   		<comp:excelSheet   sheetName="单价运价表" order="1" title="所有单价运价表" titleAlign="center" titleBlod="true"  >
							
							<comp:excelSheetCol order="1" dataCol="FACTORYID" excelCol="工厂" headerBlod="true">				
								<comp:excelSheetColOperate order="1" tragetCol="" replace="石化" type="replace" find="1"/>
					   			<comp:excelSheetColOperate order="2" tragetCol="" replace="聚合物" type="replace" find="2"/>
					   			<comp:excelSheetColOperate order="3" tragetCol="" replace="高新" type="replace" find="3"/>
					   			<comp:excelSheetColOperate order="4" tragetCol="" replace="逸鹏" type="replace" find="4"/>
					   			<comp:excelSheetColOperate order="5" tragetCol="" replace="逸暻" type="replace" find="5"/>
					   			<comp:excelSheetColOperate order="6" tragetCol="" replace="逸枫" type="replace" find="6"/>
							</comp:excelSheetCol>			
							<comp:excelSheetCol order="2" dataCol="PRODUCTID" excelCol="产品" headerBlod="true">
								<comp:excelSheetColOperate order="1" tragetCol="" replace="DTY" type="replace" find="1"/>
					   			<comp:excelSheetColOperate order="2" tragetCol="" replace="POY" type="replace" find="2"/>
					   			<comp:excelSheetColOperate order="3" tragetCol="" replace="ITY" type="replace" find="3"/>
					   			<comp:excelSheetColOperate order="4" tragetCol="" replace="FDY" type="replace" find="4"/>
					   			<comp:excelSheetColOperate order="5" tragetCol="" replace="切片" type="replace" find="5"/>
					   		</comp:excelSheetCol>	
					   		<comp:excelSheetCol order="3" dataCol="AREAID" excelCol="地址" headerBlod="true">
								<comp:excelSheetColOperate order="1"  type="replace" repaceClass="com.zzy.taglib.export.business.AreaReplaceBusiness"/>
							</comp:excelSheetCol>
							<comp:excelSheetCol order="4" dataCol="PRICETYPE" excelCol="类型" headerBlod="true" >
								<comp:excelSheetColOperate order="1" tragetCol="" replace="按吨计" type="replace" find="6"/>
							</comp:excelSheetCol>	
							<comp:excelSheetCol order="5" dataCol="FREIGHTMODEL" excelCol="模式" headerBlod="true" >
								<comp:excelSheetColOperate order="1" tragetCol="" replace="按单价" type="replace" find="1"/>
								<comp:excelSheetColOperate order="1" tragetCol="" replace="一口价" type="replace" find="2"/>				
							</comp:excelSheetCol>	
							<comp:excelSheetCol order="6" dataCol="PRICESTART" excelCol="开始区间" headerBlod="true" ></comp:excelSheetCol>	
							<comp:excelSheetCol order="7" dataCol="PRICEEND" excelCol="结束区间" headerBlod="true" ></comp:excelSheetCol>	
							<comp:excelSheetCol order="8" dataCol="CUSTOMERPRICE" excelCol="客户运价" headerBlod="true" ></comp:excelSheetCol>	
							<comp:excelSheetCol order="9" dataCol="CARRIERPRICE" excelCol="承运商运价" headerBlod="true" ></comp:excelSheetCol>	
							<comp:excelSheetCol order="10" dataCol="VALIDATEDATE" excelCol="生效时间" headerBlod="true" ></comp:excelSheetCol>		
							<comp:excelSheetCol order="12" dataCol="ISVALIDATE" excelCol="是否有效" headerBlod="true">
								<comp:excelSheetColOperate order="1" tragetCol="" replace="有效" type="replace" find="1"/>
					   			<comp:excelSheetColOperate order="2" tragetCol="" replace="无效" type="replace" find="0"/>
							</comp:excelSheetCol>
							<comp:excelSheetCol order="13" dataCol="ROUTEID" excelCol="线路ID" headerBlod="true" ></comp:excelSheetCol>
							<comp:excelSheetCol order="14" dataCol="PRICEID" excelCol="运价ID" headerBlod="true" ></comp:excelSheetCol>
							<comp:excelSheetSql>
							SELECT 
								TB_HTMS_ROUTE.ROUTEID,FACTORYID,AREAID,PRODUCTID ,PRICEID,PRICETYPE,FREIGHTMODEL  ,PRICESTART ,
								PRICEEND ,CUSTOMERPRICE,CARRIERPRICE ,VALIDATEDATE ,TB_HTMS_TRANSPRICE.ISVALIDATE 
							FROM TB_HTMS_TRANSPRICE,TB_HTMS_ROUTE
							WHERE 
								TB_HTMS_TRANSPRICE.ROUTEID=TB_HTMS_ROUTE.ROUTEID
								AND TB_HTMS_TRANSPRICE.FREIGHTMODEL=1
								ORDER BY  FACTORYID,PRODUCTID,AREAID,PRICESTART
				   	 		</comp:excelSheetSql>
				   		</comp:excelSheet>--%>
			   	</comp:excelExport>
			   	
			  
		    </td>
		</tr>
		<tr class="trCell">
		
			<td   id="viewContent" colSpan="6" rowSpan="1">
				<comp:viewContent exportId="exportFreight"></comp:viewContent>
			</td>
		</tr>
	</table>


</html:form>
