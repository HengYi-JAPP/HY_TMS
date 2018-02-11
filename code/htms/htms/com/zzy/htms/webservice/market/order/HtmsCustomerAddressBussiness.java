package com.zzy.htms.webservice.market.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.dictionary.route.RouteRepository;
import com.zzy.htms.sales.customeraddr.CustomerAddrBean;
import com.zzy.htms.sap.rfc.SyncLogger;
import com.zzy.htms.services.business.FreightBean;


/**
 * 闭环接口,获取客户地址信息
 * @author zzy
 *
 */
public class HtmsCustomerAddressBussiness extends AbstractBusinessExecutor{

	public static void main(String[] args) {
		JSONObject jsonObject = new JSONObject();   
        jsonObject.put("code","test");   
        jsonObject.put("account", "test");   
        jsonObject.put("passwd", "test");   
        jsonObject.put("customerSapNo", "0000300029111");   
        jsonObject.put("userId", "1");
        
        
        System.out.println(jsonObject.toString());
		
		HtmsCustomerAddressBussiness bussiness= new HtmsCustomerAddressBussiness();
		String s= bussiness.getCustomerAddress(jsonObject.toString());
		System.out.println(s);
	}
	/**
	 * 获取客户地址接口
	 * @return
	 */
	public String getCustomerAddress(String shipInfo){
		try{
			log.info(""+shipInfo);
			JSONObject jsonObj= JSONObject.fromObject(shipInfo);
			String code   =jsonObj.getString("code");
			String account=jsonObj.getString("account");
			String passwd=jsonObj.getString("passwd");
			String customerSapNo=jsonObj.getString("customerSapNo");
			String userId=jsonObj.getString("userId");
			
			WebServiceResultBean  checkUserResultBean = WebServiceUtils.accountCheck(code, account, passwd);
			if(checkUserResultBean!=null&&!checkUserResultBean.isResult()){
				return checkUserResultBean.getString();
			}
			
			if(customerSapNo==null||customerSapNo==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("customerSapNo为空");
				return checkUserResultBean.getString();
			}
			if(userId==null||userId==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("userId为空");
				return checkUserResultBean.getString();
			}
			
			JSONObject jsonObject = new JSONObject();      
			List<CustomerAddrBean>  customerAddrBeanList=getCustomerAddressBussinessByCustomerCode(customerSapNo);
			if(customerAddrBeanList==null||customerAddrBeanList.isEmpty()){
				 jsonObject.put("result", "true");   
			     jsonObject.put("message", "获取地址成功");
			     jsonObject.put("addressInfo",new JSONArray());
			     return jsonObject.toString();
			}
			
			AreaRepository areaRep = new AreaRepository();
	        jsonObject.put("result", "true");   
	        jsonObject.put("message", "获取地址成功");
	        JSONArray array=new  JSONArray();
	        int i=0;
	        for(CustomerAddrBean addressBean:customerAddrBeanList){
	        	JSONObject jsonObject1 = new JSONObject();  
	            jsonObject1.put("addressId", addressBean.getCaddrId());
	            jsonObject1.put("customerCode",customerSapNo);
	            jsonObject1.put("address",areaRep.getFullAreaName(addressBean.getAreaId()+"", "", true) + addressBean.getCaddrDetail());
	            jsonObject1.put("areaCode",addressBean.getAreaCode());
	            jsonObject1.put("contactor",addressBean.getCaddrContactor());
	            jsonObject1.put("telephone",addressBean.getCaddrTelephone());
	        	array.add(i, jsonObject1);
	        	i++;
	        }    	
	        jsonObject.put("addressInfo", array);
			return jsonObject.toString();
		}catch(Exception e){
			e.printStackTrace();
		}
		JSONObject jsonResult = new JSONObject();  
		jsonResult.put("result",false);
		jsonResult.put("message","操作失败:发生未知异常");
		return jsonResult.toString();
		
	}
	
	/**
	 * 通过地址id获取单个的地址数据
	 * @param caddrId
	 * @return
	 */
	private List<CustomerAddrBean> getCustomerAddressBussinessByAddrId(String caddrId){
		if(caddrId==null||caddrId==""){
			SyncLogger.log("getCustomerAddressBussinessByAddrId", " caddrid is null ");
			return null;
		}
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("marketGetCustomerAddrBeanById");
		Map parameters =  new HashMap();
		parameters.put("caddrId", caddrId);
		ResultBean resultBean = this.dbOperator(operationBean,parameters, false);
		if(resultBean==null|resultBean.isSuccess()==false){
			SyncLogger.log("getCustomerAddressBussinessByAddrId", "获取数据异常");
			return null;
		}
		List<CustomerAddrBean> customerAddrBean =(List<CustomerAddrBean>) resultBean.getListResult("customerAddrBean");
		return customerAddrBean;
	}
	
	
	/**
	 * 通过客户id获取当前客户的所有有效地址
	 * @param customerId
	 * @return
	 */
	private List<CustomerAddrBean> getCustomerAddressBussinessByCustomerId(String customerId){
        if(customerId==null||customerId==""){
        	SyncLogger.log("getCustomerAddressBussinessByCustomerId", " customerId is null ");
			return null;
		}
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("marketGetCustomerAddrBeanByCustomerId");
		Map parameters =  new HashMap();
		parameters.put("customerId", customerId);
		ResultBean resultBean = this.dbOperator(operationBean,parameters, false);
		if(resultBean==null|resultBean.isSuccess()==false){
			SyncLogger.log("getCustomerAddressBussinessByCustomerId", "获取数据异常");
			return null;
		}
		List<CustomerAddrBean> customerAddrBeanList =(List<CustomerAddrBean>)resultBean.getListResult("customerAddrBeanList");
		return customerAddrBeanList;
	}
	
	/**
	 * 通过客户id获取当前客户的所有有效地址
	 * @param customerId
	 * @return
	 */
	private List<CustomerAddrBean> getCustomerAddressBussinessByCustomerCode(String customerCode){
        if(customerCode==null||customerCode==""){
        	log.info("customerCode is null ");
			return null;
		}
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("marketGetCustomerAddrBeanByCustomerCode");
		Map parameters =  new HashMap();
		parameters.put("customerCode", customerCode);
		ResultBean resultBean = this.dbOperator(operationBean,parameters, false);
		if(resultBean==null||!resultBean.isSuccess()){
			log.info("获取数据异常");
			return null;
		}
		List<CustomerAddrBean> customerAddrBeanList =(List<CustomerAddrBean>)resultBean.getListResult("customerAddrBeanList");
		return customerAddrBeanList;
	}
	
}
