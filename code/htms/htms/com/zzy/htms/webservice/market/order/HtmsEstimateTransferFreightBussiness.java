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
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;
import com.zzy.htms.services.business.EstimateFreightBean;
import com.zzy.htms.services.business.FreightBean;
import com.zzy.htms.services.business.HtmsEstimateFreightBusiness;


/**
 * 获取预估运费
 * @author zzy
 *
 */
public class HtmsEstimateTransferFreightBussiness  extends AbstractBusinessExecutor{

	public static void main(String[] args) {
		JSONObject jsonObject = new JSONObject();   
        jsonObject.put("code","test");   
        jsonObject.put("account", "test");   
        jsonObject.put("passwd", "test");   
        jsonObject.put("shipId", "");
        jsonObject.put("userId", "1");   
        jsonObject.put("shipDetailId", new String[]{"72150"});
        jsonObject.put("applyTonNum", new String[]{"100.000"});
       
        HtmsEstimateTransferFreightBussiness  bussiness= new HtmsEstimateTransferFreightBussiness();
        String s =  jsonObject.toString();

		String result  = bussiness.getEstimateTransferFreight(s);
//		String result  = bussiness.rejectArrangeGoods(s);
		
	    System.out.println(result);
	}
	/*
	 * 获取预估运费
	 */
	public String getEstimateTransferFreight(String shipInfo){
		try{
			
			log.info(""+shipInfo);
			JSONObject jsonObj= JSONObject.fromObject(shipInfo);
			String code   =jsonObj.getString("code");
			String account=jsonObj.getString("account");
			String passwd=jsonObj.getString("passwd");
			String shipId=jsonObj.getString("shipId");
			String userId=jsonObj.getString("userId");
			
			JSONArray  jsonArray1=jsonObj.getJSONArray("shipDetailId");
			JSONArray  jsonArray2=jsonObj.getJSONArray("applyTonNum");
			
			Object[] obj1 =(Object[]) jsonArray1.toArray();
			Object[] obj2 =(Object[]) jsonArray2.toArray();
			
			String[] shipDetailId=new String[obj1.length];
			String[] applyTonNum=new String[obj2.length];;
			int k=0,j=0;
			for(Object o:obj1){
				shipDetailId[k]=o.toString();
				k++;
			}
	        for(Object o:obj2){
	        	applyTonNum[j]=o.toString();
				j++;
			}
			
			WebServiceResultBean  checkUserResultBean = WebServiceUtils.accountCheck(code, account, passwd);
			if(checkUserResultBean!=null&&!checkUserResultBean.isResult()){
				log.info(checkUserResultBean.getString());
				return checkUserResultBean.getString();
			}
			String approveNotice= "同意";
			
			if(shipId==null||shipId==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("shipId为空");
				return checkUserResultBean.getString(",\"freight\":[]");
			}
			if(userId==null||userId==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("userId为空");
				return checkUserResultBean.getString(",\"freight\":[]");
			}
			if(shipDetailId==null||shipDetailId.length==0){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("shipDetailId为空");
				return checkUserResultBean.getString(",\"freight\":[]");
			}
			if(applyTonNum==null||applyTonNum.length==0){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("applyTonNum为空");
				return checkUserResultBean.getString(",\"freight\":[]");
			}
			if(shipDetailId.length!=applyTonNum.length){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("shipDetailId与applyTonNum的长度不匹配");
				return checkUserResultBean.getString(",\"freight\":[]");
			}
			
			HtmsEstimateFreightBusiness freight=new HtmsEstimateFreightBusiness();
			List<EstimateFreightBean> estimateParamsList=new ArrayList<EstimateFreightBean>();
			
			
			WebServiceResultBean serviceBean = new WebServiceResultBean();
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("marketGetShipInfoById");
			Map parameters =  new HashMap();
			parameters.put("shipId", shipId);
			ResultBean resultBean = this.dbOperator(operationBean, parameters, false);
			if(resultBean==null||!resultBean.isSuccess()){
				serviceBean.setResult(false);
				serviceBean.setMsg("操作失败:获取发货信息为空");
				return checkUserResultBean.getString(",\"freight\":[]");
			}
			List<ShipBean>  shipBeanList = new ArrayList<ShipBean>();
			shipBeanList =resultBean.getListResult("shipViewBean");
			List<ShipDetailBean>  shipDetailBeanList = new ArrayList<ShipDetailBean>();
			shipDetailBeanList =resultBean.getListResult("shipDetailViewBean");
			
			if(shipBeanList==null||shipBeanList.isEmpty()){
				JSONObject jsonResult = new JSONObject();  
				jsonResult.put("result",false);
				jsonResult.put("message","操作失败:获取发货主表信息为空");
				jsonResult.put("freight",new JSONArray());
				return jsonResult.toString();
			}
			if(shipDetailBeanList==null||shipDetailBeanList.isEmpty()){
				JSONObject jsonResult = new JSONObject();  
				jsonResult.put("result",false);
				jsonResult.put("message","操作失败:获取发货详细信息为空");
				jsonResult.put("freight",new JSONArray());
				return jsonResult.toString();
			}
			
			ShipBean shipBean =  shipBeanList.get(0);
			
			String  selfFetchStatus="false";
			String 	selfFetchType = "0" ;
			if("1".equals(shipBean.getSelfFetch())||"9".equals(shipBean.getSelfFetch())){
				 selfFetchStatus="true";
				 selfFetchType = "1" ;
			}
	        if("2".equals(shipBean.getSelfFetch())||"10".equals(shipBean.getSelfFetch())){
	        	 selfFetchStatus="true";
	        	 selfFetchType = "2" ;
			}
			
			if(applyTonNum!=null){
				ShipDetailBean  shipDetailBean = shipDetailBeanList.get(0);
				int i=0;
				for(String   detailId :shipDetailId){
					EstimateFreightBean freightBean=new EstimateFreightBean();
					//freightBean.setTranferId(transferId);
					
					freightBean.setProductId(shipDetailBean.getProductId()+"");
					freightBean.setFactoryId(shipDetailBean.getFactoryId()+"");
					freightBean.setItemId(detailId);
					
					freightBean.setApplyTonNum(applyTonNum[i]);
					//freightBean.setOrderId();
					freightBean.setOrderCode(shipDetailBean.getCorderCode());
					freightBean.setAreaId(shipBean.getAreaId());
					
					//freightBean.setAreaCode();
					freightBean.setCustomerId(shipBean.getCustomerId()+"");					
					freightBean.setApplyTime(shipBean.getCreateTime());					
					freightBean.setUserId(userId);
					freightBean.setShipId(shipId);
					freightBean.setEstimateStep("2");
					
					if("true".equals(selfFetchStatus)){
						freightBean.setSelfFetch(true);
						freightBean.setSelfFetchType(selfFetchType);
						freightBean.setCustomerCode(shipBean.getCustomerCode());
					}
					i++;
					estimateParamsList.add(freightBean);
				}
			}
			
			List<FreightBean> freightList=freight.getEstimateFreight(estimateParamsList);
			
			if(freightList==null||freightList.isEmpty()){
				JSONObject jsonResult = new JSONObject();  
				jsonResult.put("result",false);
				jsonResult.put("message","操作失败:获取运费结果为空");
				jsonResult.put("freight",new JSONArray());
				return jsonResult.toString();
			}
			
			JSONObject jsonObject = new JSONObject();    
	        jsonObject.put("result", "true");   
	        jsonObject.put("message", "获取运费成功");
			
	        JSONArray array=new  JSONArray();
	        int i=0 ;
	        for(FreightBean freightBean:freightList){
	        	JSONObject jsonObject1 = new JSONObject();  
	            jsonObject1.put("freightTime", freightBean.getFreightTime());
	            jsonObject1.put("freightType",freightBean.getFreightType());
	            jsonObject1.put("freightStyle",freightBean.getFreightStyle());  //  6 按重量
	            jsonObject1.put("freightModel",freightBean.getFreightModel());   //一口价  单价
	            jsonObject1.put("applyId",shipId);
	            jsonObject1.put("applyDetailId",freightBean.getItemId());
	            jsonObject1.put("applyTonNum",freightBean.getApplyTonNum());
	            jsonObject1.put("areaId",freightBean.getAreaId());
	            jsonObject1.put("customerId",freightBean.getCustomerId());
	            jsonObject1.put("freightAmount", freightBean.getFreightAmount());
	    	    jsonObject1.put("totalFreight", freightBean.getTotalFreight());
	            array.add(i, jsonObject1);
	    	    i++;
	        }
	        jsonObject.put("freight", array);
			return jsonObject.toString();
		}catch(Exception e){
			e.printStackTrace();
		}
		JSONObject jsonResult = new JSONObject();  
		jsonResult.put("result",false);
		jsonResult.put("message","操作失败:发生未知异常");
		jsonResult.put("freight",new JSONArray());
		return jsonResult.toString();
	}
	
}
