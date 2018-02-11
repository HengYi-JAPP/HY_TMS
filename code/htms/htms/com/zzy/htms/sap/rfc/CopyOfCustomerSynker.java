package com.zzy.htms.sap.rfc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

public class CopyOfCustomerSynker extends AbstractBusinessExecutor {
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
		ResultBean resultBean = this.dbOperator(operationBean, this.parameters, false);
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
		System.out.println("loadCustOrder="+(list==null?0:list.size()));
		
		list =resultBean.getListResult("loadCustDetail");		
		if(list==null){
			log.info(SysLogInfo.GROUP_LOAD_FAILURE_OR_NULL);
		}else{				
			CustOrderDetailBean detailBean = null;
			
			for(int i =0,size=list.size();i<size;i++){
				detailBean = (CustOrderDetailBean)list.get(i);
				ordersDetailMap.put(detailBean.getSaleNum()+","+detailBean.getCodetailCertificate(), detailBean);
			}
		}
		System.out.println("loadCustDetail="+(list==null?0:list.size()));
		return ordersMap;
	}
	public void loadFromSap(){
		JCoParameterList parameterList=  null;//Jco3Utils.callFunctions(this.getFunctionCode(), this.parameters,false);
		if(parameterList==null){
			System.out.println("parameterList==null");
			return ;
		}
		/*订单抬头*/
		JCoTable jcoTable = parameterList.getTable("IT_HEAD");
		Map parametersMap = new HashMap();
		this.setTableParameter(jcoTable, parametersMap);
		
		jcoTable = parameterList.getTable("IT_ITEM");
		this.setDetailTableParameter(jcoTable, parametersMap);
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("syncCustOrder");
		ResultBean resultBean = this.dbOperator(operationBean, parametersMap, false);
		if(resultBean==null||resultBean.isSuccess()==false){
			//System.out.println("resultBean============================================================null");
		}else{
			//System.out.println("resultBean============================================================isSuccess");
		}
		//System.out.println("=============================operationBean==============================="+operationBean);
		/* jcoTable = parameterList.getTable("IT_ITEM");
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
		        }*/
	}
	
	public void setTableParameter(JCoTable jcoTable,Map parametersMap){
		if(jcoTable==null){
			return;
		}
		int iCount =0,uCount=0;
		String salesNum=null;
		jcoTable.firstRow();
		Map tempMap = new HashMap();
		List<String> tempList= new ArrayList<String>();
		for (int i = 0; i < jcoTable.getNumRows(); i++) 
        {
			 jcoTable.setRow(i);
			 salesNum=jcoTable.getString("VBELN");
			 tempMap.put(salesNum, salesNum);
			 if(ordersMap.get(salesNum)==null){
				 iCount++;
			 }else{
				 uCount++;
			 }
        }
		
		/*遍历出冗余的订单*/
		Set set =ordersMap.keySet();
		Iterator it =set.iterator();
		Object key=null;
		while(it.hasNext()){
			key=it.next();
			if(key!=null&&tempMap.get(key.toString())==null){
				tempList.add(key.toString());
			}
		}
		int tempSize = tempList.size();
		if(tempSize>0){
			String[]  delete_salesNum=new String[tempSize];
			for(int i=0;i<tempSize;i++){
				delete_salesNum[i]=tempList.get(i);
			}
			parametersMap.put("delete_salesNum",delete_salesNum);
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
	
	public void setDetailTableParameter(JCoTable jcoTable,Map parametersMap){
		if(jcoTable==null){
			return;
		}
		int iCount =0,uCount=0;
		String salesNum=null,salesItem=null;
		jcoTable.firstRow();
		Map tempMap = new HashMap();
		
		for (int i = 0; i < jcoTable.getNumRows(); i++) 
        {
			 jcoTable.setRow(i);
			 salesNum=jcoTable.getString("VBELN");
			 salesItem=jcoTable.getString("POSNR");
			 tempMap.put(salesNum+","+salesItem, salesNum+","+salesItem);
			 if(ordersDetailMap.get(salesNum+","+salesItem)==null){
				 iCount++;
			 }else{
				 uCount++;
			 }
        }
		System.out.println("\n\n iCount="+iCount+",uCount="+uCount);
		/*遍历出冗余的订单*/
		Set set =ordersDetailMap.keySet();
		Iterator it =set.iterator();
		Object key=null;
		List<String> tempList= new ArrayList<String>();
		while(it.hasNext()){
			key=it.next();
			if(key!=null&&tempMap.get(key.toString())==null){
				tempList.add(key.toString());
			}
		}
		int tempSize = tempList.size();
		if(tempSize>0){
			String[]  delete_detailSalesNum=new String[tempSize],delete_detailSalesItem=new String[tempSize];
			String str=null,temp[]=null;
			for(int i=0;i<tempSize;i++){
				str=tempList.get(i);
				temp=str.split(",");
				if(temp==null||temp.length!=2){
					continue;
				}
				delete_detailSalesNum[i]=temp[0];
				delete_detailSalesItem[i]=temp[1];
			}
			parametersMap.put("delete_detailSalesNum",delete_detailSalesNum);
			parametersMap.put("delete_detailSalesItem",delete_detailSalesItem);
		}
		
		
		StringBuffer buffer = new StringBuffer();
		//System.out.println("=============================IT_HEAD===============================");
		String[]// dinsert_corderId=new String[iCount],
		dinsert_saleNum=new String[iCount],
		dinsert_codetailCertificate=new String[iCount],
		dinsert_meterialFactory=new String[iCount],
		dinsert_meterialNo=new String[iCount],
		dinsert_meterialId=new String[iCount],
		dinsert_codetailCertificateDesc=new String[iCount],
		dinsert_orderAmount=new String[iCount],
		dinsert_orderUnit=new String[iCount],
		dinsert_projectVolume=new String[iCount],
		dinsert_volumeUnit=new String[iCount],
		dinsert_conditionSutotal=new String[iCount],
		dinsert_freight=new String[iCount],
		dinsert_unitPrice=new String[iCount],
		dinsert_docCondCount=new String[iCount],
		dinsert_notLimitStorage=new String[iCount],
		dinsert_postedStock=new String[iCount],
		dinsert_unpostedStock=new String[iCount],
		dinsert_deliveryStatus=new String[iCount],
		dinsert_partialDelivery=new String[iCount],
		dinsert_dbPrice=new String[iCount],
		dinsert_alreadyGetNum=new String[iCount],
		dinsert_creator=new String[iCount],
		dinsert_createTime=new String[iCount],
		dinsert_modifier=new String[iCount],
		dinsert_modifyTiime=new String[iCount],
		dinsert_isValidate=new String[iCount];
		
		String[] dupdate_saleNum=new String[uCount],                     
		dupdate_codetailCertificate=new String[uCount],         
		dupdate_meterialFactory=new String[uCount],             
		dupdate_meterialNo=new String[uCount],                  
		dupdate_codetailCertificateDesc=new String[uCount],     
		dupdate_orderAmount=new String[uCount],                 
		dupdate_orderUnit=new String[uCount],                   
		dupdate_projectVolume=new String[uCount],               
		dupdate_volumeUnit=new String[uCount],                  
		dupdate_conditionSutotal=new String[uCount],            
		dupdate_freight=new String[uCount],                     
		dupdate_unitPrice=new String[uCount],                   
		dupdate_docCondCount=new String[uCount],                
		dupdate_notLimitStorage=new String[uCount],             
		dupdate_postedStock=new String[uCount],                 
		dupdate_unpostedStock=new String[uCount],               
		dupdate_deliveryStatus=new String[uCount],              
		dupdate_partialDelivery=new String[uCount],             
		dupdate_dbPrice=new String[uCount],                     
		dupdate_codetailId=new String[uCount],                  

		dupdate_createTime=new String[uCount];
		
		 iCount=0;
		 uCount=0;
		 CustOrderDetailBean detailBean = null;
		 
		 for (int i = 0; i < jcoTable.getNumRows(); i++) 
	        {
			 jcoTable.setRow(i);
			 jcoTable.setRow(i);
			 salesNum=jcoTable.getString("VBELN");
			 salesItem=jcoTable.getString("POSNR");
			 detailBean=ordersDetailMap.get(salesNum+","+salesItem);
			 if(detailBean==null){
				 //dinsert_corderId[iCount]=jcoTable.getString("VBELN");
				 dinsert_saleNum[iCount]=jcoTable.getString("VBELN");
				 dinsert_codetailCertificate[iCount]=jcoTable.getString("POSNR");
				 dinsert_meterialFactory[iCount]=jcoTable.getString("WERKS");
				 
				 dinsert_meterialNo[iCount]=jcoTable.getString("MATNR");
				 
				 //dinsert_meterialId[iCount]=jcoTable.getString("VBELN");
				 dinsert_codetailCertificateDesc[iCount]=jcoTable.getString("ARKTX");
				 dinsert_orderAmount[iCount]=jcoTable.getString("KWMENG");
				 dinsert_orderUnit[iCount]=jcoTable.getString("VRKME");
				 dinsert_projectVolume[iCount]=jcoTable.getString("VOLUM");
				 dinsert_volumeUnit[iCount]=jcoTable.getString("VOLEH");
				 dinsert_conditionSutotal[iCount]=jcoTable.getString("KZWI1");
				 dinsert_freight[iCount]=jcoTable.getString("PZ007");
				 dinsert_unitPrice[iCount]=jcoTable.getString("PRICE");
				 dinsert_docCondCount[iCount]=jcoTable.getString("KNUMV");
				 dinsert_notLimitStorage[iCount]=jcoTable.getString("LABST");
				 dinsert_postedStock[iCount]=jcoTable.getString("LABST_Y");
				 dinsert_unpostedStock[iCount]=jcoTable.getString("LABST_W");
				 dinsert_deliveryStatus[iCount]=jcoTable.getString("LFGSA");
				 dinsert_partialDelivery[iCount]=jcoTable.getString("KZTLF");
				 dinsert_dbPrice[iCount]=jcoTable.getString("DBPRICE");
				 
				 //dinsert_alreadyGetNum[iCount]=jcoTable.getString("VBELN");
				 //dinsert_creator[iCount]=jcoTable.getString("VBELN");
				 dinsert_createTime[iCount]=tools.tool.getDateTime();
				 //dinsert_modifier[iCount]=jcoTable.getString("VBELN");
				 //dinsert_modifyTiime[iCount]=jcoTable.getString("VBELN");
				 //dinsert_isValidate[iCount]=jcoTable.getString("VBELN");
				 iCount++;
			 }else{
				 dupdate_saleNum[uCount]=jcoTable.getString("VBELN");
				 dupdate_codetailCertificate[uCount]=jcoTable.getString("POSNR");
				 dupdate_meterialFactory[uCount]=jcoTable.getString("WERKS");
				 dupdate_meterialNo[uCount]=jcoTable.getString("MATNR");
				 dupdate_codetailCertificateDesc[uCount]=jcoTable.getString("ARKTX");
				 dupdate_orderAmount[uCount]=jcoTable.getString("KWMENG");
				 dupdate_orderUnit[uCount]=jcoTable.getString("VRKME");
				 dupdate_projectVolume[uCount]=jcoTable.getString("VOLUM");
				 dupdate_volumeUnit[uCount]=jcoTable.getString("VOLEH");
				 dupdate_conditionSutotal[uCount]=jcoTable.getString("KZWI1");
				 dupdate_freight[uCount]=jcoTable.getString("PZ007");
				 dupdate_unitPrice[uCount]=jcoTable.getString("PRICE");
				 dupdate_docCondCount[uCount]=jcoTable.getString("KNUMV");
				 dupdate_notLimitStorage[uCount]=jcoTable.getString("LABST");
				 dupdate_postedStock[uCount]=jcoTable.getString("LABST_Y");
				 dupdate_unpostedStock[uCount]=jcoTable.getString("LABST_W");
				 dupdate_deliveryStatus[uCount]=jcoTable.getString("LFGSA");
				 dupdate_partialDelivery[uCount]=jcoTable.getString("KZTLF");
				 dupdate_dbPrice[uCount]=jcoTable.getString("DBPRICE");
				 dupdate_createTime[uCount]=tools.tool.getDateTime();
				 dupdate_codetailId[uCount]=detailBean.getCodetailId()+"";
				 uCount++;
			 }
	        }
		 System.out.println("\n\n iCount="+iCount+",uCount="+uCount);
		 
		 parametersMap.put("dinsert_saleNum",dinsert_saleNum);
		 parametersMap.put("dinsert_codetailCertificate",dinsert_codetailCertificate);
		 parametersMap.put("dinsert_meterialFactory",dinsert_meterialFactory);
		 parametersMap.put("dinsert_meterialNo",dinsert_meterialNo);
		 parametersMap.put("dinsert_codetailCertificateDesc",dinsert_codetailCertificateDesc);
		 parametersMap.put("dinsert_orderAmount",dinsert_orderAmount);
		 parametersMap.put("dinsert_orderUnit",dinsert_orderUnit);
		 parametersMap.put("dinsert_projectVolume",dinsert_projectVolume);
		 parametersMap.put("dinsert_volumeUnit",dinsert_volumeUnit);
		 parametersMap.put("dinsert_conditionSutotal",dinsert_conditionSutotal);
		 parametersMap.put("dinsert_freight",dinsert_freight);
		 parametersMap.put("dinsert_unitPrice",dinsert_unitPrice);
		 parametersMap.put("dinsert_docCondCount",dinsert_docCondCount);
		 parametersMap.put("dinsert_notLimitStorage",dinsert_notLimitStorage);
		 parametersMap.put("dinsert_postedStock",dinsert_postedStock);
		 parametersMap.put("dinsert_unpostedStock",dinsert_unpostedStock);
		 parametersMap.put("dinsert_deliveryStatus",dinsert_deliveryStatus);
		 parametersMap.put("dinsert_partialDelivery",dinsert_partialDelivery);
		 parametersMap.put("dinsert_dbPrice",dinsert_dbPrice);
		 parametersMap.put("dinsert_createTime",dinsert_createTime);
		 
		 
		 
		 parametersMap.put("dupdate_saleNum",dupdate_saleNum);
		 parametersMap.put("dupdate_codetailCertificate",dupdate_codetailCertificate);
		 parametersMap.put("dupdate_meterialFactory",dupdate_meterialFactory);
		 parametersMap.put("dupdate_meterialNo",dupdate_meterialNo);
		 parametersMap.put("dupdate_codetailCertificateDesc",dupdate_codetailCertificateDesc);
		 parametersMap.put("dupdate_orderAmount",dupdate_orderAmount);
		 parametersMap.put("dupdate_orderUnit",dupdate_orderUnit);
		 parametersMap.put("dupdate_projectVolume",dupdate_projectVolume);
		 parametersMap.put("dupdate_volumeUnit",dupdate_volumeUnit);
		 parametersMap.put("dupdate_conditionSutotal",dupdate_conditionSutotal);
		 parametersMap.put("dupdate_freight",dupdate_freight);
		 parametersMap.put("dupdate_unitPrice",dupdate_unitPrice);
		 parametersMap.put("dupdate_docCondCount",dupdate_docCondCount);
		 parametersMap.put("dupdate_notLimitStorage",dupdate_notLimitStorage);
		 parametersMap.put("dupdate_postedStock",dupdate_postedStock);
		 parametersMap.put("dupdate_unpostedStock",dupdate_unpostedStock);
		 parametersMap.put("dupdate_deliveryStatus",dupdate_deliveryStatus);
		 parametersMap.put("dupdate_partialDelivery",dupdate_partialDelivery);
		 parametersMap.put("dupdate_dbPrice",dupdate_dbPrice);
		 parametersMap.put("dupdate_createTime",dupdate_createTime);
		 parametersMap.put("dupdate_codetailId",dupdate_codetailId);
		
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		CopyOfCustomerSynker synker= new CopyOfCustomerSynker();
		synker.setFunctionCode("ZRFC_CL_INTERFACE004");
		
		synker.setParameter("G_BEGDA", "20170801");
		synker.setParameter("G_ENDDA", "20170810");
		synker.setParameter("P_VKGRP", "015");
		synker.loadFromDb();
		synker.loadFromSap();

	}

}
