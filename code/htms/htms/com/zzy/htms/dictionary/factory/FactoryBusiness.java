package com.zzy.htms.dictionary.factory;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;
/**
 * 厂区业务类
 * @author zzy
 *
 */
public class FactoryBusiness  extends AbstractV2BusinessExecutor {
	
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//FactoryRepository.reload();
			//HtmsLogger.log("FACTORY001", "增加厂区成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("FACTORY002", "增加厂区失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
		//	FactoryRepository.reload();
		//	HtmsLogger.log("FACTORY011", "删除厂区成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("FACTORY012", "删除厂区失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
			//HtmsLogger.log("FACTORY021", "查看厂区列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("FACTORY022", "查看厂区列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("FACTORY031", "查看厂区成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("FACTORY032", "查看厂区失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	FactoryRepository.reload();
			//HtmsLogger.log("FACTORY041", "修改厂区成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("FACTORY042", "修改厂区失败", "0", this.getRequest());
		}
		return forward;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1847, MethodName:默认新增, MethodCode:add
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1849, MethodName:默认删除, MethodCode:delete
	//DefautMethod,MethodId:1850, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1851, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1852, MethodName:默认查询, MethodCode:list
	//Self Define Method End.
}

