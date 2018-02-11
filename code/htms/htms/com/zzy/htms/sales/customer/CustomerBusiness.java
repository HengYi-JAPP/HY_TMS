package com.zzy.htms.sales.customer;
import java.util.List;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.zzy.htms.log.HtmsLogger;

/**
 * 客户业务实现类
 * @author zzy
 *
 */
public class CustomerBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMER001", "增加客户成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMER002", "增加客户失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMER011", "删除客户成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMER012", "删除客户失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		replaceCustomerCode();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMER021", "查看客户列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMER022", "查看客户列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMER031", "查看客户成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMER032", "查看客户失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMER041", "修改客户成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMER042", "修改客户失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String replaceCustomerCode(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		if(list==null){
			 return null;
		 }
		String customerCode = null;
		CustomerBean customerBean = null;
		for(int i=0;i<list.size();i++){
			customerBean = (CustomerBean) list.get(i);
			customerCode=customerBean.getCustomerCode().replaceFirst("^0*", "");
			customerBean.setReplaceCustomerCode(customerCode);
		}
		return null;
	}
	
	public String getSelectCustomer(){
		super.list();
		return this.selectAjaxCustomer();
	}
	
	public String selectAjaxCustomer() {
		String msgResult = "{\"isSuccess\":";	
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List selcustomer =(List) resultBean.getListResult("SELECTcustomer");
		//System.out.print("==========="+selcustomer);
		String outMsg="";
		if(selcustomer==null){
			 outMsg = "";
		 }
		 CustomerBean customerBean=null;
		//  outMsg = "[";
		 boolean first=true;
 		for(int i = 0;i < selcustomer.size();i++){
 			if(!first){
 				outMsg += ",";
	 		}
 			customerBean = (CustomerBean)selcustomer.get(i);
 			//System.out.print("===========>"+customerBean.getCustomerName());
 			outMsg += "{'hex':'";
			outMsg += customerBean.getCustomerId();
			outMsg += "',";
 			
 			outMsg += "'label':'";
 			outMsg += customerBean.getCustomerName();
 			outMsg += "'}";
 			first=false;
 		}
 	  //  outMsg += "]";
 	    
 	    
 	    
 	   if (outMsg!=null&&outMsg!="") {
 		    msgResult += 1;
 		    msgResult+=",\"msg\":\""+outMsg+"\"";
		}else{
			msgResult += 0;
			msgResult+=",\"msg\":\"未找到合适的运价，线路或运价不存在，或未指定运价;\\n\"";
		}
 	    msgResult += "}";
 	    
 	    this.out(outMsg, this.getResponse());
		
 	   //System.out.print("===========  "+outMsg);
		return outMsg;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1882, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1881, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1880, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1879, MethodName:默认删除, MethodCode:delete
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1877, MethodName:默认新增, MethodCode:add
	//Self Define Method End.
}

