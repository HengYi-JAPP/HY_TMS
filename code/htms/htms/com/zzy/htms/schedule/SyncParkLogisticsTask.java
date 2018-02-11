package com.zzy.htms.schedule;

import java.util.Date;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.utils.DateUtil;
import com.zzy.htms.parklogistics.ParkLogisticsBussiness;
import com.zzy.htms.sap.rfc.SyncLogger;

/**
 * 园区物流同步任务
 * @author zzy
 *
 */
public class SyncParkLogisticsTask extends AbstractBusinessExecutor implements ScheduleTaskApi  {

	//调用销售单同步接口，规定的日期格式
	private static final String FORMMAT_DATE="yyyy-MM-dd";
	
	
	/**
	 * 5天之内的所有调拨单的园区物流接口更新
	 */
	public void doTask() {	
		//设置同步前面多少天的数据,此值为负数
		ParkLogisticsBussiness  parkLogistics=new ParkLogisticsBussiness();
		Date date=new Date();
		String startDate=DateUtil.fotmatDate(new Date(date.getTime() - 5 * 24 * 60 * 60 * 1000L),FORMMAT_DATE);
		SyncLogger.log("SyncOrderScheduleTask: SyncParkLogistics  ","   "+startDate +"\n\n\n\n  " );
		//System.out.println("    startDate:     "+startDate);
		parkLogistics.sync(startDate);
	}
	
	

}
