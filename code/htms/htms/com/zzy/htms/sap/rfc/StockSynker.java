package com.zzy.htms.sap.rfc;

import com.sap.conn.jco.JCoTable;


/**
 * 库存查询接口实现
 * @author zzy
 *
 */
public class StockSynker extends SapSynker {
	/**
	 * 根据客户编号通过RFC接口从SAP中获取客户余额
	 * @param customerNo
	 * @return
	 */
	public String getOrderStock(String orderNo){
		if(this.isNull(orderNo)){
			log.info("StockSynker orderNo==null");
			SyncLogger.log("ZRFC_TMS_INTERFACE013 001", "orderNo==null");
			return null;
		}
		
		this.setFunctionCode("ZRFC_TMS_INTERFACE013");
		//this.setParameter("CUSTOMERID", orderNo);
		/*
		JCoStructure exportStructure =this.getJCoStructure("EXPORT");
		if(exportStructure==null){
			log.info("StockSynker exportStructure==null");
			return null;
		}*/

		SyncLogger.log("ZRFC_TMS_INTERFACE013 002", "orderNo=="+orderNo);
		Object obj = this.getValue("RETCODE");
		String returnCode = obj==null?null:obj.toString();
		//log.info("StockSynker RETCODE="+returnCode+",RETMSG="+this.getValue("RETMSG"));
		if (!this.isNull(returnCode)&&returnCode.equals("E")  )   
        {
			SyncLogger.log("ZRFC_TMS_INTERFACE013 003", "returnCode=="+returnCode+",RETMSG="+ this.getValue("RETMSG"));
			log.info("StockSynker returnCode=="+returnCode+",RETMSG="+ this.getValue("RETMSG"));
			return null;
        }
		JCoTable jcoTable =this.getJCoTable("COMPANY_TAB_TAB");
		if(jcoTable==null){
			SyncLogger.log("ZRFC_TMS_INTERFACE013 003", "jcoTable==null");
			log.info("StockSynker jcoTable==null");
			return null;
		}
		if(jcoTable.getNumRows()<1){
			SyncLogger.log("ZRFC_TMS_INTERFACE013 005", "jcoTable.getNumRows()<1");
			log.info("StockSynker jcoTable.getNumRows()<1");
			return null;
		}
		 jcoTable.setRow(0);
		 String customerMoney = jcoTable.getString("COMPANYDEBT");
		 //log.info("StockSynker customerMoney=="+customerMoney);
		 SyncLogger.log("ZRFC_TMS_INTERFACE013 006","orderNo=="+orderNo+ ",customerMoney=="+customerMoney);
		 return customerMoney;
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		StockSynker synker= new StockSynker();
		synker.getOrderStock("0000300017");

	}

}
