package com.zzy.htms.dictionary.traderprice;

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
 * 贸易商运价
 * @author zzy
 *
 */
public class TraderPriceRepository extends AbstractBusinessExecutor{
private static boolean isLoad = false;
/*是否同步其他远程主机*/
/*private static boolean syncRemove = true;

	public static boolean isSyncRemove() {
	return syncRemove;
}
public static void setSyncRemove(boolean syncRemove) {
	TraderPriceRepository.syncRemove = syncRemove;
}*/
	/**
	 * 清除贸易商运价缓存信息
	 */
	public static void reload(){
		isLoad = false;
		 tools.tool.clear(allTraderPriceList);
		 tools.tool.clear(routePriceMap);
		 tools.tool.clear(validatePriceMap);
		 tools.tool.clear(priceValidateDateList);
		 
		 allTraderPriceList=null;
		 routePriceMap=null;
		 validatePriceMap=null;		 
		 priceValidateDateList=null;
		 
		 allTraderPriceList=new ArrayList<TraderPriceBean>();
		 routePriceMap= new HashMap<String,List<TraderPriceBean>>();
		 validatePriceMap= new HashMap<String,List<TraderPriceBean>>();		 
		 priceValidateDateList=new ArrayList<String>();
		/*	if(isSyncRemove()){
				CacheSynker.syncRemoveHost(CacheSynker.TRADE_PRICE);
			}*/
	}

	private static List<TraderPriceBean> allTraderPriceList = new ArrayList<TraderPriceBean>();
	private static Map<String,List<TraderPriceBean>> routePriceMap= new HashMap<String,List<TraderPriceBean>>();
	private static Map<String,List<TraderPriceBean>> validatePriceMap= new HashMap<String,List<TraderPriceBean>>();
	private static List<String> priceValidateDateList = new ArrayList<String>();

	
	public static List<String> getPriceValidateDateList() {
		return priceValidateDateList;
	}
	public static void setPriceValidateDateList(List<String> priceValidateDateList) {
		TraderPriceRepository.priceValidateDateList = priceValidateDateList;
	}
	
	/**
	 * 加载贸易商运价缓存信息
	 */
	public  void load(){
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllTraderPrice");
		ResultBean resultBean = this.dbOperator(operationBean, new HashMap(), false);
		List list =resultBean.getListResult("loadAllTraderPrice");
		if(list==null){
			log.info("没用运价信息");
			//System.out.println("没用运价信息");
		}else{	
			//setSyncRemove(false);
			reload();
			//setSyncRemove(true);
			TraderPriceBean traderPriceBean = null;
			List<TraderPriceBean> traderPriceList = null;
			
			String routeId = null,validateDate=null,traderPriceId=null;
			 Map<String,TraderPriceBean> pricesMap= new HashMap<String,TraderPriceBean>();
			 for(int i=0,size=list.size();i<size;i++){
				 traderPriceBean=(TraderPriceBean)list.get(i);
				 
				 traderPriceId=traderPriceBean.getPriceId()+"";
				 if(pricesMap.get(traderPriceId)!=null){
					 continue;
				 }
				 pricesMap.put(traderPriceId, traderPriceBean);
				 
				 allTraderPriceList.add(traderPriceBean);
				 
				 routeId = traderPriceBean.getRouteId()+"";
				 validateDate=traderPriceBean.getValidateDate();
				 
				 traderPriceList=routePriceMap.get(routeId);
				 if(traderPriceList==null){
					 traderPriceList= new ArrayList<TraderPriceBean>();
					 routePriceMap.put(routeId, traderPriceList);
				 }
				 traderPriceList.add(traderPriceBean);
				 
				 traderPriceList=validatePriceMap.get(validateDate);
				 if(traderPriceList==null){
					 traderPriceList= new ArrayList<TraderPriceBean>();
					 validatePriceMap.put(validateDate, traderPriceList);
					 priceValidateDateList.add(validateDate);
				 }
				 traderPriceList.add(traderPriceBean);
				 
				 tools.tool.clear(pricesMap);
				isLoad=true;
			 }
		}
	}
	
	/**
	 * 通过线路获取贸易商运价信息
	 * @param routeId
	 * @return
	 */
	public static List<TraderPriceBean> getPriceList(String routeId){
		if(routePriceMap==null||routePriceMap.isEmpty()){
			TraderPriceRepository traderRepository = new TraderPriceRepository();
			traderRepository.load();
		}
		if(routePriceMap==null||routePriceMap.isEmpty()){
			return null;
		}
		return routePriceMap.get(routeId);
	}
	
	
	/**
	 * 通过运价id获取贸易商运价信息
	 * @param priceId
	 * @return
	 */
	public static TraderPriceBean getTraderPriceById(String priceId){
		if(allTraderPriceList==null||allTraderPriceList.isEmpty()){
			TraderPriceRepository traderRepository = new TraderPriceRepository();
			traderRepository.load();
		}
		for(TraderPriceBean traderPriceBean:allTraderPriceList){
			if(traderPriceBean!=null&&(traderPriceBean.getPriceId()+"").equals(priceId)){
				return traderPriceBean;
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
	public static TraderPriceBean getRouteTraderPrice(String routeId,BigDecimal tonNum,String orderDateTime){
		TraderPriceBean priceBean  = null;
		BigDecimal zero =new BigDecimal("0.00");
		if(routeId==null||"".equals(routeId.trim())||tonNum.compareTo(zero)<0){
			log.info("TraderPriceBean:getRouteTraderPrice  routeId==null||\"\".equals(routeId.trim())||tonNum.compareTo(zero)<0");
			return priceBean;
		}
		List<TraderPriceBean> routePriceList= getPriceList(routeId);
		if(routePriceList==null||routePriceList.isEmpty()){
			log.info("TraderPriceBean:getRouteTraderPrice  routePriceList==null||routePriceList.isEmpty(),routeId="+routeId);
			return priceBean;
		}
		//log.info("routePriceList=="+routePriceList.size());
		
		List<TraderPriceBean> tempPriceList=new ArrayList<TraderPriceBean>();
		BigDecimal tempStartValue = null,tempEndValue = null;
		BigDecimal multiNum =new  BigDecimal("1000.00");
		String TON="24",KG="25",unit=null;
		
		//log.info("TraderPriceBean:getRouteTraderPrice  routeId="+routeId+"   routePriceList size:"+routePriceList.size());
		for(int i=0,size=routePriceList.size();i<size;i++){
			priceBean=routePriceList.get(i);
			tempStartValue=priceBean.getStartValue();
			tempEndValue=priceBean.getEndValue();
			unit=priceBean.getPriceUnit();
			if(TON.equals(unit)){//将按吨计转换成按公斤计算
				tempStartValue=tempStartValue.multiply(multiNum);
				tempEndValue=tempEndValue.multiply(multiNum);
			}
			//System.out.println("TraderpriceRepository:getRouteTraderPrice   tempStartValue=="+tempStartValue+",tempEndValue=="+tempEndValue+",tonNum=="+tonNum+",validateDate="+priceBean.getValidateDate()+",tempDateTime="+priceBean.getLongValidateDate()+",priceId="+priceBean.getPriceId());
			if(tonNum.compareTo(tempStartValue)>0&&tonNum.compareTo(tempEndValue)<=0){
				tempPriceList.add(priceBean);
			}
		}
		priceBean=null;
		if(tempPriceList==null||tempPriceList.isEmpty()){
			log.info("TraderpriceRepository:getRouteTraderPrice   tempPriceList==null||tempPriceList.isEmpty()");
			return priceBean;
		}
		//log.info("tempPriceList=="+tempPriceList.size());
		
		long longOrderDateTime=TraderPriceBean.pasreDateTimeToLong(orderDateTime, null),
		currentDateTime = System.currentTimeMillis(),tempDateTime=0,minInterval=0,tempInterval=0;
		
		
		log.info("TraderPriceRepository:getRouteTraderPrice  pasreDateTimeToLong: "+orderDateTime+"   "+longOrderDateTime);
		
		
		if(longOrderDateTime<-1){
			log.info("TraderPriceRepository:getRouteTraderPrice   longOrderDateTime<-1");
			return priceBean;
		}
		//log.info("longOrderDateTime=="+longOrderDateTime);
		
		TraderPriceBean tempPriceBean = null,suitablePriceBean = null;
		long createTime=0,modifyTime = 0,tempCreateTime=0,tempModifyTime = 0;
		//String tempDateTime = null;
		for(int i=0,size=tempPriceList.size();i<size;i++){
			tempPriceBean=tempPriceList.get(i);
			tempDateTime=tempPriceBean.getLongValidateDate();

			//log.info("["+i+"]currentDateTime=="+currentDateTime+",longOrderDateTime=="+longOrderDateTime+",tempDateTime=="+tempDateTime+",validateDate="+tempPriceBean.getValidateDate()+",priceId="+tempPriceBean.getPriceId());
			if(tempDateTime>currentDateTime||tempDateTime>longOrderDateTime){//在下订单之前生产的运价才有效，之后 生效的运价不算跳过
				log.info("TraderPriceRepository:getRouteTraderPrice   未生效的价格，跳过 tempPriceBean.priceId=="+tempPriceBean.getPriceId());
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
	 * 通过工厂,产品,地址,有效期获取贸易商运价信息
	 * @param factoryId
	 * @param productId
	 * @param areaId
	 * @param validateDate
	 * @return
	 */
	public static List<TraderPriceBean> getRouteList(String factoryId,String productId,String areaId,String validateDate){
		if(allTraderPriceList==null||allTraderPriceList.isEmpty()){
			TraderPriceRepository rep = new TraderPriceRepository();
			rep.load();
		}
		if(allTraderPriceList==null||allTraderPriceList.isEmpty()){
			return null;
		}
		if((factoryId==null||"".equals(factoryId.trim()))&&(productId==null||"".equals(productId.trim()))&&(areaId==null||"".equals(areaId.trim()))&&(validateDate==null||"".equals(validateDate.trim()))){
			return resetTraderPriceList(allTraderPriceList);
		}
		log.info(" allTraderPriceList  Size==="+(allTraderPriceList==null?0:allTraderPriceList.size()));
		List<RouteBean> routeList=RouteRepository.getRouteList(factoryId, productId, areaId);
		List<TraderPriceBean> validateDatePriceList=getValidateDatePriceList(validateDate);
		if(routeList==null||routeList.isEmpty()){
			return resetTraderPriceList(validateDatePriceList);
		}
		List<TraderPriceBean> traderPriceList =getRoutePriceList(routeList);
		if(traderPriceList==null||traderPriceList.isEmpty()){
			return resetTraderPriceList(validateDatePriceList);
		}
		if(validateDatePriceList==null||validateDatePriceList.isEmpty()){
			return resetTraderPriceList(traderPriceList);
		}
		List<TraderPriceBean> newPriceList = new ArrayList<TraderPriceBean>();
		Map<String,TraderPriceBean> pricesMap= new HashMap<String,TraderPriceBean>();
		TraderPriceBean traderPriceBean=null;
		for(int i=0,size=validateDatePriceList.size();i<size;i++){
			traderPriceBean=validateDatePriceList.get(i);
			pricesMap.put(traderPriceBean.getPriceId()+"", traderPriceBean);
		}
		
		for(int i=0,size=traderPriceList.size();i<size;i++){
			traderPriceBean=traderPriceList.get(i);
			if(pricesMap.get(traderPriceBean.getPriceId()+"")==null){
				continue;
			}
			newPriceList.add(traderPriceBean);
		}
		return resetTraderPriceList(newPriceList);
	}
	
	/**
	 * 通过工厂,产品,区域,有效期获取贸易商运价信息
	 * @param factoryId
	 * @param productId
	 * @param areaId
	 * @param validateDate
	 * @return
	 */
	public static List<TraderPriceBean> getRouteList(String[] factoryId,String[] productId,String areaId,String validateDate){
		if(allTraderPriceList==null||allTraderPriceList.isEmpty()){
			TraderPriceRepository rep = new TraderPriceRepository();
			rep.load();
		}
		if(allTraderPriceList==null||allTraderPriceList.isEmpty()){
			return null;
		}
		if((factoryId==null||factoryId.length==0)&&(productId==null||productId.length==0)&&(areaId==null||"".equals(areaId.trim()))&&(validateDate==null||"".equals(validateDate.trim()))){
			return resetTraderPriceList(allTraderPriceList);
		}
		log.info(" allTraderPriceList  Size==="+(allTraderPriceList==null?0:allTraderPriceList.size()));
		List<RouteBean> routeList=RouteRepository.getRouteList(factoryId, productId, areaId);
		List<TraderPriceBean> validateDatePriceList=getValidateDatePriceList(validateDate);
		if(routeList==null||routeList.isEmpty()){
			return resetTraderPriceList(validateDatePriceList);
		}
		List<TraderPriceBean> traderPriceList =getRoutePriceList(routeList);
		if(traderPriceList==null||traderPriceList.isEmpty()){
			return resetTraderPriceList(validateDatePriceList);
		}
		if(validateDatePriceList==null||validateDatePriceList.isEmpty()){
			return resetTraderPriceList(traderPriceList);
		}
		List<TraderPriceBean> newPriceList = new ArrayList<TraderPriceBean>();
		Map<String,TraderPriceBean> pricesMap= new HashMap<String,TraderPriceBean>();
		TraderPriceBean traderPriceBean=null;
		for(int i=0,size=validateDatePriceList.size();i<size;i++){
			traderPriceBean=validateDatePriceList.get(i);
			pricesMap.put(traderPriceBean.getPriceId()+"", traderPriceBean);
			
		}
		
		for(int i=0,size=traderPriceList.size();i<size;i++){
			traderPriceBean=traderPriceList.get(i);
			if(pricesMap.get(traderPriceBean.getPriceId()+"")==null){
				continue;
			}
			newPriceList.add(traderPriceBean);
		}
		return resetTraderPriceList(newPriceList);
	}
	
	/**
	 * 按照传入的贸易商运价重置贸易商运价
	 * @param traderPriceList
	 * @return
	 */
	public static List<TraderPriceBean> resetTraderPriceList(List<TraderPriceBean> traderPriceList){
		if(traderPriceList==null||traderPriceList.isEmpty()){
			return traderPriceList;
		}
		String routeId = null;
		RouteBean routeBean=null;
		TraderPriceBean traderBean = null;
		List<TraderPriceBean> newPriceList = new ArrayList<TraderPriceBean>();
		
		for(int i=0,size=traderPriceList.size();i<size;i++){
			traderBean=traderPriceList.get(i);
			routeId=traderBean.getRouteId()+"";
			routeBean=RouteRepository.getRouteBean(routeId);
			if(routeBean==null){
				continue;
			}
			traderBean.setAreaId(routeBean.getAreaId());
			traderBean.setAreaName(routeBean.getAreaName());
			traderBean.setProductId(routeBean.getProductId());
			traderBean.setProductName(routeBean.getProductName());
			traderBean.setFactoryId(routeBean.getFactoryId());
			traderBean.setFactoryName(routeBean.getFactoryName());
			newPriceList.add(traderBean);
		}
		tools.tool.clear(traderPriceList);
		traderPriceList=null;
		return newPriceList;
	}
	
	/**
	 * 获取有效期之内的所有贸易商运价信息
	 * @param validateDate
	 * @return
	 */
	public static List<TraderPriceBean> getValidateDatePriceList(String validateDate){
		if(validatePriceMap==null||validatePriceMap.isEmpty()){
			TraderPriceRepository traderRepository = new TraderPriceRepository();
			traderRepository.load();
		}
		if(validatePriceMap==null||validatePriceMap.isEmpty()){
			return null;
		}
		return validatePriceMap.get(validateDate);
	}
	
	public static List<TraderPriceBean> getRoutePriceList(List<RouteBean> routeList){
		if(routeList==null||routeList.isEmpty()){
			return null;
		}
		List<TraderPriceBean> traderPriceList = new ArrayList<TraderPriceBean>(),tempList=null;
		RouteBean routeBean= null;
		for(int i=0,size=routeList.size();i<size;i++){
			routeBean=routeList.get(i);
			tempList=getPriceList(routeBean.getRouteId()+"");
			if(tempList==null||tempList.isEmpty()){
				continue;
			}
			traderPriceList.addAll(tempList);
		}
		return traderPriceList;
	}

}
 
