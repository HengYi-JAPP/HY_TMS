package com.zzy.htms.logistic.transportdetail;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;

/**
 * 运单详情业务实现类
 * @author zzy
 *
 */
public class TransportDetailBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSPORTDETAIL001", "增加运单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPORTDETAIL002", "增加运单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSPORTDETAIL011", "删除运单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPORTDETAIL012", "删除运单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSPORTDETAIL021", "查看运单明细列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPORTDETAIL022", "查看运单明细列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSPORTDETAIL031", "查看运单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPORTDETAIL032", "查看运单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSPORTDETAIL041", "修改运单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPORTDETAIL042", "修改运单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1900, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1899, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1898, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1897, MethodName:默认删除, MethodCode:delete
	//DefautMethod,MethodId:1895, MethodName:默认新增, MethodCode:add
	//Self Define Method End.
}

