package com.zzy.htms.owncar;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;

/**
 * 自备车自提车辆管理实现类
 * @author zzy
 *
 */
public class OwnCarBusiness extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			 this.setCache("ISSUCCESS", "true", "request");
		}else{
			this.setCache("ERROR_MESSAGE", "增加自备车管理费失败", "request");
			HtmsLogger.log("OWNCAR002", "增加自备车管理费失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
		}else{
			HtmsLogger.log("OWNCAR012", "删除自备车管理费失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
		}else{
			HtmsLogger.log("OWNCAR022", "查看自备车管理费列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
		}else{
			HtmsLogger.log("OWNCAR032", "查看自备车管理费失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		}else{
			HtmsLogger.log("OWNCAR042", "修改自备车管理费失败", "0", this.getRequest());
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
}
