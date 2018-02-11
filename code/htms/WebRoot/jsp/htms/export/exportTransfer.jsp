<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../common/impart/taglib.jsp"%>
<%@ include file="../../common/impart/export.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head><base href="<%=basePath%>"></head>

<script type="text/javascript">

function exportEvent(exportId){
	var isExport=true;
	var formAction = "";
	if(!exportId){
		return;
	}
	document.getElementById("excelExportId").value=exportId;
	if(isExport){
		document.getElementById("transferForm").action='excelExportServlet'
		document.getElementById("searchTransfer").disabled=true;
		document.getElementById("resetTransfer").disabled=true;
		document.getElementById("transferForm").submit();
		isExport=false;
	}
	if(isExport==false){
		document.getElementById("transferForm").action='contoller.do'
		document.getElementById("searchTransfer").disabled=false;
		document.getElementById("resetTransfer").disabled=false;
		
	}
		
	
}



</script>
	<html:hidden id="excelExportId" name="excelExportId" value=""/>

				 <comp:excelExport  fileName="调拨单列表" servletPath="excelExportServlet" exportId="exportTransfer" btnName="导出"  useForm="true" onclick="exportEvent('exportTransfer');" >
			   		<comp:excelSheet   sheetName="调拨单列表" order="3" title="调拨单列表" titleAlign="center" titleBlod="true"  >
			   			<comp:excelSheetCol order="1" dataCol="ISURGENT" excelCol="是否加急" headerBlod="true" >
			   				<comp:excelSheetColOperate order="1" tragetCol="" replace="是" type="replace" find="1"/>
				   			<comp:excelSheetColOperate order="2" tragetCol="" replace="否" type="replace" find="0"/>
			   			</comp:excelSheetCol>
			   			<comp:excelSheetCol order="3" dataCol="CREATETIME" excelCol="审批时间" headerBlod="true" ></comp:excelSheetCol>
			   			<comp:excelSheetCol order="5" dataCol="SHIPCODE" excelCol="申请编号" headerBlod="true" gridWidth="25"></comp:excelSheetCol>
						<comp:excelSheetCol order="7" dataCol="SAPTRANSCODE" excelCol="SAP调拨单号" headerBlod="true" ></comp:excelSheetCol>
						<comp:excelSheetCol order="9" dataCol="CUSTOMERNAME" excelCol="客户名称" headerBlod="true">	</comp:excelSheetCol>
						<comp:excelSheetCol order="11" dataCol="AREAID" excelCol="地区" headerBlod="true" gridWidth="25">
							<comp:excelSheetColOperate order="1"  type="replace" repaceClass="com.zzy.taglib.export.business.AreaReplaceBusiness"/>
						</comp:excelSheetCol>	
						<comp:excelSheetCol  order="12" dataCol="CADDRDETAIL" excelCol="详细地址" headerBlod="true"></comp:excelSheetCol>	
						<comp:excelSheetCol order="13" dataCol="PRODUCTNAME" excelCol="产品" headerBlod="true"></comp:excelSheetCol>	
				   		<comp:excelSheetCol  order="15" dataCol="FREIGHT" excelCol="SAP运费(元/吨)" headerBlod="true" sumCol="true"></comp:excelSheetCol>
				   		<comp:excelSheetCol  order="17" dataCol="TRANSPORTTOTALPRICE" excelCol="运费" headerBlod="true" sumCol="true"></comp:excelSheetCol>
				   		<comp:excelSheetCol  order="19" dataCol="DETAILAPPLYTONNUM" excelCol="数量" headerBlod="true"></comp:excelSheetCol>
				   		<comp:excelSheetCol  order="21" dataCol="DETAILAPPLYPACKNUM" excelCol="包数" headerBlod="true"></comp:excelSheetCol>
						<comp:excelSheetCol order="23" dataCol="FACTORYNAME" excelCol="工厂" headerBlod="true">	</comp:excelSheetCol>					
						<comp:excelSheetCol  order="25" dataCol="SHIPPOINTDESC" excelCol="装运点" headerBlod="true"></comp:excelSheetCol>
				   		<comp:excelSheetCol  order="27" dataCol="TRANSSTATUS" excelCol="状态" headerBlod="true">
				   			<comp:excelSheetColOperate order="1" tragetCol="" replace="未分配" type="replace" find="0"/>
				   			<comp:excelSheetColOperate order="2" tragetCol="" replace="已分配" type="replace" find="1"/>
				   			<comp:excelSheetColOperate order="3" tragetCol="" replace="已排车" type="replace" find="2"/>
				   		</comp:excelSheetCol>
				   		<comp:excelSheetCol  order="29" dataCol="SALEMAN" excelCol="业务员" headerBlod="true"></comp:excelSheetCol>
				
						<comp:excelSheetSql>
						SELECT TB_HTMS_TRANSFER.ISURGENT, TB_HTMS_TRANSFER.CREATETIME,TB_HTMS_TRANSFER.SHIPCODE,TB_HTMS_TRANSFER.SAPTRANSCODE,
				         TB_HTMS_TRANSFER.TRANSSTATUS,TB_HTMS_TRANSFERDETAIL.APPLYTONNUM AS DETAILAPPLYTONNUM,
				         TB_HTMS_TRANSFERDETAIL.APPLYPACKNUM AS DETAILAPPLYPACKNUM,
				         TO_NUMBER(TB_HTMS_CUSTORDERDETAIL.freight)*TO_NUMBER(1000) AS FREIGHT,
				         TO_NUMBER(TB_HTMS_CUSTORDERDETAIL.freight)*TO_NUMBER(TB_HTMS_TRANSFERDETAIL.APPLYTONNUM) AS TRANSPORTTOTALPRICE,
				         TB_HTMS_CUSTORDERDETAIL.SHIPPOINTDESC,TB_HTMS_CUSTOMERADDR.AREAID,TB_HTMS_CUSTOMERADDR.CADDRDETAIL,
				         factory.factoryName,product.productname,TB_HTMS_CUSTORDER.CUSTOMERNAME,TB_HTMS_CUSTORDER.SALEMAN
				              FROM TB_HTMS_CUSTORDER,TB_HTMS_SHIP, TB_HTMS_TRANSFER,TB_HTMS_CUSTOMERADDR, TB_HTMS_TRANSFERDETAIL, TB_HTMS_CUSTORDERDETAIL                                         
				                      left join TB_HTMS_FACTORY factory on factory.factoryId=TB_HTMS_CUSTORDERDETAIL.Factoryid
				                      left join TB_HTMS_PRODUCT product on product.productId=TB_HTMS_CUSTORDERDETAIL.productid 
				             WHERE TB_HTMS_CUSTORDERDETAIL.codetailId = TB_HTMS_TRANSFERDETAIL.codetailId
				             AND TB_HTMS_TRANSFER.TRANSID = TB_HTMS_TRANSFERDETAIL.TRANSID
				             AND TB_HTMS_CUSTORDER.CORDERID = TB_HTMS_SHIP.CORDERID
				             AND TB_HTMS_SHIP.SHIPID = TB_HTMS_TRANSFER.SHIPID
				             AND TB_HTMS_TRANSFER.CADDRID = TB_HTMS_CUSTOMERADDR.CADDRID
				             AND TB_HTMS_TRANSFER.SELFFETCH = '0' 
                      <if test="'$[carCodeSH]'!=''">
            			    and TB_HTMS_TRANSFER.transid in  (select TB_HTMS_TRANSPORT.transid  from TB_HTMS_TRANSPORT where TB_HTMS_TRANSPORT.TRANSPORTID in (
							select TB_HTMS_TRANSPORTSEND.TRANSPORTID from TB_HTMS_TRANSPORTSEND 
							where TB_HTMS_TRANSPORTSEND.sendid in (select tb_htms_send.sendid  from tb_htms_send where tb_htms_send.vehicleid in (select TB_HTMS_VEHICLE.vehicleid from TB_HTMS_VEHICLE  where TB_HTMS_VEHICLE.vehicleno like '%$[carCodeSH]%'))
							))
            			</if>
                      <if test="'$[isUrgentSH]'!=''">
                           AND TB_HTMS_TRANSFER.ISURGENT LIKE  '%$[isUrgentSH]%'
                      </if>
                      <if test="'$[startTimeSH]'!=''">
						   and  TO_DATE(TB_HTMS_TRANSFER.createTime,'yyyy-MM-dd HH24:mi:ss') > to_date('$[startTimeSH]','yyyy-MM-dd HH24:mi:ss')
					  </if>
					  <if test="'$[endTimeSH]'!=''">
							and  TO_DATE(TB_HTMS_TRANSFER.createTime,'yyyy-MM-dd HH24:mi:ss')  < to_date('$[endTimeSH]','yyyy-MM-dd HH24:mi:ss')
					  </if>
                      <if test="'$[transStatusSH]'!=''">
                            AND TB_HTMS_TRANSFER.TRANSSTATUS LIKE  '%$[transStatusSH]%'
                      </if>
                      <if test="'$[customerNameSH]'!=''">
                            and TB_HTMS_CUSTORDER.CUSTOMERNAME LIKE '%$[customerNameSH]%'
                        </if>
                        <if test="'$[saleManSH]'!=''">
                            and TB_HTMS_CUSTORDER.saleMan LIKE '%$[aleManSH]%'
                        </if>
                        <if test="'$[carrierIdSH]'!=''">
                            and TB_HTMS_TRANSFER.TRANSID in (select transid from TB_HTMS_TRANSPORT where carrierid = '$[carrierIdSH]' )
                        </if>
                      <if test="'$[shipCodeSH]'!=''">
							 AND TB_HTMS_TRANSFER.shipCode  like '%$[shipCodeSH]%'
				      </if>
					  <if test="'$[sapTransCodeSH]'!=''">
							 AND TB_HTMS_TRANSFER.sapTransCode  like '%$[sapTransCodeSH]%'
					  </if>
                      <if test="'$[areaCodeSH]'!=''">
							AND caddr.AREACODE LIKE '$areaCodeSH%'
					   </if>
					  <if test="'$[productIdSH]'!=''">
						     and TB_HTMS_TRANSFERDETAIL.productid in ($[productIdSH])
					  </if>
					   <if test="'$[factoryIdSH]'!=''">
						     and TB_HTMS_TRANSFERDETAIL.factoryid in ($[factoryIdSH])
					  </if>
                       
                      ORDER BY   TB_HTMS_TRANSFER.TRANSSTATUS asc  ,TB_HTMS_TRANSFER.ISURGENT  desc,  TB_HTMS_TRANSFER.createTime desc
						</comp:excelSheetSql>
						
			   		</comp:excelSheet>
			   	</comp:excelExport>

