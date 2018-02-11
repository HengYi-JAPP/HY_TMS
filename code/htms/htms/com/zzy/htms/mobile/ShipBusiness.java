package com.zzy.htms.mobile;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.mobilecn.utils.RequestHelper;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.log.HtmsLogger;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;
import com.zzy.htms.services.business.EstimateFreightBean;
import com.zzy.htms.services.business.FreightBean;
import com.zzy.htms.services.business.HtmsEstimateFreightBusiness;
import com.zzy.htms.webservice.market.order.HtmsApplyOrderBussiness;


/**
 * 已发货申请处理类
 * @author zzy
 *
 */
public class ShipBusiness extends AbstractV2BusinessExecutor {

	private Map<Integer, ShipTransferBean> mAppliedListMap = null;
	private List<Integer> mAppliedKeyList = null;
	
	private ShipTransferBean mSelectedTransBean = null;
	
	public static String getPastDate(int past) {  
       Calendar calendar = Calendar.getInstance();  
       calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);  
       Date today = calendar.getTime();  
       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
       String result = format.format(today);  
 
       return result;  
	 }
	public static String processCreateTime(String time) {
		if (time == null) {
			return null;
		}
		
		String retTime = time;
		String []timeArr = time.split(":");
		if (timeArr.length == 3) {
			String secondStr = timeArr[2];
			retTime = time.substring(0, time.length() - secondStr.length() - 1);
		}
		
		return retTime;
	}
	
	public String beforeModify(){
		
		this.setCache("modifyTime", tools.tool.getDateTime(), "request");
		return null;
	}
	
	public String returnCancelAppliedShip(){
		RequestHelper helper = new RequestHelper(this.getRequest());    
	    String operationResult=(String) helper.getValueFromAllScopes("OPERATION_RESULT");
		if("false".equals(operationResult)){
			String forward=super.view();
			if (this.isSuccess()) {
				
			}else{
				HtmsLogger.log("SHIP032", "撤销发货申请失败", "0", this.getRequest());
			}
			return forward;
		}
		return "";
	}
	
	
	public String cancelAppliedShip(){
		String forward=super.view();
		ShipBean shipBean=(ShipBean)this.getParameter("shipDetailViewBean");
		if(shipBean!=null){
			  AreaRepository rep = new AreaRepository();
			 shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
			 this.setCache("shipDetailViewBean", shipBean, "request");
		}
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIP031", "查看发货申请成功", "1", this.getRequest());
	        HtmsApplyOrderBussiness   applyOrderBussiness=new HtmsApplyOrderBussiness();
		    boolean b=applyOrderBussiness.updateApplyStatus(Integer.valueOf(shipBean.getShipId()),"901");
			if(!b){
				this.setCache("OPERATION_RESULT","false","request");
				String errorMessage="撤销失败：调用闭环系统取消订单接口失败";
				this.setCache("INVOKE_MESSAGE",errorMessage,"request");
				log.info(errorMessage);
			}
		}else{
			HtmsLogger.log("SHIP032", "查看发货申请失败", "0", this.getRequest());
		}
		return forward;
	}
	

	public String view(){
		String forward=super.view();
		ShipBean shipBean=(ShipBean)this.getParameter("shipDetailViewBean");
		if(shipBean!=null){
			AreaRepository rep = new AreaRepository();
			 shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
			 this.setCache("shipDetailViewBean", shipBean, "request");
		}
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIP031", "查看发货申请成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SHIP032", "查看发货申请失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public boolean setShipDetail(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =null;
		if(resultBean==null||resultBean.isSuccess()==false){
			log.info("\n\n resultBean==null||resultBean.isSuccess()==false \n\n");
			// return "listAction";
		}else{
			 list =(List) resultBean.getListResult("shipDetailList");
		}
		if(list==null||list.isEmpty()){
			list=(List) this.getParameter("shipDetailList");
		}
		
		 if(list==null||list.isEmpty()){
			 HtmsLogger.log("APPROVE701", "撤消时更新订单明细数据失败", "0", this.getRequest());
			 return false;
		 }
		int size= list.size();
		log.info("\n\n ------------------------->shipDetailList.size="+size+"\n\n");
		ShipDetailBean detailBean = null;
		String[] applyTonNum=new String[size],codetailId=new String[size];
		for(int i=0;i<size;i++){
			detailBean = (ShipDetailBean)list.get(i);
			applyTonNum[i]=detailBean.getApplyTonNum();
			codetailId[i]=detailBean.getCodetailId()+"";
		}
		this.setCache("applyTonNum",applyTonNum,"request");
		this.setCache("codetailId",codetailId,"codetailId");
		
		return true;
	}
	
	public String add(){
		boolean result = setShipDetail();
		String outMsg = "{\"isSuccess\":";
		
		
		if (!result) {
			if (result) {
				outMsg += 1;
			}else{
				outMsg += 0;
			}
			outMsg += "}";
			
			this.out(outMsg, this.getResponse());
			
			return "NULL";
		}
		
		super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("APPROVE011", "取消申请成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("APPROVE012", "取消申请失败", "0", this.getRequest());
		}
		
		if (result) {
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
	
	/**
	 * 获取已申请列表
	 */
	public String listApplyed(){							
		super.list();
		
		this.setCache("curpage", this.getParameter("curpage"), "request");
		
		getApplyedList();
		
		return null;
	}
	public String getApplyedList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List appliedList =(List) resultBean.getListResult("SELECTAPPLYED");
		 if(appliedList==null){
			 return null;
		 }
		 
		 //System.out.println("===================++++++++++++++"+appliedList);
		 ShipBean shipBean=null;
		 AreaRepository rep = new AreaRepository();
		 
		 List<EstimateFreightBean> estimateFreightBeansList = null;
		 EstimateFreightBean estimateFreightBean =null;
		 Map<String, List<EstimateFreightBean>> estimateFreightBeansMap=new HashMap<String, List<EstimateFreightBean>>();
		 
		 
		 this.mAppliedListMap = new HashMap<Integer, ShipTransferBean>();
		 this.mAppliedKeyList = new ArrayList<Integer>();
		 
		 //需要获取司机信息的shipId
		 List<Integer> shippdedId = new ArrayList<Integer>();
		 
		 for(int i=0,size=appliedList.size();i<size;i++){
			 shipBean=(ShipBean)appliedList.get(i);
			 
			 estimateFreightBeansList=estimateFreightBeansMap.get(shipBean.getShipId());
			 if(estimateFreightBeansList==null){
				 estimateFreightBeansList=new  ArrayList<EstimateFreightBean>();
				 estimateFreightBeansMap.put(shipBean.getShipId()+"", estimateFreightBeansList);
			 }
			 //获取寻找运价的参数
 			 estimateFreightBean = new EstimateFreightBean();
			 estimateFreightBean.setApplyTonNum(shipBean.getApplyTonNum());
			 estimateFreightBean.setAreaId(shipBean.getAreaId());
			 estimateFreightBean.setFactoryId(shipBean.getFactoryId());
			 estimateFreightBean.setCustomerId(shipBean.getCustomerId()+"");
			 estimateFreightBean.setShipId(shipBean.getShipId()+"");
			 estimateFreightBean.setProductId(shipBean.getProductId());
			 estimateFreightBean.setItemCode(shipBean.getItemCode());
			 estimateFreightBean.setOrderCode(shipBean.getCorderCode());
			 estimateFreightBean.setOrderId(shipBean.getCorderId()+"");
			 estimateFreightBean.setApplyTime(shipBean.getCreateTime());
			 
			 estimateFreightBeansList.add(estimateFreightBean);
			 
			 String time = processCreateTime(shipBean.getCreateTime());
			 shipBean.setCreateTime(time);
			 
			 shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
			/* 
			 int shipId = shipBean.getShipId();
			 
			 ShipTransferBean shipTransferBean = mAppliedListMap.get(shipId);
			 if (shipTransferBean == null) {
				 shipTransferBean = new ShipTransferBean(shipBean);
				 
				 mAppliedListMap.put(shipId, shipTransferBean);
				 
				 mAppliedKeyList.add(shipId);
				 			 
//				 int transStatus = shipBean.getTransStatus();
//				 log.info("TransStatus==========" + transStatus);
				 if ((shipBean.getFetchDriver() == null || shipBean.getFetchDriver().length() == 0) && shipBean.getApplyStatus() >= 2) {
					 shippdedId.add(shipId);
				 }
			 }
			 
			shipTransferBean.addDetail(shipBean);
			shipTransferBean.addTransId(shipBean.getTransId());*/
			

		 }//for
		 
		 //获取对应的运价和单价
		 HtmsEstimateFreightBusiness htmsEstimateFreightBusiness=new HtmsEstimateFreightBusiness();
		 List<FreightBean> freightList = null;
		 Map<String, List<FreightBean>> freightMap=new HashMap<String, List<FreightBean>>();
		 for (String key : estimateFreightBeansMap.keySet()) {
			 
			 estimateFreightBeansList = estimateFreightBeansMap.get(key);
			 
			 freightList=htmsEstimateFreightBusiness.getEstimateFreight(estimateFreightBeansList,false);
			// System.out.println("==========="+freightList);
			 freightMap.put(key, freightList);
		 }
		 FreightBean freightBean = null;
		 for(int i = 0;i < appliedList.size();i++){
			 shipBean = (ShipBean)appliedList.get(i);
			 
			 freightList = freightMap.get(shipBean.getShipId()+"");
			 /*
			 if(freightList == null || freightList.isEmpty()){
				 continue;
			 }
			 freightBean = freightList.get(0);
			 shipBean.setFreightPrice(freightBean.getFreightPrice());
			 shipBean.setFreight(freightBean.getTotalFreight());
			 shipBean.setFreightModel(freightBean.getFreightModel());
			 */
			 if (freightList != null && !freightList.isEmpty()) {
				 freightBean = freightList.get(0);
				 shipBean.setFreightPrice(freightBean.getFreightPrice());
				 shipBean.setFreight(freightBean.getTotalFreight());
				 shipBean.setFreightModel(freightBean.getFreightModel());
			 }			 
			 
			 int shipId = shipBean.getShipId();
			 
			 ShipTransferBean shipTransferBean = mAppliedListMap.get(shipId);
			 if (shipTransferBean == null) {
				 shipTransferBean = new ShipTransferBean(shipBean);
				 
				 mAppliedListMap.put(shipId, shipTransferBean);
				 
				 mAppliedKeyList.add(shipId);
				 			 
//				 int transStatus = shipBean.getTransStatus();
//				 log.info("TransStatus==========" + transStatus);
				 if ((shipBean.getFetchDriver() == null || shipBean.getFetchDriver().length() == 0) && shipBean.getApplyStatus() >= 2) {
					 shippdedId.add(shipId);
				 }
			 }
			 
			shipTransferBean.addDetail(shipBean);
			shipTransferBean.addTransId(shipBean.getTransId());
			 
		 }
		
		
		 
		 
		 this.setCache("appliedKeyList", mAppliedKeyList, "appliedKeyList");
		 this.setCache("appliedListMap", mAppliedListMap, "appliedListMap");
		 	
		 int size = shippdedId.size();
		 String []shippedIdArray = new String[size];
		 for (int i = 0; i < size; i++) {
			 int shipId = shippdedId.get(i);
			  
			 shippedIdArray[i] = shipId+"";
		 }
		 
		 this.setCache("shippdedId",shippedIdArray,"request");
		 
		return null;
	}
	public String getTransList() {
		String forward=super.list();
		
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List<ShipDriverBean> appliedShipList =(List) resultBean.getListResult("SELECTAPPLYEDSHIP");
		
		 if(appliedShipList==null || mAppliedListMap == null){
			 return null;
		 }
				 
		 for (int i = 0; i < appliedShipList.size(); i++) {
			 ShipDriverBean shipDriverBean = appliedShipList.get(i);
			 int shipId = shipDriverBean.getShipId();
			 
			 ShipTransferBean shipTransferBean = mAppliedListMap.get(shipId);
			 if (shipTransferBean == null) {
				 continue;
			 }			 

			 shipTransferBean.setFetchDriver(shipDriverBean.getDriverName());
			 shipTransferBean.setFetchCar(shipDriverBean.getVehicleNo());
			 shipTransferBean.setFetchMobile(shipDriverBean.getDriverMobile());
			 shipTransferBean.setTransStatus(shipDriverBean.getSendStatus());
//			 shipTransferBean.setTotalFreight(shipDriverBean.getTotalFreight());
		 }
		 
		 this.setCache("appliedListMap", mAppliedListMap, "appliedListMap");
		 
		return null;
	}
	
	//获取调拨单信息
	public String getShipInfo() {
		super.list();
		
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List appliedList =(List) resultBean.getListResult("SELECTMOBILESHIPINFO");
		 if(appliedList==null || appliedList.size() == 0){
			 return null;
		 }
		 
		 ShipBean shipBean=(ShipBean)appliedList.get(0);;
		 AreaRepository rep = new AreaRepository();
		 shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
		 
		 mSelectedTransBean = new ShipTransferBean(shipBean);
		 
		 for(int i=0,size=appliedList.size();i<size;i++){
			 shipBean=(ShipBean)appliedList.get(i);
			 
			 String time = processCreateTime(shipBean.getCreateTime());
			 shipBean.setCreateTime(time);
			 
			 shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
			 
			 mSelectedTransBean.addDetail(shipBean);
			 mSelectedTransBean.addTransId(shipBean.getTransId());
		 }
		 
		 this.setCache("selectedTransBean", mSelectedTransBean, "selectedTransBean");
		 
		 return null;
	}
	public String getTransportInfo() {
		super.list();
		
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List appliedList =(List) resultBean.getListResult("SELECTMOBILETRANSPORTINFO");
		 if(appliedList==null || appliedList.size() == 0){
			 return null;
		 }	 
		 
		 if (mSelectedTransBean == null) {
			 return null;
		 }
		 
		 List<String> transIdList = mSelectedTransBean.getTransIdList();
		 String []transId = new String[transIdList.size()];
		 for (int i = 0; i < transIdList.size(); i++) {
			 String shipId = transIdList.get(i);
			  
			 transId[i] = shipId;
		 }
		 
		 ShipTransferBean transportBean = null;
		 
		 for (int i = 0; i < appliedList.size(); i++) {
			 ShipBean shipBean = (ShipBean)appliedList.get(i);
			 			 
			 transportBean = mSelectedTransBean.getTransBean(shipBean.getTransId());
			 if (transportBean == null) {
				 transportBean = new ShipTransferBean(shipBean); 
				 mSelectedTransBean.addTransport(transportBean); 
			 }
				
			 transportBean.addDetail(shipBean);	 
		 }
		 
		 this.setCache("selectedTransBean", mSelectedTransBean, "selectedTransBean");
		 
//		 log.info("mSelectedTransBean2222=======" + mSelectedTransBean);
		 
		 this.setCache("transId",transId,"request");
		 
		return null;
	}
	public String getTransportList() {
		super.list();

		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List<ShipDriverBean> appliedShipList =(List) resultBean.getListResult("SELECTMOBILETRANSPORTLIST");
		
//		 log.info("mSelectedTransBean111=======" + mSelectedTransBean);
		
		 if(mSelectedTransBean==null || appliedShipList == null){
			 return null;
		 }
		 
		 List<ShipTransferBean> transportList = mSelectedTransBean.getTransportList();
		
		 if (transportList == null) {
			 return null;
		 }
		 
		 for (int i = 0; i < appliedShipList.size(); i++) {
			 ShipDriverBean shipDriverBean = appliedShipList.get(i);
			 
			 for (int j = 0; j < transportList.size(); j++) {
				 ShipTransferBean transportBean = transportList.get(j);
				 if (transportBean.getTransId() == null) {
					 continue;
				 }
				 
				 int transId = Integer.parseInt(transportBean.getTransId());
				 
				 if (shipDriverBean.getTransId() == transId) {
					 transportBean.setFetchDriver(shipDriverBean.getDriverName());
					 transportBean.setFetchCar(shipDriverBean.getVehicleNo());
					 transportBean.setFetchMobile(shipDriverBean.getDriverMobile());
					 transportBean.setSendStatus(shipDriverBean.getSendStatus());
				 }				
			 }
		 }
		 
		 this.setCache("selectedTransBean", mSelectedTransBean, "selectedTransBean");
		 
		 //log.info("mSelectedTransBean222222222=======" + mSelectedTransBean);
		 
		return null;
	}
	public String getTransportFreight() {
		super.list();

		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List<ShipDriverBean> appliedShipList =(List) resultBean.getListResult("SELECTMOBILETRANSPORTFREIGHT");
		
//		 log.info("mSelectedTransBean111=======" + mSelectedTransBean);
		
		 if(mSelectedTransBean==null || appliedShipList == null){
			 return null;
		 }
		 
		 List<ShipTransferBean> transportList = mSelectedTransBean.getTransportList();
		
		 if (transportList == null) {
			 return null;
		 }
		 
		 for (int i = 0; i < appliedShipList.size(); i++) {
			 ShipDriverBean shipDriverBean = appliedShipList.get(i);
			 
			 for (int j = 0; j < transportList.size(); j++) {
				 ShipTransferBean transportBean = transportList.get(j);
				 if (transportBean.getTransId() == null) {
					 continue;
				 }
				 
				 int transId = Integer.parseInt(transportBean.getTransId());
				 
				 if (shipDriverBean.getTransId() == transId) {
					 transportBean.setTotalFreight(shipDriverBean.getTotalFreight());
				 }				
			 }
		 }
		 
		 this.setCache("selectedTransBean", mSelectedTransBean, "selectedTransBean");
		 
		 //log.info("mSelectedTransBean222222222=======" + mSelectedTransBean);
		 
		return null;
	}
	
	//申请取消前查看申请的状态
	public String viewApplyStatus() {
		String outMsg = "{\"code\":";		
		
		super.list();
		
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List appliedList =(List) resultBean.getListResult("MOBILEVIEWAPPLYSTATUS");
		 if(appliedList==null || appliedList.size() == 0){
			 
			 outMsg += "1001,\"msg\":\"没有获取到申请信息，请刷新后充试\"}";
			 this.out(outMsg, this.getResponse());
			 
			 return "NULL";
		 }
		 
		ShipBean shipBean=(ShipBean)appliedList.get(0);;
		
		outMsg += ("0,\"applyStatus\":" + shipBean.getApplyStatus() + "}");
		
		this.out(outMsg, this.getResponse());
		
		return "NULL";
	}
}
