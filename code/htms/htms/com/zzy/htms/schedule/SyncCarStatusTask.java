package com.zzy.htms.schedule;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.zzy.htms.sap.rfc.ChangeCarStatusSynker;

/**
 * 同步订单状态的类
 * @author zzy
 *
 */
public class SyncCarStatusTask extends AbstractBusinessExecutor implements ScheduleTaskApi  {

	public void doTask() {	
		//设置同步前面多少天的数据,此值为负数
		ChangeCarStatusSynker synker= new ChangeCarStatusSynker();
		synker.sync();
	}
	
	

}
