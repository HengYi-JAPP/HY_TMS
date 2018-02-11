package com.zzy.htms.dictionary.transprice;

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
 * 正常运价缓存实现类
 * @author zzy
 *
 */
public class TranspriceRepository extends AbstractBusinessExecutor{
private static boolean isLoad = false;
/*是否同步其他远程主机*/
/*private static boolean syncRemove = true;

	public static boolean isSyncRemove() {
	return syncRemove;
}
public static void setSyncRemove(boolean syncRemove) {
	TranspriceRepository.syncRemove = syncRemove;
}*/

	/**
	 * 清空当前缓存
	 */
	public static void reload(){
		isLoad = false;
		 tools.tool.clear(allTransPriceList);
		 tools.tool.clear(routePriceMap);
		 tools.tool.clear(validatePriceMap);
		 tools.tool.clear(priceValidateDateList);
		 
		 allTransPriceList=null;
		 routePriceMap=null;
		 validatePriceMap=null;		 
		 priceValidateDateList=null;
		 
		 allTransPriceList=new ArrayList<TransPriceBean>();
		 routePriceMap= new HashMap<String,List<TransPriceBean>>();
		 validatePriceMap= new HashMap<String,List<TransPriceBean>>();		 
		 priceValidateDateList=new ArrayList<String>();
		/*if(isSyncRemove()){
			CacheSynker.syncRemoveHost(CacheSynker.TRANS_PRICE);
		}*/
	}

	private static List<TransPriceBean> allTransPriceList = new ArrayList<TransPriceBean>();
	private static Map<String,List<TransPriceBean>> routePriceMap= new HashMap<String,List<TransPriceBean>>();
	private static Map<String,List<TransPriceBean>> validatePriceMap= new HashMap<String,List<TransPriceBean>>();
	private static List<String> priceValidateDateList = new ArrayList<String>();

	
	public static List<String> getPriceValidateDateList() {
		return priceValidateDateList;
	}
	public static void setPriceValidateDateList(List<String> priceValidateDateList) {
		TranspriceRepository.priceValidateDateList = priceValidateDateList;
	}
	public  void load(){
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllTransferPrice");
		ResultBean resultBean = this.dbOperator(operationBean, new HashMap(), false);
		List list =resultBean.getListResult("loadAllTransferPrice");
		if(list==null){
			log.info("没用运价信息");
			//System.out.println("没用运价信息");
		}else{	
			//setSyncRemove(false);
			reload();
			//setSyncRemove(true);
			TransPriceBean transPriceBean = null;
			List<TransPriceBean> transPriceList = null;
			
			String routeId = null,validateDate=null,transPriceId=null;
			 Map<String,TransPriceBean> pricesMap= new HashMap<String,TransPriceBean>();
			 for(int i=0,size=list.size();i<size;i++){
				 transPriceBean=(TransPriceBean)list.get(i);
				 
				 transPriceId=transPriceBean.getPriceId()+"";
				 if(pricesMap.get(transPriceId)!=null){
					 continue;
				 }
				 pricesMap.put(transPriceId, transPriceBean);
				 
				 allTransPriceList.add(transPriceBean);
				 
				 routeId = transPriceBean.getRouteId()+"";
				 validateDate=transPriceBean.getValidateDate();
				 
				 transPriceList=routePriceMap.get(routeId);
				 if(transPriceList==null){
					 transPriceList= new ArrayList<TransPriceBean>();
					 routePriceMap.put(routeId, transPriceList);
				 }
				 transPriceList.add(transPriceBean);
				 
				 transPriceList=validatePriceMap.get(validateDate);
				 if(transPriceList==null){
					 transPriceList= new ArrayList<TransPriceBean>();
					 validatePriceMap.put(validateDate, transPriceList);
					 priceValidateDateList.add(validateDate);
				 }
				 transPriceList.add(transPriceBean);
				 
				 tools.tool.clear(pricesMap);
				isLoad=true;
			 }
		}
	}
	
	/**
	 * 通过线路取正常运价
	 * @param routeId
	 * @return
	 */
	public static List<TransPriceBean> getPriceList(String routeId){
		if(routePriceMap==null||routePriceMap.isEmpty()){
			TranspriceRepository transRepository = new TranspriceRepository();
			transRepository.load();
		}
		if(routePriceMap==null||routePriceMap.isEmpty()){
			return null;
		}
		return routePriceMap.get(routeId);
	}
	
	/**
	 * 通过正常运价ID获取正常运价
	 * @param priceId
	 * @return
	 */
	public static TransPriceBean getTransPriceById(String priceId){
		if(allTransPriceList==null||allTransPriceList.isEmpty()){
			TranspriceRepository transRepository = new TranspriceRepository();
			transRepository.load();
		}
		for(TransPriceBean transPriceBean:allTransPriceList){
			if(transPriceBean!=null&&(transPriceBean.getPriceId()+"").equals(priceId)){
				return transPriceBean;
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
	public static TransPriceBean getRouteTransPrice(String routeId,BigDecimal tonNum,String orderDateTime){
		TransPriceBean priceBean  = null;
		BigDecimal zero =new BigDecimal("0.00");
		if(routeId==null||"".equals(routeId.trim())||tonNum.compareTo(zero)<0){
			log.info("TransPriceBean:getRouteTransPrice  routeId==null||\"\".equals(routeId.trim())||tonNum.compareTo(zero)<0");
			return priceBean;
		}
		List<TransPriceBean> routePriceList= getPriceList(routeId);
		if(routePriceList==null||routePriceList.isEmpty()){
			log.info("TransPriceBean:getRouteTransPrice  routePriceList==null||routePriceList.isEmpty(),routeId="+routeId);
			return priceBean;
		}
		//log.info("routePriceList=="+routePriceList.size());
		
		List<TransPriceBean> tempPriceList=new ArrayList<TransPriceBean>();
		BigDecimal tempStartValue = null,tempEndValue = null;
		BigDecimal multiNum =new  BigDecimal("1000.00");
		String TON="24",KG="25",unit=null;
		
		//System.out.println("TransPriceBean:getRouteTransPrice  routeId="+routeId+"   routePriceList size:"+routePriceList.size());
		for(int i=0,size=routePriceList.size();i<size;i++){
			priceBean=routePriceList.get(i);
			tempStartValue=priceBean.getStartValue();
			tempEndValue=priceBean.getEndValue();
			unit=priceBean.getPriceUnit();
			if(TON.equals(unit)){//将按吨计转换成按公斤计算
				tempStartValue=tempStartValue.multiply(multiNum);
				tempEndValue=tempEndValue.multiply(multiNum);
			}
			//System.out.println("TranspriceRepository:getRouteTransPrice   tempStartValue=="+tempStartValue+",tempEndValue=="+tempEndValue+",tonNum=="+tonNum+",validateDate="+priceBean.getValidateDate()+",tempDateTime="+priceBean.getLongValidateDate()+",priceId="+priceBean.getPriceId());
			if(tonNum.compareTo(tempStartValue)>0&&tonNum.compareTo(tempEndValue)<=0){
				tempPriceList.add(priceBean);
			}
		}
		priceBean=null;
		if(tempPriceList==null||tempPriceList.isEmpty()){
			//System.out.println("TranspriceRepository:getRouteTransPrice   tempPriceList==null||tempPriceList.isEmpty()");
			return priceBean;
		}
		//log.info("tempPriceList=="+tempPriceList.size());
		
		long longOrderDateTime=TransPriceBean.pasreDateTimeToLong(orderDateTime, null),
		currentDateTime = System.currentTimeMillis(),tempDateTime=0,minInterval=0,tempInterval=0;
		
		
		//System.out.println("TranspriceRepository:getRouteTransPrice  pasreDateTimeToLong: "+orderDateTime+"   "+longOrderDateTime);
		
		
		if(longOrderDateTime<-1){
			log.info("TranspriceRepository:getRouteTransPrice   longOrderDateTime<-1");
			return priceBean;
		}
		//log.info("longOrderDateTime=="+longOrderDateTime);
		
		TransPriceBean tempPriceBean = null,suitablePriceBean = null;
		long createTime=0,modifyTime = 0,tempCreateTime=0,tempModifyTime = 0;
		//String tempDateTime = null;
		for(int i=0,size=tempPriceList.size();i<size;i++){
			tempPriceBean=tempPriceList.get(i);
			tempDateTime=tempPriceBean.getLongValidateDate();
			/*
			if(tempDateTime>currentDateTime){//未生效的价格，跳过
				log.info("未生效的价格，跳过 tempPriceBean.priceId=="+tempPriceBean.getPriceId());
				continue;
			}
			tempInterval=tempDateTime-longOrderDateTime;
			tempInterval=tempInterval<0?-tempInterval:tempInterval;//如果是负数，则取反获得正数。
			*/
			//log.info("["+i+"]currentDateTime=="+currentDateTime+",longOrderDateTime=="+longOrderDateTime+",tempDateTime=="+tempDateTime+",validateDate="+tempPriceBean.getValidateDate()+",priceId="+tempPriceBean.getPriceId());
			if(tempDateTime>currentDateTime||tempDateTime>longOrderDateTime){//在下订单之前生产的运价才有效，之后 生效的运价不算跳过
				log.info("TranspriceRepository:getRouteTransPrice   未生效的价格，跳过 tempPriceBean.priceId=="+tempPriceBean.getPriceId());
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
				createTime=tools.tool.pasreDateTimeToLong(suitablePriceBean.getCreateTime(),null);
				modifyTime=tools.tool.pasreDateTimeToLong(suitablePriceBean.getModifyTime(),null);
				createTime=modifyTime>createTime?modifyTime:createTime;
				
				/*同时一个运价中，创建时间和修改时间，取最大的一个时间*/
				tempCreateTime=tools.tool.pasreDateTimeToLong(tempPriceBean.getCreateTime(),null);
				tempModifyTime=tools.tool.pasreDateTimeToLong(tempPriceBean.getModifyTime(),null);
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
	 * 通过工厂产品,区域,申请时间(与生效时间做对比)获取正常运价
	 * @param factoryId
	 * @param productId
	 * @param areaId
	 * @param validateDate
	 * @return
	 */
	public static List<TransPriceBean> getRouteList(String factoryId,String productId,String areaId,String validateDate){
		if(allTransPriceList==null||allTransPriceList.isEmpty()){
			TranspriceRepository rep = new TranspriceRepository();
			rep.load();
		}
		if(allTransPriceList==null||allTransPriceList.isEmpty()){
			return null;
		}
		if((factoryId==null||"".equals(factoryId.trim()))&&(productId==null||"".equals(productId.trim()))&&(areaId==null||"".equals(areaId.trim()))&&(validateDate==null||"".equals(validateDate.trim()))){
			return resetTransPriceList(allTransPriceList);
		}
		log.info(" allTransPriceList  Size==="+(allTransPriceList==null?0:allTransPriceList.size()));
		List<RouteBean> routeList=RouteRepository.getRouteList(factoryId, productId, areaId);
		List<TransPriceBean> validateDatePriceList=getValidateDatePriceList(validateDate);
		if(routeList==null||routeList.isEmpty()){
			return resetTransPriceList(validateDatePriceList);
		}
		List<TransPriceBean> transPriceList =getRoutePriceList(routeList);
		if(transPriceList==null||transPriceList.isEmpty()){
			return resetTransPriceList(validateDatePriceList);
		}
		if(validateDatePriceList==null||validateDatePriceList.isEmpty()){
			return resetTransPriceList(transPriceList);
		}
		List<TransPriceBean> newPriceList = new ArrayList<TransPriceBean>();
		Map<String,TransPriceBean> pricesMap= new HashMap<String,TransPriceBean>();
		TransPriceBean transPriceBean=null;
		for(int i=0,size=validateDatePriceList.size();i<size;i++){
			transPriceBean=validateDatePriceList.get(i);
			pricesMap.put(transPriceBean.getPriceId()+"", transPriceBean);
		}
		
		for(int i=0,size=transPriceList.size();i<size;i++){
			transPriceBean=transPriceList.get(i);
			if(pricesMap.get(transPriceBean.getPriceId()+"")==null){
				continue;
			}
			newPriceList.add(transPriceBean);
		}
		return resetTransPriceList(newPriceList);
	}
	
	
	/**
	 * 通过多个工厂\产品\ 单个区域ID,申请时间获取正常运价
	 * @param factoryId
	 * @param productId
	 * @param areaId
	 * @param validateDate
	 * @return
	 */
	public static List<TransPriceBean> getRouteList(String[] factoryId,String[] productId,String areaId,String validateDate){
		if(allTransPriceList==null||allTransPriceList.isEmpty()){
			TranspriceRepository rep = new TranspriceRepository();
			rep.load();
		}
		if(allTransPriceList==null||allTransPriceList.isEmpty()){
			return null;
		}
		if((factoryId==null||factoryId.length==0)&&(productId==null||productId.length==0)&&(areaId==null||"".equals(areaId.trim()))&&(validateDate==null||"".equals(validateDate.trim()))){
			return resetTransPriceList(allTransPriceList);
		}
		log.info(" allTransPriceList  Size==="+(allTransPriceList==null?0:allTransPriceList.size()));
		List<RouteBean> routeList=RouteRepository.getRouteList(factoryId, productId, areaId);
		List<TransPriceBean> validateDatePriceList=getValidateDatePriceList(validateDate);
		if(routeList==null||routeList.isEmpty()){
			return resetTransPriceList(validateDatePriceList);
		}
		List<TransPriceBean> transPriceList =getRoutePriceList(routeList);
		if(transPriceList==null||transPriceList.isEmpty()){
			return resetTransPriceList(validateDatePriceList);
		}
		if(validateDatePriceList==null||validateDatePriceList.isEmpty()){
			return resetTransPriceList(transPriceList);
		}
		List<TransPriceBean> newPriceList = new ArrayList<TransPriceBean>();
		Map<String,TransPriceBean> pricesMap= new HashMap<String,TransPriceBean>();
		TransPriceBean transPriceBean=null;
		for(int i=0,size=validateDatePriceList.size();i<size;i++){
			transPriceBean=validateDatePriceList.get(i);
			pricesMap.put(transPriceBean.getPriceId()+"", transPriceBean);
		}
		
		for(int i=0,size=transPriceList.size();i<size;i++){
			transPriceBean=transPriceList.get(i);
			if(pricesMap.get(transPriceBean.getPriceId()+"")==null){
				continue;
			}
			newPriceList.add(transPriceBean);
		}
		return resetTransPriceList(newPriceList);
	}
	
	public static List<TransPriceBean> resetTransPriceList(List<TransPriceBean> transPriceList){
		if(transPriceList==null||transPriceList.isEmpty()){
			return transPriceList;
		}
		String routeId = null;
		RouteBean routeBean=null;
		TransPriceBean transBean = null;
		List<TransPriceBean> newPriceList = new ArrayList<TransPriceBean>();
		
		for(int i=0,size=transPriceList.size();i<size;i++){
			transBean=transPriceList.get(i);
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
		}
		tools.tool.clear(transPriceList);
		transPriceList=null;
		return newPriceList;
		
	}
	public static List<TransPriceBean> getValidateDatePriceList(String validateDate){
		if(validatePriceMap==null||validatePriceMap.isEmpty()){
			TranspriceRepository transRepository = new TranspriceRepository();
			transRepository.load();
		}
		if(validatePriceMap==null||validatePriceMap.isEmpty()){
			return null;
		}
		return validatePriceMap.get(validateDate);
	}
	
	public static List<TransPriceBean> getRoutePriceList(List<RouteBean> routeList){
		if(routeList==null||routeList.isEmpty()){
			return null;
		}
		List<TransPriceBean> transPriceList = new ArrayList<TransPriceBean>(),tempList=null;
		RouteBean routeBean= null;
		for(int i=0,size=routeList.size();i<size;i++){
			routeBean=routeList.get(i);
			tempList=getPriceList(routeBean.getRouteId()+"");
			if(tempList==null||tempList.isEmpty()){
				continue;
			}
			transPriceList.addAll(tempList);
		}
		return transPriceList;
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
 
