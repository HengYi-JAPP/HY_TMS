package com.zzy.htms.vstore;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.location.Config;
import com.zzy.htms.location.User;
import com.zzy.htms.location.WeChatLocationBussiness;
import com.zzy.htms.logistic.send.SendBean;
import com.zzy.htms.logistic.transfer.TransferBean;
import com.zzy.htms.logistic.transport.TransportBean;
import com.zzy.htms.logistic.transportdetail.TransportDetailBean;


/**
 * 待配送订单,签收功能实现类
 * @author zzy
 *
 */
public class DeliveryBusiness extends AbstractV2BusinessExecutor{
	public String list(){
		String forward=super.list();
		waitForSend();
		loadUserAndWXConfig();
		imgList();
		appendTransportDetailInfor();
		return forward;
	}
	
	public String appendTransportDetailInfor(){
		ResultBean resultBean=this.getResultBean();
		
		List<SendBean> sendList=resultBean.getListResult("ListWaitForSend");
		if(sendList==null||sendList.isEmpty()){
			return "";
		}
		String transportIds="";
		for(SendBean sendBean:sendList ){
			transportIds+=sendBean.getTransportId()+",";
		}
		if(transportIds.length()>0){
			transportIds=transportIds.substring(0,transportIds.length()-1);
		}
		//System.out.println(transportIds);
		Map parameters = new HashMap();
		parameters.put("transportIds", transportIds);
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("getTransportDetailsWaitForSend");
		ResultBean detailResultBean = this.dbOperator(operationBean, parameters, false);
		List<TransportDetailBean> transportDetailList = new ArrayList<TransportDetailBean>();
		transportDetailList =detailResultBean.getListResult("transportDetailList");
		
		if(transportDetailList==null||transportDetailList.isEmpty()){
			return "";
		}
		List<TransportDetailBean> list = new ArrayList<TransportDetailBean>();
		Map<String ,List<TransportDetailBean>>  transportDetailMap=new HashMap<String,List<TransportDetailBean>>();
		for(TransportDetailBean transportDetail:transportDetailList ){
			list=transportDetailMap.get(transportDetail.getTransportId()+"");
			if(list==null||list.isEmpty()){
				list = new ArrayList<TransportDetailBean>();
				transportDetailMap.put(transportDetail.getTransportId()+"", list);
			}
			list.add(transportDetail);
		}
		this.setCache("transportDetailMap",transportDetailMap,"request");
		
		return "";
	}
	
	public String waitForSend() {		
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List<SendBean> sendList =(List) resultBean.getListResult("ListWaitForSend");
		 if(sendList==null){
			 return null;
		 }
		 SendBean sendBean=null;
		 AreaRepository rep = new AreaRepository();
		 
		 for(int i=0;i<sendList.size();i++){
			 sendBean=(SendBean)sendList.get(i);
			 sendBean.setAreaName(rep.getFullAreaName(sendBean.getAreaId(), "", true));
		 }
		 this.setCache("sendList",sendList,"sendList");
		return null;
		
	}
	
	/**
	 * 加载微信对应的用户信息和微信配置信息
	 */
	private void loadUserAndWXConfig(){
		User user=(User)  this.getRequest().getSession().getAttribute("wxuser");
    	this.setCache("user",user,"request");
    	    	
  	    Config c=new Config();
  	    c.setInterval(Integer.valueOf(WeChatLocationBussiness.CONFIG_INTERVAL));
  	    c.setDebug(WeChatLocationBussiness.CONFIG_DEBUG);
  	    this.setCache("config", c,"request");		
	}
	
	
	//处理图片显示
	public String imgList() {		
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List<SignBean> signBeanList =(List) resultBean.getListResult("imgList");
		//System.out.println("signBeanList======1"+signBeanList);
		 if(signBeanList == null ){
			 return null;
		 }
		 if(signBeanList.isEmpty()){
			 return null;
		 }
		 
		SignBean signBean = null;
		String picList = "";
		
		signBean = (SignBean) signBeanList.get(0);
		picList = signBean.getPicList();
		
		String[] picImgList = picList.split("&");
		signBean.setPicListArray(picImgList);
		this.setCache("signBean", signBean, "signBean");
		
		return null;
		
	}
	
	
	public String sign(){
		super.add();
		
		String outMsg = "{\"isSuccess\":";
		if (this.isSuccess()) {
			outMsg += 1;
		}else{
			outMsg += 0;
		}
		outMsg += "}";
		
		this.out(outMsg, this.getResponse());
		
		return "NULL";
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
	
}
