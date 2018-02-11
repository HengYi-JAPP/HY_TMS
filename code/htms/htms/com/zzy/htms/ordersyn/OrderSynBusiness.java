package com.zzy.htms.ordersyn;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;
import com.zzy.htms.sap.rfc.OrderSynker;
import com.zzy.htms.user.HtmsUserBean;

import consts.SysConsts;


/**
 * 订单同步实现类
 * @author zzy
 *
 */
public class OrderSynBusiness extends AbstractV2BusinessExecutor{
	
	
	/**
	 * 用销售组作为订单同步的依据做订单同步
	 * @return
	 */
	public String  toSyncSalesOrder(){
		return exeSyncOrder("2");
	}
	
	
	/**
	 * 用订单编号做获取数据的判断依据做订单同步操作
	 * @return
	 */
	public String  toSyncOrderUseOrderCode(){
		return exeSyncOrder("1");
	}
	
	/**
	 * 订单同步具体实现类
	 * @param type
	 * @return
	 */
	public String  exeSyncOrder(String type){
		String startDate = (String)this.getParameter("startDate");
		String endDate = (String)this.getParameter("endDate");
		//String salesNo = (String)this.getParameter("salesNo");
		
		HtmsUserBean userBean =(HtmsUserBean) this.getRequest().getSession().getAttribute(SysConsts.USER_BEAN);
		String userEmployNo= userBean.getSyncEmployNo();
		userEmployNo=userEmployNo==null?"":userEmployNo;
		if(userEmployNo.indexOf(",")!=-1){
			userEmployNo=userEmployNo.replaceAll(",", "-");
		}
		
		String userSalesNo =(String)this.getRequest().getSession().getAttribute("user_sales_no");
		
		userSalesNo= userSalesNo==null?"":userSalesNo.trim();
		if(userSalesNo==null||"".equals(userSalesNo.trim())){
			return "listAction";
		}
		if(userSalesNo.indexOf(",")!=-1){
			userSalesNo=userSalesNo.replaceAll(",", "-");
		}
		//String salesNos[]=userSalesNo.split(",");
	
		if(startDate==null||"".equals(startDate.trim())){			
			HtmsLogger.log("ORDER_SYNC_001", "同步开始日期为空", "0", this.getRequest());
			return "listAction";
		}
		/*if(salesNos==null||salesNos.length==0){			
			HtmsLogger.log("ORDER_SYNC_002", "同步销售组号为空", "0", this.getRequest());
			return "listAction";
		}*/
		this.setCache("startTime", tools.tool.getDateTime(), "request");
		long useTime = System.currentTimeMillis();
		OrderSynker synker= null;
		boolean result =true,tempResult;
		
		try{
			//for(int i=0;i<salesNos.length;i++){
				synker= new OrderSynker();
				//tempResult =synker.sync(salesNos[i], startDate, endDate);
				tempResult =synker.sync(userSalesNo,userEmployNo, startDate, endDate,type);
			//	result=tempResult?result:tempResult;
			//}
		}catch (Exception e) {
			log.info("MobileOrderSynkerException "+e);
		}
			
			
			
		useTime=System.currentTimeMillis()-useTime;
		
		//this.setCache("salesNo", salesNo, "request");
		this.setCache("useTime", useTime, "request");
		this.setCache("endTime", tools.tool.getDateTime(), "request");
		HtmsLogger.log("ORDER_SYNC_003", "同步销售组订单结束", result?"1":"0", this.getRequest());
		
		return super.add();
	}
	
	
/*	public String loadsynList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("userList");
		 if(list==null){
			 return null;
		 }
		 OrderSynBean orderSynBean=null;
		 log.info("list====="+list);
		 for(int i=0;i<list.size();i++){
			 orderSynBean=(OrderSynBean)list.get(i);
			String saleNo = orderSynBean.getSalesNo();
			String[] syn=saleNo.split(",");
			for(int j=0;j<syn.length;j++){
				System.out.print("000000000000000000"+syn[j]);
			}
		 }
		 return null;
	}*/
}
