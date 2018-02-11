package com.zzy.htms.schedule;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.zzy.htms.sap.rfc.SyncLogger;


/**
 * 调度任务实现类
 * @author zzy
 *
 */
public class ScheduleListener implements ServletContextListener {
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}
	
	private static SchedulePoll schedulePoll = null;
	private static  SchedulePoll getSchedulePollInstance() {  
        if (schedulePoll == null) {    
        	schedulePoll = new SchedulePoll();
        }    
       return schedulePoll;  
   }
	
	private static  Timer timer = null;
	private static  Timer getTimerInstance() {  
        if (timer == null) {    
        	timer = new Timer(true);
        }    
       return timer;  
   }

	private long LISTEN_TIME = tools.tool.toLong(tools.tool.getProperty("SCHEDULE_TASK_LISTEN_TIME"));
	private long DEF_LISTEN_TIME=2*60*1000;
	public void contextInitialized(ServletContextEvent event) {
		// 在这里初始化监听器，在tomcat启动的时候监听器启动，可以在这里实现定时器功能
		timer = getTimerInstance();
		
		// 添加日志，可在tomcat日志中查看到
		event.getServletContext().log("Timer start");
		SyncLogger.log("ScheduleListener:contextInitialized  ","Timer start");
		LISTEN_TIME =LISTEN_TIME>0?LISTEN_TIME:DEF_LISTEN_TIME;
		// 调用LogTimerTask，0表示任务无延迟，5*1000表示每隔5秒执行任务，60*60*1000表示一个小时，24*60*60*1000表示一天。
		timer.schedule(getSchedulePollInstance(), 0,LISTEN_TIME); // 每2分钟(2*60*1000)执行一次LogTimerTask类
		SyncLogger.log("ScheduleListener:contextInitialized  ","Task Schedule TimerTask");
	
		//添加SAP接口服务端的启动
		//SapServerService.startServer();
		//System.out.println("Task SapServerService start");
		
	}

}
