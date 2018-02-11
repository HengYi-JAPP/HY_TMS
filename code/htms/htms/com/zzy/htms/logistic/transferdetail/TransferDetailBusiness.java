package com.zzy.htms.logistic.transferdetail;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.zzy.htms.log.HtmsLogger;

/**
 * 调拨单详情业务实现类
 * @author zzy
 *
 */
public class TransferDetailBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1949, MethodName:默认新增, MethodCode:add
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFERDETAIL001", "增加调拨单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFERDETAIL002", "增加调拨单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFERDETAIL011", "删除调拨单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFERDETAIL012", "删除调拨单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String list(){
		String forward=super.list();
		LoadTransferDetailList();
		
		if(this.isSuccess()){
			//HtmsLogger.log("TRANSFERDETAIL021","查看调拨单明细列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFERDETAIL022", "查看调拨单明细列表失败", "0", this.getRequest());
		}
		
		return forward;
	}
	
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFERDETAIL031", "查看调拨单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFERDETAIL032", "查看调拨单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFERDETAIL041", "修改调拨单明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFERDETAIL042", "修改调拨单明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String LoadTransferDetailList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		 if(list==null){
			 return null;
		 }
		//log.info("list====================="+list);
		  List<TransferDetailBean> transferLists = null;
		  List<TransferDetailBean> transferOrderLists = null;
		  
		  List<TransferDetailBean> transferCustomerLists = new ArrayList<TransferDetailBean>();

		 Map<String, List<TransferDetailBean>> transferOrderMap=new HashMap<String, List<TransferDetailBean>>();
		 Map<String, List<TransferDetailBean>> transferCustomerMap=new HashMap<String, List<TransferDetailBean>>();
		 Map<String, String> ordersMap=new HashMap<String, String>();
		 TransferDetailBean transferDetailBean=null;
		 String orderCode = null;
		 String mapCustomerId = null;
		 for(int i=0,size=list.size();i<size;i++){
			 transferDetailBean=(TransferDetailBean)list.get(i);
			 
			 orderCode=transferDetailBean.getCorderCode();
			 mapCustomerId=transferDetailBean.getCustomerName();
			 
			 //log.info("mapId==============="+mapId);
			
			
			 transferOrderLists=transferCustomerMap.get(mapCustomerId);
			 if(transferOrderLists==null){
				 transferOrderLists = new ArrayList<TransferDetailBean>();
				 transferCustomerMap.put(mapCustomerId, transferOrderLists);
				 
				 transferCustomerLists.add(transferDetailBean);
			 }
			 if(ordersMap.get(orderCode)==null){
				 transferOrderLists.add(transferDetailBean);
				 ordersMap.put(orderCode, orderCode);
			 }
			
			 transferLists=transferOrderMap.get(orderCode);
			 if(transferLists==null){
				 transferLists = new ArrayList<TransferDetailBean>();
				 transferOrderMap.put(orderCode,transferLists);
			 }
			 transferLists.add(transferDetailBean);

			
			//log.info("transferBean==============="+transferBean);
			 //log.info("transferCustomerListstransferCustomerLists====="+transferCustomerLists);
		 }
		
		 this.setCache("transferOrderMap", transferOrderMap, "request");
		 this.setCache("transferCustomerLists", transferCustomerLists, "request");
		 this.setCache("transferCustomerMap", transferCustomerMap, "request");
		 return null;
	}
	
	//DefautMethod,MethodId:1954, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1952, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1953, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1951, MethodName:默认删除, MethodCode:delete
	//Self Define Method End.
}

