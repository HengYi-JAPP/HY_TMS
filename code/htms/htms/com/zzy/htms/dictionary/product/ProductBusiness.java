package com.zzy.htms.dictionary.product;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;
/**
 * 产品业务类
 * @author zzy
 *
 */
public class ProductBusiness  extends AbstractV2BusinessExecutor {
	
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		
		if (this.isSuccess()) {
			//ProductRepository.reload();
			//HtmsLogger.log("PRODUCT001", "增加产品成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("PRODUCT002", "增加产品失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		
		if (this.isSuccess()) {
			//ProductRepository.reload();
			//HtmsLogger.log("PRODUCT011", "删除产品成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("PRODUCT012", "删除产品失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
			//HtmsLogger.log("PRODUCT021", "查看产品列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("PRODUCT022", "查看产品列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("PRODUCT031", "查看产品成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("PRODUCT032", "查看产品失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//ProductRepository.reload();
			//HtmsLogger.log("PRODUCT041", "修改产品成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("PRODUCT042", "修改产品失败", "0", this.getRequest());
		}
		return forward;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1845, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1844, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1843, MethodName:默认删除, MethodCode:delete
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1841, MethodName:默认新增, MethodCode:add
	//DefautMethod,MethodId:1846, MethodName:默认查询, MethodCode:list
	//Self Define Method End.
}

