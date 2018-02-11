package com.zzy.htms.services.business;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.json.JSONArray;

import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.dictionary.factory.FactoryRepository;
import com.zzy.htms.dictionary.product.ProductRepository;
import com.zzy.htms.location.SendLocation;
import com.zzy.htms.logistic.send.SendBean;
import com.zzy.htms.logistic.transfer.TransferBean;
import com.zzy.htms.logistic.transferdetail.TransferDetailBean;
import com.zzy.htms.logistic.transport.TransportBean;
import com.zzy.htms.parklogistics.ParkLogisticsBean;
import com.zzy.htms.sales.customer.CustomerBean;
import com.zzy.htms.sales.customeraddr.CustomerAddrBean;
import com.zzy.htms.sales.custorder.CustOrderBean;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.webservice.market.order.WebServiceResultBean;
import com.zzy.htms.webservice.market.order.WebServiceUtils;


/**
 * 获取调拨单的车辆派送跟踪信息
 * @author zzy
 *
 */
public class HtmsTransferTraceBusiness  extends HtmsServiceBusiness {
	
	public static void main(String[] args) {
		JSONObject jsonObject = new JSONObject();   
        jsonObject.put("code","test");   
        jsonObject.put("account", "test");   
        jsonObject.put("passwd", "test");
        jsonObject.put("orderCode", "0010000545");
        jsonObject.put("sapCode", "");
       
        HtmsTransferTraceBusiness  bussiness= new HtmsTransferTraceBusiness();
        String s =  jsonObject.toString();
        System.out.println(s);
		String result  = bussiness.getTransferTraceInfor(s);
	    System.out.println(result);
	    
	    
	    
	    JSONArray array  = new JSONArray();
	    
		JSONObject jsonObject1 = new JSONObject();   
        jsonObject1.put("code","test");   
        jsonObject1.put("account", "test"); 
        array.put(jsonObject1);
        JSONObject jsonObject2 = new JSONObject();   
        jsonObject2.put("code","test");   
        jsonObject2.put("account", "test"); 
        array.put(jsonObject2);
	    
        jsonObject.put("transInfo", array.toString());
        
        System.out.println(jsonObject.toString());
        
	}	
	
	//String code ,String account,String password,String sapcode
	public String getTransferTraceInfor(String orderInfo){
		log.info("微商城接口调用开始，传入参数为："+orderInfo);
		try{
			JSONObject jsonObj= JSONObject.fromObject(orderInfo);
			String code   =jsonObj.getString("code");
			String account=jsonObj.getString("account");
			String passwd=jsonObj.getString("passwd");
			String orderCode=jsonObj.getString("orderCode");
			String sapCode=jsonObj.getString("sapCode");
			
			WebServiceResultBean  checkUserResultBean = WebServiceUtils.accountCheck(code, account, passwd);
			if(checkUserResultBean!=null&&!checkUserResultBean.isResult()){
				log.info(checkUserResultBean.getString());
				return checkUserResultBean.getString();
			}
			
			if(orderCode==null||orderCode==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("orderCode为空");
				log.info(checkUserResultBean.getString());
				return checkUserResultBean.getString();
			}
			
			Map parameters =  new HashMap();
			parameters.put("orderCode",orderCode);
			parameters.put("sapTransferCode",sapCode);
			
			OperationBean orderOperationBean = OperationConfigRepository.getOperationConfig("loadTransferTraceTransfer");
			ResultBean ordeResultBean = this.dbOperator(orderOperationBean, parameters, false);
			if(ordeResultBean==null|ordeResultBean.isSuccess()==false){
				JSONObject jsonResult = new JSONObject();  
				jsonResult.put("result",false);
				jsonResult.put("message","操作失败:查询订单和调拨单信息出错");
				log.info(jsonResult.toString());
				return jsonResult.toString();
			}
			
			CustOrderBean orderBean =(CustOrderBean) ordeResultBean.getListFirstResult("orderBean");
			List<TransferBean>   transferBeanList = ordeResultBean.getListResult("transferBean");
			
			if(transferBeanList==null||orderBean==null){
				JSONObject jsonResult = new JSONObject();  
				jsonResult.put("result",false);
				jsonResult.put("message","操作失败:查询不到订单或者调拨单数据");
				log.info(jsonResult.toString());
				return jsonResult.toString();
			}
			String transSapCode="";
			String transferId="";
			String shipId="";
			String customerId=orderBean.getCustomerId()+"";
			
			for(TransferBean transferBean:transferBeanList){
				transSapCode+="'"+transferBean.getSapTransCode()+"',";
				transferId+="'"+transferBean.getTransId()+"',";
				shipId+="'"+transferBean.getShipId()+"',";
				if(customerId==""&&transferBean.getCustomerId()>0){
					customerId=transferBean.getCustomerId()+"";
				}
			}
			if(transSapCode!=null&&transSapCode!=""){
				transSapCode=transSapCode.substring(0,transSapCode.length()-1);
			}
			if(transferId!=null&&transferId!=""){
				transferId=transferId.substring(0,transferId.length()-1);
			}
			if(shipId!=null&&shipId!=""){
				shipId=shipId.substring(0,shipId.length()-1);
			}
			
			parameters.put("refTransId", transferId);
			parameters.put("refShipId", shipId);
			parameters.put("sapTransferCodes", transSapCode);			
			parameters.put("refCustomerId", customerId);
			
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadTransferTraceInfo");
			ResultBean resultBean = this.dbOperator(operationBean, parameters, false);
			if(resultBean==null|resultBean.isSuccess()==false){
				JSONObject jsonResult = new JSONObject();  
				jsonResult.put("result",false);
				jsonResult.put("message","操作失败:查询排单派送信息出错");
				log.info(jsonResult.toString());
				return jsonResult.toString();
			}
			
			CustomerBean customerBean =(CustomerBean) resultBean.getListFirstResult("customerBean");
			
			List<TransferDetailBean>  tranferDetailBeanList= resultBean.getListResult("transDetailList");
			List<TransportBean>  transportBeanList= resultBean.getListResult("transportBean");
			List<ShipBean> shipBeanList= resultBean.getListResult("shipBean");
			List<SendBean> sendBeanList=resultBean.getListResult("sendBean");
			List<SendLocation> sendLocationList=resultBean.getListResult("sendLocationBean");
			List<ParkLogisticsBean> parkLogisticsBeanList=resultBean.getListResult("parkLogisticsBean");
			
			List<CustomerAddrBean>  customerAddrList  = resultBean.getListResult("customerAddrList");
			
			if(orderBean==null){
				JSONObject jsonResult = new JSONObject();  
				jsonResult.put("result",false);
				jsonResult.put("message","操作失败:查询不到订单数据");
				log.info(jsonResult.toString());
				return jsonResult.toString();
			}
			
			Map<String,TransportBean> tranportMap=new HashMap<String,TransportBean>();
			if(transportBeanList!=null&&transportBeanList.size()>0){
				for(TransportBean  transportBean:transportBeanList){
					tranportMap.put(transportBean.getTransId()+"", transportBean);
				}
			}
			
			Map<String,ShipBean> shipMap=new HashMap<String,ShipBean>();
			if(shipBeanList!=null&&shipBeanList.size()>0){
				for(ShipBean  shipBean:shipBeanList){
					shipMap.put(shipBean.getShipId()+"", shipBean);
				}
			}

			Map<String,SendBean> sendBeanMap=new HashMap<String,SendBean>();
			if(sendBeanList!=null&&sendBeanList.size()>0){
				for(SendBean  sendBean:sendBeanList){
					sendBeanMap.put(sendBean.getSendId()+"", sendBean);
				}
			}
			Map<String,SendLocation> sendLocationMap=new HashMap<String,SendLocation>();
			if(sendLocationList!=null&&sendLocationList.size()>0){
				for(SendLocation  sendLocation:sendLocationList){
					sendLocationMap.put(sendLocation.getTransId()+"", sendLocation);
				}
			}
			
			Map<String,ParkLogisticsBean> parkLogisticsMap=new HashMap<String,ParkLogisticsBean>();
			if(parkLogisticsBeanList!=null&&parkLogisticsBeanList.size()>0){
				for(ParkLogisticsBean  parkLogisticsBean:parkLogisticsBeanList){
					parkLogisticsMap.put(parkLogisticsBean.getSapCode()+"", parkLogisticsBean);
				}
			}
			
			Map<String,List<TransferDetailBean>>  transferDetailMap=new HashMap<String,List<TransferDetailBean>>();
			List<TransferDetailBean>  detailList=null;
			if(tranferDetailBeanList!=null&&tranferDetailBeanList.size()>0){
				for(TransferDetailBean  transDetailBean:tranferDetailBeanList){
					detailList=transferDetailMap.get(transDetailBean.getTransId()+"");
					if(detailList==null){
						detailList= new ArrayList<TransferDetailBean>();
					}
					detailList.add(transDetailBean);
					transferDetailMap.put(transDetailBean.getTransId()+"", detailList);
				}
			}
			
			Map<String,CustomerAddrBean>  customerAddrBeanMap=new HashMap<String,CustomerAddrBean>();
			if(customerAddrList!=null&&customerAddrList.size()>0){
				for(CustomerAddrBean  customerAddrBean:customerAddrList){
					customerAddrBeanMap.put(customerAddrBean.getCaddrId()+"", customerAddrBean);
				}
			}
			
			
			
			/*
			String customMsg=" 客户名称:"+customerBean.getCustomerName()+
	        "  工厂:"+FactoryRepository.getFactoryName(transDetailBean.getFactoryId()+"")+
	        "  产品:"+ProductRepository.getProductName(transDetailBean.getProductId()+"")+
	        "  配送量:"+applyTotalTonNum+
	        "  配送包数:"+applyTotalPackNum+
	        "  配送地址:"+addressInfo+customerAddrBean.getCaddrDetail();
			*/
			AreaRepository areaRep=new AreaRepository();
			JSONArray  array=new JSONArray();
			for(TransferBean transferBean:transferBeanList){
				JSONObject sendObj = new JSONObject();
			    ShipBean       shipBean      =  shipMap.get(transferBean.getShipId()+"");
			    TransportBean  transportBean =  tranportMap.get(transferBean.getTransId()+"");
			    
			    ParkLogisticsBean parkLogisticsBean=parkLogisticsMap.get(transferBean.getSapTransCode());
			    SendLocation sendLocationBean  =sendLocationMap.get(transferBean.getTransId()+"");
			    
			    sendObj.put("orderCode", orderBean.getCorderCode());      //订单编号
			    sendObj.put("sapCode", transferBean.getSapTransCode());   //交货单号（虚拟调拨单号）
				sendObj.put("approveTime", transferBean.getCreateTime()); //内勤审批时间
				sendObj.put("shipCreateTime", shipBean.getCreateTime());  //发货申请创建时间
				
				if(customerBean!=null){
					sendObj.put("customerCode",customerBean.getCustomerCode());//客户编码
					sendObj.put("customerName",customerBean.getCustomerName());//客户名称
				}
				detailList=transferDetailMap.get(transferBean.getTransId()+"");
				if(detailList!=null){
					TransferDetailBean transDetailBean=detailList.get(0);
					BigDecimal applyTotalTonNum=new BigDecimal(0);
			    	BigDecimal applyTotalPackNum=new BigDecimal(0);
			    	for(TransferDetailBean detailBean:detailList){
			    		String applyTonNum=detailBean.getApplyTonNum()==null||detailBean.getApplyTonNum()==""?"0":detailBean.getApplyTonNum();
			    		String applyPackNum=detailBean.getApplyPackNum()==null||detailBean.getApplyPackNum()==""?"0":detailBean.getApplyPackNum();
			    		applyTotalTonNum=applyTotalTonNum.add(new BigDecimal(applyTonNum));
			    		applyTotalPackNum=applyTotalPackNum.add(new BigDecimal(applyPackNum));
			    	}
					sendObj.put("factoryName",FactoryRepository.getFactoryName(transDetailBean.getFactoryId()+""));// 工厂名称
					sendObj.put("productName",ProductRepository.getProductName(transDetailBean.getProductId()+""));//产品名称
					sendObj.put("applyTotalTonNum",applyTotalTonNum);    //申请吨数
					sendObj.put("applyTotalPackNum",applyTotalPackNum);  //申请包数
					
					CustomerAddrBean  customerAddrBean = customerAddrBeanMap.get(shipBean.getCaddrId()+"");
					if(customerAddrBean!=null){
						String addressInfo = areaRep.getFullAreaName(customerAddrBean.getAreaId()+"", "", false);
						sendObj.put("address",addressInfo+customerAddrBean.getCaddrDetail());    //配送地址
					}
				}
				
				if(transportBean!=null){
					sendObj.put("tranferCreateTime", transportBean.getCreateTime());//.newLine();//物流分配时间
					SendBean  sendBean=sendBeanMap.get(transportBean.getTransportId()+"");
					if(sendBean!=null&&sendBean.getVehicleNo()!=null){
						sendObj.put("vehicleNo", sendBean.getVehicleNo());//.newLine();//运送车牌号
					}
					if(transportBean.getTransportStatus()>0){
						String transportDesc="";
						if("102".equals(transportBean.getTransportStatus()+"")){
							transportDesc="已签收";
						}else{
							transportDesc="未签收";
						}
						sendObj.put("transportStatus",transportBean.getTransportStatus()+"");//签收状态
						sendObj.put("transportStatusDesc",transportDesc);//签收状态
					}
				}
				
				if(parkLogisticsBean!=null&&parkLogisticsBean.getParkStatus()!=null){
					String s="";
					if("1".equals(parkLogisticsBean.getParkStatus())){
				       s="已到园区,未装运   到园区时间:"+parkLogisticsBean.getBindingTime();
				    }else if("2".equals(parkLogisticsBean.getParkStatus())){
				       s="装运完成,已驶离园区  离开时间:"+parkLogisticsBean.getExitTime();
				    }else{
				    	s="未到园区";
				    } 
					sendObj.put("parkStatus",parkLogisticsBean.getParkStatus());//园区物流状态
					sendObj.put("parkBindingTime",parkLogisticsBean.getBindingTime());//园区物流进园区时间
					sendObj.put("parkExitTime",parkLogisticsBean.getExitTime());//园区物流出园区时间
					sendObj.put("parkStatusDesc",s);//园区物流状态描述
				}
				
				if(sendLocationBean!=null&&sendLocationBean.getProvince()!=null){
	                String sendDesc=sendLocationBean.getProvince();
	                
	                if(sendLocationBean.getCity()!=null&&sendLocationBean.getCity()!=""){
	                	sendDesc += sendLocationBean.getCity();
	                	sendObj.put("city",sendLocationBean.getCity());//园区物流配送地址 市
	                }
	                if(sendLocationBean.getDistrict()!=null&&sendLocationBean.getDistrict()!=""){
	                	sendDesc += sendLocationBean.getDistrict();
	                	sendObj.put("district",sendLocationBean.getDistrict());//园区物流配送地址 区
	                }
	                if(sendLocationBean.getModifyTime()!=null&&sendLocationBean.getModifyTime()!=""){
	                	sendDesc="更新时间:"+sendLocationBean.getModifyTime() ; 
				    }else if(sendLocationBean.getCreateTime()!=null&&sendLocationBean.getCreateTime()!=""){
				    	sendDesc="更新时间:"+sendLocationBean.getCreateTime() ;
				    }
	                sendObj.put("province",sendLocationBean.getProvince());//园区物流配送地址 省
					sendObj.put("sendDesc",sendDesc);//园区物流配送地址描述
					sendObj.put("longitude",sendLocationBean.getLongitude());//经度
					sendObj.put("latitude",sendLocationBean.getLatitude());//纬度
				}
				array.put(sendObj);
			}
			
			JSONObject resultObj = new JSONObject();
			resultObj.put("result",true);
			resultObj.put("message","操作成功");
			resultObj.put("transferInfo",array.toString());
			log.info("调用园区物流结束，返回参数为："+resultObj.toString());
			return resultObj.toString();
		}catch(Exception e){
			e.printStackTrace();
		}
		JSONObject jsonResult = new JSONObject();  
		jsonResult.put("result",false);
		jsonResult.put("message","操作失败:发生未知异常");
		log.info(jsonResult.toString());
		return jsonResult.toString();
   }

}
