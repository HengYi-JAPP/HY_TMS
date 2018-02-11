<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/impart/export.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'exportexcel.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
     
 
    
 

  <body>
  <comp:excelExport fileName="线路表" servletPath="excelExportServlet" exportId="exportRoute" btnName="导出线路" >
   		<comp:excelSheet   tableName="TB_HTMS_ROUTE" sheetName="运费表" order="1" title="所有运费列表" titleAlign="center" titleBlod="true"  >
   			
			<comp:excelSheetCol order="2" dataCol="FACTORYID" excelCol="工厂" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="石化" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="聚合物" type="replace" find="2"/>
	   			<comp:excelSheetColOperate order="3" tragetCol="" replace="高新" type="replace" find="3"/>
	   			<comp:excelSheetColOperate order="4" tragetCol="" replace="逸鹏" type="replace" find="4"/>
	   			<comp:excelSheetColOperate order="5" tragetCol="" replace="逸暻" type="replace" find="5"/>
	   			<comp:excelSheetColOperate order="6" tragetCol="" replace="逸枫" type="replace" find="6"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="3" dataCol="PRODUCTID" excelCol="产品" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="DTY" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="POY" type="replace" find="2"/>
	   			<comp:excelSheetColOperate order="3" tragetCol="" replace="ITY" type="replace" find="3"/>
	   			<comp:excelSheetColOperate order="4" tragetCol="" replace="FDY" type="replace" find="4"/>
	   			<comp:excelSheetColOperate order="5" tragetCol="" replace="切片" type="replace" find="5"/>
			</comp:excelSheetCol>			
			<comp:excelSheetCol order="4" dataCol="AREAID" excelCol="地址" headerBlod="true">
				<comp:excelSheetColOperate order="1"  type="replace" repaceClass="com.zzy.taglib.export.business.AreaReplaceBusiness"/>
			</comp:excelSheetCol>
			
			<comp:excelSheetCol order="5" dataCol="ISVALIDATE" excelCol="是否有效" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="有效" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="无效" type="replace" find="0"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="6" dataCol="ROUTEID" excelCol="线路ID" headerBlod="true" ></comp:excelSheetCol>
			<comp:excelSheetOrderBy> ROUTEID </comp:excelSheetOrderBy>
   		</comp:excelSheet>
   	</comp:excelExport>
   	
   	 <comp:excelExport fileName="单价运价表" servletPath="excelExportServlet" exportId="exportSinglePrice" btnName="单价运价" >   
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
   		</comp:excelSheet>
   	</comp:excelExport>
   	<comp:excelExport fileName="一口价运价表" servletPath="excelExportServlet" exportId="exportOnePrice" btnName="一口价运价" >   
   		<comp:excelSheet   sheetName="一口价运价表" order="3" title="所有一口价运价表" titleAlign="center" titleBlod="true"  >
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
			<comp:excelSheetCol order="8" dataCol="CUSTOMERONEPRICE" excelCol="客户运价" headerBlod="true" ></comp:excelSheetCol>	
			<comp:excelSheetCol order="9" dataCol="CARRIERONEPRICE" excelCol="承运商运价" headerBlod="true" ></comp:excelSheetCol>	
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
				PRICEEND,CUSTOMERONEPRICE ,CARRIERONEPRICE,VALIDATEDATE ,TB_HTMS_TRANSPRICE.ISVALIDATE 
			FROM TB_HTMS_TRANSPRICE,TB_HTMS_ROUTE
			WHERE 
				TB_HTMS_TRANSPRICE.ROUTEID=TB_HTMS_ROUTE.ROUTEID
				AND TB_HTMS_TRANSPRICE.FREIGHTMODEL=2
				ORDER BY FACTORYID,PRODUCTID,AREAID,PRICESTART
   	 		</comp:excelSheetSql>
   		</comp:excelSheet>
   	</comp:excelExport>
  <comp:excelExport fileName="运费表" servletPath="excelExportServlet" exportId="exportFreight" btnName="导出运费" >
   		<comp:excelSheet   tableName="TB_HTMS_FREIGHT" sheetName="运费表" order="3" title="所有运费列表" titleAlign="center" titleBlod="true"  >
   			<comp:excelSheetCol order="1" dataCol="SAPCODE" excelCol="调拨单号" headerBlod="true" ></comp:excelSheetCol>
			<comp:excelSheetCol order="2" dataCol="ITEMCODE" excelCol="行项目号" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="3" dataCol="SUBITEMCODE" excelCol="子行项号" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="4" dataCol="AREAID" excelCol="送货地址" headerBlod="true">
				<comp:excelSheetColOperate order="1"  type="replace" repaceClass="com.zzy.taglib.export.business.AreaReplaceBusiness"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="5" dataCol="ROUTEID" excelCol="运路" headerBlod="true" countCol="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="6" dataCol="FREIGHTTYPE" excelCol="计费类型" headerBlod="true">			
				<comp:excelSheetColOperate order="1" tragetCol="" replace="正常计费" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="特殊客户" type="replace" find="2"/>
				<comp:excelSheetColOperate order="3" tragetCol="" replace="指定运价" type="replace" find="3"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="7" dataCol="FREIGHTSTYLE" excelCol="计费方式" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="按重量计" type="replace" find="6"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="8" dataCol="FREIGHTMODEL" excelCol="计费模式" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="9" dataCol="VALIDATEDATE" excelCol="运价生效日期" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="10" dataCol="APPLYTONNUM" excelCol="计费重量" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="11" dataCol="FREIGHTPRICE" excelCol="实际单价" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="12" dataCol="FREIGHTAMOUNT" excelCol="实际运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="13" dataCol="TOTALFREIGHT" excelCol="总运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="14" dataCol="CARRIERPRICE" excelCol="承运商运价" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="15" dataCol="CARRIERFREIGHT" excelCol="承运商运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="16" dataCol="TOTALCARRIERFREIGHT" excelCol="承商总运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="17" dataCol="PRICEID" excelCol="运价ID" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="18" dataCol="PLANFREIGHTSTYLE" excelCol="原来计费方式" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="按重量计" type="replace" find="6"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="19" dataCol="PLANFREIGHTMODEL" excelCol="原来计费模式" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="20" dataCol="PLANVALIDATEDATE" excelCol="原来运价生效日期" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="21" dataCol="PLANFREIGHTPRICE" excelCol="原来单价" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="22" dataCol="PLANPRICEID" excelCol="原来运价ID" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="23" dataCol="PLANFREIGHT" excelCol="原来运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="24" dataCol="PLANTOTALFREIGHT" excelCol="原来总运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="25" dataCol="PLANTOTALCARRIERFREIGHT" excelCol="原来承商总运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="26" dataCol="FAVOURFREIGHT" excelCol="运费优惠额度" sumCol="true" headerBlod="true">
				<comp:excelSheetColOperate order="1" sourceCol="PLANTOTALFREIGHT" tragetCol="TOTALFREIGHT" type="subtract"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="27" dataCol="PLANCARRIERPRICE" excelCol="原来承商运价" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="28" dataCol="PLANCARRIERFREIGHT" excelCol="原来承商运费" sumCol="true"> </comp:excelSheetCol>
			<comp:excelSheetCol order="29" dataCol="FREIGHTBALANCE" excelCol="运费均衡度" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="30" dataCol="FREIGHTTIME" excelCol="计算时间" headerBlod="true"></comp:excelSheetCol>
			
			<comp:excelSheetCol order="31" dataCol="ISVALIDATE" excelCol="是否有效" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="有效" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="无效" type="replace" find="0"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="32" dataCol="ISESTIMATE" excelCol="是否预估" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="预估" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="实际" type="replace" find="0"/>
			</comp:excelSheetCol>
			
			<comp:excelSheetCondition>
				ISESTIMATE=0
			</comp:excelSheetCondition>
			<comp:excelSheetOrderBy> FREIGHTID </comp:excelSheetOrderBy>
   		</comp:excelSheet>
   	</comp:excelExport>
   	
   	 <comp:excelExport fileName="预估运费" servletPath="excelExportServlet" exportId="exportEstimateFreight" btnName="预估运费" >
   		<comp:excelSheet   tableName="TB_HTMS_FREIGHT" sheetName="预估运费表" order="3" title="所有预估运费表" titleAlign="center" titleBlod="true"  >
   			<comp:excelSheetCol order="1" dataCol="SAPCODE" excelCol="调拨单号" headerBlod="true" ></comp:excelSheetCol>
			<comp:excelSheetCol order="2" dataCol="ITEMCODE" excelCol="行项目号" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="3" dataCol="SUBITEMCODE" excelCol="子行项号" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="4" dataCol="AREAID" excelCol="送货地址" headerBlod="true">
				<comp:excelSheetColOperate order="1"  type="replace" repaceClass="com.zzy.taglib.export.business.AreaReplaceBusiness"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="5" dataCol="ROUTEID" excelCol="运路" headerBlod="true" countCol="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="6" dataCol="FREIGHTTYPE" excelCol="计费类型" headerBlod="true">			
				<comp:excelSheetColOperate order="1" tragetCol="" replace="正常计费" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="特殊客户" type="replace" find="2"/>
				<comp:excelSheetColOperate order="3" tragetCol="" replace="指定运价" type="replace" find="3"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="7" dataCol="FREIGHTSTYLE" excelCol="计费方式" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="按重量计" type="replace" find="6"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="8" dataCol="FREIGHTMODEL" excelCol="计费模式" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="9" dataCol="VALIDATEDATE" excelCol="运价生效日期" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="10" dataCol="APPLYTONNUM" excelCol="计费重量" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="11" dataCol="FREIGHTPRICE" excelCol="实际单价" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="12" dataCol="FREIGHTAMOUNT" excelCol="实际运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="13" dataCol="TOTALFREIGHT" excelCol="总运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="14" dataCol="CARRIERPRICE" excelCol="承运商运价" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="15" dataCol="CARRIERFREIGHT" excelCol="承运商运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="16" dataCol="TOTALCARRIERFREIGHT" excelCol="承商总运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="17" dataCol="PRICEID" excelCol="运价ID" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="18" dataCol="PLANFREIGHTSTYLE" excelCol="原来计费方式" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="按重量计" type="replace" find="6"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="19" dataCol="PLANFREIGHTMODEL" excelCol="原来计费模式" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="20" dataCol="PLANVALIDATEDATE" excelCol="原来运价生效日期" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="21" dataCol="PLANFREIGHTPRICE" excelCol="原来单价" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="22" dataCol="PLANPRICEID" excelCol="原来运价ID" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="23" dataCol="PLANFREIGHT" excelCol="原来运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="24" dataCol="PLANTOTALFREIGHT" excelCol="原来总运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="25" dataCol="PLANTOTALCARRIERFREIGHT" excelCol="原来承商总运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="26" dataCol="FAVOURFREIGHT" excelCol="运费优惠额度" sumCol="true" headerBlod="true">
				<comp:excelSheetColOperate order="1" sourceCol="PLANTOTALFREIGHT" tragetCol="TOTALFREIGHT" type="subtract"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="27" dataCol="PLANCARRIERPRICE" excelCol="原来承商运价" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="28" dataCol="PLANCARRIERFREIGHT" excelCol="原来承商运费" sumCol="true"> </comp:excelSheetCol>
			<comp:excelSheetCol order="29" dataCol="FREIGHTBALANCE" excelCol="运费均衡度" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="30" dataCol="FREIGHTTIME" excelCol="计算时间" headerBlod="true"></comp:excelSheetCol>
			
			<comp:excelSheetCol order="31" dataCol="ISVALIDATE" excelCol="是否有效" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="有效" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="无效" type="replace" find="0"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="32" dataCol="ISESTIMATE" excelCol="是否预估" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="预估" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="实际" type="replace" find="0"/>
			</comp:excelSheetCol>
			<comp:excelSheetCondition>
				ISESTIMATE=1
			</comp:excelSheetCondition>
			<comp:excelSheetOrderBy> FREIGHTID </comp:excelSheetOrderBy>
   		</comp:excelSheet>
   	
   	</comp:excelExport>
   	
   	
   	
   	
   	
   	
   	
   	
   	 <comp:excelExport fileName="核对运费表" servletPath="excelExportServlet" exportId="exportCheckFreight" btnName="核对运费" >
   		<comp:excelSheet   sheetName="核对运费表" order="3" title="所有运费列表" titleAlign="center" titleBlod="true"  >
   			<comp:excelSheetSql>
   			SELECT DISTINCT SAPCODE,TB_HTMS_ROUTE.FACTORYID,TB_HTMS_ROUTE.PRODUCTID,TB_HTMS_ROUTE.AREAID,
			FREIGHTTYPE,FREIGHTSTYLE,FREIGHTMODEL,PRICEID,FREIGHTPRICE,TOTALFREIGHT,sum(FREIGHTAMOUNT) AS AMOUNT,
			sum(APPLYTONNUM) AS TONUM
			FROM TB_HTMS_FREIGHT ,TB_HTMS_ROUTE   
			WHERE 
			TB_HTMS_FREIGHT.ROUTEID=TB_HTMS_ROUTE.ROUTEID
			and ISESTIMATE = 0
			group by SAPCODE,TB_HTMS_ROUTE.FACTORYID,TB_HTMS_ROUTE.PRODUCTID,TB_HTMS_ROUTE.AREAID,FREIGHTTYPE,FREIGHTSTYLE,FREIGHTMODEL,PRICEID,FREIGHTPRICE,TOTALFREIGHT 
			ORDER BY SAPCODE
   			</comp:excelSheetSql>	
   			<comp:excelSheetCol order="1" dataCol="SAPCODE" excelCol="调拨单号" headerBlod="true" ></comp:excelSheetCol>
			<comp:excelSheetCol order="2" dataCol="FACTORYID" excelCol="工厂" headerBlod="true">				
				<comp:excelSheetColOperate order="1" tragetCol="" replace="石化" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="聚合物" type="replace" find="2"/>
	   			<comp:excelSheetColOperate order="3" tragetCol="" replace="高新" type="replace" find="3"/>
	   			<comp:excelSheetColOperate order="4" tragetCol="" replace="逸鹏" type="replace" find="4"/>
	   			<comp:excelSheetColOperate order="5" tragetCol="" replace="逸暻" type="replace" find="5"/>
	   			<comp:excelSheetColOperate order="6" tragetCol="" replace="逸枫" type="replace" find="6"/>
			</comp:excelSheetCol>			
			<comp:excelSheetCol order="3" dataCol="PRODUCTID" excelCol="产品" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="DTY" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="POY" type="replace" find="2"/>
	   			<comp:excelSheetColOperate order="3" tragetCol="" replace="ITY" type="replace" find="3"/>
	   			<comp:excelSheetColOperate order="4" tragetCol="" replace="FDY" type="replace" find="4"/>
	   			<comp:excelSheetColOperate order="5" tragetCol="" replace="切片" type="replace" find="5"/>
	   		</comp:excelSheetCol>	
	   		<comp:excelSheetCol order="4" dataCol="AREAID" excelCol="地址" headerBlod="true">
				<comp:excelSheetColOperate order="1"  type="replace" repaceClass="com.zzy.taglib.export.business.AreaReplaceBusiness"/>
			</comp:excelSheetCol>
					
			<comp:excelSheetCol order="6" dataCol="FREIGHTTYPE" excelCol="计费类型" headerBlod="true">			
				<comp:excelSheetColOperate order="1" tragetCol="" replace="正常计费" type="replace" find="1"/>
	   			<comp:excelSheetColOperate order="2" tragetCol="" replace="特殊客户" type="replace" find="2"/>
				<comp:excelSheetColOperate order="3" tragetCol="" replace="指定运价" type="replace" find="3"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="7" dataCol="FREIGHTSTYLE" excelCol="计费方式" headerBlod="true">
				<comp:excelSheetColOperate order="1" tragetCol="" replace="按重量计" type="replace" find="6"/>
			</comp:excelSheetCol>
			<comp:excelSheetCol order="8" dataCol="FREIGHTMODEL" excelCol="计费模式" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="10" dataCol="TONUM" excelCol="计费重量" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="11" dataCol="FREIGHTPRICE" excelCol="实际单价" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="12" dataCol="AMOUNT" excelCol="实际运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="13" dataCol="TOTALFREIGHT" excelCol="总运费" sumCol="true" headerBlod="true"></comp:excelSheetCol>
			<comp:excelSheetCol order="17" dataCol="PRICEID" excelCol="运价ID" headerBlod="true"></comp:excelSheetCol>
			
   		</comp:excelSheet>
   	</comp:excelExport>
   	
   	
  </body>
</html>
