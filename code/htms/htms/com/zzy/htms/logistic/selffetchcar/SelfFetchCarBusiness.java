package com.zzy.htms.logistic.selffetchcar;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.zzy.htms.log.HtmsLogger;
import com.zzy.htms.sales.customer.CustomerBean;
import com.zzy.htms.utils.JsonUtils;

/**
 * 自备车自提业务实现类
 * @author zzy
 *
 */
public class SelfFetchCarBusiness  extends AbstractV2BusinessExecutor {
	
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
		//	HtmsLogger.log("DRIVER001", "增加自备车自提车辆成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("DRIVER002", "增加自备车自提车辆失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
		//	HtmsLogger.log("DRIVER011", "删除自备车自提车辆成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("DRIVER012", "删除自备车自提车辆失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
		//	HtmsLogger.log("DRIVER021", "查看自备车自提车辆列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("DRIVER022", "查看自备车自提车辆列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
		//	HtmsLogger.log("DRIVER031", "查看自备车自提车辆成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("DRIVER032", "查看自备车自提车辆失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	HtmsLogger.log("DRIVER041", "修改自备车自提车辆成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("DRIVER042", "修改自备车自提车辆失败", "0", this.getRequest());
		}
		return forward;
	}
	
	
	public void toAdd() {
		super.list();
		this.selectCust();
	}
	
	private void out(String message, HttpServletResponse response) {
		if (message==null||"".equals(message.trim())) {
			return;
		}
		PrintWriter out = null;
		try {
			
			response.setContentType("application/x-www-form-urlencoded; charset=utf-8");
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			out.write(message);
			out.flush();
			out.close();
			
			out = null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
	}
	
	
	/**
	 * 自备车自提,加载客户数据的处理类
	 * @return
	 */
	public String selectCust() {
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List selcustomer =(List) resultBean.getListResult("selectCustomer");
		 if(selcustomer==null){
			 return null;
		 }
		 CustomerBean customerBean=null;
		 String outMsg = "[";
		 boolean first=true;
		 		for(int i = 0;i < selcustomer.size();i++){
		 			if(!first){
		 				outMsg += ",";
			 		}
		 			customerBean = (CustomerBean)selcustomer.get(i);
		 			//System.out.print("===========>"+customerBean.getCustomerName());
		 			outMsg += "{\"hex\":\"";
					outMsg += customerBean.getCustomerCode();
					outMsg += "\",";
		 			
		 			outMsg += "\"label\":\"";
		 			//System.out.println("===========  filter "+ customerBean.getCustomerName());
		 			//System.out.println("===========  filter "+JsonUtils.jsonStrFilter(customerBean.getCustomerName()));
		 			outMsg += JsonUtils.jsonStrFilter(customerBean.getCustomerName());
		 			outMsg += "\"}";
		 			first=false;
		 		}
		 	outMsg += "]";
		 	this.out(outMsg, this.getResponse());
		 	//System.out.print("==========="+outMsg);
		 	
		return null;
	}
	
	
}

