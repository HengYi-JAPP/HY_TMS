package com.zzy.htms.logistic.transport;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.utils.RequestHelper;
import com.zzy.htms.dictionary.area.AreaBean;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.dictionary.factory.FactoryBean;
import com.zzy.htms.dictionary.factory.FactoryRepository;
import com.zzy.htms.dictionary.product.ProductBean;
import com.zzy.htms.dictionary.product.ProductRepository;
import com.zzy.htms.log.HtmsLogger;
import com.zzy.htms.logistic.driver.DriverBean;
import com.zzy.htms.logistic.send.SendBean;
import com.zzy.htms.logistic.transfer.TransferBean;
import com.zzy.htms.logistic.transportdetail.TransportDetailBean;
import com.zzy.htms.logistic.vehicle.VehicleBean;
import com.zzy.htms.sales.custorderdetail.CustOrderDetailBean;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sap.rfc.CarSynker;
/**
 * 运单业务实现类
 * @author zzy
 *
 */
public class TransportBusiness  extends AbstractV2BusinessExecutor {
	
	public void checkDriverAndCar(){
		String selectDriverId=(String)this.getParameter("selectDriverId");
		if(this.isNull(selectDriverId)){
			ResultBean resultBean =this.doDBOperate("checkDriverExist");
			if(resultBean!=null&&resultBean.isSuccess()){
				List driverList =(List) resultBean.getListResult("driverList");
				if(driverList==null||driverList.isEmpty()){
					log.info("001 不存在司机信息，需要插入司机信息");
					resultBean =this.doDBOperate("addNewDriver");
					if(resultBean!=null&&resultBean.isSuccess()){
						driverList =(List) resultBean.getListResult("driverList");
						if(driverList==null||driverList.isEmpty()){
							log.info("002 插入司机信息不存在,无法后续操作。");
							return;
						}
					}
				}else{
					log.info("003存在司机信息，不要插入司机信息");
				}
				DriverBean driverBean=(DriverBean)driverList.get(0);
				this.setCache("sendDriverId", driverBean.getDriverId(), "request");
			}else{
				log.info("004 检测司机信息是否存在失败,无法后续操作。");
				return;
			}
			
		}else{
			log.info("005 已选择司机信息,直接进入后续操作。");
			this.setCache("sendDriverId", selectDriverId, "request");
		}
		
		/*检测车辆*/
		String selectVehicleId=(String)this.getParameter("selectVehicleId");
		if(this.isNull(selectVehicleId)){
			ResultBean resultBean =this.doDBOperate("checkVehicleExist");
			if(resultBean!=null&&resultBean.isSuccess()){
				List vehicleList =(List) resultBean.getListResult("vehicleList");
				if(vehicleList==null||vehicleList.isEmpty()){
					log.info("201 不存在车辆信息，需要插入车辆信息");
					resultBean =this.doDBOperate("addNewVehicle");
					if(resultBean!=null&&resultBean.isSuccess()){
						vehicleList =(List) resultBean.getListResult("vehicleList");
						if(vehicleList==null||vehicleList.isEmpty()){
							log.info("202 插入车辆信息不存在,无法后续操作。");
							return;
						}
					}
				}else{
					log.info("203存在车辆信息，不要插入车辆信息");
				}
				VehicleBean vehicleBean=(VehicleBean)vehicleList.get(0);
				this.setCache("sendVehicleId", vehicleBean.getVehicleId(), "request");
			}else{
				log.info("204 检测车辆信息是否存在失败,无法后续操作。");
				return;
			}
			
		}else{
			log.info("205 已选择车辆信息,直接进入后续操作。");
			this.setCache("sendVehicleId", selectVehicleId, "request");
		}
		//$,$
	}
	public void checkDriverAndCarToLogistics(){
		String selectDriverId=(String)this.getParameter("selectDriverId");
		if(this.isNull(selectDriverId)){
			ResultBean resultBean =this.doDBOperate("checkDriverExistToLogistics");
			if(resultBean!=null&&resultBean.isSuccess()){
				List driverList =(List) resultBean.getListResult("driverList");
				if(driverList==null||driverList.isEmpty()){
					log.info("001 不存在司机信息，需要插入司机信息");
					resultBean =this.doDBOperate("addNewDriverToLogistics");
					if(resultBean!=null&&resultBean.isSuccess()){
						driverList =(List) resultBean.getListResult("driverList");
						if(driverList==null||driverList.isEmpty()){
							log.info("002 插入司机信息不存在,无法后续操作。");
							return;
						}
					}
				}else{
					log.info("003存在司机信息，不要插入司机信息");
				}
				DriverBean driverBean=(DriverBean)driverList.get(0);
				this.setCache("sendDriverId", driverBean.getDriverId(), "request");
			}else{
				log.info("004 检测司机信息是否存在失败,无法后续操作。");
				return;
			}
			
		}else{
			log.info("005 已选择司机信息,直接进入后续操作。");
			this.setCache("sendDriverId", selectDriverId, "request");
		}
		
		/*检测车辆*/
		String selectVehicleId=(String)this.getParameter("selectVehicleId");
		if(this.isNull(selectVehicleId)){
			ResultBean resultBean =this.doDBOperate("checkVehicleExistToLogistics");
			if(resultBean!=null&&resultBean.isSuccess()){
				List vehicleList =(List) resultBean.getListResult("vehicleList");
				if(vehicleList==null||vehicleList.isEmpty()){
					log.info("201 不存在车辆信息，需要插入车辆信息");
					resultBean =this.doDBOperate("addNewVehicleToLogistics");
					if(resultBean!=null&&resultBean.isSuccess()){
						vehicleList =(List) resultBean.getListResult("vehicleList");
						if(vehicleList==null||vehicleList.isEmpty()){
							log.info("202 插入车辆信息不存在,无法后续操作。");
							return;
						}
					}
				}else{
					log.info("203存在车辆信息，不要插入车辆信息");
				}
				VehicleBean vehicleBean=(VehicleBean)vehicleList.get(0);
				this.setCache("sendVehicleId", vehicleBean.getVehicleId(), "request");
			}else{
				log.info("204 检测车辆信息是否存在失败,无法后续操作。");
				return;
			}
			
		}else{
			log.info("205 已选择车辆信息,直接进入后续操作。");
			this.setCache("sendVehicleId", selectVehicleId, "request");
		}
		//$,$
	}
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("SEND001", "增加派车单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SEND002", "增加派车单失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("SEND011", "取消派车成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SEND012", "取消派车失败", "0", this.getRequest());
		}
		return forward;
	}
	/**
	 * 在查找之间组合参数
	 */
	public void beforeSearch(){
		RequestHelper helper = new RequestHelper(this.getRequest());
		//String factoryId = (String)helper.getValueFromAllScopes("factoryId");
		//String productId = (String)helper.getValueFromAllScopes("productId");
		String provinceId = (String)helper.getValueFromAllScopes("provinceId");
		String cityId = (String)helper.getValueFromAllScopes("cityId");
		String countyId = (String)helper.getValueFromAllScopes("countyId");
		String countryId = (String)helper.getValueFromAllScopes("countryId");
		/*log.info("==============================>provinceId="+provinceId);
		log.info("==============================>cityId="+cityId);
		log.info("==============================>countyId="+countyId);
		log.info("==============================>countryId="+countryId);*/
		String areaId =this.isNull(countryId)?countyId:countryId;
		areaId =this.isNull(areaId)?cityId:areaId;
		areaId =this.isNull(areaId)?provinceId:areaId;
		AreaRepository areaRep = new AreaRepository();
		AreaBean areaBean =areaRep.getArea(areaId);
		if(areaBean!=null){
			this.setCache("areaCodeSH", areaBean.getAreaCode(),"request");
		}
		
		
		
		
		 
		String[] factoryIds =this.getParameterValues("factoryIdSH");
		//log.info("==============================>factoryIds.lenght="+(factoryIds==null?0:factoryIds.length));
		StringBuffer buffer = null;
		if(factoryIds!=null&&factoryIds.length>0){	
			buffer = new StringBuffer();
			 FactoryBean factoryBean=null;
			List<FactoryBean> checkFactoryList = new ArrayList<FactoryBean>();
			for(int i=0;i<factoryIds.length;i++){
				
				//log.info("==============================>factoryIds[i]="+factoryIds[i]);
				if(i>0){
					buffer.append("','");
				}
				buffer.append(factoryIds[i]);
				factoryBean=FactoryRepository.getFactory(factoryIds[i]);
				checkFactoryList.add(factoryBean);
			}
			//this.setCache("checkFactoryList",checkFactoryList,"request");
			this.setCache("facorysIdsSH", buffer.toString(),"request");
		}
		String[] productIds =this.getParameterValues("productIdSH");
		//log.info("==============================>productIds.lenght="+(productIds==null?0:productIds.length));
		if(productIds!=null&&productIds.length>0){	
			ProductBean productBean=null;
			List<ProductBean> checkProductList = new ArrayList<ProductBean>();
			buffer = new StringBuffer();
			for(int i=0;i<productIds.length;i++){
				//log.info("==============================>productIds[i]="+productIds[i]);
				if(i>0){
					buffer.append("','");
				}
				buffer.append(productIds[i]);
				productBean=ProductRepository.getProduct(productIds[i]);
				checkProductList.add(productBean);
			}
			//this.setCache("checkProductList",checkProductList,"request");
			this.setCache("productsIdsSH", buffer.toString(),"request");
		}
		
		/*
		String customerNameSH =(String)helper.getValueFromAllScopes("customerNameSH");
		String caddrContactorSH = (String)helper.getValueFromAllScopes("caddrContactorSH");
		String assignDateSH = (String)helper.getValueFromAllScopes("assignDateSH");
		String sendCarDateSH = (String)helper.getValueFromAllScopes("sendCarDateSH");
		this.setCache("customerNameSH", customerNameSH,"request");
		this.setCache("assignDateSH", assignDateSH,"request");
		this.setCache("sendCarDateSH", sendCarDateSH,"request");
		this.setCache("caddrContactorSH",caddrContactorSH,"request");

		String transportCodeSH = (String)helper.getValueFromAllScopes("transportCodeSH");
		String carNoSH = (String)helper.getValueFromAllScopes("carNoSH");
		String sapTransCodeSH = (String)helper.getValueFromAllScopes("sapTransCodeSH");
		String corderCodeSH = (String)helper.getValueFromAllScopes("corderCodeSH");
		this.setCache("transportCodeSH", transportCodeSH,"request");
		this.setCache("carNoSH", carNoSH,"request");
		this.setCache("sapTransCodeSH", sapTransCodeSH,"request");
		this.setCache("corderCodeSH", corderCodeSH,"request");*/
		
		 
		// this.setCache("cacheFactoryId", factoryIds, "request");
		// this.setCache("cacheProductId", productIds, "request");
		/* this.setCache("cacheProvinceId", provinceId, "request");
		 this.setCache("cacheCityId", cityId, "request");
		 this.setCache("cacheCountyId", countyId, "request");
		 this.setCache("cacheCountryId", countryId, "request");*/
	}
	public String list(){
		beforeSearch();
		String forward=super.list();
		if(this.isSuccess()){
			//HtmsLogger.log("TRANSPORT021","查看运单列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPORT022", "查看运单列表失败", "0", this.getRequest());
		}
		searchTransportList();
		return forward;
	}
	public String view(){
		String forward=super.view();
		loadTransportList();
		setDetailList();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSPORT031", "查看运单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPORT032", "查看运单失败", "0", this.getRequest());
		}
		return forward;
	}
	public String loadTransportList(){
		//ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		 if(list==null){
			 log.info("================================>list==null");
			 return null;
		 }
		//log.info("list====================="+list);
		  List<TransportBean> transportLists = new ArrayList<TransportBean>();
		  Map<String, String> transportsIdMap=new HashMap<String, String>();
		  
		 //map<areaId,<factoryId,<materialId,<orderId,<applyId,List<transportBean>>>>>>
		  Map<String,Map<String,Map<String, List<TransportBean>>>> transportsMap=new HashMap<String,Map<String,Map<String, List<TransportBean>>>>();
		  //Map<String,Map<String,Map<String,Map<String, List<TransportBean>>>>> factoryMap = null;
		  //Map<String,Map<String,Map<String, List<TransportBean>>>> materialMap=null;
		  Map<String,Map<String, List<TransportBean>>> orderMap=null;
		  Map<String, List<TransportBean>> applyMap=null;
		  TransportBean transportBean=null;
		 String transportId = null,areaId=null,factoryId=null,materialId=null,orderId=null,transferCode=null;
		 AreaRepository rep = new AreaRepository();
		 for(int i=0,size=list.size();i<size;i++){
			 transportBean=(TransportBean)list.get(i);
			 transportId = transportBean.getTransId()+"";
			 areaId=transportBean.getAreaId();
			 factoryId=transportBean.getMeterialFactory();
			 materialId=transportBean.getMeterialNo();
			 orderId=transportBean.getCorderId()+"";
			 transferCode=transportBean.getTransportCode();
			 /*
			 if(transportsIdMap.get(transportId)!=null){
				 continue;
			 }
			 transportsIdMap.put(transportId, transportId);
			 */
			 
			 /*factoryMap=transportsMap.get(areaId);
			 if(factoryMap==null){
				 factoryMap= new HashMap<String,Map<String,Map<String,Map<String, List<TransportBean>>>>>();
				 transportsMap.put(areaId, factoryMap);
			 }
			 log.info("================================>areaId:"+areaId+" , transportsMap size="+transportsMap.size());
			 
			 materialMap=factoryMap.get(factoryId);
			 if(materialMap==null){
				 materialMap= new HashMap<String,Map<String,Map<String, List<TransportBean>>>>();
				 factoryMap.put(factoryId, materialMap);
			 }
			 log.info("================================>factoryId:"+factoryId+" , materialMap size="+materialMap.size());
			 */
			 orderMap=transportsMap.get(areaId);
			 if(orderMap==null){
				 orderMap= new HashMap<String,Map<String, List<TransportBean>>>();
				 transportsMap.put(areaId, orderMap);
			 }
			 log.info("================================>areaId:"+areaId+" , orderMap size="+orderMap.size());
			 applyMap=orderMap.get(orderId);
			 if(applyMap==null){
				 applyMap= new HashMap<String, List<TransportBean>>();
				 orderMap.put(orderId, applyMap);
			 }
			 log.info("================================>orderId:"+orderId+" , applyMap size="+applyMap.size());
			 transportLists=applyMap.get(transferCode);
			 if(transportLists==null){
				 transportLists = new ArrayList<TransportBean>();
				 applyMap.put(transferCode, transportLists);
			 }
			 transportBean.setAreaName( rep.getFullAreaName(transportBean.getAreaId(), "", true));
			 transportLists.add(transportBean);
			 log.info("================================>transferCode:"+transferCode+" , transportLists size="+transportLists.size());
			
		 }
		 this.setCache("transportsMap", transportsMap, "request");
		 return null;
	}
	public String assignCar(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSPORT031", "运单分配车辆成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPORT032", "运单分配车辆失败", "0", this.getRequest());
		}
		return forward;
	}
	public String syncAssignCar(){
		try{
			//String forward=super.view();	
		
			String[] sapTransCode=(String[])this.getRequest().getParameterValues("sapTransCode");
			String SAP_INVOKE_MESSAGE=null;
			this.setCache("SAP_INVOKE_MESSAGE","","request");
			if(sapTransCode==null||sapTransCode.length==0){
				log.info("sapTransCode==null||sapTransCode.length==0,没有获取sapTransCode");
				SAP_INVOKE_MESSAGE="调拨单号为空，运单分配失败";
				this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
				return null;
			}
			String vehicleNo = this.getRequest().getParameter("vehicleNo");
			if(this.isNull(vehicleNo)){
				log.info("vehicleNo==null,没有获取车牌号");
				SAP_INVOKE_MESSAGE="车牌号码为空，运单分配失败";
				this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
				return null;
			}
			
			log.info("sapTransCode.length====="+sapTransCode.length);
			CarSynker carSynker= null;
			String result = "";
			for(int i=0;i<sapTransCode.length;i++){
				carSynker= new CarSynker();		
				log.info("sapTransCode["+i+"]====="+sapTransCode[i]);
				result=carSynker.writeCarNo(sapTransCode[i],vehicleNo);
				if("S".equals(result)==false){
					SAP_INVOKE_MESSAGE="运单分配失败。"+result;
					this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
					return null;
				}
			}
			
			//添加排车单状态的检测，状态为0，允许排车，不存在或者，状态不正确不允许排车
			RequestHelper helper = new RequestHelper(this.getRequest());
			String transportId = (String)helper.getValueFromAllScopes("transportId");
			Map parameters = new HashMap();
			parameters.put("transportId", transportId);
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("getTransportById");
			ResultBean coorderResultBean = this.dbOperator(operationBean, parameters, false);
			List<TransportBean> transportList = new ArrayList<TransportBean>();
			transportList =coorderResultBean.getListResult("getTransportById");
			if(transportList==null||transportList.size()==0){
				SAP_INVOKE_MESSAGE="排车失败:无法获取排车信息!";
				this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
				return null;
			}
			if(transportList!=null||transportList.size()>0){
				TransportBean transportBean=transportList.get(0);
				if(transportBean.getTransportStatus()!=0){
					String status="";
					if(transportBean.getTransportStatus()==2){
						status="已派车";
					}
					if(transportBean.getTransportStatus()==1){
						status="已排车";
					}		
					if(transportBean.getTransportStatus()==0){
						status="未排车";
					}
					SAP_INVOKE_MESSAGE="排车失败:运单状态为 "+status+"，不能排车 !";
					this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
					return null;
				}
			}	
		}catch(Exception e){
			this.setCache("SAP_INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
		return null;
	}
	
	public void getCancelAssignCar(){
		String forward=super.view();
		ResultBean resultBean = this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			return ;
		}
		List transferList =(List) resultBean.getListResult("getCancelAssignCar");
		if(transferList==null){
			log.info("================================>transferList==null");
			return ;
		}
		int size = transferList.size();
		String[] transSapTransCodes= new String [size];
		TransferBean transBean = null;
		for(int i=0;i<size;i++){
			transBean=(TransferBean)transferList.get(i);
			transSapTransCodes[i]=transBean.getSapTransCode();
		}
		this.setCache("transSapTransCodes", transSapTransCodes, "request");
	}
	
	public String cancelAssignCar(){
		try{
			//String forward=super.view();
			
			RequestHelper helper = new RequestHelper(this.getRequest());
			
			String[] sapTransCode=(String[])this.getRequest().getParameterValues("sapTransCode");
			//String[] sapTransCode=(String[])helper.getValueFromAllScopes("transSapTransCodes");
			String SAP_INVOKE_MESSAGE=null;
			this.setCache("SAP_INVOKE_MESSAGE","","request");
			if(sapTransCode==null||sapTransCode.length==0){
				log.info("sapTransCode==null||sapTransCode.length==0,没有获取sapTransCode");
				SAP_INVOKE_MESSAGE="调拨单号为空，无法取消车。";
				this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
				return null;
			}
			
			
			log.info("sapTransCode.length====="+sapTransCode.length);
			CarSynker carSynker= null;
			String result = "";
			for(int i=0;i<sapTransCode.length;i++){
				carSynker= new CarSynker();		
				log.info("sapTransCode["+i+"]====="+sapTransCode[i]);
				result=carSynker.cancelCarNo(sapTransCode[i]);
				if("S".equals(result)==false){
					SAP_INVOKE_MESSAGE="无法取消车失败。"+result;
					this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
					return null;
				}
			}
			
			//取消排车，添加排车单状态的检测
			//RequestHelper helper = new RequestHelper(this.getRequest());
			String transportId = (String)helper.getValueFromAllScopes("transportId");
			Map parameters = new HashMap();
			parameters.put("transportId", transportId);
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("getTransportById");
			ResultBean coorderResultBean = this.dbOperator(operationBean, parameters, false);
			List<TransportBean> transportList = new ArrayList<TransportBean>();
			transportList =coorderResultBean.getListResult("getTransportById");
			if(transportList==null||transportList.size()==0){
				SAP_INVOKE_MESSAGE="取消排车失败:无法获取排车单!";
				this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
				return null;
			}
			if(transportList!=null||transportList.size()>0){
				TransportBean transportBean=transportList.get(0);
				if(transportBean.getTransportStatus()!=1){
					String status="";
					if(transportBean.getTransportStatus()==2){
						status="已派车";
					}
					if(transportBean.getTransportStatus()==1){
						status="已排车";
					}		
					if(transportBean.getTransportStatus()==0){
						status="未排车";
					}
					SAP_INVOKE_MESSAGE="取消排车失败:运单状态为 "+status+"，无法取消 !";
					this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
					return null;
				}
			}		
			
			this.setCache("modifyTime",tools.tool.getDateTime(),"request");
		}catch(Exception e){
			this.setCache("SAP_INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
		return null;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSPORT041", "修改运单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPORT042", "修改运单失败", "0", this.getRequest());
		}
		return forward;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1919, MethodName:默认新增, MethodCode:add
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
		getSendCode();
	}
	
	public String setDetailList(){
		ResultBean resultBean = this.getResultBean();
		List detailList =(List) resultBean.getListResult("detailList");
		 if(detailList==null||detailList.isEmpty()){
			 return null;
		 }
		 
		 
		
		 
		 TransportDetailBean detailBean = null;
		 List<TransportDetailBean> tempList = null;
		 Map<String,List<TransportDetailBean>> transportDetailMap =new HashMap<String,List<TransportDetailBean>>();
		 String transportId=null;
		 
		 
		 String codetailIds="";
         for(int i=0,size=detailList.size();i<size;i++){
        	 detailBean=(TransportDetailBean) detailList.get(i);
        	 if(detailBean.getCodetailId()>0){
        		 codetailIds+=detailBean.getCodetailId()+",";
        	 }
		 }
         List<CustOrderDetailBean>  orderDetailBeanList=null;
		 if(codetailIds!=null&&codetailIds!=""){
			 codetailIds+="-1";
				Map parameters = new HashMap();
				parameters.put("codetailId", codetailIds);
				
				OperationBean operationBean = OperationConfigRepository.getOperationConfig("getCuOrderDetailById");
				ResultBean coorderDetailResultBean = this.dbOperator(operationBean, parameters, false);
				orderDetailBeanList =coorderDetailResultBean.getListResult("getCuOrderDetailById");
		 }
		
		 
		 for(int i=0,size=detailList.size();i<size;i++){
			 detailBean=(TransportDetailBean) detailList.get(i);
			 transportId=detailBean.getTransportId()+"";
			 tempList = transportDetailMap.get(transportId);
			 if(tempList==null){
				 tempList=new ArrayList<TransportDetailBean>();
				 transportDetailMap.put(transportId, tempList);
			 }
			 if(orderDetailBeanList!=null&&orderDetailBeanList.size()>0){
				 for(CustOrderDetailBean orderDetailBean:orderDetailBeanList){
					 if((detailBean.getCodetailId()+"").equals(orderDetailBean.getCodetailId())){
						 detailBean.setShipPointDesc(orderDetailBean.getShipPointDesc());
					 }
				 }
			 }			 
			 tempList.add(detailBean);
		 }
		 this.setCache("transportDetailMap", transportDetailMap, "request");
		 return null;
	}
	
	public void setTransportParams(){
		String[] transportsIds=this.getRequest().getParameterValues("checkTransportId");
		
		if(transportsIds==null){
			log.info("\n\n\n\n *******************transportsIds==null***************** \n\n\n");
			this.setCache("sportsIds", "", "request");
		}else{
			log.info("\n\n\n\n *******************transportsIds*****************");
			StringBuffer buffer = new StringBuffer();
			for(int i=0;i<transportsIds.length;i++){
				if(i>0){
					buffer.append("','");
				}
				buffer.append(transportsIds[i]);
				log.info(" *******************transportsIds["+i+"]="+transportsIds[i]+"***************** ");
			}
			log.info(" *******************transportsIds***************** \n\n\n");
			this.setCache("sportsIds", buffer.toString(), "request");
		}
	}

	public String searchTransportList(){
		//ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List transportLists =(List) resultBean.getListResult("SELECT");
		 if(transportLists==null){
			 log.info("================================>list==null");
			 return null;
		 }
		//log.info("list====================="+list);
		 // List<TransportBean> transportLists = new ArrayList<TransportBean>();
		 // Map<String, String> transportsIdMap=new HashMap<String, String>();
		  
		 //map<areaId,<factoryId,<materialId,<orderId,<applyId,List<transportBean>>>>>>
		  //Map<String,Map<String,Map<String, List<TransportBean>>>> transportsMap=new HashMap<String,Map<String,Map<String, List<TransportBean>>>>();
		  //Map<String,Map<String,Map<String,Map<String, List<TransportBean>>>>> factoryMap = null;
		  //Map<String,Map<String,Map<String, List<TransportBean>>>> materialMap=null;
		 // Map<String,Map<String, List<TransportBean>>> orderMap=null;
		 // Map<String, List<TransportBean>> applyMap=null;
		  TransportBean transportBean=null;
		 String transportId = null;//,areaId=null,factoryId=null,materialId=null,orderId=null,transferCode=null;
		 String transferId = null;
		 AreaRepository rep = new AreaRepository();
		 StringBuffer buffer = new StringBuffer();
		 StringBuffer transferBuffer = new StringBuffer();
		 
		 for(int i=0,size=transportLists.size();i<size;i++){
			 transportBean=(TransportBean)transportLists.get(i);
			 transportId=transportBean.getTransportId()+"";
			 transferId=transportBean.getTransId()+"";
			 transportBean.setAreaName(rep.getFullAreaName(transportBean.getAreaId(), "", true)+transportBean.getCaddrDetail());

			 if(i>0){
				 buffer.append("','");
				 transferBuffer.append("','");
			 }
			 buffer.append(transportId);
			 transferBuffer.append(transferId);
		 }
		 this.setCache("transferIds",   transferBuffer.toString(), "request");
		 this.setCache("transportsIds", buffer.toString(), "request");
		 this.setCache("transportLists", transportLists, "request");
		 return null;
	}
	
	public String getTransportDetail(){
		RequestHelper helper = new RequestHelper(this.getRequest());
		List transportLists =(List)helper.getValueFromAllScopes("transportLists");
		if(transportLists==null||transportLists.isEmpty()){
			log.info("================================>transportLists==null||transportLists.isEmpty()");
			return null;
		}
		String forward = super.list();
		ResultBean resultBean = this.getResultBean();
		List transportsDetailList =(List) resultBean.getListResult("transportsDetail");
		Map<String,TransportDetailBean> detailMap = new HashMap<String,TransportDetailBean>();
		TransportDetailBean detailBean = null;
		if(transportsDetailList!=null){
			for(int i=0,size=transportsDetailList.size();i<size;i++){
				detailBean=(TransportDetailBean)transportsDetailList.get(i);
				detailMap.put(detailBean.getTransportId()+"", detailBean);
			}
			
		}else{
			log.info("================================>transportsDetail==null");
		}
		
		List shipList =(List) resultBean.getListResult("shipList");
		Map<String,ShipBean> shipMap = new HashMap<String,ShipBean>();
		ShipBean shipBean=null;
		if(shipList!=null){
			for(int i=0,size=shipList.size();i<size;i++){
				shipBean=(ShipBean)shipList.get(i);
				shipMap.put(shipBean.getTransId()+"", shipBean);
			}
			
		}else{
			log.info("================================>shipList==null");
		}
		
		List sendList =(List) resultBean.getListResult("sendList");
		Map<String,SendBean> sendMap = new HashMap<String,SendBean>();
		SendBean sendBean=null;
		if(sendList!=null){
			for(int i=0,size=sendList.size();i<size;i++){
				sendBean=(SendBean)sendList.get(i);
				sendMap.put(sendBean.getTransportId()+"", sendBean);
			}
		}else{
			log.info("================================>sendList==null");
		}
		
		
		 TransportBean transportBean=null;
		 String transportId = null;//,areaId=null,factoryId=null,materialId=null,orderId=null,transferCode=null;
		 String transId =null;
		 ProductBean productBean=null;
		 FactoryBean factoryBean=null;
		 for(int i=0,size=transportLists.size();i<size;i++){
			 transportBean=(TransportBean)transportLists.get(i);
			 transportId=transportBean.getTransportId()+"";
			 transId=transportBean.getTransId()+"";
			 
			 detailBean= detailMap.get(transportId);
			 
			 if(detailBean!=null){
				 productBean=ProductRepository.getProduct(detailBean.getProductId()+"");
				 if(productBean!=null){
					 transportBean.setProductName(productBean.getProductName());
				 }
				 factoryBean=FactoryRepository.getFactory(detailBean.getFactoryId());
				 if(factoryBean!=null){
					 transportBean.setFactoryName(factoryBean.getFactoryName());
				 }
				 if(detailBean.getShipPointDesc()!=null){
					 transportBean.setShipPointDesc(detailBean.getShipPointDesc());
				 }
				 if(detailBean.getCodetailCertificateDesc()!=null){
					 transportBean.setCodetailCertificateDesc(detailBean.getCodetailCertificateDesc());
				 }
			 }
			 
			 sendBean= sendMap.get(transportId);
			 if(sendBean!=null){
				 transportBean.setDriverName(sendBean.getDriverName());
				 transportBean.setCarNo(sendBean.getVehicleNo());
				 transportBean.setSendStatus(sendBean.getSendStatus()+1);//派车
			 }
			 
			 shipBean = shipMap.get(transId);
			 if(shipBean!=null){
				 transportBean.setShipNotice(shipBean.getShipNotice());
			 }
			 
		 }
		
		 this.setCache("transportLists", transportLists, "request");
		 return null;
	}
	public void getSendCode(){
		Date date= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Random random = new Random();
		int code=random.nextInt(1000);
		String sendCode = sdf.format(date)+code;
		  this.getRequest().setAttribute("sendCode", sendCode);
	}
	//DefautMethod,MethodId:1924, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1922, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1923, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1921, MethodName:默认删除, MethodCode:delete
	//Self Define Method End.
}

