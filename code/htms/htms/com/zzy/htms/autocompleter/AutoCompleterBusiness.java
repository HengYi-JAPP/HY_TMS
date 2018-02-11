package com.zzy.htms.autocompleter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.zzy.htms.sales.customer.CustomerBean;
import com.zzy.htms.utils.JsonUtils;

/**
 * autocomplete demo业务类  
 * @author zzy
 *
 */
public class AutoCompleterBusiness extends AbstractV2BusinessExecutor{
	public void toAdd() {
		super.list();
		this.selectCust();
	}
	
	/**
	 * ajax 请求，将message信息返回到页面使用的方法
	 * @param message
	 * @param response
	 */
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
	 * autocomplete组件  加载客户数据
	 * @return
	 */
	public String selectCust() {
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List selcustomer =(List) resultBean.getListResult("SELECTcustomer");
		//System.out.print("==========="+selcustomer);
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
					outMsg += customerBean.getCustomerId();
					outMsg += "\",";
		 			
		 			outMsg += "\"label\":\"";
		 			outMsg +=JsonUtils.jsonStrFilter(customerBean.getCustomerName());
		 			outMsg += "\"}";
		 			first=false;
		 		}
		 	outMsg += "]";
		 	this.out(outMsg, this.getResponse());
		 	//System.out.print("==========="+outMsg);
		return null;
	}
}
