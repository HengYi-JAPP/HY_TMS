package com.zzy.htms.webservice.market.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.dictionary.factory.FactoryRepository;
import com.zzy.htms.dictionary.product.ProductRepository;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;

/**
 * 排货之后的查询接口
 * 
 * @author zzy
 * 
 */
public class HtmsTransferQueryBussiness  extends AbstractBusinessExecutor{

	public static void main(String[] args) {
		JSONObject jsonObject = new JSONObject();   
        jsonObject.put("code","test");   
        jsonObject.put("account", "test");   
        jsonObject.put("passwd", "test");   
        jsonObject.put("orderNo", "0010000521");   
        jsonObject.put("userId", "1");
        String s =  jsonObject.toString();
        
        
        HtmsTransferQueryBussiness  bussiness= new HtmsTransferQueryBussiness();
        System.out.println(s);
		String result  = bussiness.queryShipInfo(s);
		System.out.println(result);
	}
	
	/**
	 * 查询排货之后的发货申请信息,调拨单信息
	 */
	public String queryShipInfo(String shipInfo) {
		try{
			WebServiceResultBean serviceBean = new WebServiceResultBean();
			log.info(""+shipInfo);
			JSONObject jsonObj= JSONObject.fromObject(shipInfo);
			String code   = jsonObj.getString("code");
			String account= jsonObj.getString("account");
			String passwd = jsonObj.getString("passwd");
			String orderNo = jsonObj.getString("orderNo");
			String userId = jsonObj.getString("userId");
				
			
			WebServiceResultBean  checkUserResultBean = WebServiceUtils.accountCheck(code, account, passwd);
			if(checkUserResultBean!=null&&!checkUserResultBean.isResult()){
				return checkUserResultBean.getString();
			}
			
			if(orderNo==null||orderNo==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("shipId为空");
				return checkUserResultBean.getString();
			}
			if(userId==null||userId==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("userId为空");
				return checkUserResultBean.getString();
			}
			
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("marketGetShipInfoByOrderNo");
			Map parameters = new HashMap();
			parameters.put("orderNo", orderNo);
			ResultBean resultBean = this.dbOperator(operationBean, parameters,false);
			if (resultBean == null || !resultBean.isSuccess()) {
				serviceBean.setResult(false);
				serviceBean.setMsg("操作失败:获取发货信息为空");
				return serviceBean.getString();
			}
			List<ShipBean> shipBeanList = new ArrayList<ShipBean>();
			shipBeanList = resultBean.getListResult("shipViewBean");
			List<ShipDetailBean> shipDetailBeanList = new ArrayList<ShipDetailBean>();
			shipDetailBeanList = resultBean.getListResult("shipDetailViewBean");

			if (shipBeanList == null || shipBeanList.isEmpty()) {
				JSONObject jsonObject = new JSONObject();   
				jsonObject.put("result","true");   
		        jsonObject.put("message","操作成功:获取发货主表信息为空");  
				jsonObject.put("shipBean", new JSONArray());  
				jsonObject.put("shipDetailBean", new JSONArray());   
				return jsonObject.toString();
			}
			if (shipDetailBeanList == null || shipDetailBeanList.isEmpty()) {
				JSONObject jsonObject = new JSONObject();   
				jsonObject.put("result","true");   
		        jsonObject.put("message","操作成功:获取发货详细信息为空");  
				jsonObject.put("shipBean", new JSONArray());  
				jsonObject.put("shipDetailBean", new JSONArray());   
				return serviceBean.getString();
			}
			
			JSONObject jsonObject = new JSONObject();   
	        jsonObject.put("result","true");   
	        jsonObject.put("message","操作成功");  
			
	        
	        JSONArray  shipBeanArray=new JSONArray();
	        for(int i=0;i<shipBeanList.size();i++){
	        	ShipBean shipBean = shipBeanList.get(i);
	        	JSONObject  shipBeanObj=new JSONObject();
	        	
	        	shipBeanObj.put("applyId", shipBean.getShipId()+"");
	        	shipBeanObj.put("orderNo", shipBean.getCorderCode()+"");
	        	shipBeanObj.put("createTime", shipBean.getCreateTime());
	        	shipBeanObj.put("remark",shipBean.getShipNotice());
	        	shipBeanObj.put("applyTonNum",shipBean.getApplyTonNum());
	        	/*
	        	 *  <html:option label="待审批"      value="0"     selected="$[applyStatusSH]"  />
				      <html:option label="待物流分配"   value="1"     selected="$[applyStatusSH]" />
				      <html:option label="待排车"      value="2"     selected="$[applyStatusSH]"  />
				      <html:option label="已排车"      value="3"     selected="$[applyStatusSH]"  />
				      <html:option label="未通过"      value="901"   selected="$[applyStatusSH]"  />
				      <html:option label="已撤消"      value="902"   selected="$[applyStatusSH]"  />
				      <html:option label="物流拒绝"    value="903"   selected="$[applyStatusSH]"  />
	        	 */
	        	if(shipBean.getApplyStatus()>-1){
	        		shipBeanObj.put("status",shipBean.getApplyStatus()+"");
	        		String statusDesc="";
	        		if(shipBean.getApplyStatus()==0){
	        			statusDesc="待审批";
	        		}
					if(shipBean.getApplyStatus()==1){
						statusDesc="待物流分配";        			
					}
					if(shipBean.getApplyStatus()==2){
						statusDesc="待排车";    
					}
					if(shipBean.getApplyStatus()==3){
						statusDesc="已排车";    
					}
					if(shipBean.getApplyStatus()==901){
						statusDesc="未通过";  
					}
					if(shipBean.getApplyStatus()==902){
						statusDesc="已撤消";  
					}
					if(shipBean.getApplyStatus()==903){
						statusDesc="物流拒绝";  
					}
		        	shipBeanObj.put("statusDesc",statusDesc);
	        	}
	        	
				if(shipBean.getApplyPackNum()!=null&&shipBean.getApplyPackNum()!=""){
					shipBeanObj.put("applyPackNum",shipBean.getApplyPackNum());
				}
	        	shipBeanArray.add(shipBeanObj);
	        }
	        jsonObject.put("shipBean", shipBeanArray);           
	        
	        
	        JSONArray  shipBeanDetailArray=new JSONArray();
	        for(int i=0;i<shipDetailBeanList.size();i++){
	        	ShipDetailBean shipDetailBean = shipDetailBeanList.get(i);
	        	JSONObject  shipDetailBeanObj=new JSONObject();
	        	shipDetailBeanObj.put("applyId", shipDetailBean.getShipId()+"");
	        	shipDetailBeanObj.put("applyDetailId", shipDetailBean.getShipDetailId()+"");
	        	shipDetailBeanObj.put("applyTonNum", shipDetailBean.getApplyTonNum()+"");
				if(shipDetailBean.getApplyPackNum()!=null&&shipDetailBean.getApplyPackNum()!=""){
					shipDetailBeanObj.put("applyPackNum", shipDetailBean.getApplyPackNum()+"");
				}
				shipDetailBeanObj.put("createTime", shipDetailBean.getCreateTime()+"");
				shipDetailBeanObj.put("factoryName",FactoryRepository.getFactoryName(shipDetailBean.getFactoryId()));
				shipDetailBeanObj.put("productName",ProductRepository.getProductName(shipDetailBean.getProductId()+""));
				shipDetailBeanObj.put("materialCode",shipDetailBean.getMeterialNo());//存放物料号
				shipDetailBeanObj.put("remark",shipDetailBean.getShipDetailNotice());
	        	
	        	shipBeanDetailArray.add(shipDetailBeanObj);
	        }
	        jsonObject.put("shipDetailBean", shipBeanDetailArray);    
	        
			return jsonObject.toString();
		}catch(Exception e){
			e.printStackTrace();
		}
		JSONObject jsonResult = new JSONObject();  
		jsonResult.put("result",false);
		jsonResult.put("message","操作失败:发生未知异常");
		return jsonResult.toString();
	}
}