package com.zzy.htms.schedule;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.TimerTask;

import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.database.DBTool;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.sap.rfc.SyncLogger;
import com.zzy.privilege.task.ScheduleTaskBean;


/**
 * 调度任务资源池管理类
 * @author zzy
 *
 */
public class SchedulePoll  extends TimerTask{  

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	@Override
	public void run() {

		
		this.polling();

		
	}
	public void polling(){
		SyncLogger.log("SchedulePoll: polling  ","---------------- 调度任务执行开始  -----------------");
		if(this.getInstance()==null||this.getInstance().isEmpty()){
			this.load();
		}
		if(this.getInstance()==null||this.getInstance().isEmpty()){
			return;
		}
		ScheduleTaskBean taskBean = null;
		for(int i=0,size=this.getInstance().size();i<size;i++){
			taskBean=getInstance().get(i);
			this.doTask(taskBean);
		}
		SyncLogger.log("SchedulePoll: polling  ","----------------调度任务执行结束  -----------------");
	}
	public  void doTask(ScheduleTaskBean taskBean){
		long currentTime = System.currentTimeMillis();
		String taskName = taskBean.getTaskName();
		if(taskBean.isUse()==false){
			SyncLogger.log("SchedulePoll: doTask  ","["+taskName+"]任务暂未启用");
			return;
		}
		String taskClass = taskBean.getTaskClass();
		if(taskClass==null||"".equals(taskClass.trim())){
			SyncLogger.log("SchedulePoll: doTask  ","["+taskName+"]任务没有指定服务对象的类");
			return;
		}
		if(taskBean.getValidateTimeStart()==-1){
			SyncLogger.log("SchedulePoll: doTask  ","["+taskName+"]任务开始时间无效");
			return;
		}
		if(currentTime<taskBean.getValidateTimeStart()){
			SyncLogger.log("SchedulePoll: doTask  ","["+taskName+"]任务暂未开始");
			return;
		}
		if(taskBean.getValidateTimeEnd()>-1&&currentTime>taskBean.getValidateTimeEnd()){
			SyncLogger.log("SchedulePoll: doTask  ","["+taskName+"]任务已过有效期。");
			return;
		}
		if(taskBean==null||taskBean.getTaskType()==null||taskBean.getTaskType()==""){
			SyncLogger.log("SchedulePoll: doTask  ","["+taskName+"]任务类型为空，不能继续执行任务。");
			return;
		}
		if(taskBean.getTaskType().equals("1")){
			doIntervalSchedule(taskBean, currentTime);
		}else	if(taskBean.getTaskType().equals("2")){
			doCycleSchedule(taskBean, currentTime);
		}
	}

	
	private void doCycleSchedule(ScheduleTaskBean taskBean,long currentTime){
		String taskName = taskBean.getTaskName();
		String taskClass = taskBean.getTaskClass();
		long lastScheduleTime = taskBean.getLastScheduleTime();
		//获取上次执行的时间
		long scheduleTime = taskBean.getScheduleCycle();
		//时间间隔为天
		long scheduleIntervalTime = taskBean.getCycleInterval();
		
		//SyncLogger.log("SchedulePoll: doTask  ",new Date(lastScheduleTime));
		
		SyncLogger.log("SchedulePoll: doCycleSchedule  ","【定时】调度任务判断条件开始 ["+taskName+"]任务判断参数：lastScheduleTime:"+new Date(lastScheduleTime)+"   currentTime:"+new Date(currentTime));
		
		if(currentTime > lastScheduleTime && currentTime <lastScheduleTime + scheduleIntervalTime){
			taskBean.setLastScheduleTime(scheduleTime+scheduleIntervalTime);
			Object obj = tools.tool.createInstance(taskClass);
			if(obj==null||(obj instanceof ScheduleTaskApi)==false){
				SyncLogger.log("SchedulePoll: doCycleSchedule  ","["+taskName+"]任务指定的任务对象类不正确或不是ScheduleTaskApi子类，无法构建任务对象类。");
				return;
			}
			SyncLogger.log("SchedulePoll: doCycleSchedule  ","================["+taskName+"] 开始执行【定时】调度任务  =================");
			ScheduleTaskApi scheduleTask = (ScheduleTaskApi) obj;
			scheduleTask.doTask();
			SyncLogger.log("SchedulePoll: doCycleSchedule  ","----------------["+taskName+"] 调度任务【定时】执行结束  -----------------");
			return;
		}			
		if(lastScheduleTime==0){
			taskBean.setLastScheduleTime(scheduleTime+scheduleIntervalTime);
		}
		SyncLogger.log("SchedulePoll: doCycleSchedule  ","【定时】调度任务 ["+taskName+"]任务未到调用周期。");
	}
	
	private void doIntervalSchedule(ScheduleTaskBean taskBean,long currentTime){
		String taskName = taskBean.getTaskName();
		String taskClass = taskBean.getTaskClass();
		long lastScheduleTime = taskBean.getLastScheduleTime();
		long scheduleIntervalTime = taskBean.getScheduleInterval();
		if(lastScheduleTime>0&&currentTime<lastScheduleTime+scheduleIntervalTime){
			SyncLogger.log("SchedulePoll: doIntervalSchedule  ","【间隔】调度任务 ["+taskName+"]任务未到调用周期。");
			return;
		}
		if(lastScheduleTime==0){
			taskBean.setLastScheduleTime(currentTime);
			return ;
		}
		taskBean.setLastScheduleTime(currentTime);
		Object obj = tools.tool.createInstance(taskClass);
		if(obj==null||(obj instanceof ScheduleTaskApi)==false){
			SyncLogger.log("SchedulePoll: doIntervalSchedule  ","["+taskName+"]任务指定的任务对象类不正确或不是ScheduleTaskApi子类，无法构建任务对象类。");
			return;
		}
		SyncLogger.log("SchedulePoll: doIntervalSchedule  ","================["+taskName+"] 开始执行【间隔】调度任务  =================");
		ScheduleTaskApi scheduleTask = (ScheduleTaskApi) obj;
		scheduleTask.doTask();
		SyncLogger.log("SchedulePoll: doIntervalSchedule  ","----------------["+taskName+"] 调度任务【间隔】执行结束  -----------------");
	}
	
	
	private static List<ScheduleTaskBean> taskList = null;
	 public static  List<ScheduleTaskBean> getInstance() {  
         if (taskList == null) {    
        	 taskList = new ArrayList<ScheduleTaskBean>();
         }    
        return taskList;  
    }
	
	private boolean isLoading = false;
	
	public static void reload(){
		getInstance().clear();
	}
	
	public  void load(){
		try{
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllScheduleTask");
			DBTool dbTool = new DBTool();
			ResultBean resultBean =dbTool.execute(operationBean, new HashMap(), false);
			List list =resultBean.getListResult("loadAllScheduleTask");
			if(list==null){
				SyncLogger.log("SchedulePoll: load  ","================ 暂时没有调度任务  =================");
			}else{	
				SyncLogger.log("SchedulePoll: load  ","================ 获取所有调度任务  ================= 任务条数： " + list.size());
				ScheduleTaskBean taskBean = null;
				isLoading=true;
				getInstance().clear();
				//taskList=null;
				//taskList = new ArrayList<ScheduleTaskBean>();
				for(int i =0,size=list.size();i<size;i++){
					taskBean = (ScheduleTaskBean)list.get(i);
					getInstance().add(taskBean);
				}
				isLoading = false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
