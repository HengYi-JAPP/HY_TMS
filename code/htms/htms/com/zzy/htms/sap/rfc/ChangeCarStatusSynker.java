package com.zzy.htms.sap.rfc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.database.DBTool;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.sap.conn.jco.JCoTable;
import com.zzy.htms.logistic.transfer.TransferBean;


/**
 * 车辆状态同步实现类
 * @author zzy
 *
 */
public class ChangeCarStatusSynker extends SapSynker {
	
	
	/**
	 * 同步运单状态,已经发货完成的,修改运单状态为已排车
	 * @return
	 */
	public  boolean sync(){
		boolean result=false;
		Map parametersMap = new HashMap();
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllNotSendCarSapCode");
		DBTool dbTool = new DBTool();
		dbTool.setAutoCommint(true);
		ResultBean resultBean = dbTool.execute(operationBean, parametersMap, false);
		if(resultBean==null||resultBean.isSuccess()==false){
			SyncLogger.log("ZRFC_HTMS_013 001", "resultBean==null||resultBean.isSuccess()==false 获取未派车调拨单号出错。");
			return false;
		}
		List list = resultBean.getListResult("loadAllNotSendCarSapCode");
		if(list==null||list.isEmpty()){
			SyncLogger.log("ZRFC_HTMS_013 002", "list==null||list.isEmpty() 没有未派车调拨单号。");
			return false;
		}
		this.setFunctionCode("ZRFC_HTMS_013");
		TransferBean tansBean = null;
		int count =0;
		int countEnd=200;
		int loopNumbers=list.size()/200+1;
		//增加for循环，每次以200个为单位做sap的请求和本地数据库的更新
		for(int j=0;j<loopNumbers;j++){
				 count=(j+1)*200;
				 for(int i=j*200,size=list.size();i<size&&i<count;i++){
					SyncLogger.log("  loopNumbers start  ------------  ","   ---   "+i+"     "+count);
					tansBean=(TransferBean)list.get(i);
					if(this.isNull(tansBean.getSapTransCode())){
						continue;
					}
					this.setTableValue("IT_TAB", "VBELN", tansBean.getSapTransCode());
				}
				
				/*订单抬头*/
				JCoTable jcoTable = this.getJCoTable("IT_TAB");//parameterList.getTable("IT_HEAD");
				int rowNum = jcoTable==null?0:jcoTable.getNumRows();
				if(rowNum==0){
					SyncLogger.log("ZRFC_HTMS_013 003", "jcoTable==null or rowNum==0  没有需要更新派车状态的调拨单号。");
					return true;
				}
				String[] updateSapCodes=new String[rowNum];
				StringBuffer buffer = new StringBuffer();
				for(int i=0;i<rowNum;i++){
					jcoTable.setRow(i);
					updateSapCodes[i]=jcoTable.getString("VBELN");
					buffer.append(updateSapCodes[i]).append(",");
				}
				SyncLogger.log("ZRFC_HTMS_013 004", "需要更新派车状态的调拨单号:"+buffer);
				
				operationBean = OperationConfigRepository.getOperationConfig("updateAllNotSendCarSapCode");	
				if(operationBean==null){
					SyncLogger.log("ZRFC_HTMS_013 005", "operationBean==null 更新调拨单号派车状态失败。");
				}
				//dbTool.setAutoCommint(true);		
				parametersMap.put("updateSapCodes", updateSapCodes);
				dbTool = new DBTool();
				dbTool.setAutoCommint(true);
				resultBean = dbTool.execute(operationBean, parametersMap, false);
				if(resultBean==null||resultBean.isSuccess()==false){
					SyncLogger.log("ZRFC_HTMS_013 005", "resultBean==null||resultBean.isSuccess()==false  更新调拨单号派车状态失败。");
					result = false;
				}else{
					SyncLogger.log("ZRFC_HTMS_013 006", " 更新调拨单号派车状态成功。");
					result = true;
				}
		
	   }
		
		return result;
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ChangeCarStatusSynker synker= new ChangeCarStatusSynker();
		synker.sync();
		
		
		//synker.setFunctionCode("ZRFC_CL_INTERFACE004");
	/*	
		synker.setParameter("G_BEGDA", "20170101");
		synker.setParameter("G_ENDDA", "20170812");
		synker.setParameter("P_VKGRP", "001");//015,001
*/		//synker.loadFromDb();
		//152-010-106-F06
		//synker= new ChangeCarStatusSynker();
		//0010646969	F06	2017-08-31
		//0010643804	106	2017-08-22
		//synker.sync("","2017-09-01","2017-09-12");
		//synker= new OrderSynker();
		//synker.sync("106","2017-08-31","2017-09-01");
		/*synker= new OrderSynker();
		synker.sync("106","2017-09-8","2017-09-12");
		synker= new OrderSynker();		
		synker.sync("F06","2017-09-8","2017-09-12");*/		
		//synker.sync("152-010-106-F06","2017-09-8","2017-09-12");

		/*int listsize=20045;
		
		int count =0;
		int countEnd=200;
		int loopNumbers=listsize/200+1;
		System.out.println("loopNumbers  "+loopNumbers);
		for(int j=0;j<loopNumbers;j++){
		  count=(j+1)*200;
		  
		  for(int i=j*200,size=listsize;i<size&&i<count;i++){
		
		  }
		}*/
		
	}

}
