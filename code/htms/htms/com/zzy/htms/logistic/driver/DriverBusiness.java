package com.zzy.htms.logistic.driver;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;

/**
 * 司机业务实现类
 * @author zzy
 *
 */
public class DriverBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
		//	HtmsLogger.log("DRIVER001", "增加司机成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("DRIVER002", "增加司机失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
		//	HtmsLogger.log("DRIVER011", "删除司机成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("DRIVER012", "删除司机失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
		//	HtmsLogger.log("DRIVER021", "查看司机列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("DRIVER022", "查看司机列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
		//	HtmsLogger.log("DRIVER031", "查看司机成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("DRIVER032", "查看司机失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	HtmsLogger.log("DRIVER041", "修改司机成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("DRIVER042", "修改司机失败", "0", this.getRequest());
		}
		return forward;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1931, MethodName:默认新增, MethodCode:add
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1936, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1934, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1935, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1933, MethodName:默认删除, MethodCode:delete
	//Self Define Method End.
}

