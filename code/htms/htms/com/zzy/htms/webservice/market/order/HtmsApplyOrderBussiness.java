package com.zzy.htms.webservice.market.order;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.zzy.htms.dictionary.factory.FactoryRepository;
import com.zzy.htms.dictionary.product.ProductRepository;
import com.zzy.htms.sales.custorder.CustOrderBean;
import com.zzy.htms.sales.custorderdetail.CustOrderDetailBean;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;
import com.zzy.htms.webservice.market.client.OrderPutApplyBean;
import com.zzy.htms.webservice.market.client.OrderPutApplyDetailBean;
import com.zzy.htms.webservice.market.client.OrderPutApplyRmtService;
import com.zzy.htms.webservice.market.client.OrderPutApplyRmtServiceImplServiceLocator;
import com.zzy.htms.webservice.market.client.WebServiceResponse;


/**
 * 闭环接口,申请单写入闭环
 * @author zzy
 *
 */
public class HtmsApplyOrderBussiness extends AbstractBusinessExecutor{
	
	/**
	 * 获取闭环建议可排数量
	 * @param orderBean
	 * @param orderDetailBeanList
	 * @return
	 */
	public Map<String,String> getGoodsCount(CustOrderBean orderBean,List<CustOrderDetailBean> orderDetailBeanList)  {
		
		try {
			OrderPutApplyRmtServiceImplServiceLocator  service=new OrderPutApplyRmtServiceImplServiceLocator();
			OrderPutApplyRmtService orderApplyService;
			orderApplyService = service.getOrderPutApplyRmtServiceImplPort();
			
			JSONArray array=new JSONArray();
			for(CustOrderDetailBean  orderDetailBean:orderDetailBeanList){
				JSONObject obj1=new JSONObject();
				obj1.put("orderNo", orderBean.getCorderCode());
				obj1.put("materialCode", orderDetailBean.getMeterialNo());
				array.add(0, obj1);
			}
			System.out.println(array.toString());
			WebServiceResponse responseBean= orderApplyService.getGoodsCount(array.toString());
			
			if(responseBean.getMessageType()==1){
				Map<String ,String >  resultMap= new HashMap<String,String>();
				String json = (String) responseBean.getData();
				System.out.println(json);
				JSONArray jsonArray= JSONArray.fromObject(json);
			    for (int i = 0; i < jsonArray.size(); i++) {  
	                JSONObject jsonObject= (JSONObject) jsonArray.get(i);  
	                resultMap.put(jsonObject.optString("materialCode"), jsonObject.optString("number"));  
	            }
				return resultMap;
			}else{
				log.info(responseBean.getMessage());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 时间转换成yyyy-MM-dd HH:mm:ss格式
	 * @param timeStr
	 * @return
	 */
	private  Calendar getCalendarFromStr(String timeStr) {
		if(timeStr==null||timeStr==""){
			return null;
		}
		try{
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date =sdf.parse(timeStr);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			return calendar;
		}catch(Exception e){
			log.info("转换时间发生错误："+e.getMessage());
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 写入订单到闭环系统
	 * @return
	 */
	public boolean  createOrder(ShipBean shipBean,List<ShipDetailBean> shipDetailList){
		try {
			OrderPutApplyBean applyBean = new OrderPutApplyBean();
			
			OrderPutApplyDetailBean[] orderPutApplyDetailBean = new OrderPutApplyDetailBean[shipDetailList.size()];
			
			for(int i=0;i<shipDetailList.size();i++){
				ShipDetailBean shipDetailBean = shipDetailList.get(i);
				
				OrderPutApplyDetailBean  detailBean = new OrderPutApplyDetailBean();
				detailBean.setApplyDetailId(shipDetailBean.getShipDetailId());
				detailBean.setApplyId(shipDetailBean.getShipId());
				
				if(shipDetailBean.getApplyPackNum()!=null&&shipDetailBean.getApplyPackNum()!=""){
					detailBean.setApplyPackNum(Integer.valueOf(shipDetailBean.getApplyPackNum()));
				}
				
				detailBean.setApplyTonNum(new BigDecimal(shipDetailBean.getApplyTonNum()));
				
				detailBean.setCreateTime(getCalendarFromStr(shipDetailBean.getCreateTime()));
				
				detailBean.setFactoryName(FactoryRepository.getFactoryName(shipDetailBean.getFactoryId()));
				
				detailBean.setProductName(ProductRepository.getProductName(shipDetailBean.getProductId()+""));
				
				detailBean.setMaterialCode(shipDetailBean.getMeterialNo());//存放物料号
				
				
				detailBean.setRemark(shipDetailBean.getShipDetailNotice());
				try{
					log.info("detail bean infor:shipid "+shipDetailBean.getShipId()+" shipdetailid "+shipDetailBean.getShipDetailId()+
							" ApplyPackNum "+shipDetailBean.getApplyPackNum()+
							" ApplyTonNum  "+shipDetailBean.getApplyTonNum()+
							" CreateTime  "+shipDetailBean.getCreateTime()+
							" factoryName  "+FactoryRepository.getFactoryName(shipDetailBean.getFactoryId())+
							" ProductName "+ProductRepository.getProductName(shipDetailBean.getProductId()+"")+"  MeterialNo  "+shipDetailBean.getMeterialNo());
				}catch(Exception e){
					
				}
				orderPutApplyDetailBean[i]=detailBean;
			}
			
			applyBean.setApplyId(shipBean.getShipId());
			applyBean.setDetailBeanList(orderPutApplyDetailBean);
			applyBean.setCreateTime(getCalendarFromStr(shipBean.getCreateTime()));
			//applyBean.setDelFlag(Integer.valueOf(1));
			applyBean.setOrderNo(shipBean.getCorderCode());
			applyBean.setRemark(shipBean.getShipNotice());
			//applyBean.setStatus("1");
			applyBean.setApplyTonNum(new BigDecimal(shipBean.getApplyTonNum()));
			if(shipBean.getApplyPackNum()!=null&&shipBean.getApplyPackNum()!=""){
				applyBean.setApplyPackNum(Integer.valueOf(shipBean.getApplyPackNum()));
			}
			
			try{
				log.info("detail bean infor:shipid "+shipBean.getShipId()+" corderCode "+shipBean.getCorderCode()+
						" ApplyPackNum "+shipBean.getApplyPackNum()+
						" ApplyTonNum  "+shipBean.getApplyTonNum()+
						" CreateTime  "+shipBean.getCreateTime());
			}catch(Exception e){
				
			}
			
			OrderPutApplyRmtServiceImplServiceLocator  service=new OrderPutApplyRmtServiceImplServiceLocator();
			OrderPutApplyRmtService orderApplyService= service.getOrderPutApplyRmtServiceImplPort();
			WebServiceResponse responseBean= orderApplyService.insertOrderPutApply(applyBean);
			
			if((new Integer(0)).equals(responseBean.getMessageType())){
				log.info(responseBean.getMessageType()+"");
	        	log.info(responseBean.getMessage());
				return false;
			}
	        if((new Integer(1)).equals(responseBean.getMessageType())){
	        	log.info(responseBean.getMessageType()+"");
	        	log.info(responseBean.getMessage());
	        	return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	/*
	  <option value="0" >待审批</option>
	  <option value="1" >待物流分配</option>
	  <option value="2" >待排车</option>
	  <option value="3" >已排车</option>
	  <option value="901" >未通过</option>
	  <option value="902" >已撤消</option>
	  <option value="903" >物流拒绝</option>

	 */
	/**
	 * 取消写入到闭环系统的申请订单
	 * 传入参数为 订单的shipId
	 * 传入参数为 订单的 shipStatus   901 删除订单  0未审批   1 审批通过订单   2物流审批通过
	 * @return
	 */
	public boolean  updateApplyStatus(Integer shipId,String shipStatus){
		try {
			OrderPutApplyRmtServiceImplServiceLocator  service=new OrderPutApplyRmtServiceImplServiceLocator();
			OrderPutApplyRmtService orderApplyService= service.getOrderPutApplyRmtServiceImplPort();
			
			JSONObject jsonObj=new JSONObject();
			jsonObj.put("applyId", shipId);
			jsonObj.put("status", shipStatus);
			System.out.println(jsonObj.toString());
			WebServiceResponse responseBean= orderApplyService.updateApply(jsonObj.toString());
			if((new Integer(0)).equals(responseBean.getMessageType())){
				log.info(responseBean.getMessageType()+"");
	        	log.info(responseBean.getMessage());
				return false;
			}
	        if((new Integer(1)).equals(responseBean.getMessageType())){
	        	log.info(responseBean.getMessageType()+"");
	        	log.info(responseBean.getMessage());
	        	return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 取闭环可申请数量
	 * @return
	 */
//	public String getMarketAppliedTonNum(){
//		
//		return "";
//	}
	
}
