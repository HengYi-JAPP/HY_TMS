package com.zzy.htms.combox;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.zzy.htms.sales.customer.CustomerBean;
import com.zzy.htms.utils.JsonUtils;

public class ComBoxBusiness extends AbstractV2BusinessExecutor {
	public void toAdd() {
		super.list();
		this.comBoxCust();
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
	
	public String comBoxCust() {
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List selcustomer =(List) resultBean.getListResult("ComBoxcustomer");
		//System.out.print("==========="+selcustomer);
		 if(selcustomer==null){
			 return null;
		 }
		 CustomerBean customerBean=null;
		 String outMsg = "[";
		 outMsg += "{";
		 outMsg += "\"id\":";
		 outMsg += "1";
		 outMsg += ",";
		 outMsg += "\"text\":";
		 outMsg += "\"All\"";
		 outMsg += ",";
		 outMsg += "\"children\":";
		 outMsg += "[";
		 boolean first=true;
		 		for(int i = 0;i < selcustomer.size();i++){
		 			if(!first){
		 				outMsg += ",";
			 		}
		 			customerBean = (CustomerBean)selcustomer.get(i);
		 			//System.out.print("===========>"+customerBean.getCustomerName());
		 			outMsg += "{\"id\":\"";
					outMsg += customerBean.getCustomerId()+1;
					outMsg += "\",";
		 			
		 			outMsg += "\"text\":\"";
		 			outMsg += JsonUtils.jsonStrFilter(customerBean.getCustomerName());
		 			outMsg += "\"}";
		 			first=false;
		 		}
		 	outMsg += "]";
		 	outMsg += "}";
		 	outMsg += "]";
		 	this.out(outMsg, this.getResponse());
		 	//System.out.print("==========="+outMsg);
		return null;
	}
}
