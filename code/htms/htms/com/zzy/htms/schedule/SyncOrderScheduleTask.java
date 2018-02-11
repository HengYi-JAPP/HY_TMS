package com.zzy.htms.schedule;

import java.util.Date;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.utils.DateUtil;
import com.zzy.htms.sap.rfc.OrderSynker;
import com.zzy.htms.sap.rfc.SyncLogger;

/**
 * 同步7天之内的所有订单
 * @author zzy
 *
 */
public class SyncOrderScheduleTask extends AbstractBusinessExecutor implements ScheduleTaskApi  {

	
	//调用销售单同步接口，规定的日期格式
	private static final String FORMMAT_DATE="yyyy-MM-dd";
	
	
	public void doTask() {	
		//设置同步前面多少天的数据,此值为负数
	   int SYNC_DAYS=-7;
	   syncOrder(SYNC_DAYS);
	}
	
	public void syncOrder(int days){
		//查询数据库获取所有的salesno
		/*OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllUserSalesNo");
		ResultBean resultBean = this.dbOperator(operationBean, new HashMap(), false);
		List resultList =resultBean.getListResult("loadUserSalesNoList");
		
		//将取出的salesno放入map，中途去掉重复的salesno
		Map<String,String> salesNoMap=new HashMap<String,String>();
		if(resultList==null){
			log.info("loadCustOrder ==null");
		}else{				
			for(int i =0,size=resultList.size();i<size;i++){
				HashMap<String,String> result = (HashMap) resultList.get(i);	
				String sales = result.get("SALESNO");
				if(sales.contains(",")){
					String[] splitSales=sales.split(",");
					for(String s:splitSales){
						salesNoMap.put(s,s);
					}
				}else{
					salesNoMap.put(sales,sales);
				}
			}
		}*/
		
		//初始化同步销售订单的开始日期和结束日期
		Date date=new Date();
		String endDate=DateUtil.fotmatDate(date,FORMMAT_DATE);
		String startDate=DateUtil.fotmatDate(new Date(date.getTime() + days * 24 * 60 * 60 * 1000L),FORMMAT_DATE);
		
		//根据salesno 批量执行同步销售订单任务
		/*if(salesNoMap!=null&&salesNoMap.size()>0){
			for (Map.Entry<String, String> entry : salesNoMap.entrySet()) {
				log.info("\n\n\n\n  CustOrderScheduleTask   custorder sync task parameters:    "+" salesno: "+entry.getValue()+"  startDate:  "+startDate+"  endDate  "+endDate +" \n\n\n\n " );
				
				
				
			}
			log.info(" \n\n\n\n CustOrderScheduleTask  doing  end .........  \n\n\n\n ");
		}*/
		SyncLogger.log("SyncOrderScheduleTask: syncOrder  "," \n\n\n\n CustOrderScheduleTask doing  start custorder sync task parameters: startDate:  "+startDate+"  endDate  "+endDate +"\n\n\n\n  " );
		
		OrderSynker synker= new OrderSynker();
		synker.sync(null,"", startDate, endDate);
		SyncLogger.log("SyncOrderScheduleTask: syncOrder  "," \n\n\n\n CustOrderScheduleTask doing  end .........  \n\n\n\n ");
	}


}
