package com.zzy.htms.sap.rfc;

import java.util.HashMap;
import java.util.Map;

import com.sap.conn.jco.JCoTable;


/**
 * sap客户相关接口实现
 * @author zzy
 *
 */
public class CustomerSynker extends SapSynker {
	/**
	 * 根据客户编号通过RFC接口从SAP中获取客户余额
	 * @param customerNo
	 * @return
	 */
	public String getCustomerAccountMoney(String customerNo,String saleOrg){
		if(this.isNull(customerNo)){
			log.info("CustomerSynker customerNo==null");
			SyncLogger.log("ZRFC_HTMS_004 001","customerNo="+customerNo+",saleOrg="+saleOrg);
			return null;
		}
		SyncLogger.log("ZRFC_HTMS_004 002","customerNo="+customerNo+",saleOrg="+saleOrg);
		this.setFunctionCode("ZRFC_HTMS_004");
		this.setParameter("CUSTOMERID", customerNo);//客户号码
		this.setParameter("VKORG", saleOrg);//公司、销售组织,可空/细项
		/*
		JCoStructure exportStructure =this.getJCoStructure("EXPORT");
		if(exportStructure==null){
			log.info("CustomerSynker exportStructure==null");
			return null;
		}*/
		Object obj = this.getValue("RETCODE");//返回代码
		String returnCode = obj==null?null:obj.toString();
		log.info("CustomerSynker RETCODE="+returnCode+",RETMSG="+this.getValue("RETMSG"));
		SyncLogger.log("ZRFC_HTMS_004 003","RETCODE="+returnCode+",RETMSG="+this.getValue("RETMSG"));
		if (!this.isNull(returnCode)&&returnCode.equals("E")  )   
        {
			log.info("CustomerSynker returnCode=="+returnCode+",RETMSG="+ this.getValue("RETMSG"));//返回消息
			return null;
        }
		JCoTable jcoTable =this.getJCoTable("COMPANY_TAB_TAB");//客户余额表
		if(jcoTable==null){
			 SyncLogger.log("ZRFC_HTMS_004 004","jcoTable==null");
			log.info("CustomerSynker jcoTable==null");
			return null;
		}
		if(jcoTable.getNumRows()<1){
			log.info("CustomerSynker jcoTable.getNumRows()<1");
			 SyncLogger.log("ZRFC_HTMS_004 001","jcoTable.getNumRows()<1");
			return null;
		}
		 jcoTable.setRow(0);
		 String value = jcoTable.getString("COMPANYID");//公司代码
		 log.info("CustomerSynker 公司代码=="+value);
		String compName  = jcoTable.getString("COMPANYNAME");//公司的名称
		 log.info("CustomerSynker 公司的名称=="+value);
		 String customerMoney = jcoTable.getString("COMPANYDEBT");//用本币计的结转余额
		 log.info("CustomerSynker customerMoney=="+customerMoney);
		 SyncLogger.log("ZRFC_HTMS_004 001","customerNo="+customerNo+",saleOrg="+saleOrg+",公司代码=="+value+",公司的名称=="+compName+",customerMoney=="+customerMoney);
		
		 return customerMoney;
	}
	
	
	public String getCustomerAccountMoney(String[] customersNos,String[] salesOrgs){
		if(customersNos==null||customersNos.length<1||salesOrgs==null||salesOrgs.length<1||salesOrgs.length!=customersNos.length){
			log.info("customersNos==null||customersNos.length<1||salesOrgs==null||salesOrgs.length<1||salesOrgs.length!=customersNos.length");
			return null;
		}
		this.setFunctionCode("ZRFC_HTMS_004");
		for(int i=0;i<customersNos.length;i++){
			this.setParameter("CUSTOMERID", customersNos[i]);//客户号码
			this.setParameter("VKORG", salesOrgs[i]);//公司、销售组织,可空/细项
		}
		
	
		/*
		JCoStructure exportStructure =this.getJCoStructure("EXPORT");
		if(exportStructure==null){
			log.info("CustomerSynker exportStructure==null");
			return null;
		}*/
		Object obj = this.getValue("RETCODE");//返回代码
		String returnCode = obj==null?null:obj.toString();
		log.info("CustomerSynker RETCODE="+returnCode+",RETMSG="+this.getValue("RETMSG"));
		if (!this.isNull(returnCode)&&returnCode.equals("E")  )   
        {
			log.info("CustomerSynker returnCode=="+returnCode+",RETMSG="+ this.getValue("RETMSG"));//返回消息
			return null;
        }
		JCoTable jcoTable =this.getJCoTable("COMPANY_TAB_TAB");//客户余额表
		if(jcoTable==null){
			log.info("CustomerSynker jcoTable==null");
			return null;
		}
		if(jcoTable.getNumRows()<1){
			log.info("CustomerSynker jcoTable.getNumRows()<1");
			return null;
		}
		 jcoTable.setRow(0);
		 String value = jcoTable.getString("COMPANYID");//公司代码
		 log.info("CustomerSynker 公司代码=="+value);
		 value = jcoTable.getString("COMPANYNAME");//公司的名称
		 log.info("CustomerSynker 公司的名称=="+value);
		 String customerMoney = jcoTable.getString("COMPANYDEBT");//用本币计的结转余额
		 log.info("CustomerSynker customerMoney=="+customerMoney);
		 
		 
			StringBuffer buffer = new StringBuffer();
			//log.info("=============================ZRFC_HTMS_005 IT_TAB===============================");
			Map<String,Map<String,String>> orderStockMap = new HashMap<String,Map<String,String>>();
			Map<String,String> stockMap =null;
			String  orderCode=null,itemCode=null,orderNum=null,applyNum=null,key=null;
			 for (int i = 0; i < jcoTable.getNumRows(); i++){
				 jcoTable.setRow(i);
				// jcoTable.appendRow();
				 buffer = new StringBuffer();
				 
				
				 buffer.append(jcoTable.getString("COMPANYID")).append('\t');//公司代码
				 buffer.append(jcoTable.getString("COMPANYNAME")).append('\t');//公司的名称
				 buffer.append(jcoTable.getString("COMPANYDEBT")).append('\t');//用本币计的结转余额
				 
				 orderCode=jcoTable.getString("VBELN");
				 itemCode=jcoTable.getString("POSNR");
				 orderNum=jcoTable.getString("KWMENG");
				 applyNum=jcoTable.getString("LABST");
				
				 stockMap=new HashMap<String,String>();
				 orderNum=orderNum==null?"0":orderNum;
				 applyNum=applyNum==null?"0":applyNum;
				 stockMap.put("orderNum", orderNum);
				 stockMap.put("applyNum", applyNum);
				
				 key=orderCode+itemCode;
				 orderStockMap.put(key, stockMap);

		         //log.info(buffer);
	        }
		 return customerMoney;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		CustomerSynker synker= new CustomerSynker();
		//log.info("--------------江阴捷悦化工贸易有限公司------------------------");
		//synker.getCustomerAccountMoney("0000300024","1000");
		
		//log.info("--------------嘉兴市富春贸易有限公司------------------------");
		//synker = new CustomerSynker();
		//synker.getCustomerAccountMoney("0000300029", "2000");
		
		//log.info("--------------上海福晨化工有限公司------------------------");
		//synker = new CustomerSynker();
		synker.getCustomerAccountMoney("0000314613", "9100");

	}

}
