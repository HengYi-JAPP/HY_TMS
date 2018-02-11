package com.zzy.htms.logistic.vehicle;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;

/**
 * 车辆业务实现类
 * @author zzy
 *
 */
public class VehicleBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("VEHICLE001", "增加车辆成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("VEHICLE002", "增加车辆失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("VEHICLE011", "删除车辆成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("VEHICLE012", "删除车辆失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
			//HtmsLogger.log("VEHICLE021", "查看车辆列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("VEHICLE022", "查看车辆列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("VEHICLE031", "查看车辆成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("VEHICLE032", "查看车辆失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("VEHICLE041", "修改车辆成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("VEHICLE042", "修改车辆失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1925, MethodName:默认新增, MethodCode:add
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1930, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1928, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1929, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1927, MethodName:默认删除, MethodCode:delete
	//Self Define Method End.
}

