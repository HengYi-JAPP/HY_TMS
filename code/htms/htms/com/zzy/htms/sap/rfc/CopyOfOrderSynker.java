package com.zzy.htms.sap.rfc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.privilege.group.GroupBean;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.zzy.htms.sales.custorder.CustOrderBean;
import com.zzy.htms.sales.custorderdetail.CustOrderDetailBean;

import consts.PropKey;
import consts.SysLogInfo;

public class CopyOfOrderSynker extends AbstractBusinessExecutor {
	Map parameters=new HashMap();
	public void setParameter(Object key,Object value){
		this.parameters.put(key, value);
	}
	private String functionCode;
	

	public String getFunctionCode() {
		return functionCode;
	}
	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}
	/**
	 * 根据开始日期、结束日期和销售组号，从SAP中获取该销售在近期内的订单；
	 * 然后从数据库中获取该销售在近期内的订单，
	 * 两份订单进行对比，如果订单存在，则进行更新；如果订单不存在，则进行插入
	 * 
	 * 订单中有如下信息：
	 * 1）订单；
	 * 2）订单明细；
	 * 3）客户；
	 * 4）厂区；
	 * 5）产品
	 * 
	 * 
	 * 同步点有下面几个：
	 * 1）发货助手登录时，进入界面前进行同步；
	 * 2）业务平台通过操作按钮手功同步；
	 * 3）通过定时调度任务，每隔一小时进行同步
	 */
	public void sync(){
		
	}
	Map<String,CustOrderBean> ordersMap =new HashMap<String,CustOrderBean>();
	Map<String,CustOrderDetailBean> ordersDetailMap =new HashMap<String,CustOrderDetailBean>();
	
	public Map<String,CustOrderBean> loadFromDb(){
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadCustOrder");
		ResultBean resultBean = this.dbOperator(operationBean, new HashMap(), false);
		List list =resultBean.getListResult("loadCustOrder");
		
		if(list==null){
			log.info(SysLogInfo.GROUP_LOAD_FAILURE_OR_NULL);
		}else{				
			CustOrderBean orderBean = null;
			
			for(int i =0,size=list.size();i<size;i++){
				orderBean = (CustOrderBean)list.get(i);	
				
				ordersMap.put(orderBean.getCorderCode(), orderBean);
				
			}
		}
		
		list =resultBean.getListResult("loadCustDetail");		
		if(list==null){
			log.info(SysLogInfo.GROUP_LOAD_FAILURE_OR_NULL);
		}else{				
			CustOrderDetailBean detailBean = null;
			
			for(int i =0,size=list.size();i<size;i++){
				detailBean = (CustOrderDetailBean)list.get(i);	
				
				ordersDetailMap.put(detailBean.getSaleNum()+detailBean.getCodetailCertificate(), detailBean);
			}
		}
		return ordersMap;
	}
	public void loadFromSap(){
		JCoParameterList parameterList =null;//=Jco3Utils.callFunctions(this.getFunctionCode(), this.parameters,false);
		if(parameterList==null){
			System.out.println("parameterList==null");
			return ;
		}
		/*订单抬头*/
		JCoTable jcoTable = parameterList.getTable("IT_HEAD");
		int iCount =0,uCount=0;
		String salesNum=null;
		for (int i = 0; i < jcoTable.getNumRows(); i++) 
        {
			 jcoTable.setRow(i);
			 salesNum=jcoTable.getString("VBELN");
			 if(ordersMap.get(salesNum)==null){
				 iCount++;
			 }else{
				 uCount++;
			 }
        }
		StringBuffer buffer = new StringBuffer();
		System.out.println("=============================IT_HEAD===============================");
		String[] //insert_corderId=new String[iCount],
		//insert_customerId=new String[iCount],
		//insert_corderName=new String[iCount],
		insert_corderCode=new String[iCount],
		insert_customerCode=new String[iCount],
		insert_customerName=new String[iCount],
		insert_saleType=new String[iCount],
		insert_saleNum=new String[iCount],
		insert_exchangeTitle=new String[iCount],
		insert_saleOrg=new String[iCount],
		insert_saleChannel=new String[iCount],
		insert_productGroup=new String[iCount],
		insert_saleGroup=new String[iCount],
		insert_saleDepartment=new String[iCount],
		insert_fetchFactory=new String[iCount],
		insert_saleMan=new String[iCount],
		insert_deliveryStatus=new String[iCount],
		insert_crecateTime=new String[iCount],
		insert_inputTime=new String[iCount],
		insert_creator=new String[iCount];
		
		String[] //update_customerId=new String[uCount],
		//update_corderName=new String[uCount],
		update_corderCode=new String[uCount],
		update_customerCode=new String[uCount],
		update_customerName=new String[uCount],
		update_saleType=new String[uCount],
		update_saleNum=new String[uCount],
		update_exchangeTitle=new String[uCount],
		update_saleOrg=new String[uCount],
		update_saleChannel=new String[uCount],
		update_productGroup=new String[uCount],
		update_saleGroup=new String[uCount],
		update_saleDepartment=new String[uCount],
		update_fetchFactory=new String[uCount],
		update_saleMan=new String[uCount],
		update_deliveryStatus=new String[uCount],
		update_crecateTime=new String[uCount],
		update_inputTime=new String[uCount],
		update_creator=new String[uCount],update_corderId=new String[uCount];
		
		 iCount=0;
		 uCount=0;
		 CustOrderBean orderBean = null;
		 for (int i = 0; i < jcoTable.getNumRows(); i++) 
	        {
			 jcoTable.setRow(i);
			 jcoTable.setRow(i);
			 salesNum=jcoTable.getString("VBELN");
			 orderBean=ordersMap.get(salesNum);
			 if(orderBean==null){
				 //insert_corderId[iCount]=jcoTable.getString("VBELN");
				 //insert_customerId[iCount]=jcoTable.getString("VBELN");
				 //insert_corderName[iCount]=jcoTable.getString("VBELN");
				 insert_corderCode[iCount]=jcoTable.getString("VBELN");
				 insert_customerCode[iCount]=jcoTable.getString("KUNNR");
				 insert_customerName[iCount]=jcoTable.getString("NAME1");
				 insert_saleType[iCount]=jcoTable.getString("AUART");
				 insert_saleNum[iCount]=jcoTable.getString("VBELN");
				 insert_exchangeTitle[iCount]=jcoTable.getString("VBELN");
				 
				 insert_saleOrg[iCount]=jcoTable.getString("VKORG");
				 insert_saleChannel[iCount]=jcoTable.getString("VTWEG");
				 insert_productGroup[iCount]=jcoTable.getString("SPART");
				 insert_saleGroup[iCount]=jcoTable.getString("VKGRP");
				 insert_saleDepartment[iCount]=jcoTable.getString("VKBUR");
				 insert_fetchFactory[iCount]=jcoTable.getString("VBELN");
				 
				 insert_saleMan[iCount]=jcoTable.getString("BEZEI");
				 insert_deliveryStatus[iCount]=jcoTable.getString("LFGSK");
				 insert_crecateTime[iCount]=jcoTable.getString("ERDAT");
				 insert_inputTime[iCount]=jcoTable.getString("ERZET");
				 insert_creator[iCount]=jcoTable.getString("ERNAM");
				 iCount++;
			 }else{
				 update_corderCode[uCount]=jcoTable.getString("VBELN");
				 update_customerCode[uCount]=jcoTable.getString("KUNNR");
				 update_customerName[uCount]=jcoTable.getString("NAME1");
				 update_saleType[uCount]=jcoTable.getString("AUART");
				 update_saleNum[uCount]=jcoTable.getString("VBELN");
				 update_exchangeTitle[uCount]=jcoTable.getString("VBELN");

				 update_saleOrg[uCount]=jcoTable.getString("VKORG");
				 update_saleChannel[uCount]=jcoTable.getString("VTWEG");
				 update_productGroup[uCount]=jcoTable.getString("SPART");
				 update_saleGroup[uCount]=jcoTable.getString("VKGRP");
				 update_saleDepartment[uCount]=jcoTable.getString("VKBUR");
				 update_fetchFactory[uCount]=jcoTable.getString("VBELN");

				 update_saleMan[uCount]=jcoTable.getString("BEZEI");
				 update_deliveryStatus[uCount]=jcoTable.getString("LFGSK");
				 update_crecateTime[uCount]=jcoTable.getString("ERDAT");
				 update_inputTime[uCount]=jcoTable.getString("ERZET");
				 update_creator[uCount]=jcoTable.getString("ERNAM");
				 update_corderId[uCount]=orderBean.getCorderId()+"";
				 uCount++;
			 }
			 /*
			 buffer = new StringBuffer();
			 buffer.append(jcoTable.getString("VBELN")).append('\t');
			 buffer.append(jcoTable.getString("ERDAT")).append('\t');
			 buffer.append(jcoTable.getString("ERZET")).append('\t');
			 buffer.append(jcoTable.getString("ERNAM")).append('\t');
			 buffer.append(jcoTable.getString("AUART")).append('\t');
			 buffer.append(jcoTable.getString("LIFSK")).append('\t');
			 buffer.append(jcoTable.getString("VKORG")).append('\t');
			 buffer.append(jcoTable.getString("VTWEG")).append('\t');
			 buffer.append(jcoTable.getString("SPART")).append('\t');
			 buffer.append(jcoTable.getString("VKGRP")).append('\t');
			 buffer.append(jcoTable.getString("VKBUR")).append('\t');
			 buffer.append(jcoTable.getString("LFGSK")).append('\t');
			 buffer.append(jcoTable.getString("KUNNR")).append('\t');
			 buffer.append(jcoTable.getString("NAME1")).append('\t');
			 buffer.append(jcoTable.getString("BEZEI")).append('\t');

	            System.out.println(buffer);*/
	        }
		 System.out.println("=============================IT_ITEM===============================");
		 jcoTable = parameterList.getTable("IT_ITEM");
			 for (int i = 0; i < jcoTable.getNumRows(); i++) 
		        {
				 jcoTable.setRow(i);
				 buffer = new StringBuffer();
				 

				 buffer.append(jcoTable.getString("VBELN")).append('\t');
				 buffer.append(jcoTable.getString("POSNR")).append('\t');
				 buffer.append(jcoTable.getString("MATNR")).append('\t');
				 buffer.append(jcoTable.getString("WERKS")).append('\t');
				 buffer.append(jcoTable.getString("MATKL")).append('\t');
				 buffer.append(jcoTable.getString("ARKTX")).append('\t');
				 buffer.append(jcoTable.getString("KWMENG")).append('\t');
				 buffer.append(jcoTable.getString("VRKME")).append('\t');
				 
				 buffer.append(jcoTable.getString("VOLUM")).append('\t');
				 buffer.append(jcoTable.getString("VOLEH")).append('\t');
				 buffer.append(jcoTable.getString("KZWI1")).append('\t');
				 buffer.append(jcoTable.getString("PZ007")).append('\t');
				 buffer.append(jcoTable.getString("PRICE")).append('\t');
				 buffer.append(jcoTable.getString("KNUMV")).append('\t');
				 buffer.append(jcoTable.getString("LABST")).append('\t');


				 buffer.append(jcoTable.getString("LABST_Y")).append('\t');
				 buffer.append(jcoTable.getString("LABST_W")).append('\t');
				 buffer.append(jcoTable.getString("LFGSA")).append('\t');
				 buffer.append(jcoTable.getString("KZTLF")).append('\t');
				 buffer.append(jcoTable.getString("DBPRICE")).append('\t');
				 
				 System.out.println(buffer);
		        }
	}
	
	public void setTableParameter(JCoTable jcoTable,Map parametersMap){
		if(jcoTable==null){
			return;
		}
		int iCount =0,uCount=0;
		String salesNum=null;
		jcoTable.firstRow();
		for (int i = 0; i < jcoTable.getNumRows(); i++) 
        {
			 jcoTable.setRow(i);
			 salesNum=jcoTable.getString("VBELN");
			 if(ordersMap.get(salesNum)==null){
				 iCount++;
			 }else{
				 uCount++;
			 }
        }
		StringBuffer buffer = new StringBuffer();
		//System.out.println("=============================IT_HEAD===============================");
		String[] //insert_corderId=new String[iCount],
		//insert_customerId=new String[iCount],
		//insert_corderName=new String[iCount],
		insert_corderCode=new String[iCount],
		insert_customerCode=new String[iCount],
		insert_customerName=new String[iCount],
		insert_saleType=new String[iCount],
		insert_saleNum=new String[iCount],
		insert_exchangeTitle=new String[iCount],
		insert_saleOrg=new String[iCount],
		insert_saleChannel=new String[iCount],
		insert_productGroup=new String[iCount],
		insert_saleGroup=new String[iCount],
		insert_saleDepartment=new String[iCount],
		insert_fetchFactory=new String[iCount],
		insert_saleMan=new String[iCount],
		insert_deliveryStatus=new String[iCount],
		insert_crecateTime=new String[iCount],
		insert_inputTime=new String[iCount],
		insert_creator=new String[iCount];
		
		String[] //update_customerId=new String[uCount],
		//update_corderName=new String[uCount],
		update_corderCode=new String[uCount],
		update_customerCode=new String[uCount],
		update_customerName=new String[uCount],
		update_saleType=new String[uCount],
		update_saleNum=new String[uCount],
		update_exchangeTitle=new String[uCount],
		update_saleOrg=new String[uCount],
		update_saleChannel=new String[uCount],
		update_productGroup=new String[uCount],
		update_saleGroup=new String[uCount],
		update_saleDepartment=new String[uCount],
		update_fetchFactory=new String[uCount],
		update_saleMan=new String[uCount],
		update_deliveryStatus=new String[uCount],
		update_crecateTime=new String[uCount],
		update_inputTime=new String[uCount],
		update_creator=new String[uCount],update_corderId=new String[uCount];
		
		 iCount=0;
		 uCount=0;
		 CustOrderBean orderBean = null;
		 for (int i = 0; i < jcoTable.getNumRows(); i++) 
	        {
			 jcoTable.setRow(i);
			 jcoTable.setRow(i);
			 salesNum=jcoTable.getString("VBELN");
			 orderBean=ordersMap.get(salesNum);
			 if(orderBean==null){
				 //insert_corderId[iCount]=jcoTable.getString("VBELN");
				 //insert_customerId[iCount]=jcoTable.getString("VBELN");
				 //insert_corderName[iCount]=jcoTable.getString("VBELN");
				 insert_corderCode[iCount]=jcoTable.getString("VBELN");
				 insert_customerCode[iCount]=jcoTable.getString("KUNNR");
				 insert_customerName[iCount]=jcoTable.getString("NAME1");
				 insert_saleType[iCount]=jcoTable.getString("AUART");
				 insert_saleNum[iCount]=jcoTable.getString("VBELN");
				 insert_exchangeTitle[iCount]=jcoTable.getString("VBELN");
				 
				 insert_saleOrg[iCount]=jcoTable.getString("VKORG");
				 insert_saleChannel[iCount]=jcoTable.getString("VTWEG");
				 insert_productGroup[iCount]=jcoTable.getString("SPART");
				 insert_saleGroup[iCount]=jcoTable.getString("VKGRP");
				 insert_saleDepartment[iCount]=jcoTable.getString("VKBUR");
				 insert_fetchFactory[iCount]=jcoTable.getString("VBELN");
				 
				 insert_saleMan[iCount]=jcoTable.getString("BEZEI");
				 insert_deliveryStatus[iCount]=jcoTable.getString("LFGSK");
				 insert_crecateTime[iCount]=jcoTable.getString("ERDAT");
				 insert_inputTime[iCount]=jcoTable.getString("ERZET");
				 insert_creator[iCount]=jcoTable.getString("ERNAM");
				 iCount++;
			 }else{
				 update_corderCode[uCount]=jcoTable.getString("VBELN");
				 update_customerCode[uCount]=jcoTable.getString("KUNNR");
				 update_customerName[uCount]=jcoTable.getString("NAME1");
				 update_saleType[uCount]=jcoTable.getString("AUART");
				 update_saleNum[uCount]=jcoTable.getString("VBELN");
				 update_exchangeTitle[uCount]=jcoTable.getString("VBELN");

				 update_saleOrg[uCount]=jcoTable.getString("VKORG");
				 update_saleChannel[uCount]=jcoTable.getString("VTWEG");
				 update_productGroup[uCount]=jcoTable.getString("SPART");
				 update_saleGroup[uCount]=jcoTable.getString("VKGRP");
				 update_saleDepartment[uCount]=jcoTable.getString("VKBUR");
				 update_fetchFactory[uCount]=jcoTable.getString("VBELN");

				 update_saleMan[uCount]=jcoTable.getString("BEZEI");
				 update_deliveryStatus[uCount]=jcoTable.getString("LFGSK");
				 update_crecateTime[uCount]=jcoTable.getString("ERDAT");
				 update_inputTime[uCount]=jcoTable.getString("ERZET");
				 update_creator[uCount]=jcoTable.getString("ERNAM");
				 update_corderId[uCount]=orderBean.getCorderId()+"";
				 uCount++;
			 }
	        }
		 
		 
		 parametersMap.put("insert_corderCode",insert_corderCode        );
		 parametersMap.put("insert_customerCode",insert_customerCode    );
		 parametersMap.put("insert_customerName",insert_customerName    );
		 parametersMap.put("insert_saleType",insert_saleType            );
		 parametersMap.put("insert_saleNum",insert_saleNum              );
		 parametersMap.put("insert_exchangeTitle",insert_exchangeTitle  );
		 parametersMap.put("insert_saleOrg",insert_saleOrg              );
		 parametersMap.put("insert_saleChannel",insert_saleChannel      );
		 parametersMap.put("insert_productGroup",insert_productGroup    );
		 parametersMap.put("insert_saleGroup",insert_saleGroup          );
		 parametersMap.put("insert_saleDepartment",insert_saleDepartment);
		 parametersMap.put("insert_fetchFactory",insert_fetchFactory    );
		 parametersMap.put("insert_saleMan",insert_saleMan              );
		 parametersMap.put("insert_deliveryStatus",insert_deliveryStatus);
		 parametersMap.put("insert_crecateTime",insert_crecateTime      );
		 parametersMap.put("insert_inputTime",insert_inputTime          );
		 parametersMap.put("insert_creator",insert_creator              );
		 
		 parametersMap.put("update_corderCode",update_corderCode);
		 parametersMap.put("update_customerCode",update_customerCode);
		 parametersMap.put("update_customerName",update_customerName);
		 parametersMap.put("update_saleType",update_saleType);
		 parametersMap.put("update_saleNum",update_saleNum);
		 parametersMap.put("update_exchangeTitle",update_exchangeTitle);
		 parametersMap.put("update_saleOrg",update_saleOrg);
		 parametersMap.put("update_saleChannel",update_saleChannel);
		 parametersMap.put("update_productGroup",update_productGroup);
		 parametersMap.put("update_saleGroup",update_saleGroup);
		 parametersMap.put("update_saleDepartment",update_saleDepartment);
		 parametersMap.put("update_fetchFactory",update_fetchFactory);
		 parametersMap.put("update_saleMan",update_saleMan);
		 parametersMap.put("update_deliveryStatus",update_deliveryStatus);
		 parametersMap.put("update_crecateTime",update_crecateTime);
		 parametersMap.put("update_inputTime",update_inputTime);
		 parametersMap.put("update_creator",update_creator);
		 parametersMap.put("update_corderId",update_corderId);
		
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		CopyOfOrderSynker synker= new CopyOfOrderSynker();
		synker.setFunctionCode("ZRFC_CL_INTERFACE004");
		
		synker.setParameter("G_BEGDA", "20170801");
		synker.setParameter("G_ENDDA", "20170810");
		synker.setParameter("P_VKGRP", "015");
		
		synker.loadFromSap();

	}

}
