package com.zzy.htms.logistic.carrier;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;

/**
 * 贸易商业务实现类
 * @author zzy
 *
 */
public class CarrierBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("CARRIER001", "增加承运商成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CARRIER002", "增加承运商失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("CARRIER011", "删除承运商成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CARRIER012", "删除承运商失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
			//HtmsLogger.log("CARRIER021", "查看承运商列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CARRIER022", "查看承运商列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("CARRIER031", "查看承运商成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CARRIER032", "查看承运商失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	HtmsLogger.log("CARRIER041", "修改承运商成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CARRIER042", "修改承运商失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1937, MethodName:默认新增, MethodCode:add
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1942, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1940, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1941, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1939, MethodName:默认删除, MethodCode:delete
	//Self Define Method End.
}

