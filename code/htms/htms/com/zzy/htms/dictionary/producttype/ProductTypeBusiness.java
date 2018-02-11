package com.zzy.htms.dictionary.producttype;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;

/**
 * 产品类型业务类
 * @author zzy
 *
 */
public class ProductTypeBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("PRODUCTTYPE001", "增加产品类型成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("PRODUCTTYPE002", "增加产品类型失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
		//	HtmsLogger.log("PRODUCTTYPE011", "删除产品类型成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("PRODUCTTYPE012", "删除产品类型失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
			//HtmsLogger.log("PRODUCTTYPE021", "查看产品类型列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("PRODUCTTYPE022", "查看产品类型列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
		//	HtmsLogger.log("PRODUCTTYPE031", "查看产品类型成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("PRODUCTTYPE032", "查看产品类型失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	HtmsLogger.log("PRODUCTTYPE041", "修改产品类型成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("PRODUCTTYPE042", "修改产品类型失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1835, MethodName:默认新增, MethodCode:add
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1840, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1838, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1839, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1837, MethodName:默认删除, MethodCode:delete
	//Self Define Method End.
}

