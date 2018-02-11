package com.zzy.htms.autotest;

import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;


/**
 * 多线程自动测试使用到的类
 * @author zzy
 *
 */
public class Tester {

	public void test(){
		int count=30;
		TestThread[] testers  = new TestThread[count];
		for(int i=0;i<count;i++){
			testers[i]=new TestThread();
			
		}
		for(int i=0;i<count;i++){
			testers[i].start();
		}
		
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//OperationConfigRepository repository = new OperationConfigRepository();
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("testCreateShipApply");
		if(operationBean==null){
			System.out.println("========================>>> createShipApply operationBean==null");
			return ;
		}
		Tester test = new Tester();
		test.test();

	}

}
