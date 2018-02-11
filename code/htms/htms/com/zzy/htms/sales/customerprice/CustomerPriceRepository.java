package com.zzy.htms.sales.customerprice;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.dictionary.route.RouteBean;
import com.zzy.htms.dictionary.route.RouteRepository;


/**
 * 特殊客户运价缓存实现类
 * @author zzy
 *
 */
public class CustomerPriceRepository extends AbstractBusinessExecutor{
private static boolean isLoad = false;
/*是否同步其他远程主机*/
/*private static boolean syncRemove = true;

	public static boolean isSyncRemove() {
	return syncRemove;
}
public static void setSyncRemove(boolean syncRemove) {
	CustomerPriceRepository.syncRemove = syncRemove;
}*/

	/**
	 * 清空缓存
	 */
	public static void reload(){
		isLoad = false;
		 tools.tool.clear(allCustomerPriceList);
		 tools.tool.clear(routePriceMap);
		 tools.tool.clear(validatePriceMap);
		 tools.tool.clear(priceValidateDateList);
		 tools.tool.clear(customerPriceMap);
		 
		 customerPriceMap=null;
		 allCustomerPriceList=null;
		 routePriceMap=null;
		 validatePriceMap=null;		 
		 priceValidateDateList=null;
		 
		 customerPriceMap= new HashMap<String,List<CustomerPriceBean>>();
		 allCustomerPriceList=new ArrayList<CustomerPriceBean>();
		 routePriceMap= new HashMap<String,List<CustomerPriceBean>>();
		 validatePriceMap= new HashMap<String,List<CustomerPriceBean>>();		 
		 priceValidateDateList=new ArrayList<String>();
		/*if(isSyncRemove()){
			CacheSynker.syncRemoveHost(CacheSynker.CUSTOMER_PRICE);
		}*/
	}

	private static List<CustomerPriceBean> allCustomerPriceList = new ArrayList<CustomerPriceBean>();
	private static Map<String,List<CustomerPriceBean>> routePriceMap= new HashMap<String,List<CustomerPriceBean>>();
	private static Map<String,List<CustomerPriceBean>> customerPriceMap= new HashMap<String,List<CustomerPriceBean>>();
	private static Map<String,List<CustomerPriceBean>> validatePriceMap= new HashMap<String,List<CustomerPriceBean>>();
	private static List<String> priceValidateDateList = new ArrayList<String>();

	
	public static List<String> getPriceValidateDateList() {
		return priceValidateDateList;
	}
	public static void setPriceValidateDateList(List<String> priceValidateDateList) {
		CustomerPriceRepository.priceValidateDateList = priceValidateDateList;
	}
	
	/**
	 * 加载缓存
	 */
	public  void load(){
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllCustomerPrice");
		ResultBean resultBean = this.dbOperator(operationBean, new HashMap(), false);
		List list =resultBean.getListResult("loadAllCustomerPrice");
		if(list==null){
			log.info("没用运价信息");
		}else{	
			/*setSyncRemove(false);
			 * reload();
			setSyncRemove(true);*/
			reload();
			
			CustomerPriceBean custPriceBean = null;
			List<CustomerPriceBean> custPriceList = null;
			
			String routeId = null,validateDate=null,custPriceId=null,customerId=null;
			 Map<String,CustomerPriceBean> pricesMap= new HashMap<String,CustomerPriceBean>();
			 for(int i=0,size=list.size();i<size;i++){
				 custPriceBean=(CustomerPriceBean)list.get(i);
				 
				 custPriceId=custPriceBean.getPriceId()+"";
				 if(pricesMap.get(custPriceId)!=null){
					 continue;
				 }
				 pricesMap.put(custPriceId, custPriceBean);
				 
				// log.info("\n\n custPriceBean:\n"+custPriceBean+"");
				 allCustomerPriceList.add(custPriceBean);
				 
				 customerId=custPriceBean.getCustomerId()+"";
				 custPriceList=customerPriceMap.get(customerId);
				 if(custPriceList==null){
					 custPriceList= new ArrayList<CustomerPriceBean>();
					 customerPriceMap.put(customerId, custPriceList);
				 }
				 custPriceList.add(custPriceBean);
				 
				 routeId = custPriceBean.getRouteId()+"";
				 validateDate=custPriceBean.getValidateDate();
				 
				 custPriceList=routePriceMap.get(routeId);
				 if(custPriceList==null){
					 custPriceList= new ArrayList<CustomerPriceBean>();
					 routePriceMap.put(routeId, custPriceList);
				 }
				 custPriceList.add(custPriceBean);
				 
				 custPriceList=validatePriceMap.get(validateDate);
				 if(custPriceList==null){
					 custPriceList= new ArrayList<CustomerPriceBean>();
					 validatePriceMap.put(validateDate, custPriceList);
					 priceValidateDateList.add(validateDate);
				 }
				 custPriceList.add(custPriceBean);
				 
				 tools.tool.clear(pricesMap);
				isLoad=true;
			 }
		}
	}
	
	/**
	 * 通过线路id获取特殊客户运价信息
	 * @param routeId
	 * @return
	 */
	public static List<CustomerPriceBean> getPriceList(String routeId){
		if(routePriceMap==null||routePriceMap.isEmpty()){
			CustomerPriceRepository transRepository = new CustomerPriceRepository();
			transRepository.load();
		}
		if(routePriceMap==null||routePriceMap.isEmpty()){
			return null;
		}
		return routePriceMap.get(routeId);
	}
	
	
	/**
	 * 通过特殊客户运价id获取特殊客户运价
	 * @param priceId
	 * @return
	 */
	public static CustomerPriceBean getCustemerPriceById(String priceId){
		if(allCustomerPriceList==null||allCustomerPriceList.isEmpty()){
			CustomerPriceRepository transRepository = new CustomerPriceRepository();
			transRepository.load();
		}
		for(CustomerPriceBean customerPriceBean:allCustomerPriceList){
			if(customerPriceBean!=null&&(customerPriceBean.getPriceId()+"").equals(priceId)){
				return customerPriceBean;
			}
		}
		return null;
	}
	/**
	 * 根据线路和发货数量获取运价
	 * 先获取对应区间中的运价列表；
	 * 再根据时间差获取已经生效的与定单时间最近（最接近）的运价。
	 * @param routeId
	 * @param tonNum
	 * @return
	 */
	public static CustomerPriceBean getCustomerRoutePrice(String customerId,String routeId,BigDecimal applyTonNum,String orderDateTime){
		CustomerPriceBean priceBean  = null;
		//BigDecimal zero =new BigDecimal("0.00");
		if(routeId==null||"".equals(routeId.trim())||customerId==null||"".equals(customerId.trim())){
			log.info("routeId==null||\"\".equals(routeId.trim())||customerId==null||\"\".equals(customerId())");
			return priceBean;
		}
		/*找到客户相关的运价表*/
		List<CustomerPriceBean> customerPriceList= getCustomerPriceList(customerId);
		if(customerPriceList==null||customerPriceList.isEmpty()){
			log.info("customerPriceList==null||customerPriceList()");
			return priceBean;
		}
		/*进行线路和区间匹配*/
		//List<TransPriceBean> tempPriceList=new ArrayList<TransPriceBean>();
		BigDecimal tempStartValue = null,tempEndValue = null;
		BigDecimal multiNum =new  BigDecimal("1000.00");
		String TON="24",KG="25",unit=null;
		BigDecimal tonNum = applyTonNum;
		List<CustomerPriceBean> tempPriceList=new ArrayList<CustomerPriceBean>();
		for(int i=0,size=customerPriceList.size();i<size;i++){
			 priceBean  = customerPriceList.get(i);
			 if(routeId.equals(priceBean.getRouteId()+"")){
				 tempStartValue=priceBean.getStartValue();
					tempEndValue=priceBean.getEndValue();
					unit=priceBean.getPriceUnit();
					if(unit!=null&&TON.equals(unit)){//将按吨计转换成按公斤计算
						tempStartValue=tempStartValue.multiply(multiNum);
						tempEndValue=tempEndValue.multiply(multiNum);
					}
					System.out.println("tempStartValue=="+tempStartValue+",tempEndValue=="+tempEndValue+",tonNum=="+tonNum+",validateDate="+priceBean.getValidateDate()+",tempDateTime="+priceBean.getLongValidateDate()+",priceId="+priceBean.getPriceId());
					if(tonNum.compareTo(tempStartValue)>0&&tonNum.compareTo(tempEndValue)<=0){
						tempPriceList.add(priceBean);
					}
				 //tempPriceList.add(priceBean);
			 }
		}
		
		/*进行区间匹配*/
		
		
		 priceBean  = null;
		if(tempPriceList==null||tempPriceList.isEmpty()){
			log.info("tempPriceList==null||tempPriceList.isEmpty()");
			return priceBean;
		}
		
		/*进行时间匹配，找到最合适的运价*/
		long longOrderDateTime=CustomerPriceBean.pasreDateTimeToLong(orderDateTime, null),
		currentDateTime = System.currentTimeMillis(),tempDateTime=0,minInterval=0,tempInterval=0;
		if(longOrderDateTime<-1){
			log.info("longOrderDateTime<-1");
			return priceBean;
		}
		
		CustomerPriceBean tempPriceBean = null,suitablePriceBean = null;
		long createTime=0,modifyTime = 0,tempCreateTime=0,tempModifyTime = 0;
		for(int i=0,size=tempPriceList.size();i<size;i++){
			tempPriceBean=tempPriceList.get(i);
			tempDateTime=tempPriceBean.getLongValidateDate();
			
			//log.info("["+i+"]currentDateTime=="+currentDateTime+",longOrderDateTime=="+longOrderDateTime+",tempDateTime=="+tempDateTime+",validateDate="+tempPriceBean.getValidateDate()+",priceId="+tempPriceBean.getPriceId());
			if(tempDateTime>currentDateTime||tempDateTime>longOrderDateTime){//在下订单之前生产的运价才有效，之后 生效的运价不算跳过
				log.info("未生效的价格，跳过 tempPriceBean.priceId=="+tempPriceBean.getPriceId());
				continue;
			}
			tempInterval=longOrderDateTime-tempDateTime;
			
			
			//minInterval=minInterval==0?tempInterval:(minInterval>tempInterval?tempInterval:minInterval);
			if(minInterval==0){//初始化最小时差
				minInterval=tempInterval;
				suitablePriceBean=tempPriceBean;
				continue;
			}
			
			if(minInterval>tempInterval){//比较时差，存在更小时间的情况下，更新最小时差
				minInterval=tempInterval;
				suitablePriceBean=tempPriceBean;
				continue;
			}
			if(minInterval==tempInterval){//如果两个时差相同，则取最新创建的或最近修改的那一个
				/*同时一个运价中，创建时间和修改时间，取最大的一个时间*/
				createTime=CustomerPriceBean.pasreDateTimeToLong(suitablePriceBean.getCreateTime(),null);
				modifyTime=CustomerPriceBean.pasreDateTimeToLong(suitablePriceBean.getModifyTime(),null);
				createTime=modifyTime>createTime?modifyTime:createTime;
				
				/*同时一个运价中，创建时间和修改时间，取最大的一个时间*/
				tempCreateTime=CustomerPriceBean.pasreDateTimeToLong(tempPriceBean.getCreateTime(),null);
				tempModifyTime=CustomerPriceBean.pasreDateTimeToLong(tempPriceBean.getModifyTime(),null);
				tempCreateTime=tempModifyTime>tempCreateTime?tempModifyTime:tempCreateTime;
				
				/*比较两组时间中，看哪一个最大，如果当前的大，则说明修改时间比较后，是最新的运价;其他情况不变*/
				if(tempCreateTime>createTime){
					suitablePriceBean=tempPriceBean;
				}
			}
			
		}
		return suitablePriceBean;
	}
	
	/**
	 * 通过客户id,厂区,产品,地址区域,生效日期获取特殊客户运价信息
	 * @param customerId
	 * @param factoryId
	 * @param productId
	 * @param areaId
	 * @param validateDate
	 * @return
	 */
	public static List<CustomerPriceBean> getRouteList(String customerId,String factoryId,String productId,String areaId,String validateDate){
		if(allCustomerPriceList==null||allCustomerPriceList.isEmpty()){
			CustomerPriceRepository rep = new CustomerPriceRepository();
			rep.load();
		}
		if(allCustomerPriceList==null||allCustomerPriceList.isEmpty()){
			return null;
		}
		if((customerId==null||"".equals(customerId.trim()))&&(customerId==null||"".equals(factoryId.trim()))&&(productId==null||"".equals(productId.trim()))&&(areaId==null||"".equals(areaId.trim()))&&(validateDate==null||"".equals(validateDate.trim()))){
			return resetTransPriceList(allCustomerPriceList);
		}
		
		List<CustomerPriceBean> customerPriceList=customerPriceMap.get(customerId);
		List<CustomerPriceBean> routeList=getRouteList(factoryId,productId, areaId, validateDate);
		// log.info(" allCustomerPriceList  Size==="+(allCustomerPriceList==null?0:allCustomerPriceList.size()));
		//List<RouteBean> routeList=RouteRepository.getRouteList(factoryId, productId, areaId);
		List<CustomerPriceBean> validateDatePriceList=getValidateDatePriceList(validateDate);
		
		if(routeList==null||routeList.isEmpty()){
			return resetTransPriceList(customerPriceList);
		}
		//List<CustomerPriceBean> custPriceList =getRoutePriceList(routeList);
		if(customerPriceList==null||customerPriceList.isEmpty()){
			return resetTransPriceList(routeList);
		}
		
		
		List<CustomerPriceBean> newPriceList = new ArrayList<CustomerPriceBean>();
		Map<String,CustomerPriceBean> pricesMap= new HashMap<String,CustomerPriceBean>();
		CustomerPriceBean custPriceBean=null;
		for(int i=0,size=routeList.size();i<size;i++){
			custPriceBean=routeList.get(i);
			pricesMap.put(custPriceBean.getPriceId()+"", custPriceBean);
		}
		
		for(int i=0,size=customerPriceList.size();i<size;i++){
			custPriceBean=customerPriceList.get(i);
			if(pricesMap.get(custPriceBean.getPriceId()+"")==null){
				continue;
			}
			newPriceList.add(custPriceBean);
		}
		return resetTransPriceList(newPriceList);
	}
	
	
	/**
	 * 通过厂区,产品,地址区域,生效日志获取特殊客户运价信息
	 * @param factoryId
	 * @param productId
	 * @param areaId
	 * @param validateDate
	 * @return
	 */
	public static List<CustomerPriceBean> getRouteList(String factoryId,String productId,String areaId,String validateDate){
		if(allCustomerPriceList==null||allCustomerPriceList.isEmpty()){
			CustomerPriceRepository rep = new CustomerPriceRepository();
			rep.load();
		}
		if(allCustomerPriceList==null||allCustomerPriceList.isEmpty()){
			return null;
		}
		if((factoryId==null||"".equals(factoryId.trim()))&&(productId==null||"".equals(productId.trim()))&&(areaId==null||"".equals(areaId.trim()))&&(validateDate==null||"".equals(validateDate.trim()))){
			return resetTransPriceList(allCustomerPriceList);
		}
	
		 log.info(" allCustomerPriceList  Size==="+(allCustomerPriceList==null?0:allCustomerPriceList.size()));
		List<RouteBean> routeList=RouteRepository.getRouteList(factoryId, productId, areaId);
		List<CustomerPriceBean> validateDatePriceList=getValidateDatePriceList(validateDate);
		
		if(routeList==null||routeList.isEmpty()){
			return resetTransPriceList(validateDatePriceList);
		}
		List<CustomerPriceBean> custPriceList =getRoutePriceList(routeList);
		if(custPriceList==null||custPriceList.isEmpty()){
			return resetTransPriceList(validateDatePriceList);
		}
		if(validateDatePriceList==null||validateDatePriceList.isEmpty()){
			return resetTransPriceList(custPriceList);
		}
		List<CustomerPriceBean> newPriceList = new ArrayList<CustomerPriceBean>();
		Map<String,CustomerPriceBean> pricesMap= new HashMap<String,CustomerPriceBean>();
		CustomerPriceBean custPriceBean=null;
		for(int i=0,size=validateDatePriceList.size();i<size;i++){
			custPriceBean=validateDatePriceList.get(i);
			pricesMap.put(custPriceBean.getPriceId()+"", custPriceBean);
		}
		
		for(int i=0,size=custPriceList.size();i<size;i++){
			custPriceBean=custPriceList.get(i);
			if(pricesMap.get(custPriceBean.getPriceId()+"")==null){
				continue;
			}
			newPriceList.add(custPriceBean);
		}
		return resetTransPriceList(newPriceList);
	}
	/**
	 * 通过厂区,产品,地址区域,生效日志获取特殊客户运价信息
	 * @param customerId
	 * @param factoryId
	 * @param productId
	 * @param areaId
	 * @param validateDate
	 * @return
	 */
	 
	public static List<CustomerPriceBean> getRouteList(String customerId,String[] factoryId,String[] productId,String areaId,String validateDate){
		if(allCustomerPriceList==null||allCustomerPriceList.isEmpty()){
			CustomerPriceRepository rep = new CustomerPriceRepository();
			rep.load();
		}
		if(allCustomerPriceList==null||allCustomerPriceList.isEmpty()){
			return null;
		}
		if((customerId==null||"".equals(customerId.trim()))&&(factoryId==null||factoryId.length==0)&&(productId==null||productId.length==0)&&(areaId==null||"".equals(areaId.trim()))&&(validateDate==null||"".equals(validateDate.trim()))){
			return resetTransPriceList(allCustomerPriceList);
		}
		
		List<CustomerPriceBean> customerPriceList=customerPriceMap.get(customerId);
		List<CustomerPriceBean> routeList=getRouteList(factoryId,productId, areaId, validateDate);
		// log.info(" allCustomerPriceList  Size==="+(allCustomerPriceList==null?0:allCustomerPriceList.size()));
		//List<RouteBean> routeList=RouteRepository.getRouteList(factoryId, productId, areaId);
		List<CustomerPriceBean> validateDatePriceList=getValidateDatePriceList(validateDate);
		
		if(routeList==null||routeList.isEmpty()){
			return resetTransPriceList(customerPriceList);
		}
		//List<CustomerPriceBean> custPriceList =getRoutePriceList(routeList);
		if(customerPriceList==null||customerPriceList.isEmpty()){
			return resetTransPriceList(routeList);
		}
		
		
		List<CustomerPriceBean> newPriceList = new ArrayList<CustomerPriceBean>();
		Map<String,CustomerPriceBean> pricesMap= new HashMap<String,CustomerPriceBean>();
		CustomerPriceBean custPriceBean=null;
		for(int i=0,size=routeList.size();i<size;i++){
			custPriceBean=routeList.get(i);
			pricesMap.put(custPriceBean.getPriceId()+"", custPriceBean);
		}
		
		for(int i=0,size=customerPriceList.size();i<size;i++){
			custPriceBean=customerPriceList.get(i);
			if(pricesMap.get(custPriceBean.getPriceId()+"")==null){
				continue;
			}
			newPriceList.add(custPriceBean);
		}
		return resetTransPriceList(newPriceList);
	}
	
	
	/**
	 * 通过厂区,产品,地址区域,生效日志获取特殊客户运价信息
	 * @param customerId
	 * @param factoryId
	 * @param productId
	 * @param areaId
	 * @param validateDate
	 * @return
	 */
	public static List<CustomerPriceBean> getRouteList(String[] factoryId,String[] productId,String areaId,String validateDate){
		if(allCustomerPriceList==null||allCustomerPriceList.isEmpty()){
			CustomerPriceRepository rep = new CustomerPriceRepository();
			rep.load();
		}
		if(allCustomerPriceList==null||allCustomerPriceList.isEmpty()){
			return null;
		}
		if((factoryId==null||factoryId.length==0)&&(productId==null||productId.length==0)&&(areaId==null||"".equals(areaId.trim()))&&(validateDate==null||"".equals(validateDate.trim()))){
			return resetTransPriceList(allCustomerPriceList);
		}
	
		 log.info(" allCustomerPriceList  Size==="+(allCustomerPriceList==null?0:allCustomerPriceList.size()));
		List<RouteBean> routeList=RouteRepository.getRouteList(factoryId, productId, areaId);
		List<CustomerPriceBean> validateDatePriceList=getValidateDatePriceList(validateDate);
		
		if(routeList==null||routeList.isEmpty()){
			return resetTransPriceList(validateDatePriceList);
		}
		List<CustomerPriceBean> custPriceList =getRoutePriceList(routeList);
		if(custPriceList==null||custPriceList.isEmpty()){
			return resetTransPriceList(validateDatePriceList);
		}
		if(validateDatePriceList==null||validateDatePriceList.isEmpty()){
			return resetTransPriceList(custPriceList);
		}
		List<CustomerPriceBean> newPriceList = new ArrayList<CustomerPriceBean>();
		Map<String,CustomerPriceBean> pricesMap= new HashMap<String,CustomerPriceBean>();
		CustomerPriceBean custPriceBean=null;
		for(int i=0,size=validateDatePriceList.size();i<size;i++){
			custPriceBean=validateDatePriceList.get(i);
			pricesMap.put(custPriceBean.getPriceId()+"", custPriceBean);
		}
		
		for(int i=0,size=custPriceList.size();i<size;i++){
			custPriceBean=custPriceList.get(i);
			if(pricesMap.get(custPriceBean.getPriceId()+"")==null){
				continue;
			}
			newPriceList.add(custPriceBean);
		}
		return resetTransPriceList(newPriceList);
	}
	
	
	/**
	 * 特殊客户运价实体转换
	 * @param custPriceList
	 * @return
	 */
	public static List<CustomerPriceBean> resetTransPriceList(List<CustomerPriceBean> custPriceList){
		if(custPriceList==null||custPriceList.isEmpty()){
			return custPriceList;
		}
		String routeId = null;
		RouteBean routeBean=null;
		CustomerPriceBean transBean = null;
		List<CustomerPriceBean> newPriceList = new ArrayList<CustomerPriceBean>();
		
		for(int i=0,size=custPriceList.size();i<size;i++){
			transBean=custPriceList.get(i);
			routeId=transBean.getRouteId()+"";
			routeBean=RouteRepository.getRouteBean(routeId);
			if(routeBean==null){
				continue;
			}
			transBean.setAreaId(routeBean.getAreaId());
			transBean.setAreaName(routeBean.getAreaName());
			transBean.setProductId(routeBean.getProductId());
			transBean.setProductName(routeBean.getProductName());
			transBean.setFactoryId(routeBean.getFactoryId());
			transBean.setFactoryName(routeBean.getFactoryName());
			newPriceList.add(transBean);
			log.info("\n\n\n result transBean:\n"+transBean+"\n");
		}
		tools.tool.clear(custPriceList);
		custPriceList=null;
		return newPriceList;
		
	}
	
	/**
	 * 获取有效期内的所有特殊客户运价
	 * @param validateDate
	 * @return
	 */
	public static List<CustomerPriceBean> getValidateDatePriceList(String validateDate){
		if(validatePriceMap==null||validatePriceMap.isEmpty()){
			CustomerPriceRepository transRepository = new CustomerPriceRepository();
			transRepository.load();
		}
		if(validatePriceMap==null||validatePriceMap.isEmpty()){
			return null;
		}
		return validatePriceMap.get(validateDate);
	}
	
	/**
	 * 通过客户id获取所有特殊客户运价信息
	 * @param customerId
	 * @return
	 */
	public static List<CustomerPriceBean> getCustomerPriceList(String customerId){
		if(customerPriceMap==null||customerPriceMap.isEmpty()){
			CustomerPriceRepository transRepository = new CustomerPriceRepository();
			transRepository.load();
		}
		if(customerPriceMap==null||customerPriceMap.isEmpty()){
			return null;
		}
		return customerPriceMap.get(customerId);
	}
	
	/**
	 * 通过线路获取所有特殊客户运价信息
	 * @param routeList
	 * @return
	 */
	public static List<CustomerPriceBean> getRoutePriceList(List<RouteBean> routeList){
		if(routeList==null||routeList.isEmpty()){
			return null;
		}
		List<CustomerPriceBean> custPriceList = new ArrayList<CustomerPriceBean>(),tempList=null;
		RouteBean routeBean= null;
		for(int i=0,size=routeList.size();i<size;i++){
			routeBean=routeList.get(i);
			tempList=getPriceList(routeBean.getRouteId()+"");
			if(tempList==null||tempList.isEmpty()){
				continue;
			}
			custPriceList.addAll(tempList);
		}
		return custPriceList;
	}
	/*
	public static long getIntervalDays(Date fDate, Date oDate) {

	       if (null == fDate || null == oDate) {

	           return -1;

	       }

	       long intervalMilli = oDate.getTime() - fDate.getTime();

	       return  (intervalMilli / (24 * 60 * 60 * 1000));

	    }*/
}
 
