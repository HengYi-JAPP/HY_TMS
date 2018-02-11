package com.zzy.htms.autotest;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;

public class CopyOfAutoTestBussiness  extends AbstractV2BusinessExecutor {
	
	public static String corderId = "46" ;
	public static String caddrId =  "14"  ;
	public static String orderCode="0010000388";
	public static int userId=999;
	public static String codetailId= "52";
	public static String productId="2";
	public static String factoryId="1";
	public static String itemCode ="000010";
	public static String createTime="2017-10-31 12:59:59";
	public static String modifyTime="2017-11-01 09:12:59";
	public static String  carrierId="4";
	public static String sapTransferCode="0000084556";
	
	
	public static int failureRows=0;
	public static int successRows=0;

	
	
	public void createShipApply(){
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
		
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCreateShipApply");			
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
	
	
	//
	public void cancelShipApply(String shipId){
		Map parameters =  new HashMap();
		System.out.println(" ");
		//ship 参数设置		
		parameters.put("shipId",shipId);		
		parameters.put("codetailId",codetailId);
		parameters.put("modifyTime",modifyTime);	
		parameters.put("userId",userId);	
		parameters.put("applyTonNum",1);	
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCancelShipApply");			
		ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
		if(saveBean==null|saveBean.isSuccess()==false){
			System.out.println("保存cancelShipApply不成功,resultBean==null|resultBean.isSuccess()==false");
			failureRows--;
		}else{
			successRows++;
			System.out.println("保存cancelShipApply成功   shipid: "+shipId);
			
			List<Object> list=saveBean.getListResult("shipId");
			if(list!=null&&list.size()>0){
				for(Object str:list){
					System.out.println("   shipid:   "+shipId.toString());
				}
			}else{
				//System.out.println("   shipid  list is null   ");
			}
		}
	}
	
	public void createTransfer(String shipId,String shipDetailId){
		Map parameters =  new HashMap();
		//ship 参数设置		
		parameters.put("shipId",shipId);		
		parameters.put("logisticsId","");
		parameters.put("transferCode",tools.tool.DateUtil.getFormatDate("MMddHHmmss")+tools.tool.getRandomUUID(8).toUpperCase());	
		parameters.put("createTime",createTime);	
		parameters.put("userId",userId);
		
		parameters.put("selfFetch","0");	
		parameters.put("shipDetailId",shipDetailId);
		
		parameters.put("approveNotice","审批备注"+tools.tool.getRandomUUID(10));
		parameters.put("shortStock",256);
		parameters.put("shortNotice","审批细项备注"+tools.tool.getRandomUUID(10));
		parameters.put("modifyTime",modifyTime);
		
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCreateTransfer");			
		ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
		if(saveBean==null|saveBean.isSuccess()==false){
			System.out.println("保存createTransfer不成功,resultBean==null|resultBean.isSuccess()==false");
			failureRows--;
		}else{
			successRows++;
			System.out.println("保存createTransfer成功   shipid: "+shipId+"   shipDetailId:"+shipDetailId);
			List<Object> list=saveBean.getListResult("shipId");
			if(list!=null&&list.size()>0){
				for(Object str:list){
					System.out.println("   shipid:   "+str.toString());
				}
			}else{
				//System.out.println("   shipid  list is null   ");
			}
		}
	}
	
	
	public void cancelTransfer(String shipId){
		Map parameters =  new HashMap();
		//ship 参数设置		
		parameters.put("shipId",shipId);		
		parameters.put("userId",userId);
		parameters.put("modifyTime",modifyTime);
		
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCancelTransfer");			
		ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
		if(saveBean==null|saveBean.isSuccess()==false){
			System.out.println("保存cancelTransfer不成功,resultBean==null|resultBean.isSuccess()==false");
			failureRows--;
		}else{
			successRows++;
			System.out.println("保存cancelTransfer成功   shipid: ");
			
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
	
	public void createTransport(String transId,String ShipId,String currentTransDetailId){
		Map parameters =  new HashMap();
		//ship 参数设置		
		parameters.put("transId",transId);		
		parameters.put("currentShipId",ShipId);	
		
		parameters.put("currentTransDetailId",currentTransDetailId);	
		
		
		
		parameters.put("transportCode",tools.tool.DateUtil.getFormatDate("MMddHHmmss")+tools.tool.getRandomUUID(8).toUpperCase());	
		parameters.put("transportNotice","分配备注"+tools.tool.getRandomUUID(10));	
		
		parameters.put("transDetailNotice","分配细项备注"+tools.tool.getRandomUUID(10));	
		parameters.put("sapTransferCode",sapTransferCode);	
		
		parameters.put("currentCarrierId",carrierId);	
		parameters.put("userId",userId);
		parameters.put("modifyTime",modifyTime);
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCreateTransport");			
		ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
		if(saveBean==null|saveBean.isSuccess()==false){
			System.out.println("保存createTransport不成功,resultBean==null|resultBean.isSuccess()==false");
			failureRows--;
		}else{
			successRows++;
			System.out.println("保存createTransport成功   shipid: ");
			
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
	
	public void cancelTransport(String transId,String currentShipId){
		Map parameters =  new HashMap();
		//ship 参数设置		
		parameters.put("transId",transId);		
		parameters.put("transShipId",currentShipId);			
		parameters.put("sapTransferCode","");	
		parameters.put("userId",userId);
		parameters.put("modifyTime",modifyTime);
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCancelTransport");			
		ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
		if(saveBean==null|saveBean.isSuccess()==false){
			System.out.println("保存cancelTransport不成功,resultBean==null|resultBean.isSuccess()==false");
			failureRows--;
		}else{
			successRows++;
			System.out.println("保存cancelTransport成功   shipid: ");
			
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
	
	
	public void createSend(String transferId,String transportId){
		Map parameters =  new HashMap();
		
		/*
		 $sendVehicleId,$sendDriverId,
	     $login_user_carrier_id,$planTime,$detailTime,$sendTonNum,$sendPackNum,$sendCode,$sendNotice,0,$userId,$createTime,$createTime 
		 
		 */
		//ship 参数设置		
		
		parameters.put("transferId",transferId);		
		parameters.put("transportId",transportId);		
		parameters.put("sendVehicleId",1);	
		parameters.put("sendDriverId",1);	
		
		parameters.put("planTime",createTime);	
		parameters.put("detailTime",createTime);	
		parameters.put("sendTonNum",1);	
		parameters.put("sendPackNum",1);
		
		parameters.put("sendCode",tools.tool.DateUtil.getFormatDate("MMddHHmmss")+tools.tool.getRandomUUID(2).toUpperCase());	
		parameters.put("sendNotice","排车备注"+tools.tool.getRandomUUID(10));	
		parameters.put("userId",userId);	
		parameters.put("createTime",createTime);	
		parameters.put("modifyTime",modifyTime);
		
		
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCreateSend");			
		ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
		if(saveBean==null|saveBean.isSuccess()==false){
			System.out.println("保存testCreateSend不成功,resultBean==null|resultBean.isSuccess()==false");
			failureRows--;
		}else{
			successRows++;
			System.out.println("保存testCreateSend成功   shipid: ");
			
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
	
	
	public void cancelSend(String transferId,String transportId){
		Map parameters =  new HashMap();
		
		/*
		 $sendVehicleId,$sendDriverId,
	     $login_user_carrier_id,$planTime,$detailTime,$sendTonNum,$sendPackNum,$sendCode,$sendNotice,0,$userId,$createTime,$createTime 
		 
		 */
		//ship 参数设置		
		
		parameters.put("transferId",transferId);		
		parameters.put("transportId",transportId);		
		parameters.put("sendVehicleId",1);	
		parameters.put("sendDriverId",1);	
		
		parameters.put("planTime",createTime);	
		parameters.put("detailTime",createTime);	
		parameters.put("sendTonNum",1);	
		parameters.put("sendPackNum",1);
		
		parameters.put("sendCode",tools.tool.DateUtil.getFormatDate("MMddHHmmss")+tools.tool.getRandomUUID(2).toUpperCase());	
		parameters.put("sendNotice","排车备注"+tools.tool.getRandomUUID(10));	
		parameters.put("userId",userId);	
		parameters.put("createTime",createTime);	
		parameters.put("modifyTime",modifyTime);
		
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCancelSend");			
		ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
		if(saveBean==null|saveBean.isSuccess()==false){
			System.out.println("保存testCreateSend不成功,resultBean==null|resultBean.isSuccess()==false");
			failureRows--;
		}else{
			successRows++;
			System.out.println("保存testCreateSend成功   shipid: ");
			
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
	
	
	public void sendCar(String sendId){
         Map parameters =  new HashMap();
		
		/*
		 $sendVehicleId,$sendDriverId,
	     $login_user_carrier_id,$planTime,$detailTime,$sendTonNum,$sendPackNum,$sendCode,$sendNotice,0,$userId,$createTime,$createTime 
		 
		 */
		//ship 参数设置		
		
		parameters.put("checkSendId",sendId);		
		parameters.put("sendVehicleId",1);	
		parameters.put("sendDriverId",1);	
		
		parameters.put("userId",userId);	
		parameters.put("createTime",createTime);	
		parameters.put("modifyTime",modifyTime);
		
		
		
		
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testDoSendCar");			
		ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
		if(saveBean==null|saveBean.isSuccess()==false){
			System.out.println("保存testCreateSend不成功,resultBean==null|resultBean.isSuccess()==false");
			failureRows--;
		}else{
			successRows++;
			System.out.println("保存testCreateSend成功   shipid: ");
			
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
	
	
	public void cancelSendCar(String sendId){
		Map parameters = new HashMap();
		parameters.put("sendId", sendId);
		parameters.put("sendVehicleId", 1);
		parameters.put("sendDriverId", 1);

		parameters.put("userId", userId);
		parameters.put("createTime", createTime);
		parameters.put("modifyTime", modifyTime);

		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCancelSendCar");
		ResultBean saveBean = this.dbOperator(operationBean, parameters, false);
		if (saveBean == null | saveBean.isSuccess() == false) {
			System.out.println("保存testCreateSend不成功,resultBean==null|resultBean.isSuccess()==false");
			failureRows--;
		}else{
			successRows++;
			System.out.println("保存testCreateSend成功   shipid: ");

			List<Object> list = saveBean.getListResult("shipId");
			if (list != null && list.size() > 0) {
				for (Object str : list) {
					System.out.println("   shipid:   " + str.toString());
				}
			} else {
				System.out.println("   shipid  list is null   ");
			}
		}
	}
	
	
	public static void main(String[] args) {
		long start=(new Date()).getTime() ;
		CopyOfAutoTestBussiness bussiness=new  CopyOfAutoTestBussiness();
		for(int i =0 ;i<500;i++){
			//按照我们的逻辑生成ID
			bussiness.createShipApply();
			//按照数据库sequence表的逻辑生成ID
			//bussiness.createShipApplyUserSeq();
		}
		//ship
		for(int i =2 ;i<1000;i++){
			String shipId=i+"";
			//bussiness.cancelShipApply(shipId);
			
		}
		
		//transfer
		for(int i=2;i<1001;i++){
			String shipId=i+"";
			int k=i;
			String shipDetailId=k+"";
			//bussiness.createTransfer(shipId,shipDetailId);
			//bussiness.cancelTransfer(shipId);
		}
		
		//transport
		for(int i=2;i<1001;i++){
			String shipId=i+"";
			int k=i;
			String transId=k+"";
			String currentTransDetailId=i+"";
			//bussiness.createTransport(transId,shipId,currentTransDetailId);
			//bussiness.cancelTransport(transId,shipId);
		}
		
		
		//transport
		for(int i=1655;i<2655;i++){
//			String transferId=i+"";
			int k=i+1059-1655;
			int  transferId=k;
			String transportId=(k-1059+1045)  +"";
			//bussiness.createSend(transferId+"",transportId);
			//bussiness.cancelSend(transId,shipId);
		}
		
		long end=(new Date()).getTime() ;
		System.out.println("  result    failureRows:"+failureRows+"       successRows:"+successRows  +"  执行时间:"+(end-start));
	}
	
}
