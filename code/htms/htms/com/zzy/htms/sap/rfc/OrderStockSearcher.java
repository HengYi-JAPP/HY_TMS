package com.zzy.htms.sap.rfc;

import java.util.HashMap;
import java.util.Map;

import com.sap.conn.jco.JCoTable;


/**
 * 订单库存接口
 * @author zzy
 *
 */
public class OrderStockSearcher extends SapSynker {
	
	/**
	 * 调用sap订单库存接口方法
	 * @param ordersCodess
	 * @param itemsCodes
	 * @return
	 */
	public Map<String,Map<String,String>> getOrderStock(String[] ordersCodess,String[] itemsCodes){
		if(ordersCodess==null||ordersCodess.length==0||itemsCodes==null||itemsCodes.length==0||ordersCodess.length!=itemsCodes.length){
			log.info("ordersCodess==null||ordersCodess.length==0||itemsCodes==null||itemsCodes.length==0||ordersCodess.length!=itemsCodes.length");

			 SyncLogger.log("ZRFC_HTMS_005 005","ordersCodess==null||ordersCodess.length==0||itemsCodes==null||itemsCodes.length==0||ordersCodess.length!=itemsCodes.length");
			return  null;
		}
		/*订单抬头*/
		this.setFunctionCode("ZRFC_HTMS_005");
	
		for(int i=0;i<ordersCodess.length;i++){
			log.info("VBELN="+ordersCodess[i]+",POSNR="+itemsCodes[i]);
			this.setTableValue("IT_TAB", "VBELN", ordersCodess[i]);//"0010000276");//销售订单号
			this.setTableValue("IT_TAB", "POSNR",itemsCodes[i]);// "000010");//销售订单行项目
			this.setTableValue("IT_TAB", "KWMENG", "");//销售订单数
			this.setTableValue("IT_TAB", "LABST", "");//可发货数量 
			SyncLogger.log("ZRFC_HTMS_005 006","VBELN="+ordersCodess[i]+",POSNR="+itemsCodes[i]);
		}
		
		//this.setParameter("CUSTOMERID", "0000300017");
		JCoTable jcoTable =this.getJCoTable("IT_TAB");// parameterList.getTable("COMPANY_TAB_TAB");
		
		if(jcoTable==null){
			log.info("ZRFC_HTMS_005 jcoTable==null");
			SyncLogger.log("ZRFC_HTMS_005 007","jcoTable==null");
			return null;
		}
		
		
		// jcoTable.appendRow();
		
		StringBuffer buffer = new StringBuffer();
		log.info("=============================ZRFC_HTMS_005 IT_TAB===============================");

		SyncLogger.log("ZRFC_HTMS_005 008","=============================ZRFC_HTMS_005 IT_TAB===============================");
		Map<String,Map<String,String>> orderStockMap = new HashMap<String,Map<String,String>>();
		Map<String,String> stockMap =null;
		String value=null,orderCode=null,itemCode=null,orderNum=null,applyNum=null,key=null;
		 for (int i = 0; i < jcoTable.getNumRows(); i++){
			 jcoTable.setRow(i);
			// jcoTable.appendRow();
			 buffer = new StringBuffer();
			 
			
			 buffer.append(jcoTable.getString("VBELN")).append('\t');//销售订单号
			 buffer.append(jcoTable.getString("POSNR")).append('\t');//销售订单行项目
			 buffer.append(jcoTable.getString("KWMENG")).append('\t');//销售订单数
			 buffer.append(jcoTable.getString("LABST")).append('\t');//可发货数量
			 
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

	         log.info(buffer.toString());
	         SyncLogger.log("ZRFC_HTMS_005 008",buffer.toString());
        }
		 //jcoTable.setRow(0);
		// value= jcoTable.getString("LABST");
		 //log.info("OrderStockSearcher 可发货数量 LABST="+value);
		 return orderStockMap;
		 
	}
	
	/**
	 * 根据订单号和订单行号从SAP中获取可发货数量
	 * @param orderCode
	 * @param detailNo
	 * @return
	 */
	public String getOrderStock(String orderCode,String detailNo){
		/*JCoParameterList parameterList=Jco3Utils.callFunctions(this.getFunctionCode(), this.parameters,false);
		if(parameterList==null){
			log.info("parameterList==null");
			return ;
		}*/
		/*订单抬头*/
		this.setFunctionCode("ZRFC_HTMS_005");
		SyncLogger.log("ZRFC_HTMS_005 001","orderCode=="+orderCode+ ",detailNo=="+detailNo);
	
		this.setTableValue("IT_TAB", "VBELN", orderCode);//"0010000276");//销售订单号
		this.setTableValue("IT_TAB", "POSNR",detailNo);// "000010");//销售订单行项目
		this.setTableValue("IT_TAB", "KWMENG", "");//销售订单数
		this.setTableValue("IT_TAB", "LABST", "");//可发货数量 
		
		//this.setParameter("CUSTOMERID", "0000300017");
		JCoTable jcoTable =this.getJCoTable("IT_TAB");// parameterList.getTable("COMPANY_TAB_TAB");
		
		if(jcoTable==null){
			log.info("ZRFC_HTMS_005 jcoTable==null");
			SyncLogger.log("ZRFC_HTMS_005 002","jcoTable==null");
			return null;
		}
		String value=null;
		
		// jcoTable.appendRow();
		
		StringBuffer buffer = new StringBuffer();
		log.info("=============================ZRFC_HTMS_005 IT_TAB===============================");
		
		 for (int i = 0; i < jcoTable.getNumRows(); i++){
			 jcoTable.setRow(i);
			// jcoTable.appendRow();
			 buffer = new StringBuffer();
			 
			
			 buffer.append(jcoTable.getString("VBELN")).append('\t');//销售订单号
			 buffer.append(jcoTable.getString("POSNR")).append('\t');//销售订单行项目
			 buffer.append(jcoTable.getString("KWMENG")).append('\t');//销售订单数
			 buffer.append(jcoTable.getString("LABST")).append('\t');//可发货数量

	         log.info(buffer.toString());
	         SyncLogger.log("ZRFC_HTMS_005 003",buffer.toString());
        }
		 jcoTable.setRow(0);
		 value= jcoTable.getString("LABST");
		 log.info("OrderStockSearcher 可发货数量 LABST="+value);
		 SyncLogger.log("ZRFC_HTMS_005 004","orderCode=="+orderCode+ ",detailNo=="+detailNo+",可发货数量 LABST="+value);
		 return value;
		 
	}
	/**
	 * 根据工厂号和物料号，获取该工厂指定物料的可发货数量
	 * @param factoryNo
	 * @param materialNo
	 * @return
	 */
	public String getFactoryMaterialStock(String factoryNo,String materialNo){
		if(this.isNull(materialNo)||this.isNull(factoryNo)){
			log.info("OrderStockSearcher this.isNull(materialNo)||this.isNull(factoryNo)");
			SyncLogger.log("ZRFC_HTMS_007 001","factoryNo=="+factoryNo+ ",materialNo=="+materialNo);
			return null;
		}
		
		this.setFunctionCode("ZRFC_HTMS_007");
		this.setParameter("P_MATNR", materialNo);//物料号
		this.setParameter("P_WERKS", factoryNo);//工厂
		SyncLogger.log("ZRFC_HTMS_007 002","factoryNo=="+factoryNo+ ",materialNo=="+materialNo);
		/*
		JCoStructure exportStructure =this.getJCoStructure("EXPORT");
		if(exportStructure==null){
			log.info("CustomerSynker exportStructure==null");
			return null;
		}*/
		Object obj = this.getValue("EX_LABST");//库存数量
		String stockNum = obj==null?null:obj.toString();
		log.info("OrderStockSearcher stockNum="+stockNum);
		SyncLogger.log("ZRFC_HTMS_007 003","factoryNo=="+factoryNo+ ",materialNo=="+materialNo+", stockNum="+stockNum);
		return stockNum;
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		OrderStockSearcher synker= new OrderStockSearcher();
		//synker.getOrderStock(new String[]{"0010000276","0010000276"},new String[]{"000010","000020"});
		//浙江恒逸石化有限公司,DTY
		synker= new OrderStockSearcher();
		synker.getFactoryMaterialStock("1100", "000000001000116414");
		//synker.getFactoryMaterialStock("1000","000000001000116414");
		//synker.getFactoryMaterialStock("2000","000000001000116414");
		//synker.getFactoryMaterialStock("3000","000000001000116414");
		/*DBTool dbtool = new DBTool();
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllFactory");
		Map parameters = new HashMap();
		ResultBean resultBean = dbtool.execute(operationBean, parameters, false);
		if(resultBean==null||resultBean.isSuccess()==false){
			return;
		}
		List list=(List)resultBean.getListResult("sqlName");
		synker.ZRFC_CL_INTERFACE013();*/

	}
	


}
