package com.zzy.htms.sap.rfc;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.database.DBTool;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.zzy.htms.services.business.FreightBean;
import com.zzy.htms.services.business.HtmsFreightBusiness;
import com.zzy.htms.services.business.SapTransferBean;


/**
 * sap运费回写接口实现类
 * @author zzy
 *
 */
public class SapFreightSynker extends SapSynker {
	
	/**
	 * 正式运费回写到sap需要调用的方法
	 * @param freightList
	 * @return
	 */
	public Map<String,String> writeFreight(List<FreightBean> freightList){
		
		if(freightList==null||freightList.isEmpty()){
			SyncLogger.log("ZRFC_HTMS_010 001","transferBean==null，不能创建SAP中的调拨单");
			return null;
		}
		
		/*订单抬头*/
		this.setFunctionCode("ZRFC_HTMS_010");
	
		FreightBean freightBean = null;		
		SyncLogger.log("ZRFC_HTMS_010 002","=============================ZRFC_HTMS_010 002 INPUT========================");
		for(int i=0,size=freightList.size();i<size;i++){
			freightBean=freightList.get(i);
			
			
			StringBuffer buffer= new StringBuffer();
			this.setTableValue("IT_SHIPPINGCOST", "VBELN", freightBean.getSapCode());//销售订单号
			this.setTableValue("IT_SHIPPINGCOST", "POSNR", freightBean.getSubItemCode());//销售订单行项目
			this.setTableValue("IT_SHIPPINGCOST", "PRICE", freightBean.getFreightPrice());//虚拟调拨单号
			this.setTableValue("IT_SHIPPINGCOST", "DBITEMTOTAL", freightBean.getFreightAmount());//交货数量
			
			buffer.append("VBELN").append(freightBean.getSapCode()).append("\t");
			buffer.append("POSNR").append(freightBean.getSubItemCode()).append("\t");
			buffer.append("PRICE").append(freightBean.getFreightPrice()).append("\t");
			buffer.append("DBITEMTOTAL").append(freightBean.getFreightAmount()).append("\t");
			
			SyncLogger.log("ZRFC_HTMS_010 002["+i+"]",buffer.toString());
			
		}
		
		
		
		//this.setParameter("CUSTOMERID", "0000300017");
		JCoTable jcoTable =this.getJCoTable("ET_RETURN");// parameterList.getTable("COMPANY_TAB_TAB");
		
		if(jcoTable==null){
			log.info("ZRFC_HTMS_010 003 jcoTable==null");
			SyncLogger.log("ZRFC_HTMS_010 003","jcoTable==null");
			return null;
		}
		String value=null;
		 jcoTable.setRow(0);
		// jcoTable.appendRow();
		
		StringBuffer buffer = new StringBuffer();
		log.info("=============================ET_RETURN===============================");
		SyncLogger.log("ZRFC_HTMS_010 004","=============================ET_RETURN===============================");
		String vbeln=null,vgbel=null,message=null;
		Map<String,String> resutlMap=new HashMap<String,String>();
		 for (int i = 0; i < jcoTable.getNumRows(); i++){
			 jcoTable.setRow(i);
			 
			 vbeln=jcoTable.getString("VBELN");//交货单号，即SAP中的调拨单号
			 vgbel=jcoTable.getString("POSNR");//虚拟交货单号
			 message=jcoTable.getString("MSG");//返回的消息
			 
			 buffer = new StringBuffer();
			 resutlMap.put(vbeln+vgbel, message);
			 
			 buffer.append(vbeln).append('\t');//交货单号，即SAP中的调拨单号
			 buffer.append(vgbel).append('\t');//虚拟交货单号
			 buffer.append(message).append('\t');//返回的消息

	         log.info(buffer.toString());

	 		SyncLogger.log("ZRFC_HTMS_010 004["+i+"]",buffer.toString());
        }
		 return resutlMap;
	}
	
	
	
	/**
	 * 获取sap中的调拨单详细信息
	 * @param sapTranfCode
	 * @return
	 */
	public List<SapTransferBean> getTransferInfo(String sapTranfCode){
		if(sapTranfCode==null){
			log.info("sapTranfCode==null不能获取SAP中的调拨单");
			SyncLogger.log("ZRFC_HTMS_008 001","sapTranfCode==null不能获取SAP中的调拨单");
			return null;
		}
		/*订单抬头*/
		this.setFunctionCode("ZRFC_HTMS_008");
		//this.setParameter("IT_VBELN", sapTranfCode);//交货单号,即SAP中的调拨单号
		this.setTableValue("IT_VBELN", "VBELN", sapTranfCode);//销售订单号
		
		//this.setParameter("CUSTOMERID", "0000300017");
		JCoTable jcoTable =this.getJCoTable("ET_DELIVERY_ITEM");// parameterList.getTable("COMPANY_TAB_TAB");
		
		if(jcoTable==null){
			log.info("ZRFC_HTMS_008 002 jcoTable==null");
			SyncLogger.log("ZRFC_HTMS_008 002","jcoTable==null");
			return null;
		}
		String value=null;
		// jcoTable.setRow(0);
		// jcoTable.appendRow();
		
		StringBuffer buffer = new StringBuffer();
		log.info("=============================ET_DELIVERY_ITEM===============================");
		SyncLogger.log("ZRFC_HTMS_008 003","=============================ET_DELIVERY_ITEM===============================");
		String type=null,vbeln=null,vgbel=null,message=null;
		Map<String,Map<String,String>> resutlMap=new HashMap<String,Map<String,String>>();
		Map<String,String> map=new HashMap<String,String>();
		List<SapTransferBean> sapTransList = new ArrayList<SapTransferBean>();
		SapTransferBean sapTransferBean = null;
		BigDecimal tonNum=new BigDecimal("0.000"),actualNum=null;;
		 for (int i = 0; i < jcoTable.getNumRows(); i++){
			 jcoTable.setRow(i);
			 
			 
			 value = jcoTable.getString("LFIMG");//实际已交货量（按销售单位）
			 actualNum=new BigDecimal(value);
			if(actualNum.compareTo(tonNum)<1){
				 continue;
			 }
			 
			 buffer = new StringBuffer();
			 sapTransferBean = new SapTransferBean();
			 sapTransferBean.setEstimate("false");//不是预估运费，是真实运费
			 
			 sapTransferBean.setApplyTonNum(value);
			 
			 value = jcoTable.getString("VBELN");//交货
			 sapTransferBean.setTransferCode(value);
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("POSNR");//交货项目
			 sapTransferBean.setSubItemCode(value);
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("UECHA");//父级项目
			 sapTransferBean.setItemCode(value);
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("MATNR");//物料号 
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("MAKTX");//物料描述（短文本）
			 buffer.append(value).append('\t');
			  
			 value = jcoTable.getString("MATKL");//物料组 
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("WERKS");//工厂
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("LGORT");//库存地点
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("CHARG");//批号
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("LFIMG");//实际已交货量（按销售单位）
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("MEINS");//基本计量单位
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("VRKME");//销售单位 
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZBREED");//产品品种
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZSPEC");//产品规格
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZGROUP");//产品批号
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZRANK");//产品等级
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZNIANX");//捻向
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("ZSHTYP");//纱种
			 buffer.append(value).append('\t');
			
	         log.info("ZRFC_HTMS_008 003["+i+"]:"+buffer);
	 		 SyncLogger.log("ZRFC_HTMS_008 003["+i+"]:",buffer.toString());
	 		
	 		sapTransList.add(sapTransferBean);
        }
		 return sapTransList;
	}
	
	/**
	 * 预估运费功能
	 * sap传入1个或者多个调拨单的数据，查询后，返回有结果的运费数据，没有结果返回为空
	 * sap返回为空，不能设置table属性
	 * @param function
	 */
	public void estimateFreight(JCoFunction function){
		if(function==null){
			//log.info("ZRFC_HTMS_011 001 function==null");
			SyncLogger.log("ZRFC_HTMS_011 001","function==null");
			return ;
		}

		/*订单抬头*/
		JCoParameterList parameterList=function.getTableParameterList();	
		if(parameterList==null){
			//log.info("ZRFC_HTMS_011 002 parameterList==null");
			SyncLogger.log("ZRFC_HTMS_011 002","parameterList==null");
			return ;
		}
		
		JCoTable jcoTable = parameterList.getTable("IT_DELIVERY_INFO");
		if(jcoTable==null){
			//log.info("ZRFC_HTMS_011 003 jcoTable==null");
			SyncLogger.log("ZRFC_HTMS_011 003","jcoTable==null");
			return ;
		}
		
		
		//log.info("=============================ET_DELIVERY_ITEM===============================");
		SyncLogger.log("ZRFC_HTMS_011 004","=============================estimateFreight  start ===================="+new Date());
		
		SapTransferBean sapTransferBean = null;
		String VBELN = null;
		BigDecimal tonNum=new BigDecimal("0.000"),actualNum=null;
		
		String mapId=null;
		Map<String,List<SapTransferBean>>  sapTransMap=new HashMap<String,List<SapTransferBean>>();
		List<SapTransferBean> tmpSapTransList =null;
		
		 for (int i = 0; i < jcoTable.getNumRows(); i++){
			 String value=null;
			 StringBuffer buffer = new StringBuffer();
			 jcoTable.setRow(i);

			 value = jcoTable.getString("LFIMG");//实际已交货量（按销售单位）
			 actualNum=new BigDecimal(value);
			 if(actualNum.compareTo(tonNum)<1){
				 continue;
			 }
			 
			 buffer = new StringBuffer();
			 sapTransferBean = new SapTransferBean();
			 sapTransferBean.setEstimate("true");//预估运费，不是真实运费
			 
			 sapTransferBean.setApplyTonNum(value);
			 
			 value = jcoTable.getString("VBELN");//交货
			 VBELN=value;
			 sapTransferBean.setTransferCode(value);
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("POSNR");//交货项目
			 sapTransferBean.setSubItemCode(value);
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("MATNR");//物料号 
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("LFIMG");//实际已交货量（按销售单位）
			 buffer.append(value).append('\t');
			 
			 value = jcoTable.getString("MEINS");//基本计量单位
			 buffer.append(value).append('\t');
			
	         //log.info("ZRFC_HTMS_011 004["+i+"]:"+buffer);
	 		 SyncLogger.log("ZRFC_HTMS_011 005 预估运费请求数据 ["+i+"]:",buffer.toString());
	 		
	 		//sapTransList.add(sapTransferBean);
	 		
	 		mapId=VBELN;
	 		tmpSapTransList=sapTransMap.get(mapId);
			if(tmpSapTransList==null){
				tmpSapTransList = new ArrayList<SapTransferBean>();
				sapTransMap.put(mapId,tmpSapTransList);
			 }
			 tmpSapTransList.add(sapTransferBean);
			 if(sapTransMap.get(mapId)==null){
				 tmpSapTransList.add(sapTransferBean);
				 sapTransMap.put(mapId,tmpSapTransList);
			 }
        }
		 
		List<SapTransferBean> sapTransList = new ArrayList<SapTransferBean>();
		Map<String,FreightBean>  sapTransFreightMap = null;
		HtmsFreightBusiness freightBusiness = new HtmsFreightBusiness();
		for(String key:sapTransMap.keySet()){
			sapTransList = sapTransMap.get(key);	
	    	List<FreightBean> freightList =freightBusiness.getFreight(sapTransList,false);
	    	if(freightList!=null&&freightList.size()>0){
	    		FreightBean  freightBean=freightList.get(0);
				if(freightBean!=null&&freightBean.getSapCode()!=null&&freightBean.getTotalFreight()!=null){
		    		SyncLogger.log("ZRFC_HTMS_011 sapTransFreightMap  "," sapcode= "+key+ "  freightList:"+freightList.size());
		    		if(sapTransFreightMap==null){
		    			sapTransFreightMap=new HashMap<String, FreightBean>();
		    		}
		    	    sapTransFreightMap.put(key, freightBean);
	    	    }
	    	}
		}		
		
	    //返回结果赋值，如果sapTransFreightMap为空
    	if(sapTransFreightMap!=null&&!sapTransFreightMap.isEmpty()){
    		JCoTable table=parameterList.getTable("ET_SHIPPINGCOST");
    		for(String key:sapTransFreightMap.keySet()){
				FreightBean  freightBean=sapTransFreightMap.get(key);
				if(freightBean!=null&&jcoTable!=null){
					table.appendRow();
					String code=freightBean.getSapCode();
					String freight=freightBean.getTotalFreight();
					SyncLogger.log("ZRFC_HTMS_011 009","  sapcode: "+freightBean.getSapCode()+"    totalFreight:"+freightBean.getTotalFreight());
					table.setValue("VBELN", code);
					table.setValue("DBITEMTOTAL", freight);					
        		}
		    }
    	}
    	
        JCoTable jcoTableReturn =parameterList.getTable("ET_SHIPPINGCOST");
		
		if(jcoTableReturn==null){
			SyncLogger.log("ZRFC_HTMS_011 010","jcoTable==null  预估运费返回结果为空");
			return ;
		}
		jcoTableReturn.setRow(0);
		
		
		StringBuffer buffer = new StringBuffer();
		SyncLogger.log("ZRFC_HTMS_011 008","=============================ET_SHIPPINGCOST===============================");
		String vbeln=null,vgbel=null;
		 for (int i = 0; i < jcoTableReturn.getNumRows(); i++){
			 jcoTableReturn.setRow(i);
			 
			 vbeln=jcoTableReturn.getString("VBELN");//交货单号，即SAP中的调拨单号
			 vgbel=jcoTableReturn.getString("DBITEMTOTAL");//虚拟交货单号
			 
			 buffer = new StringBuffer();
			 
			 buffer.append(vbeln).append('\t');//交货单号，即SAP中的调拨单号
			 buffer.append(vgbel).append('\t');//虚拟交货单号

	         log.info(buffer.toString());

	 		SyncLogger.log("ZRFC_HTMS_011  预估运费 返回结果遍历  ["+i+"]:",buffer.toString());
        }
    	SyncLogger.log("ZRFC_HTMS_011 008","预估运费调用结束");
		return ;
	}
	
	
	
	/**
	 * 获取开票日期,开票金额,开票的实际重量
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public boolean syncInvoiceFreight(String startDate,String endDate){
		Map<String,Object> parametersMap=new HashMap<String,Object>();
		
		if(!this.isNull(startDate)){
			parametersMap.put("startDate", new String[]{tools.tool.DateUtil.getDate(startDate, "yyyy-MM-dd")});
		}
		if(!this.isNull(endDate)){
			parametersMap.put("endDate", new String[]{tools.tool.DateUtil.getDate(endDate, "yyyy-MM-dd")});
		}
		
	
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadDbFreightSapCode");
		ResultBean resultBean = this.dbOperator(operationBean, parametersMap, false);
		if(resultBean==null||resultBean.isSuccess()==false){
			SyncLogger.log("ZRFC_HTMS_012 001", "resultBean==null||resultBean.isSuccess()==false 数据库查询失败。");
			return false;
		}
		List<FreightBean> freightList =(List<FreightBean>)resultBean.getListResult("freightList");
		
		if(freightList==null||freightList.isEmpty()){
			SyncLogger.log("ZRFC_HTMS_012 002","reightList==null||freightList.isEmpty()，在指定时间内，没有需要获取开票运费的调拨单。");
			return true;
		}
		
		/*订单抬头*/
		this.setFunctionCode("ZRFC_HTMS_012");
	
		FreightBean freightBean = null;		
		SyncLogger.log("ZRFC_HTMS_012 004","=============================ZRFC_HTMS_012 002 INPUT========================");
		StringBuffer buffer= new StringBuffer();
		for(int i=0,size=freightList.size();i<size;i++){
			freightBean=freightList.get(i);
			/*if(this.isNull(freightBean.getInvoiceFreight())==false){已经
				continue;
			}*/
			
			this.setTableValue("IT_VBELN", "VBELN", freightBean.getSapCode());//销售订单号
			//System.out.println("VBELN="+freightBean.getSapCode());
			buffer.append("VBELN").append(freightBean.getSapCode()).append(",");
		}
		
		SyncLogger.log("ZRFC_HTMS_012 004 ",buffer.toString());
		
		
		//this.setParameter("CUSTOMERID", "0000300017");
		JCoTable jcoTable =this.getJCoTable("ET_SHIPPINGCOST");// parameterList.getTable("COMPANY_TAB_TAB");
		
		if(jcoTable==null){
			log.info("ZRFC_HTMS_012 005 ET_SHIPPINGCOST jcoTable==null");
			SyncLogger.log("ZRFC_HTMS_012 005","ET_SHIPPINGCOST jcoTable==null");
			return false;
		}
		
		jcoTable.setRow(0);

		
		
		int rowNum = jcoTable.getNumRows();
		
		if(rowNum==0){
			SyncLogger.log("ZRFC_HTMS_012 006","rowNum==0");
			return true;
		}
		
		log.info("=============================ET_RETURN===============================");
		SyncLogger.log("ZRFC_HTMS_012 007","=============================ET_RETURN===============================");
		String[] sapCode=new String[rowNum],invoiceFreight=new String[rowNum];

		String[] actualApplyTon=new String[rowNum] ;
		String[] actualShipmentsDate = new String[rowNum];
		
		jcoTable.setRow(0);
		 for (int i = 0; i < rowNum; i++){
			 jcoTable.setRow(i);
			 
			 sapCode[i]=jcoTable.getString("VBELN");//交货单号，即SAP中的调拨单号
			 invoiceFreight[i]=jcoTable.getString("DBITEMTOTAL");//金额
			 actualApplyTon[i] =jcoTable.getString("LFIMG");        //实际已交货量
			 actualShipmentsDate[i]=jcoTable.getString("WADAT_IST");//实际货物移动日期
			
			 
			 buffer = new StringBuffer();
			 buffer.append( sapCode[i]).append('\t');//交货单号，即SAP中的调拨单号
			 buffer.append(invoiceFreight[i]).append('\t');//虚拟交货单号
			 buffer.append(actualApplyTon[i]).append('\t');//虚拟交货单号
			 buffer.append(actualShipmentsDate[i]).append('\t');//虚拟交货单号
			 
//			System.out.println("ZRFC_HTMS_012 007"+buffer.toString());
			//System.out.println("ZRFC_HTMS_012 007"+buffer.toString());
	 		SyncLogger.log("ZRFC_HTMS_012 007["+i+"]",buffer.toString());
        }
		 //System.out.println("rowNum ="+rowNum);
		 //System.out.println("sapCode ="+sapCode);

		 //System.out.println("invoiceFreight ="+invoiceFreight);
		 parametersMap.put("sapCode", sapCode);
		 parametersMap.put("invoiceFreight", invoiceFreight);
		 parametersMap.put("invoiceTonNum",  actualApplyTon);
		 parametersMap.put("invoiceTime",    actualShipmentsDate);
		 
		 operationBean = OperationConfigRepository.getOperationConfig("updateDbInvoiceFreight");
		 if(operationBean==null){
			SyncLogger.log("ZRFC_HTMS_012 008","operationBean==null");
			return false;
		 }
		 
		 DBTool dbTool = new DBTool();
		 dbTool.setAutoCommint(true);
		 resultBean = dbTool.execute(operationBean, parametersMap, false);
			
		if(resultBean==null||resultBean.isSuccess()==false){
			SyncLogger.log("ZRFC_HTMS_012 009","保存开票费用失败。");			
			return false;
		}else{
			SyncLogger.log("ZRFC_HTMS_012 010","保存开票费用成功.");
			return true;
		}		
	}
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		SapFreightSynker synker= new SapFreightSynker();
//		//synker.createTransfer();
//		synker.syncInvoiceFreight("2017-09-30", "2017-09-30");
//	

			
		String mapId=null;
		Map<String,List<SapTransferBean>>  sapTransMap=new HashMap<String,List<SapTransferBean>>();
		List<SapTransferBean> tmpSapTransList =null;
		//SapTransferBean sapTransferBean = null;
		
		List<SapTransferBean> sapTransList=new ArrayList<SapTransferBean>();
		SapTransferBean transBean = new SapTransferBean();
		 
		transBean.setTransferCode("0080001699");
		transBean.setItemCode("000010");
		transBean.setApplyTonNum("389.00");
		transBean.setEstimate("false");
		
	
		sapTransList.add(transBean);
		
		transBean = new SapTransferBean();
		transBean.setTransferCode("0080001699");
		transBean.setItemCode("000020");
		transBean.setApplyTonNum("100.00");
		transBean.setEstimate("true");
		//sapTransList.add(transBean);
		
		transBean = new SapTransferBean();
		transBean.setTransferCode("0080001723");
		transBean.setItemCode("000010");
		transBean.setApplyTonNum("1234.00");
		transBean.setEstimate("true");
		sapTransList.add(transBean);
		
		//freightBusiness.getFreight(sapTransList);
	
		for(SapTransferBean bean:sapTransList){
			mapId=bean.getTransferCode();
	 		tmpSapTransList=sapTransMap.get(mapId);
			if(tmpSapTransList==null){
				tmpSapTransList = new ArrayList<SapTransferBean>();
				sapTransMap.put(mapId,tmpSapTransList);
			 }
			 tmpSapTransList.add(bean);
			 if(sapTransMap.get(mapId)==null){
				 tmpSapTransList.add(bean);
				 sapTransMap.put(mapId,tmpSapTransList);
			 }
	    }
		
		List<SapTransferBean> sapTransList1 = new ArrayList<SapTransferBean>();
		Map<String,List<FreightBean>>  sapTransFreightMap=new HashMap<String,List<FreightBean>>();
		HtmsFreightBusiness freightBusiness = new HtmsFreightBusiness();
		for(String key:sapTransMap.keySet()){
			sapTransList1 = sapTransMap.get(key);			
	    	List<FreightBean> freightList =freightBusiness.getFreight(sapTransList1);
	    	sapTransFreightMap.put(key, freightList);
		}
		
		if(sapTransFreightMap!=null){
    		for(String key:sapTransFreightMap.keySet()){
    			List<FreightBean> freightList =sapTransFreightMap.get(key);
    			if(freightList!=null&&freightList.size()>0){
    				FreightBean  freightBean=freightList.get(0);
    				if(freightBean!=null){
    					System.out.println("ZRFC_HTMS_011 009    VBELN: "+freightBean.getSapCode()+"    totalFreight:"+freightBean.getTotalFreight());
            		}else{
            			//log.info("ZRFC_HTMS_011 006 freightBean==null");
            			System.out.println("ZRFC_HTMS_011 006   freightBean==null");
            		}
    			}
    		}
    	}else{
    		//log.info("ZRFC_HTMS_011 005 freightList==null");
			SyncLogger.log("ZRFC_HTMS_011 005","freightList==null");
    	}
		
	}

}
