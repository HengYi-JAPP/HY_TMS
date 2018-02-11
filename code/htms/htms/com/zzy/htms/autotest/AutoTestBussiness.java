package com.zzy.htms.autotest;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.database.DBTool;
import com.mobilecn.mydbc.repository.OperationConfigRepository;

/**
 * 自动测试使用到的方法，与业务没有直接关系
 * @author zzy
 *
 */
public class AutoTestBussiness  extends AbstractV2BusinessExecutor {
	
//	public static String corderId = "4414" ;
//	public static String caddrId =  "106"  ;
//	public static String orderCode="0010642439";
//	public static int userId=1;
//	public static String codetailId= "5158";
//	public static String productId="2";
//	public static String factoryId="1";
//	public static String itemCode ="000010";
//	public static String createTime="2017-10-31 12:59:59";
//	public static String modifyTime="2017-11-01 09:12:59";
//	public static String  carrierId="4";
//	public static String sapTransferCode="0000084556";
	
	public long codeCount =0;
	
	
	public static String corderId = "335" ;
	public static String caddrId =  "30"  ;
	public static String orderCode="0010000447";
	public static int userId=999;
	public static String codetailId= "378";
	public static String productId="2";
	public static String factoryId="2";
	public static String itemCode ="000010";
	public static String createTime="2017-10-31 12:59:59";
	public static String modifyTime="2017-11-01 09:12:59";
	public static String  carrierId="4";
	public static String sapTransferCode="0000084556";
	
	public static int getFailureRows() {
		return failureRows;
	}


	public static void setFailureRows(int failureRows) {
		AutoTestBussiness.failureRows = failureRows;
	}


	public static int getSuccessRows() {
		return successRows;
	}


	public static void setSuccessRows(int successRows) {
		AutoTestBussiness.successRows = successRows;
	}




	public static int failureRows=0;
	public static int successRows=0;

	
	
	public boolean createShipApply(){
		/*
		 删除语句
		 Delete  From tb_htms_shipdetail  Where creator = 999  ;
         Delete From tb_htms_ship Where creator =999 ;

	    $shipId,$corderId,$caddrId,$orderCode,$shipCode,$applyTonNum,$applyPackNum,$ordreNotice,0,
		        $selfFetch,$fetchDriver,$fetchMobile,$fetchCar,$isUrgent,$userId
		        
		        
		        $shipDetailId,$shipId,$caddrId,$codetailId,$productId,$factoryId,$itemCode,$applyTonNum,$applyPackNum,$shipNotice,0,$userId,$createTime
	    */
		Map parameters =  new HashMap();
		//ship 参数设置
		parameters.put("corderId",corderId);
		parameters.put("caddrId",caddrId);	
		parameters.put("orderCode",orderCode);	
		parameters.put("shipCode",tools.tool.getRandomUUID(30).toUpperCase());	
		parameters.put("applyTonNum",1);	
		parameters.put("applyPackNum",1);	
		parameters.put("ordreNotice","订单备注"+tools.tool.getRandomUUID(10));	
		parameters.put("selfFetch","0");	
		parameters.put("fetchDriver","");	
		parameters.put("fetchMobile","");	
		parameters.put("fetchCar","");	
		parameters.put("isUrgent",1);	
		parameters.put("userId",userId);
		
		
		//shipdetail 参数设置
		parameters.put("codetailId",codetailId);
		parameters.put("productId",productId);
		parameters.put("factoryId",factoryId);
		parameters.put("itemCode",itemCode);
		parameters.put("applyTonNum",1);
		parameters.put("applyPackNum",1);
		parameters.put("shipNotice","细项备注"+tools.tool.getRandomUUID(10));
		parameters.put("userId",userId);
		parameters.put("createTime",createTime);
		
		DBTool dbtool = new DBTool();
		//OperationConfigRepository repository = new OperationConfigRepository();
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCreateShipApply");
		if(operationBean==null){
			System.out.println(" createShipApply operationBean==null");
			return false;
		}
		//ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
		ResultBean saveBean = dbtool.execute(operationBean, parameters, false);
		if(saveBean==null||saveBean.isSuccess()==false){
			//System.out.println("保存createShipApply不成功,resultBean==null|resultBean.isSuccess()==false");
			failureRows--;
			tools.tool.clear(parameters);
			parameters=null;
			return false;
		}else{
			successRows++;
			//System.out.println("保存createShipApply成功   shipid: ");
			String[] shipIds=(String[])parameters.get("shipId");
			if(shipIds!=null&&shipIds.length>0){
				for(int i=0;i<shipIds.length;i++){
					System.out.println("   shipid:   "+shipIds[i]);
				}
			}else{
				System.out.println("   shipid  list is null   ");
			}
			tools.tool.clear(parameters);
			parameters=null;
			return true;
		}
	}
	
	
	public void createShipApplyUserSeq(){
		/*
		 删除语句
		 Delete  From tb_htms_shipdetail  Where creator = 999  ;
         Delete From tb_htms_ship Where creator =999 ;

	    $shipId,$corderId,$caddrId,$orderCode,$shipCode,$applyTonNum,$applyPackNum,$ordreNotice,0,
		        $selfFetch,$fetchDriver,$fetchMobile,$fetchCar,$isUrgent,$userId
		        
		        
		        $shipDetailId,$shipId,$caddrId,$codetailId,$productId,$factoryId,$itemCode,$applyTonNum,$applyPackNum,$shipNotice,0,$userId,$createTime
	    */
		Map parameters =  new HashMap();
		//ship 参数设置
		parameters.put("corderId",corderId);
		parameters.put("caddrId",caddrId);	
		parameters.put("orderCode",orderCode);	
		parameters.put("shipCode",(tools.tool.DateUtil.getFormatDate("MMddHHmmss")+tools.tool.getRandomUUID(2).toUpperCase()));	
		parameters.put("applyTonNum",1);	
		parameters.put("applyPackNum",1);	
		parameters.put("ordreNotice","订单备注"+tools.tool.getRandomUUID(10));	
		parameters.put("selfFetch","0");	
		parameters.put("fetchDriver","");	
		parameters.put("fetchMobile","");	
		parameters.put("fetchCar","");	
		parameters.put("isUrgent",1);	
		parameters.put("userId",userId);
		
		
		//shipdetail 参数设置
		parameters.put("codetailId",codetailId);
		parameters.put("productId",productId);
		parameters.put("factoryId",factoryId);
		parameters.put("itemCode",itemCode);
		parameters.put("applyTonNum",1);
		parameters.put("applyPackNum",1);
		parameters.put("shipNotice","细项备注"+tools.tool.getRandomUUID(10));
		parameters.put("userId",userId);
		parameters.put("createTime",createTime);
		
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCreateShipApplyUseSequenceId");			
		ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
		if(saveBean==null|saveBean.isSuccess()==false){
			System.out.println("保存createShipApply不成功,resultBean==null|resultBean.isSuccess()==false");
			failureRows--;
		}else{
			successRows++;
			System.out.println("保存createShipApply成功   shipid: ");
			
			List<Object> list=saveBean.getListResult("shipId");
			if(list!=null&&list.size()>0){
				for(Object str:list){
					System.out.println("   shipid:   "+str.toString());
				}
			}else{
				System.out.println("   shipid  list is null   ");
			}
		}
	}
	
	
	
	public static void main(String[] args) {
		long start=(new Date()).getTime() ;
		AutoTestBussiness bussiness=new  AutoTestBussiness();
		for(int i =0 ;i<350;i++){
			//按照我们的逻辑生成ID
			bussiness.createShipApply();
			//按照数据库sequence表的逻辑生成ID
			//bussiness.createShipApplyUserSeq();
		}
	
		
		long end=(new Date()).getTime() ;
		//System.out.println("  result    failureRows:"+failureRows+"       successRows:"+successRows  +"  执行时间:"+(end-start));
	}
	
}
