package com.zzy.privilege.task;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

import com.mobilecn.beans.AbstractBean;
import com.zzy.htms.sap.rfc.SyncLogger;

/**
 * 调度任务实体类
 * @author zzy
 *
 */
public class ScheduleTaskBean extends AbstractBean  implements Serializable {
	private String taskId       ;
	private String taskName     ;
	private String taskDesc     ;
	private String taskInterval ;
	private String taskTimeUnit ;
	private String taskClass    ;
	private String isUse        ;
	private String startDatetime;
	private String ednDateTime  ;
	private String isValidate   ;
	private long validateTimeStart=-1;
	private long validateTimeEnd=-1;
	private long lastScheduleTime=0;
	private long scheduleInterval =-1;
	
	private long scheduleCycle =-1;
	
	//1代表间隔执行，2代表按照taskTimeUnit在某个特定的时间执行
	private String taskType;
	
	//存放taskType配置为2时候的配置
	private String taskValue;
	
	public boolean isUse(){
		
		return this.isUse!=null&&("true".equalsIgnoreCase(this.isUse.trim())||"1".equalsIgnoreCase(this.isUse.trim())); 
	}
	
	/*public long pasreDateToLong(String dattime,String format){
		if(dattime==null||dattime.length()<8){
			return -1;
		}
		format =format==null||"".equals(format.trim())?"yyyyMMddhhmm":format;
		if(dattime.length()<format.length()){
			for(int i=0,size = format.length()-dattime.length();i<size;i++){
				dattime=dattime+"0";
			}
		}
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		long millionSeconds;
		try {
			millionSeconds = sdf.parse(dattime).getTime();
			return millionSeconds;
		} catch (ParseException e) {
			e.printStackTrace();
			return -1;
		}//毫秒
		
	}*/

	public long getValidateTimeStart() {
		if(validateTimeStart>0){
			return this.validateTimeStart;
		}
		this.validateTimeStart=tools.tool.pasreDateTimeToLong(this.getStartDatetime(),null);
		return validateTimeStart;
	}


	public void setValidateTimeStart(long validateTimeStart) {
		this.validateTimeStart = validateTimeStart;
	}


	public long getValidateTimeEnd() {
		if(validateTimeEnd>0){
			return this.validateTimeEnd;
		}
		this.validateTimeEnd=tools.tool.pasreDateTimeToLong(this.getEdnDateTime(),null);
		return validateTimeEnd;
	}


	public void setValidateTimeEnd(long validateTimeEnd) {
		this.validateTimeEnd = validateTimeEnd;
	}

	public long getScheduleCycle() {
		
		if(this.scheduleCycle>0){
			return this.scheduleCycle;
		}
		
		String unit =this.getTaskTimeUnit();
		String value = this.getTaskValue();
		
		return getLastScheduleTime(value,unit);
	}
	
	private void test(){
		
		this.setTaskTimeUnit("5");
		this.setTaskValue("09:26:23");
		
		long l=getScheduleCycle();
		
		System.out.println(new Date(l));
		
	}
	
	public  long  getCycleInterval(){
		String unit =this.getTaskTimeUnit();
		long intervalTime=0;
		/*分钟*/
		if("3".equals(unit)){
			intervalTime=60000;
		}
		/*小时*/
		if("4".equals(unit)){
			intervalTime=3600000;
		}
		/*天*/
		if("5".equals(unit)){
			intervalTime=86400000;
		}
		return intervalTime;
	}
	
	private long  getLastScheduleTime(String value,String unit){
		
		
		String[] time=value.split(":");
		
		Date d=new Date();
		
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(d);
	    
	   
	    String  year = cal.get(Calendar.YEAR)+"";//获取年份
	    String  month=(cal.get(Calendar.MONTH)+1)+"";//获取月份
	    String  day=cal.get(Calendar.DATE)+"";//获取日
	    String  hour=cal.get(Calendar.HOUR_OF_DAY)+"";//小时
	    String  minute=cal.get(Calendar.MINUTE)+"";//分           
	    String  second=cal.get(Calendar.SECOND)+"";//秒
	    
	    String strDate= year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second ;
		
	    //System.out.println("当前字符串转换时间：   "+strDate);
	    
        if(time.length==1){
			second=time[0];
		}
		if(time.length==2){
			minute=time[0];
			second=time[1];
		}
		if(time.length==3){
			hour=time[0];
			minute=time[1];
			second=time[2];
		}
	    long intervalTime=0;
		/*分钟*/
		if("3".equals(unit)){
			intervalTime=60000;
		}
		/*小时*/
		if("4".equals(unit)){
			intervalTime=3600000;
		}
		/*天*/
		if("5".equals(unit)){
			intervalTime=86400000;
		}
		
		
		Date date=getStrDate( year , month , day ,hour , minute ,second);
		
    	long l= getLastExecuteTime(date.getTime(),d.getTime() ,intervalTime);
		
    	SyncLogger.log("ScheduleTaskBean->getLastScheduleTime  ","上次执行任务时间："+new Date(l));
		
		return l;
	}
	
	private long getLastExecuteTime(long date,long currentTime,long intervalTime){
		if(date<currentTime){
			return date;
		}else{
		  date= date-intervalTime;
		  if(date<currentTime){
			  return date;
		  }else{
			  return date-intervalTime;
		  }
		}
	}
	
	private Date getStrDate(String year,String month,String day ,String hour, String minute,String second){
		String strDate= year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second ;
		//System.out.println("转换后的时间：   "+strDate);
		try {
			return StringUtils.isBlank(strDate) ? null : new SimpleDateFormat(defaultDatePattern).parse(strDate);
		} catch (ParseException e) {
		    //System.out.println("--日期格式转换错误--");
			e.printStackTrace();
		}
		return null;
	}
	
	private static String defaultDatePattern = "yyyy-MM-dd HH:mm:ss";  
	

	public long getScheduleInterval() {
		if(this.scheduleInterval>0){
			return this.scheduleInterval;
		}
		
		String unit =this.getTaskTimeUnit();
		String time = this.getTaskInterval();
		int intervalTime = tools.tool.toInt(time);
		if(intervalTime<0){
			return -1;
		}
		/*毫秒*/
		if("1".equals(unit)){
			this.scheduleInterval=intervalTime;
		}
		/*秒钟*/
		if("2".equals(unit)){
			this.scheduleInterval=intervalTime*1000;
		}
		/*分钟*/
		if("3".equals(unit)){
			this.scheduleInterval=intervalTime*60000;
		}
		/*小时*/
		if("4".equals(unit)){
			this.scheduleInterval=intervalTime*3600000;
		}
		/*天*/
		if("5".equals(unit)){
			this.scheduleInterval=intervalTime*86400000;
		}
		/*
		周、星期
		每周第几天？
		第几周第几天？
		if("6".equals(unit)){
			this.scheduleInterval=intervalTime*7*86400000;
		}
		,每月第几天？
		第几月第几天？
		if("7".equals(unit)){
			this.scheduleInterval=intervalTime;
		}
		每季度第几月第几天？
		第几季度第几月第几天？
		if("8".equals(unit)){
			this.scheduleInterval=intervalTime;
		}
		每年第几月第天？
		每年度第几季度第几月第几天？
		if("9".equals(unit)){
			this.scheduleInterval=intervalTime;
		}*/
		return scheduleInterval;
	}


	public void setScheduleInterval(long scheduleInterval) {
		this.scheduleInterval = scheduleInterval;
	}


	public String getTaskId() {
		return taskId;
	}


	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}


	public String getTaskName() {
		return taskName;
	}


	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}


	public String getTaskDesc() {
		return taskDesc;
	}


	public void setTaskDesc(String taskDesc) {
		this.taskDesc = taskDesc;
	}


	public String getTaskInterval() {
		return taskInterval;
	}


	public void setTaskInterval(String taskInterval) {
		this.taskInterval = taskInterval;
	}


	public String getTaskTimeUnit() {
		return taskTimeUnit;
	}


	public void setTaskTimeUnit(String taskTimeUnit) {
		this.taskTimeUnit = taskTimeUnit;
	}


	public String getTaskClass() {
		return taskClass;
	}


	public void setTaskClass(String taskClass) {
		this.taskClass = taskClass;
	}


	public String getIsUse() {
		return isUse;
	}


	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}


	public String getStartDatetime() {
		return startDatetime;
	}


	public void setStartDatetime(String startDatetime) {
		this.startDatetime = startDatetime;
	}


	public String getEdnDateTime() {
		return ednDateTime;
	}


	public void setEdnDateTime(String ednDateTime) {
		this.ednDateTime = ednDateTime;
	}


	public String getIsValidate() {
		return isValidate;
	}


	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}


	public long getLastScheduleTime() {
		return lastScheduleTime;
	}


	public void setLastScheduleTime(long lastScheduleTime) {
		this.lastScheduleTime = lastScheduleTime;
	}

	
	

	public String getTaskType() {
		return taskType;
	}

	public void setTaskType(String taskType) {
		this.taskType = taskType;
	}

	public String getTaskValue() {
		return taskValue;
	}

	public void setTaskValue(String taskValue) {
		this.taskValue = taskValue;
	}

	
	


	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//System.out.println((new ScheduleTaskBean()).toOperation("TB_HTMS_TASKSCHEDULE"));
		ScheduleTaskBean task = new ScheduleTaskBean();
		/*System.out.println(task.pasreDateToLong("2012 08 09 11:12:13",null));
		
		System.out.println(task.pasreDateToLong("2012/08/09".replaceAll("\\/", ""),null));
		System.out.println(task.pasreDateToLong("2012-08-09".replaceAll("-", ""),null));
		System.out.println(task.pasreDateToLong("2012 08 09 11:12:13",null));*/
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmm");
		long millionSeconds;
		try {
			//Date date = new Date("20120809");
			
			//millionSeconds = sdf.parse("20120809").getTime();
			//System.out.println(date.getTime());
			millionSeconds = sdf.parse("2012-08-09 03:00:00").getTime();
			System.out.println(millionSeconds);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//毫秒
*/		
	
		for(int i=0;i<10;i++){
			task.test();
		}
		
	}
	
	

}
