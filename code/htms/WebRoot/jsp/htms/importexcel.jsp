<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="../common/impart/taglib.jsp"%>
<%@ taglib uri="/config/taglibs/tld/comp-extends.tld" prefix="cext"%>

<html:page title="场景管理">
		<com:loader  js="js/common/common.js,js/console/list/list.js"/>
		<com:loader css="css/common/table-list.css"/>
		
	
		<!-- banner 页面导航条 -->
	
			
			<jsp:include page="../common/impart/table-banner.jsp">
				<jsp:param value="场景管理" name="title"/>
				<jsp:param value="searchConditionBox" name="conditionBoxId"/>
				<jsp:param value="false" name="hideSearchBanner"/>
			</jsp:include>
		
			<!-- searchbox 搜索条 -->	
			<html:table id="searchConditionBox" style="width: 100%;" align="center" cellPadding="0" cellSpacing="0">
				<html:tr>
					<html:td styleClass="condition_label">请选择导入文件:</html:td>
					<html:td  styleClass="condition_option">						
						<com:simpleUpload isImage="false" fileId="encInitFile" fileName="encInitFile"></com:simpleUpload>
					</html:td>
					<html:td  styleClass="condition_option">
						<com:excelImportor importFileName="encInitFile">
							<com:excelSheetMap sheetName="高新POY" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="高新FDY" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="石化POY" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="石化FDY" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="石化DTY" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="聚合物POY" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="聚合物FDY" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="逸暻POY" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="逸暻FDY" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="逸暻DTY" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="太仓逸枫" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="逸鹏" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>							
							<com:excelSheetMap sheetName="高新切片" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>							
							<com:excelSheetMap sheetName="聚合物切片" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>
							<com:excelSheetMap sheetName="逸暻切片" tableName="PRICE001" headerStartIndex="0" headerEndIndex="0" contentStartIndex="1" >
								<com:excelColMap excelColName="地区" tableColName="AREA001"/>
								<com:excelColMap excelColName="区域细分" tableColName="AREA002"   />
								<com:excelColMap excelColName="工厂" tableColName="FACTORYNAME" notNull="true"  />	
								<com:excelColMap excelColName="产品" tableColName="PRODUCTNAME" notNull="true" />
								<com:excelColMap excelColName="计价模式" tableColName="PRICEMODE" notNull="true" />									
								<com:excelColMap excelColName="开始区间" tableColName="STARTTON" notNull="true" />									
								<com:excelColMap excelColName="结束区间" tableColName="ENDTON" notNull="true" />									
								<com:excelColMap excelColName="承运商运价" tableColName="CARRIERPRICE" notNull="true" />									
								<com:excelColMap excelColName="客户运价" tableColName="CUSTOMERPRICE" notNull="true" />	
							</com:excelSheetMap>							
						</com:excelImportor>						
					</html:td>
				</html:tr>
			</html:table>
			<com:loader ajax="true"  simpleUpload="true"/>
</html:page>
