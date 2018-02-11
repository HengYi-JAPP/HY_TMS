package com.zzy.htms.sap.rfc;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.database.DBTool;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.sap.conn.jco.JCoTable;
import com.zzy.htms.dictionary.factory.FactoryRepository;
import com.zzy.htms.dictionary.product.ProductRepository;
import com.zzy.htms.sales.customer.CustomerBean;
import com.zzy.htms.sales.custorder.CustOrderBean;
import com.zzy.htms.sales.custorderdetail.CustOrderDetailBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;


/**
 * 订单同步接口实现
 * @author zzy
 *
 */
public class OrderSynker extends SapSynker {
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
	public void clean(){
		tools.tool.clear(ordersMap);
		ordersMap=null;
		

		tools.tool.clear(ordersDetailMap);
		ordersDetailMap=null;
		

		tools.tool.clear(customersMap);
		customersMap=null;
	}
	Map<String,CustOrderBean> ordersMap =new HashMap<String,CustOrderBean>();
	Map<String,CustOrderDetailBean> ordersDetailMap =new HashMap<String,CustOrderDetailBean>();
	Map<String,CustomerBean> customersMap =new HashMap<String,CustomerBean>();
	Map<String,String> dbuseNumMap=new HashMap<String,String>();
	
	
	void loadFromDb(String salesNo,String startDay,String endDay){
		Map<String,Object> parameters=new HashMap<String,Object>();
	
		salesNo=salesNo==null?"":salesNo.trim();
		salesNo=salesNo.indexOf("-")>0?salesNo.replaceAll("-", "','"):salesNo;
		
		
		parameters.put("G_BEGDA", new String[]{tools.tool.DateUtil.getDate(startDay, "yyyyMMdd")});
		parameters.put("G_ENDDA",  new String[]{tools.tool.DateUtil.getDate(endDay, "yyyyMMdd")});
        //因为销售组编号可能变化，所以查询旧数据时，仅仅用时间条件查询旧数据
		parameters.put("syncSalesNo",new String[]{ salesNo});
		//parameters.put("syncSalesNo","");
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadCustOrder");
		ResultBean resultBean = this.dbOperator(operationBean, parameters, false);
		List list =resultBean.getListResult("loadCustOrder");
		tools.tool.clear(parameters);
		if(list==null){
			log.info("loadCustOrder ==null");
			SyncLogger.log("ZRFC_HTMS_001 002", "loadCustOrder ==null");
		}else{				
			CustOrderBean orderBean = null;
			
			for(int i =0,size=list.size();i<size;i++){
				orderBean = (CustOrderBean)list.get(i);	
				
				ordersMap.put(orderBean.getCorderCode(), orderBean);
				
			}
		}
		log.info("loadCustOrder="+(list==null?0:list.size()));
		list =resultBean.getListResult("loadCustDetail");		
		if(list==null){
			log.info("loadCustDetail ==null");
		}else{				
			CustOrderDetailBean detailBean = null;
			//log.info("\n\n\n");
			for(int i =0,size=list.size();i<size;i++){
				detailBean = (CustOrderDetailBean)list.get(i);
				//log.info(detailBean.getSaleNum()+","+detailBean.getCodetailCertificate());
				ordersDetailMap.put(detailBean.getSaleNum()+","+detailBean.getCodetailCertificate(), detailBean);
			}
			//log.info("\n\n\n");
		}
		log.info("loadCustDetail="+(list==null?0:list.size()));
		
		list =resultBean.getListResult("loadAllCustomer");		
		if(list==null){
			log.info("loadAllCustomer ==null");
		}else{				
			CustomerBean custBean = null;
			
			for(int i =0,size=list.size();i<size;i++){
				custBean = (CustomerBean)list.get(i);
				customersMap.put(custBean.getCustomerCode(), custBean);
			}
		}
		
		List shipDetailList =(List) resultBean.getListResult("shipDetailList");
		
		ShipDetailBean shipDetailBean = null;
		for(int i=0,iSize=shipDetailList==null?0:shipDetailList.size();i<iSize;i++){
			shipDetailBean=(ShipDetailBean)shipDetailList.get(i);
			dbuseNumMap.put(shipDetailBean.getCorderCode()+shipDetailBean.getItemCode(), shipDetailBean.getApplyTonNum());
		}
		log.info("loadCustDetail="+(list==null?0:list.size()));
		
		//return ordersMap;
	}
	
	
	/**
	 * 通过从sap中获取的ordercode获取数据库记录
	 * @param jcoTable
	 * @param startDay
	 * @param endDay
	 */
	void loadFromDbWithOrderCode(JCoTable jcoTable,String startDay,String endDay){
		Map<String,Object> parameters=new HashMap<String,Object>();		
		String orderCode=null;
		jcoTable.firstRow();
		
		parameters.put("G_BEGDA", new String[]{tools.tool.DateUtil.getDate(startDay, "yyyyMMdd")});
		parameters.put("G_ENDDA",  new String[]{tools.tool.DateUtil.getDate(endDay, "yyyyMMdd")});
		
		int count =0;
		int countEnd=200;
		int loopNumbers=jcoTable.getNumRows()/200+1;
		//增加for循环，每次以200个为单位做sap的请求和本地数据库的更新
		for(int j=0;j<loopNumbers;j++){
			 count=(j+1)*200;
			 StringBuffer codeBuffer=new StringBuffer(); 
			 Map<String,String> tempMap = new HashMap<String,String>();
			 for(int i=j*200,size=jcoTable.getNumRows();i<size&&i<count;i++){
				 jcoTable.setRow(i);
				 orderCode=jcoTable.getString("VBELN");
				 tempMap.put(orderCode, orderCode);
			 }
			 for(String key:tempMap.keySet()){
				 codeBuffer.append("'").append(key).append("',");
			 }
			 String orderCodes=codeBuffer.toString();
			 if(codeBuffer.length()>0){
				 orderCodes=orderCodes.substring(0, codeBuffer.length()-1); 
			 }
			 orderCodes=(orderCodes==null||orderCodes.length()==0)?"'-1'":orderCodes;
			 SyncLogger.log(""," -------------------------orderCodes: "+orderCodes);
			 
			  //因为销售组编号可能变化，所以查询旧数据时，仅仅用时间条件查询旧数据
				parameters.put("orderCodes",orderCodes);
				
				OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadCustOrderWithOrderCode");
				ResultBean resultBean = this.dbOperator(operationBean, parameters, false);
				List list =resultBean.getListResult("loadCustOrderWithOrderCode");
				tools.tool.clear(parameters);
				if(list==null){
					log.info("loadCustOrder ==null");
					SyncLogger.log("ZRFC_HTMS_001 002", "loadCustOrder ==null");
				}else{				
					CustOrderBean orderBean = null;
					
					for(int i =0,size=list.size();i<size;i++){
						orderBean = (CustOrderBean)list.get(i);	
						
						ordersMap.put(orderBean.getCorderCode(), orderBean);
						
					}
				}
				log.info("loadCustOrder="+(list==null?0:list.size()));
				list =resultBean.getListResult("loadCustDetail");		
				if(list==null){
					log.info("loadCustDetail ==null");
				}else{				
					CustOrderDetailBean detailBean = null;
					//log.info("\n\n\n");
					for(int i =0,size=list.size();i<size;i++){
						detailBean = (CustOrderDetailBean)list.get(i);
						//log.info(detailBean.getSaleNum()+","+detailBean.getCodetailCertificate());
						ordersDetailMap.put(detailBean.getSaleNum()+","+detailBean.getCodetailCertificate(), detailBean);
					}
					//log.info("\n\n\n");
				}
				log.info("loadCustDetail="+(list==null?0:list.size()));
				
				list =resultBean.getListResult("loadAllCustomer");		
				if(list==null){
					log.info("loadAllCustomer ==null");
				}else{				
					CustomerBean custBean = null;
					
					for(int i =0,size=list.size();i<size;i++){
						custBean = (CustomerBean)list.get(i);
						customersMap.put(custBean.getCustomerCode(), custBean);
					}
				}
				
				List shipDetailList =(List) resultBean.getListResult("shipDetailList");
				
				ShipDetailBean shipDetailBean = null;
				for(int i=0,iSize=shipDetailList==null?0:shipDetailList.size();i<iSize;i++){
					shipDetailBean=(ShipDetailBean)shipDetailList.get(i);
					dbuseNumMap.put(shipDetailBean.getCorderCode()+shipDetailBean.getItemCode(), shipDetailBean.getApplyTonNum());
				}
				log.info("loadCustDetail="+(list==null?0:list.size()));
			 
		}
	}
	
	/**
	 * 根据同步的订单类型做同步
	 * @param salesNo
	 * @param startDay
	 * @param endDay
	 * @param type   1则为通过销售组号做判断条件，2则为通过订单编号做判断条件
	 * @return
	 */
	public synchronized boolean sync(String salesNo,String employNo,String startDay,String endDay,String type){
		/*if(this.isNull(salesNo)){
		log.info("OrderSynker salesNo==null");
		return false;
	    }*/
		if(this.isNull(startDay)||this.isNull(endDay)){
			log.info("OrderSynker this.isNull(startDay)||this.isNull(endDay)");
			SyncLogger.log("ZRFC_HTMS_001 001", "this.isNull(startDay)||this.isNull(endDay)");
			return false;
		}
		salesNo=salesNo==null?"":salesNo;
		type=(type==null||type=="")?"2":type;
		
		this.setFunctionCode("ZRFC_HTMS_001");
		this.setParameter("G_BEGDA", tools.tool.DateUtil.getDate(startDay, "yyyyMMdd"));
		this.setParameter("G_ENDDA", tools.tool.DateUtil.getDate(endDay, "yyyyMMdd"));
		this.setParameter("P_VKGRP", salesNo);//015,001
	    this.setParameter("P_SALESNUM",employNo); //订单同步编号
	    
		SyncLogger.log("ZRFC_HTMS_001 002", "G_BEGDA:"+startDay+",G_ENDDA:"+endDay+"P_VKGRP:"+salesNo+"  P_SALESNUM:  "+employNo);
		
		if("1".equals(type)){
			this.loadFromDb( salesNo, startDay, endDay);
		}
		/*订单抬头*/
		JCoTable jcoTable = this.getJCoTable("IT_HEAD");//parameterList.getTable("IT_HEAD");
		Map parametersMap = new HashMap();
		if("2".equals(type)){
			this.loadFromDbWithOrderCode(jcoTable, startDay, endDay);
		}
		
		this.setTableParameter(jcoTable, parametersMap);
		
		jcoTable = this.getJCoTable("IT_ITEM");//parameterList.getTable("IT_ITEM");
		this.setDetailTableParameter(jcoTable, parametersMap);
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("syncCustOrder");
		DBTool dbTool = new DBTool();
		dbTool.setAutoCommint(true);
		//ResultBean resultBean = this.dbOperator(operationBean, parametersMap, false);
		ResultBean resultBean = dbTool.execute(operationBean, parametersMap, false);
		this.clean();
		if(resultBean==null||resultBean.isSuccess()==false){
			//log.info("resultBean============================================================null");
			return false;
		}else{
			//log.info("resultBean============================================================isSuccess");
			return true;
		}
	}
	
	public synchronized boolean sync(String salesNo,String employNo,String startDay,String endDay){
		return sync(salesNo, employNo,startDay, endDay,"2");
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
		//log.info("=============================IT_HEAD===============================");
		String[] 
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
		insert_customerAmount=new String[iCount],
		insert_creator=new String[iCount],
		insert_syncEmployNo=new String[iCount];
		
		String[] 
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
		update_customerAmount=new String[uCount],
		update_deliveryStatus=new String[uCount],
		update_crecateTime=new String[uCount],
		update_inputTime=new String[uCount],
		update_creator=new String[uCount],
		update_corderId=new String[uCount],
		update_syncEmployNo=new String[uCount];
		
		 iCount=0;
		 uCount=0;
		 CustOrderBean orderBean = null;
		 Map<String,String> insertCustomerMap = new HashMap<String,String>();
		 Map<String,String> updateCustomerMap = new HashMap<String,String>();
		 buffer = new StringBuffer();
		 SyncLogger.log("ZRFC_HTMS_001 004", "jcoTable.getNumRows():"+jcoTable.getNumRows());
		 for (int i = 0; i < jcoTable.getNumRows(); i++) 
	        {
			 jcoTable.setRow(i);
			 //jcoTable.setRow(i);
			 salesNum=jcoTable.getString("VBELN");
			 buffer = new StringBuffer();
			 orderBean=ordersMap.get(salesNum);
			 
			 if(orderBean==null){
				 insert_corderCode[iCount]=jcoTable.getString("VBELN");//销售和分销凭证号
				 insert_crecateTime[iCount]=jcoTable.getString("ERDAT");//订单日期 
				 insert_inputTime[iCount]=jcoTable.getString("ERZET");//订单时间
				 insert_creator[iCount]=jcoTable.getString("ERNAM");//创建人 
				 insert_saleType[iCount]=jcoTable.getString("AUART");//销售凭证类型 
				 // jcoTable.getString("LIFSK");//交货冻结（抬头）				 
				 insert_saleOrg[iCount]=jcoTable.getString("VKORG");//销售组织 
				 insert_saleChannel[iCount]=jcoTable.getString("VTWEG");//分销渠道
				 insert_productGroup[iCount]=jcoTable.getString("SPART");//产品组
				 insert_saleGroup[iCount]=jcoTable.getString("VKGRP");//业务员
				 insert_saleDepartment[iCount]=jcoTable.getString("VKBUR");//销售部门 
				 insert_deliveryStatus[iCount]=jcoTable.getString("LFGSK");//总交货状态 
				 insert_customerCode[iCount]=jcoTable.getString("KUNNR");//客户号码
				 insert_customerName[iCount]=jcoTable.getString("NAME1");//客户
				 insert_saleMan[iCount]=jcoTable.getString("BEZEI");////业务员名字
				 insert_customerAmount[iCount]=jcoTable.getString("COMPANYDEBT");//客户余额
				 if(customersMap.get(insert_customerCode[iCount])==null){
					 insertCustomerMap.put( insert_customerCode[iCount],  insert_customerName[iCount]);
				 }else{
					 updateCustomerMap.put( insert_customerCode[iCount],  insert_customerName[iCount]);
				 }
				 
				 
				 insert_saleNum[iCount]=jcoTable.getString("VBELN");//销售和分销凭证号
				 insert_exchangeTitle[iCount]=jcoTable.getString("VBELN");//销售和分销凭证号
				 insert_fetchFactory[iCount]=jcoTable.getString("VBELN");//销售和分销凭证号
				 insert_syncEmployNo[iCount]=jcoTable.getString("IHREZ");//订单同步编号
				 
				 iCount++;
			 }else{
				 update_corderCode[uCount]=jcoTable.getString("VBELN");//销售和分销凭证号 
				 update_crecateTime[uCount]=jcoTable.getString("ERDAT");//订单日期 
				 update_inputTime[uCount]=jcoTable.getString("ERZET");//订单时间
				 update_creator[uCount]=jcoTable.getString("ERNAM");//创建人 
				 update_saleType[uCount]=jcoTable.getString("AUART");//销售凭证类型 
				 // jcoTable.getString("LIFSK");//交货冻结（抬头）
				 update_saleOrg[uCount]=jcoTable.getString("VKORG");//销售组织 
				 update_saleChannel[uCount]=jcoTable.getString("VTWEG");//分销渠道
				 update_productGroup[uCount]=jcoTable.getString("SPART");//产品组
				 update_saleGroup[uCount]=jcoTable.getString("VKGRP");//业务员
				 update_saleDepartment[uCount]=jcoTable.getString("VKBUR");//销售部门 
				 update_deliveryStatus[uCount]=jcoTable.getString("LFGSK");//总交货状态 
				 update_customerCode[uCount]=jcoTable.getString("KUNNR");//客户号码
				 update_customerName[uCount]=jcoTable.getString("NAME1");//客户
				 update_saleMan[uCount]=jcoTable.getString("BEZEI");//业务员名字
				 update_customerAmount[uCount]=jcoTable.getString("COMPANYDEBT");//客户余额
				 if(customersMap.get(update_customerCode[uCount])==null){
					 insertCustomerMap.put( update_customerCode[uCount],  update_customerName[uCount]);
				 }else{
					 updateCustomerMap.put( update_customerCode[uCount],  update_customerName[uCount]);
				 }
				 
				 update_saleNum[uCount]=jcoTable.getString("VBELN");//销售和分销凭证号
				 update_exchangeTitle[uCount]=jcoTable.getString("VBELN");//销售和分销凭证号
				 update_fetchFactory[uCount]=jcoTable.getString("VBELN");//销售和分销凭证号
				 update_syncEmployNo[uCount]=jcoTable.getString("IHREZ");//订单同步编号
				 update_corderId[uCount]=orderBean.getCorderId()+"";
				 uCount++;
			 }
	        }
		 int csize =insertCustomerMap==null|| insertCustomerMap.isEmpty()?0:insertCustomerMap.size();
		// log.info("\n\n\n insertCustomerMap csize=="+csize);
		 //log.info("\n\n\n insertCustomerMap csize=="+csize);
		 SyncLogger.log("ZRFC_HTMS_001 005", "insertCustomerMap csize=="+csize);
		 if(csize>0){
			 set = insertCustomerMap.keySet();
			 it=set.iterator();
			 String[] insertCustomerNo=new String[csize],insertCustomerName=new String[csize];
			 int cindex=0;
			 while(it.hasNext()){
				 insertCustomerNo[cindex]=(String)it.next();
				 insertCustomerName[cindex]=insertCustomerMap.get(insertCustomerNo[cindex]);
				 cindex++;
			 }
			 parametersMap.put("insertCustomerNo",insertCustomerNo);
			 parametersMap.put("insertCustomerName",insertCustomerName);
			 
		 }
		 
		 csize =updateCustomerMap==null|| updateCustomerMap.isEmpty()?0:updateCustomerMap.size();
		// log.info("\n\n\n updateCustomerMap csize=="+csize);
		// log.info("\n\n\n updateCustomerMap csize=="+csize);
		 SyncLogger.log("ZRFC_HTMS_001 005", "updateCustomerMap csize=="+csize);
		 if(csize>0){
		  set = updateCustomerMap.keySet();
		  it=set.iterator();
		  String[] updateCustomerNo=new String[csize],updateCustomerName=new String[csize];
		  int cindex=0;
		  while(it.hasNext()){
		 	 updateCustomerNo[cindex]=(String)it.next();
		 	 updateCustomerName[cindex]=updateCustomerMap.get(updateCustomerNo[cindex]);
		 	cindex++;
		  }
		  parametersMap.put("updateCustomerNo",updateCustomerNo);
		  parametersMap.put("updateCustomerName",updateCustomerName);
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
		 parametersMap.put("insert_customerAmount",insert_customerAmount);
		 parametersMap.put("insert_deliveryStatus",insert_deliveryStatus);
		 parametersMap.put("insert_crecateTime",insert_crecateTime      );
		 parametersMap.put("insert_inputTime",insert_inputTime          );
		 parametersMap.put("insert_creator",insert_creator              );
		 
		 parametersMap.put("insert_syncEmployNo",insert_syncEmployNo);
		 
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
		 parametersMap.put("update_customerAmount",update_customerAmount);
		 parametersMap.put("update_deliveryStatus",update_deliveryStatus);
		 parametersMap.put("update_crecateTime",update_crecateTime);
		 parametersMap.put("update_inputTime",update_inputTime);
		 parametersMap.put("update_creator",update_creator);
		 parametersMap.put("update_corderId",update_corderId);
		 parametersMap.put("update_syncEmployNo",update_syncEmployNo);
		 
		 tools.tool.clear(tempMap);
		
	}
	
	
	/**
	 * 订单同步给订单详情设置详细信息
	 * @param jcoTable
	 * @param parametersMap
	 */
	public void setDetailTableParameter(JCoTable jcoTable,Map parametersMap){
		if(jcoTable==null){
			return;
		}
		int iCount =0,uCount=0;
		String salesNum=null,salesItem=null;
		jcoTable.firstRow();
		Map tempMap = new HashMap();
		String keyValue=null;
		//log.info("\n\n\n");
		SyncLogger.log("ZRFC_HTMS_001 006", "DetailTable csize=="+jcoTable.getNumRows());
		for (int i = 0; i < jcoTable.getNumRows(); i++) 
        {
			 jcoTable.setRow(i);
			 salesNum=jcoTable.getString("VBELN");
			 salesItem=jcoTable.getString("POSNR");
			 keyValue=salesNum+","+salesItem;
			 
			 if(ordersDetailMap.get(keyValue)==null){
				 //log.info("insert:"+keyValue);
				 iCount++;
			 }else{
				// log.info("update:"+keyValue);
				 uCount++;
			 }

			 
			 tempMap.put(keyValue, keyValue);
			
        }
		//log.info("\n\n\n");
		//log.info("\n\n iCount="+iCount+",uCount="+uCount);
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
		tools.tool.clear(tempMap);
		
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
		//log.info("=============================IT_HEAD===============================");
		String[]// dinsert_corderId=new String[iCount],
		dinsert_saleNum=new String[iCount],
		dinsert_codetailCertificate=new String[iCount],
		dinsert_meterialFactory=new String[iCount],
		dinsert_meterialNo=new String[iCount],
		dinsert_meterialId=new String[iCount],
		dinsert_meterialGroup=new String[iCount],
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
		dinsert_productId=new String[iCount],
		dinsert_factoryId=new String[iCount],
		dinsert_factoryGroup=new String[iCount],
		dinsert_alreadyGetNum=new String[iCount],
		dinsert_creator=new String[iCount],
		dinsert_createTime=new String[iCount],
		dinsert_modifier=new String[iCount],
		dinsert_modifyTiime=new String[iCount],
		dinsert_applyNum=new String[iCount],
		dinsert_isValidate=new String[iCount],
		dinsert_shipPoint=new String[iCount],
		dinsert_shipPointDesc=new String[iCount];
		
		String[] dupdate_saleNum=new String[uCount],                     
		dupdate_codetailCertificate=new String[uCount],         
		dupdate_meterialFactory=new String[uCount],             
		dupdate_meterialNo=new String[uCount],
		dupdate_meterialGroup=new String[uCount],      
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
		dupdate_productId=new String[uCount],                     
		dupdate_factoryId=new String[uCount],                      
		dupdate_factoryGroup=new String[uCount],                    
		dupdate_codetailId=new String[uCount], 
		dupdate_applyNum=new String[uCount],

		dupdate_shipPoint=new String[uCount],
		dupdate_shipPointDesc=new String[uCount],
		dupdate_createTime=new String[uCount];
		String[] ordersCodes=new String[iCount+uCount],itemsCodes=new String[iCount+uCount];
		
		 iCount=0;
		 uCount=0;
		 CustOrderDetailBean detailBean = null;
		 String orderItemCode = null,sh,shDesc;
		 StringBuffer fileContent = new StringBuffer();
		 
		 for (int i = 0; i < jcoTable.getNumRows(); i++) 
	        {
			 jcoTable.setRow(i);
			 jcoTable.setRow(i);
			 salesNum=jcoTable.getString("VBELN");
			 salesItem=jcoTable.getString("POSNR");
			 sh=jcoTable.getString("VSTEL");
			 shDesc=jcoTable.getString("VTEXT");
			 
			 fileContent.append("\t").append(salesNum).append("\t").append(salesItem).append("\t").append(sh).append("\t").append(shDesc).append("\n");
			 orderItemCode=salesNum+salesItem;
			 ordersCodes[i]=salesNum;
			 itemsCodes[i]=salesItem;
			 detailBean=ordersDetailMap.get(salesNum+","+salesItem);
			 if(detailBean==null){
				 //dinsert_corderId[iCount]=jcoTable.getString("VBELN");
				 dinsert_saleNum[iCount]=jcoTable.getString("VBELN");
				 dinsert_codetailCertificate[iCount]=jcoTable.getString("POSNR");
				 dinsert_meterialFactory[iCount]=jcoTable.getString("WERKS");//工厂
				 
				 dinsert_meterialNo[iCount]=jcoTable.getString("MATNR");//物料号
				 dinsert_meterialGroup[iCount]=jcoTable.getString("MATKL");//MATKL
				 
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

				 dinsert_factoryGroup[iCount]=jcoTable.getString("BUKRS");
				 //log.info("insert----------->VSTEL:"+jcoTable.getString("VSTEL")+",VTEXT="+jcoTable.getString("VTEXT"));
				 dinsert_shipPoint[iCount]=jcoTable.getString("VSTEL");
				 dinsert_shipPointDesc[iCount]=jcoTable.getString("VTEXT");
				 //dinsert_applyNum[iCount]=this.getVKORG(orderItemCode, jcoTable.getString("VKORG"));
				 
				 //dinsert_alreadyGetNum[iCount]=jcoTable.getString("VBELN");
				 //dinsert_creator[iCount]=jcoTable.getString("VBELN");
				 dinsert_createTime[iCount]=tools.tool.getDateTime();
				 dinsert_productId[iCount]=ProductRepository.getProductId(dinsert_meterialGroup[iCount].trim());
				 dinsert_factoryId[iCount]=FactoryRepository.getFactoryId(dinsert_factoryGroup[iCount].trim());
				 //dinsert_modifier[iCount]=jcoTable.getString("VBELN");
				 //dinsert_modifyTiime[iCount]=jcoTable.getString("VBELN");
				 //dinsert_isValidate[iCount]=jcoTable.getString("VBELN");
				 iCount++;
			 }else{
				 dupdate_saleNum[uCount]=jcoTable.getString("VBELN");
				 dupdate_codetailCertificate[uCount]=jcoTable.getString("POSNR");
				 dupdate_meterialFactory[uCount]=jcoTable.getString("WERKS");
				 dupdate_meterialNo[uCount]=jcoTable.getString("MATNR");
				 dupdate_meterialGroup[uCount]=jcoTable.getString("MATKL");
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
				 dupdate_factoryGroup[uCount]=jcoTable.getString("BUKRS");
				 dupdate_createTime[uCount]=tools.tool.getDateTime();
				 dupdate_codetailId[uCount]=detailBean.getCodetailId()+"";
				// log.info("update----------->VSTEL:"+jcoTable.getString("VSTEL")+",VTEXT="+jcoTable.getString("VTEXT"));
				 dupdate_shipPoint[uCount]=jcoTable.getString("VSTEL");
				 dupdate_shipPointDesc[uCount]=jcoTable.getString("VTEXT");
				// dupdate_applyNum[uCount]=this.getVKORG(orderItemCode, jcoTable.getString("VKORG"));
				 
				 //log.info("_meterialGroup="+dupdate_meterialGroup[uCount]+",factoryGroup="+dupdate_factoryGroup[uCount]);
				 dupdate_productId[uCount]=ProductRepository.getProductId(dupdate_meterialGroup[uCount].trim());
				 dupdate_factoryId[uCount]=FactoryRepository.getFactoryId(dupdate_factoryGroup[uCount].trim());
				 uCount++;
			 }
	        }
		// log.info("\n\n iCount="+iCount+",uCount="+uCount);
		 SyncLogger.log("ZRFC_HTMS_001 006", "detail insert count iCount=="+iCount);
		 OrderStockSearcher synker= new OrderStockSearcher();
		 Map<String,Map<String,String>> sapStockMap=synker.getOrderStock(ordersCodes,itemsCodes);
		 Map<String,String > tempSapMap=null;
		 BigDecimal sapApplyNum = null,dbApplyNum;
		 String sapStrNum=null,dbStrNum;
		 //tools.tool.FileUtil.newFile("C:\\ship-point001.txt", fileContent.toString());
		 for(int i=0;i<iCount;i++){
				sapApplyNum=new BigDecimal(dinsert_orderAmount[i]);
				key= dinsert_saleNum[i]+dinsert_codetailCertificate[i];

				tempSapMap=sapStockMap.get(key);
				if(tempSapMap==null||tempSapMap.isEmpty()){
					dinsert_applyNum[i]=dinsert_orderAmount[i];
					continue;
				}
				sapStrNum=tempSapMap.get("applyNum");
				sapStrNum=this.isNull(sapStrNum)?"0":sapStrNum;
				
				dbStrNum=dbuseNumMap.get(key);
				if(dbStrNum==null||"".equals(dbStrNum.trim())){
					dinsert_applyNum[i]=sapStrNum;
					continue;
				}
				
				sapApplyNum=new BigDecimal(sapStrNum);
				dbStrNum=this.isNull(dbStrNum)?"0":dbStrNum;
				dbApplyNum=new BigDecimal(dbStrNum);
				
				log.info("sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum);
				if(sapApplyNum.compareTo(dbApplyNum)<1){
					dinsert_applyNum[i]="0";
				}else{
					sapApplyNum=sapApplyNum.subtract(dbApplyNum);
					dinsert_applyNum[i]=sapApplyNum+"";
				}
		 }
		 SyncLogger.log("ZRFC_HTMS_001 007", "detail update count uCount=="+uCount);
		 for(int i=0;i<uCount;i++){
				sapApplyNum=new BigDecimal(dupdate_orderAmount[i]);
				key= dupdate_saleNum[i]+dupdate_codetailCertificate[i];

				tempSapMap=sapStockMap.get(key);
				if(tempSapMap==null||tempSapMap.isEmpty()){
					dupdate_applyNum[i]=dupdate_orderAmount[i];
					continue;
				}
				sapStrNum=tempSapMap.get("applyNum");
				sapStrNum=this.isNull(sapStrNum)?"0":sapStrNum;
				
				dbStrNum=dbuseNumMap.get(key);
				if(dbStrNum==null||"".equals(dbStrNum.trim())){
					dupdate_applyNum[i]=sapStrNum;
					continue;
				}
				
				sapApplyNum=new BigDecimal(sapStrNum);
				dbStrNum=this.isNull(dbStrNum)?"0":dbStrNum;
				dbApplyNum=new BigDecimal(dbStrNum);
				
				log.info("sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum);
				if(sapApplyNum.compareTo(dbApplyNum)<1){
					dupdate_applyNum[i]="0";
				}else{
					sapApplyNum=sapApplyNum.subtract(dbApplyNum);
					dupdate_applyNum[i]=sapApplyNum+"";
				}
		 }
		 
		 
		 parametersMap.put("dinsert_saleNum",dinsert_saleNum);
		 parametersMap.put("dinsert_codetailCertificate",dinsert_codetailCertificate);
		 parametersMap.put("dinsert_meterialFactory",dinsert_meterialFactory);
		 parametersMap.put("dinsert_meterialNo",dinsert_meterialNo);
		 parametersMap.put("dinsert_meterialGroup",dinsert_meterialGroup);
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
		 parametersMap.put("dinsert_productId",dinsert_productId);
		 parametersMap.put("dinsert_factoryId",dinsert_factoryId);
		 parametersMap.put("dinsert_factoryGroup",dinsert_factoryGroup);
		 parametersMap.put("dinsert_createTime",dinsert_createTime);
		 parametersMap.put("dinsert_applyNum",dinsert_applyNum);
		 parametersMap.put("dinsert_shipPoint",dinsert_shipPoint);
		 parametersMap.put("dinsert_shipPointDesc",dinsert_shipPointDesc);
		 
		 
		 parametersMap.put("dupdate_saleNum",dupdate_saleNum);
		 parametersMap.put("dupdate_codetailCertificate",dupdate_codetailCertificate);
		 parametersMap.put("dupdate_meterialFactory",dupdate_meterialFactory);
		 parametersMap.put("dupdate_meterialNo",dupdate_meterialNo);
		 parametersMap.put("dupdate_meterialGroup",dupdate_meterialGroup);
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
		 parametersMap.put("dupdate_productId",dupdate_productId);
		 parametersMap.put("dupdate_factoryId",dupdate_factoryId);
		 parametersMap.put("dupdate_factoryGroup",dupdate_factoryGroup);
		 parametersMap.put("dupdate_createTime",dupdate_createTime);
		 parametersMap.put("dupdate_codetailId",dupdate_codetailId);
		 parametersMap.put("dupdate_applyNum",dupdate_applyNum);
		 parametersMap.put("dupdate_shipPoint",dupdate_shipPoint);
		 parametersMap.put("dupdate_shipPointDesc",dupdate_shipPointDesc);
	}
	
	public String getVKORG(String key,String vkOrg){
		 if(this.isNull(vkOrg)){
			 return "0";
		 }

		 Map<String,String > tempSapMap=null;
		 BigDecimal sapApplyNum = null,dbApplyNum;
		 String sapStrNum=null,dbStrNum;
		
		dbStrNum=dbuseNumMap.get(key);
		if(dbStrNum==null||"".equals(dbStrNum.trim())){
			return vkOrg;
		}
		
		vkOrg=this.isNull(vkOrg)?"0":vkOrg;		
		sapApplyNum=new BigDecimal(vkOrg);
		
		dbStrNum=this.isNull(dbStrNum)?"0":dbStrNum;
		dbApplyNum=new BigDecimal(dbStrNum);
		
		//log.info("sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum);
		SyncLogger.log("ZRFC_HTMS_001 008", "sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum);
		if(sapApplyNum.compareTo(dbApplyNum)<1){
			return "0";
		}else{
			sapApplyNum=sapApplyNum.subtract(dbApplyNum);
			return sapApplyNum+"";
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		OrderSynker synker= new OrderSynker();
		//synker.setFunctionCode("ZRFC_CL_INTERFACE004");
	/*	
		synker.setParameter("G_BEGDA", "20170101");
		synker.setParameter("G_ENDDA", "20170812");
		synker.setParameter("P_VKGRP", "001");//015,001
*/		//synker.loadFromDb();
		//152-010-106-F06
		synker= new OrderSynker();
		//0010646969	F06	2017-08-31
		//0010643804	106	2017-08-22
		synker.sync("004","1231231232","2017-12-30","2018-01-20");
		//synker= new OrderSynker();
		//synker.sync("106","2017-08-31","2017-09-01");
		/*synker= new OrderSynker();
		synker.sync("106","2017-09-8","2017-09-12");
		synker= new OrderSynker();		
		synker.sync("F06","2017-09-8","2017-09-12");*/		
		//synker.sync("152-010-106-F06","2017-09-8","2017-09-12");

	}

}
