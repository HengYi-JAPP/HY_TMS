package com.zzy.htms.logistic.freight;

import java.math.BigDecimal;
import java.util.List;

import com.abcer.log.Logger;
import com.zzy.htms.dictionary.route.RouteBean;
import com.zzy.htms.dictionary.route.RouteRepository;
import com.zzy.htms.dictionary.traderprice.TraderPriceBean;
import com.zzy.htms.dictionary.traderprice.TraderPriceRepository;
import com.zzy.htms.dictionary.transprice.TransPriceBean;
import com.zzy.htms.dictionary.transprice.TranspriceRepository;
import com.zzy.htms.sales.customerprice.CustomerPriceBean;
import com.zzy.htms.sales.customerprice.CustomerPriceRepository;


/**
 * 运价公共方法
 * @author zzy
 *
 */
public class PriceUtil {
	 private static Logger log= Logger.getLogger();
	/**
	 * 根据产品、提供工厂、送货地址、重量和申请时间，获取该线路的有效运价
	 * @param productId
	 * @param factoryId
	 * @param areaId
	 * @param tonAmount
	 */
	public static TransPriceBean getRoutePrice(String productId,String factoryId,String areaId, String tonAmount,String applyTime){
		if(tonAmount==null||"".equals(tonAmount.trim())||applyTime==null||"".equals(applyTime.trim())){
			log.info("tonAmount==null||applyTime==null,申请数量或时间为空。");
			return null;
		}
		List<RouteBean>  routeList=RouteRepository.getMatchRoutes(productId, factoryId, areaId);
		
		if(routeList==null||routeList.isEmpty()){
			log.info("routeList==null||routeList.isEmpty(),没有找到合适的线路。");
			return null;
		}
		RouteBean routeBean=null;
		//log.info("getRoutePrice routeBean=="+routeBean);
		BigDecimal tonNum=new BigDecimal(tonAmount);
		/**/
		
		TransPriceBean priceBean =null;//TranspriceRepository.getRouteTransPrice(routeBean.getRouteId()+"", tonNum, applyTime);
		
		//log.info("");
		for(int i=0,size=routeList.size();i<size;i++){
			routeBean=routeList.get(i);
			//log.info("PriceUtil:getRoutePrice   routeBean   getRouteId: "+routeBean.getRouteId()+"   tonNum:"+tonNum+"   applyTime:"+applyTime);
			 priceBean =TranspriceRepository.getRouteTransPrice(routeBean.getRouteId()+"", tonNum, applyTime);
			 if(priceBean!=null){
				//log.info("priceBean=="+priceBean);
				 return priceBean;
			 }
		}
		log.info("没有找到合适的线路运价");
		return priceBean;
	}
	
	/**
	 * 根据线路和客户ID找客户运价。
	 * @param productId
	 * @param factoryId
	 * @param areaId
	 * @param customerId
	 */
	public static CustomerPriceBean getCustomerPrice(String productId,String factoryId,String areaId,String customerId,BigDecimal applyTonNum,String applyTime){
		log.info("productId="+productId+",factoryId="+factoryId+",areaId="+areaId+",customerId="+customerId+",applyTime="+applyTime);
		if(applyTime==null||"".equals(applyTime.trim())){
			log.info("getCustomerPrice tonAmount==null||applyTime==null,申请数量或时间为空。");
			return null;
		}
		List<RouteBean>  routeList=RouteRepository.getMatchRoutes(productId, factoryId, areaId);
		
		if(routeList==null||routeList.isEmpty()){
			log.info("getCustomerPrice routeList==null||routeList.isEmpty(),没有找到合适的线路。");
			return null;
		}
		
		RouteBean routeBean=null;
		//log.info("getRoutePrice routeBean=="+routeBean);
		//BigDecimal tonNum=new BigDecimal(tonAmount);
		
		CustomerPriceBean priceBean =null;//TranspriceRepository.getRouteTransPrice(routeBean.getRouteId()+"", tonNum, applyTime);
		for(int i=0,size=routeList.size();i<size;i++){
			routeBean=routeList.get(i);
			//log.info("===========================size="+size+",i="+i);
			//log.info("getRoutePrice routeBean=="+routeBean);
			//log.info("===========================");//*///
			 priceBean =CustomerPriceRepository.getCustomerRoutePrice(customerId, routeBean.getRouteId()+"",applyTonNum, applyTime);
			 if(priceBean!=null){
					log.info("CustomerPriceBean priceBean=="+priceBean);
				 return priceBean;
			 }
		}
		log.info("getCustomerPrice 没有找到合适的客户运价");
		return priceBean;
	}
	
	/**
	 * 通过产品,工厂,地址区域,申请数量,申请时间获取贸易商运价信息
	 * @param productId
	 * @param factoryId
	 * @param areaId
	 * @param applyTonNum
	 * @param applyTime
	 * @return
	 */
	public static TraderPriceBean getTraderPrice(String productId,String factoryId,String areaId,BigDecimal applyTonNum,String applyTime){
		log.info("productId="+productId+",factoryId="+factoryId+",areaId="+areaId+",applyTime="+applyTime);
		if(applyTime==null||"".equals(applyTime.trim())){
			log.info("getTraderPrice tonAmount==null||applyTime==null,申请数量或时间为空。");
			return null;
		}
		List<RouteBean>  routeList=RouteRepository.getMatchRoutes(productId, factoryId, areaId);
		
		if(routeList==null||routeList.isEmpty()){
			log.info("getTraderPrice routeList==null||routeList.isEmpty(),没有找到合适的线路。");
			return null;
		}
		
		RouteBean routeBean=null;
		//log.info("getRoutePrice routeBean=="+routeBean);
		//BigDecimal tonNum=new BigDecimal(tonAmount);
		
		TraderPriceBean priceBean =null;//TranspriceRepository.getRouteTransPrice(routeBean.getRouteId()+"", tonNum, applyTime);
		for(int i=0,size=routeList.size();i<size;i++){
			routeBean=routeList.get(i);
			//log.info("===========================size="+size+",i="+i);
			//log.info("getRoutePrice routeBean=="+routeBean);
			//log.info("===========================");//*///
			 priceBean =TraderPriceRepository.getRouteTraderPrice( routeBean.getRouteId()+"",applyTonNum, applyTime);
			 if(priceBean!=null){
				 log.info("TraderPriceBean priceBean=="+priceBean);
				 return priceBean;
			 }
		}
		log.info("getCustomerPrice 没有找到合适的客户运价");
		return priceBean;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		 //getRoutePrice("2", "1","19540", "8.600","2017-09-16 08:42:41");
		//productId=2,factoryId=3,areaId=12669,customerId=696,applyTime=2017-09-10 08:31:43
		// getCustomerPrice("2","3","12669","696","2017-09-10 08:31:43");
		/*
		 * productId=2,factoryId=1,areaId=341,tonAmount=212.00,applyTime=2017-09-25 09:49:33
		 */
		//getRoutePrice("2","1","341", "212.00","2017-09-25 09:49:33");
		//productId=2,factoryId=1,areaId=12673,customerId=2,applyTime=2017-09-29 12:43:00
		BigDecimal applyTonNum = new BigDecimal("4000.00");
		getCustomerPrice("2","1","12673","2", applyTonNum,"2017-09-29 12:43:00");
		/*log.info("2017-09-16 08:42:41 ====="+tools.tool.pasreDateTimeToLong("2017-09-16 08:42:41", null));
		log.info("2017-09-15 ====="+tools.tool.pasreDateTimeToLong("2017-09-15", null));
		log.info("2017-09-08 ====="+tools.tool.pasreDateTimeToLong("2017-09-08", null));
		log.info("2017-09-10 ====="+tools.tool.pasreDateTimeToLong("2017-09-10", null));
		log.info("2017-09-20 ====="+tools.tool.pasreDateTimeToLong("2017-09-20", null));*/

	}

}
