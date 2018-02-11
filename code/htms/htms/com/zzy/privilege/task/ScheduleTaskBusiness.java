package com.zzy.privilege.task;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.zzy.htms.schedule.SchedulePoll;
import com.zzy.htms.schedule.ScheduleTaskApi;


/**
 * 调度任务业务实现类
 * @author zzy
 *
 */
public class ScheduleTaskBusiness  extends AbstractBusinessExecutor {
	public String reloadTask(){
		SchedulePoll.reload();
		return null;
	}

	
	/**
	 * 执行调度任务封装
	 */
	public void afterDoScheduleTask(){
		ResultBean resultBean=this.getResultBean();
		//TransferBean transferBean=(TransferBean) this.getParameter("tranferViewBean");
		//ScheduleTaskBean taskBean = (ScheduleTaskBean)resultBean.getListResult("view");
		
		//ScheduleTaskBean taskBean = (ScheduleTaskBean)resultBean.getListResult("view");
		
		//resultBean.getListFirstResult("sqlName");
		//resultBean.getListResult("sqlName")
		//resultBean.getSingleValue(sqlname, "")
		ScheduleTaskBean taskBean= (ScheduleTaskBean) resultBean.getListFirstResult("view");
		if(taskBean!=null){
			String taskClass = taskBean.getTaskClass();
			String taskName = taskBean.getTaskName();
			Object obj = tools.tool.createInstance(taskClass);
			if(obj==null||(obj instanceof ScheduleTaskApi)==false){
				System.out.println("["+taskName+"]任务指定的任务对象类不正确或不是ScheduleTaskApi子类，无法构建任务对象类。");
			}
			ScheduleTaskApi scheduleTask = (ScheduleTaskApi) obj;
			scheduleTask.doTask();
			this.setCache("INVOKE_MESSAGE", "执行调度任务成功", "request");
		}else{
			this.setCache("INVOKE_MESSAGE", "执行调度任务失败!", "request");
		}
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
