package com.zzy.htms.autotest;

public class TestThread extends Thread  {
	public static int threadCount =0;
	
	public int currentTotal = 200;
	public int currentCount = 0;
	public long currentTime=0;
	public int failCount=0;
	public int succCount=0;

	public static int runingCount=0;
	
	public static int totalCount=0;
	public static int totalFailCount=0;
	public static int totalSuccCount=0;
	public static long totalTime=0;
	public void run() {
		AutoTestBussiness bussiness=null;
		threadCount++;
		runingCount++;
		currentTime=System.currentTimeMillis();
		currentCount=threadCount;
		System.out.println("线程:"+currentCount+",开始");
		totalCount=totalCount+currentTotal;
		
		for(int i =0 ;i<currentTotal;i++){
			bussiness=new  AutoTestBussiness();
			if(bussiness.createShipApply()){
				succCount++;
			}else{
				failCount++;
			}
		}
		
		totalFailCount=totalFailCount+failCount;
		totalSuccCount=totalSuccCount+succCount;
		currentTime=System.currentTimeMillis()-currentTime;
		totalTime=totalTime+currentTime;
		System.out.println("线程:"+currentCount+",结束,用时："+currentTime+"  执行结果    failCount:"+failCount+",succCount:"+succCount);
		runingCount--;
		if(runingCount==0){
			System.out.println("共执行线程:"+TestThread.threadCount+" ,共执行实例："+TestThread.totalCount+" ,共用时："+TestThread.totalTime+"  执行总结果    failCount:"+TestThread.totalFailCount+",succCount:"+TestThread.totalSuccCount);
		}
	}
}
