package com.zzy.htms.logistic.logistics;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;

/**
 * 物流公司业务实现类
 * @author zzy
 *
 */
public class LogisticsBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
		//	HtmsLogger.log("LOGISTICS001", "增加物流公司成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("LOGISTICS002", "增加物流公司失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
		//	HtmsLogger.log("LOGISTICS011", "删除物流公司成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("LOGISTICS012", "删除物流公司失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
		//	HtmsLogger.log("LOGISTICS021", "查看物流公司列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("LOGISTICS022", "查看物流公司列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
		//	HtmsLogger.log("LOGISTICS031", "查看物流公司成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("LOGISTICS032", "查看物流公司失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	HtmsLogger.log("LOGISTICS041", "修改物流公司成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("LOGISTICS042", "修改物流公司失败", "0", this.getRequest());
		}
		return forward;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1961, MethodName:默认新增, MethodCode:add
	//DefautMethod,MethodId:1966, MethodName:默认查询, MethodCode:list
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1964, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1963, MethodName:默认删除, MethodCode:delete
	//DefautMethod,MethodId:1965, MethodName:默认修改, MethodCode:view
	//Self Define Method End.
}

