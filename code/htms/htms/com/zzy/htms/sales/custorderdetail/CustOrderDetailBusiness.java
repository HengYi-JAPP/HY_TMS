package com.zzy.htms.sales.custorderdetail;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;

/**
 * 订单详情业务实现类
 * @author zzy
 *
 */
public class CustOrderDetailBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERORDERDETAIL001", "增加订单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERORDERDETAIL002", "增加订单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERORDERDETAIL011", "删除订单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERORDERDETAIL012", "删除订单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERORDERDETAIL021", "查看订单明细列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERORDERDETAIL022", "查看订单明细列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERORDERDETAIL031", "查看订单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERORDERDETAIL032", "查看订单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERORDERDETAIL041", "修改订单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERORDERDETAIL042", "修改订单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1918, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1913, MethodName:默认新增, MethodCode:add
	//DefautMethod,MethodId:1915, MethodName:默认删除, MethodCode:delete
	//DefautMethod,MethodId:1916, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1917, MethodName:默认修改, MethodCode:view
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//Self Define Method End.
}

