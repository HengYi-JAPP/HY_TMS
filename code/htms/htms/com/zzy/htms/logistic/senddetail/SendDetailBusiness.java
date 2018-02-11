package com.zzy.htms.logistic.senddetail;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;

/**
 * 派车表详细信息业务类
 * @author zzy
 *
 */
public class SendDetailBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
		//	HtmsLogger.log("SENDDETAIL001", "增加派车明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SENDDETAIL002", "增加派车明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
		//	HtmsLogger.log("SENDDETAIL011", "删除派车明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SENDDETAIL012", "删除派车明细失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String list(){
		String forward=super.list();
		if(this.isSuccess()){
		//	HtmsLogger.log("SENDDETAIL021","查看派车明细列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SENDDETAIL022", "查看派车明细列表失败", "0", this.getRequest());
		}
		
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
		//	HtmsLogger.log("SENDDETAIL031", "查看派车明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SENDDETAIL032", "查看派车明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	HtmsLogger.log("SENDDETAIL041", "修改派车明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SENDDETAIL042", "修改派车明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1885, MethodName:默认删除, MethodCode:delete
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1888, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1886, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1887, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1883, MethodName:默认新增, MethodCode:add
	//Self Define Method End.
}

