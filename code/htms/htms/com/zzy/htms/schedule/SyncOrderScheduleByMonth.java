package com.zzy.htms.schedule;

import com.mobilecn.business.AbstractBusinessExecutor;

/**
 * 同步销售订单定时任务
 * @author zzy
 *
 */
public class SyncOrderScheduleByMonth extends AbstractBusinessExecutor implements ScheduleTaskApi  {

	/**
	 * 同步30天内的所有订单
	 */
	public void doTask() {	
		//设置同步前面多少天的数据,此值为负数
		int SYNC_DAYS=-30;
		SyncOrderScheduleTask task=new SyncOrderScheduleTask();
		task.syncOrder(SYNC_DAYS);
	}

}
