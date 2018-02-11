package com.zzy.htms.dictionary.traderprice;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.constants.ConsoleConsts;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.utils.PageCtl;
import com.mobilecn.utils.RequestHelper;
import com.zzy.htms.dictionary.area.AreaBean;
import com.zzy.htms.dictionary.factory.FactoryBean;
import com.zzy.htms.dictionary.factory.FactoryRepository;
import com.zzy.htms.dictionary.product.ProductBean;
import com.zzy.htms.dictionary.product.ProductRepository;
import com.zzy.htms.dictionary.route.RouteBean;
import com.zzy.htms.dictionary.route.RouteRepository;
import com.zzy.htms.log.HtmsLogger;

/**
 * 贸易商运价业务类
 * @author zzy
 *
 */
public class TraderPriceBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
		//	HtmsLogger.log("TRADERPRICE001", "增加运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRADERPRICE002", "增加运价失败", "0", this.getRequest());
		}
		//TraderPriceRepository.reload();
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRADERPRICE011", "删除运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRADERPRICE012", "删除运价失败", "0", this.getRequest());
		}
		//TraderPriceRepository.reload();
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
		//	HtmsLogger.log("TRADERPRICE021", "查看运价列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRADERPRICE022", "查看运价列表失败", "0", this.getRequest());
		}
		searchTraderPrice();
		
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
		//	HtmsLogger.log("TRADERPRICE031", "查看运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRADERPRICE032", "查看运价失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	HtmsLogger.log("TRADERPRICE041", "修改运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRADERPRICE042", "修改运价失败", "0", this.getRequest());
		}
		//TraderPriceRepository.reload();
		return forward;
	}
	
	/**
	 * 查找贸易商运价
	 */
	public void searchTraderPrice(){
		RequestHelper helper = new RequestHelper(this.getRequest());
		//String factoryId = (String)helper.getValueFromAllScopes("factoryId");
		//String productId = (String)helper.getValueFromAllScopes("productId");
		String[] factoryId = this.getParameterValues("factoryIdSH");
		String[] productId = this.getParameterValues("productIdSH");
		String provinceId = (String)helper.getValueFromAllScopes("provinceId");
		String cityId = (String)helper.getValueFromAllScopes("cityId");
		String countyId = (String)helper.getValueFromAllScopes("countyId");
		String countryId = (String)helper.getValueFromAllScopes("countryId");
		String validateDate = (String)helper.getValueFromAllScopes("cacheValidateDate");
		String areaId =this.isNull(countryId)?countyId:countryId;
		areaId =this.isNull(areaId)?cityId:areaId;
		areaId =this.isNull(areaId)?provinceId:areaId;
		
		List<TraderPriceBean> traderPriceList=TraderPriceRepository.getRouteList(factoryId, productId, areaId, validateDate);
		//RouteRepository routeRepository = new RouteRepository();
		//List<RouteBean> routeList=routeRepository.getRouteList(factoryId, productId, areaId);
		int totalCount = traderPriceList==null?0:traderPriceList.size();
		PageCtl pageCtl  =this.getPageCtl();
		pageCtl.setTotalCount(totalCount);
		int startRow = pageCtl.getBeginRow(),endRow = pageCtl.getEndRow();
		List<TraderPriceBean> currentPriceList=new ArrayList<TraderPriceBean>();
		for(int i=startRow;i<totalCount&&i<endRow;i++){
			currentPriceList.add(traderPriceList.get(i));
		}
//		log.info(" currentPriceList  Size==="+(currentPriceList==null?0:currentPriceList.size()));
		//this.setCache("routeList", currentRouteList, "request");
		this.cachePriceList(currentPriceList);
		this.setCache("pageCtl", pageCtl,"request");
		
		 List<AreaBean> provinceList=RouteRepository.getProvinceList(),cityList=RouteRepository.getCityList(),
		 countyList=RouteRepository.getCountyList(),countryList=RouteRepository.getCountryList();
/*		 log.info(" traderPriceList  Size==="+(traderPriceList==null?0:traderPriceList.size()));
		 log.info(" provinceList  Size==="+(provinceList==null?0:provinceList.size()));
		 log.info(" cityList  Size==="+(cityList==null?0:cityList.size()));
		 log.info(" countyList  Size==="+(countyList==null?0:countyList.size()));
		 log.info(" countryList  Size==="+(countryList==null?0:countryList.size()));*/
		 tools.tool.clear(traderPriceList);
		
		 /*if(productId!=null&&productId.length>0){	
				ProductBean productBean=null;
				List<ProductBean> checkProductList = new ArrayList<ProductBean>();
				for(int i=0;i<productId.length;i++){
					productBean=ProductRepository.getProduct(productId[i]);
					checkProductList.add(productBean);
				}
				this.setCache("checkProductList",checkProductList,"request");
				//this.setCache("cacheProductId", productId, "request");
			}
		 if(factoryId!=null&&factoryId.length>0){	
				 FactoryBean factoryBean=null;
				List<FactoryBean> checkFactoryList = new ArrayList<FactoryBean>();
				for(int i=0;i<factoryId.length;i++){
					factoryBean=FactoryRepository.getFactory(factoryId[i]);
					checkFactoryList.add(factoryBean);
				}
				this.setCache("checkFactoryList",checkFactoryList,"request");
				// this.setCache("cacheFactoryId", factoryId, "request");
			}*/
		 this.setCache("provinceList", provinceList, "request");
		 this.setCache("cityList", cityList, "request");
		 this.setCache("countyList", countyList, "request");
		 this.setCache("countryList", countryList, "request");
		 this.setCache("validateDateList", TraderPriceRepository.getPriceValidateDateList(), "request");
		 
		 this.setCache("cacheProvinceId", provinceId, "request");
		 this.setCache("cacheCityId", cityId, "request");
		 this.setCache("cacheCountyId", countyId, "request");
		 this.setCache("cacheCountryId", countryId, "request");
		 this.setCache("cacheValidateDate", validateDate, "request");
	}
	
	
	/**
	 * 缓存贸易商运价
	 * @param traderList
	 * @return
	 */
	public String cachePriceList(List traderList){
		/*ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");*/
		 if(traderList==null){
			 return null;
		 }
		//System.out.println("list====================="+list);
		  List<TraderPriceBean> traderLists = new ArrayList<TraderPriceBean>();
		  List<TraderPriceBean> traderRouteLists = new ArrayList<TraderPriceBean>();
		 // List<TraderPriceBean> traderLists = new ArrayList<TraderPriceBean>();
		 // List<TraderPriceBean> traderRouteLists = new ArrayList<TraderPriceBean>();
		  Map<String,Map<String,Map<String, List<TraderPriceBean>>>> traderpriceMap = new HashMap<String,Map<String,Map<String, List<TraderPriceBean>>>>();
			 Map<String,Map<String, List<TraderPriceBean>>> factoryMap=null;
			 Map<String, List<TraderPriceBean>> areaMap=null;
			 TraderPriceBean traderBean=null;
			 String customerId = null,productId= null,factoryId= null,areaId= null;
			 for(int i=0,size=traderList.size();i<size;i++){
				 traderBean=(TraderPriceBean)traderList.get(i);
				// customerId = traderBean.getCustomerId()+"";
				 productId= traderBean.getProductId()+"";
				 factoryId= traderBean.getFactoryId()+"";
				 areaId= traderBean.getAreaId()+"";
				 
				 
				 
				/* productMap=custPricesMap.get(customerId);
				 if(productMap==null){
					 productMap=new HashMap<String,Map<String,Map<String, List<TraderPriceBean>>>>();
					 custPricesMap.put(customerId, productMap);
				 }*/
				 
				 factoryMap=traderpriceMap.get(productId);
				 if(factoryMap==null){
					 factoryMap=new HashMap<String,Map<String, List<TraderPriceBean>>>();
					 traderpriceMap.put(productId, factoryMap);
				 }
				 
				 areaMap=factoryMap.get(factoryId);
				 if(areaMap==null){
					 areaMap=new HashMap<String,List<TraderPriceBean>>();
					 factoryMap.put(factoryId, areaMap);
				 }
				 
				 
				 traderLists=areaMap.get(areaId);
				 if(traderLists==null){
					 traderLists=new ArrayList<TraderPriceBean>();
					 areaMap.put(areaId, traderLists);
				 }
				 
				 traderLists.add(traderBean);
			 }
			 //traderpriceMap=null;
			 factoryMap=null;
			 areaMap=null;
			 traderLists=null;
			 
			 this.setCache("traderpriceMap", traderpriceMap, "request");
			 return null;
		/*ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		 if(traderList==null){
			 return null;
		 }
		//System.out.println("list====================="+list);
		  List<TraderPriceBean> traderLists = new ArrayList<TraderPriceBean>();
		  List<TraderPriceBean> traderRouteLists = new ArrayList<TraderPriceBean>();

		 Map<String, TraderPriceBean> traderMap=new HashMap<String, TraderPriceBean>();
		 Map<String, List<TraderPriceBean>> traderListMap=new HashMap<String, List<TraderPriceBean>>();
		 TraderPriceBean traderBean=null;
		 String mapId = null;
		 for(int i=0,size=traderList.size();i<size;i++){
			 traderBean=(TraderPriceBean)traderList.get(i);
			 mapId=""+traderBean.getAreaId()+traderBean.getProductId()+traderBean.getFactoryId();
			 traderBean.setMapId(mapId);
			// System.out.println("mapId==============="+mapId);
			
			 traderLists=traderListMap.get(mapId);
			 if(traderLists==null){
				 traderLists = new ArrayList<TraderPriceBean>();
				 traderListMap.put(mapId,traderLists);
			 }
			 traderLists.add(traderBean);

			 if(traderMap.get(mapId)==null){
				 traderRouteLists.add(traderBean);
				 traderMap.put(mapId,traderBean);
			 }
			 //System.out.println("traderBean==============="+traderBean);
		 }
		 tools.tool.clear(traderMap);
		 this.setCache("traderRouteLists", traderRouteLists, "request");
		 this.setCache("traderListMap", traderListMap, "request");
		 return null;*/
	}
	
	/**
	 * 查找贸易商运价
	 * @return
	 */
	public String searchForPrice(){
		ResultBean resultBean =this.exeSQL(false);
		if (resultBean==null) {
			return ConsoleConsts.NULL;
		}
		this.setResultBean(resultBean);
		checkSuccess();
		
		this.setSqlCache();
		
		setOperationCache();
		
		RequestHelper helper = new RequestHelper(this.getRequest());
		//String factoryId = (String)helper.getValueFromAllScopes("factoryId");
		//String productId = (String)helper.getValueFromAllScopes("productId");
		String[] factoryId = this.getRequest().getParameterValues("factoryIdSH");
		String[] productId = this.getRequest().getParameterValues("productIdSH");
		String provinceId = (String)helper.getValueFromAllScopes("provinceId");
		String cityId = (String)helper.getValueFromAllScopes("cityId");
		String countyId = (String)helper.getValueFromAllScopes("countyId");
		String countryId = (String)helper.getValueFromAllScopes("countryId");
		String areaId =this.isNull(countryId)?countyId:countryId;
		areaId =this.isNull(areaId)?cityId:areaId;
		areaId =this.isNull(areaId)?provinceId:areaId;
		
		RouteRepository routeRepository = new RouteRepository();
		List<RouteBean> routeList=routeRepository.getRouteList(factoryId, productId, areaId);
		int totalCount = routeList==null?0:routeList.size();
		
		String curPage=(String)helper.getValueFromAllScopes("curpage");
		curPage=this.isNull(curPage)?"1":curPage;
		PageCtl pageCtl=this.getPageCtl();
		pageCtl=pageCtl==null?new PageCtl(this.getRequest()):pageCtl;
		pageCtl.setPerPageCount(100);
		pageCtl.setCurPage(tools.tool.toInt(curPage));
		pageCtl.setTotalCount(totalCount);
		
		pageCtl.reCalculate();
		
		int startRow = pageCtl.getBeginRow(),endRow = pageCtl.getEndRow();
		List<RouteBean> currentRouteList=new ArrayList<RouteBean>();
		//System.out.println(" routeList  startRow==="+startRow+",endRow==="+endRow+",totalCount==="+totalCount+",curPage="+curPage);
		for(int i=startRow;i<totalCount&&i<endRow;i++){
			currentRouteList.add(routeList.get(i));
		}

		tools.tool.sortList(currentRouteList, "areaId", false);
		tools.tool.sortList(currentRouteList, "factoryId", false);
		tools.tool.sortList(currentRouteList, "productId", false);

		// System.out.println(" routeList  Size==="+(routeList==null?0:routeList.size()));
		this.setCache("routeList", currentRouteList, "request");
		this.setCache("totalCount", totalCount, "request");
		this.setCache("pricePageCtl", pageCtl,"request");
		
		 List<AreaBean> provinceList=RouteRepository.getProvinceList(),cityList=RouteRepository.getCityList(),
		 countyList=RouteRepository.getCountyList(),countryList=RouteRepository.getCountryList();
		/* System.out.println(" currentRouteList  Size==="+(currentRouteList==null?0:currentRouteList.size()));
		 System.out.println(" provinceList  Size==="+(provinceList==null?0:provinceList.size()));
		 System.out.println(" cityList  Size==="+(cityList==null?0:cityList.size()));
		 System.out.println(" countyList  Size==="+(countyList==null?0:countyList.size()));
		 System.out.println(" countryList  Size==="+(countryList==null?0:countryList.size()));
		 *///tools.tool.clear(routeList);
		 if(productId!=null&&productId.length>0){	
				ProductBean productBean=null;
				List<ProductBean> checkProductList = new ArrayList<ProductBean>();
				for(int i=0;i<productId.length;i++){
					productBean=ProductRepository.getProduct(productId[i]);
					checkProductList.add(productBean);
				}
				this.setCache("checkProductList",checkProductList,"request");
				//this.setCache("cacheProductId", productId, "request");
			}
		 if(factoryId!=null&&factoryId.length>0){	
				 FactoryBean factoryBean=null;
				List<FactoryBean> checkFactoryList = new ArrayList<FactoryBean>();
				for(int i=0;i<factoryId.length;i++){
					factoryBean=FactoryRepository.getFactory(factoryId[i]);
					checkFactoryList.add(factoryBean);
				}
				this.setCache("checkFactoryList",checkFactoryList,"request");
				// this.setCache("cacheFactoryId", factoryId, "request");
			}
		 this.setCache("provinceList", provinceList, "request");
		 this.setCache("cityList", cityList, "request");
		 this.setCache("countyList", countyList, "request");
		 this.setCache("countryList", countryList, "request");
		 
		 this.setCache("cacheProvinceId", provinceId, "request");
		 this.setCache("cacheCityId", cityId, "request");
		 this.setCache("cacheCountyId", countyId, "request");
		 this.setCache("cacheCountryId", countryId, "request");
		 
		 
		String priceType = (String)helper.getValueFromAllScopes("priceType");
		String priceUnit = (String)helper.getValueFromAllScopes("priceUnit");
		String priceStart = (String)helper.getValueFromAllScopes("priceStart");
		String priceEnd = (String)helper.getValueFromAllScopes("priceEnd");
		String freightModel = (String)helper.getValueFromAllScopes("freightModel");
		String validateDate = (String)helper.getValueFromAllScopes("validateDate");
		
		this.setCache("cachePriceType", priceType, "request");
		 this.setCache("cachePriceUnit", priceUnit, "request");
		 this.setCache("cachePriceStart", priceStart, "request");
		 this.setCache("cachePriceEnd", priceEnd, "request");
		 this.setCache("cacheFreightModel", freightModel, "request");
		 this.setCache("cacheValidateDate", validateDate, "request");
		 HtmsLogger.log("ROUTE091", "批量增加运价查询线路", "1", this.getRequest());
		 return "listPage";
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1873, MethodName:默认删除, MethodCode:delete
	//DefautMethod,MethodId:1874, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1875, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1876, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1871, MethodName:默认新增, MethodCode:add
	//Self Define Method End.
}

