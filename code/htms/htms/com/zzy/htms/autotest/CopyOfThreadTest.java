package com.zzy.htms.autotest;

public class CopyOfThreadTest implements Runnable {
	
	public static void main(String[] args) {
		CopyOfThreadTest test1=new CopyOfThreadTest();
		test1.run();
		CopyOfThreadTest test2=new CopyOfThreadTest();
		test2.run();
		CopyOfThreadTest test3=new CopyOfThreadTest();
		test3.run();
	}

	public void run() {
		AutoTestBussiness bussiness=new  AutoTestBussiness();
		for(int i =0 ;i<500;i++){
			bussiness.createShipApply();
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
		
		System.out.println("  result    failureRows:"+bussiness.failureRows+"       successRows:"+bussiness.successRows);
	}
}