package com.zzy.htms.sales.customerprice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.constants.ConsoleConsts;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
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
 * 特殊客户运价业务实现类
 * @author zzy
 *
 */
public class CustomerPriceBusiness extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		//CustomerPriceRepository.reload();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERPRICE001", "增加客户运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERPRICE002", "增加客户运价失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		//CustomerPriceRepository.reload();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERPRICE011", "删除客户运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERPRICE012", "删除客户运价失败", "0", this.getRequest());
		}
		
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERPRICE021", "查看客户运价列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERPRICE022", "查看客户运价列表失败", "0", this.getRequest());
		}
		searchTransPrice();
		
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERPRICE031", "查看客户运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERPRICE032", "查看客户运价失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		//CustomerPriceRepository.reload();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERPRICE041", "修改客户运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERPRICE042", "修改客户运价失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String loadPriceList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		 if(list==null){
			 return null;
		 }
		//log.info("list====================="+list);
		  List<CustomerPriceBean> customerLists = new ArrayList<CustomerPriceBean>();
		  List<CustomerPriceBean> customerRouteLists = new ArrayList<CustomerPriceBean>();

		 Map<String, CustomerPriceBean> customerMap=new HashMap<String, CustomerPriceBean>();
		 Map<String, List<CustomerPriceBean>> customerListMap=new HashMap<String, List<CustomerPriceBean>>();
		 CustomerPriceBean customerBean=null;
		 String mapId = null;
		 for(int i=0,size=list.size();i<size;i++){
			 customerBean=(CustomerPriceBean)list.get(i);
			 mapId=""+customerBean.getAreaId()+customerBean.getProductId()+customerBean.getFactoryId();
			 customerBean.setMapId(mapId);
			// log.info("mapId==============="+mapId);
			
			 customerLists=customerListMap.get(mapId);
			 if(customerLists==null){
				 customerLists = new ArrayList<CustomerPriceBean>();
				 customerListMap.put(mapId,customerLists);
			 }
			 customerLists.add(customerBean);

			 if(customerMap.get(mapId)==null){
				 customerRouteLists.add(customerBean);
				 customerMap.put(mapId,customerBean);
			 }
			 //log.info("transBean==============="+transBean);
		 }
		 tools.tool.clear(customerMap);
		 this.setCache("customerRouteLists", customerRouteLists, "request");
		 this.setCache("customerListMap", customerListMap, "request");
		 return null;
	}
	
	public void searchTransPrice(){
		RequestHelper helper = new RequestHelper(this.getRequest());
		String customerId = (String)helper.getValueFromAllScopes("customerId");
		//String factoryId = (String)helper.getValueFromAllScopes("factoryId");
		//String productId = (String)helper.getValueFromAllScopes("productId");
		String[] factoryId = this.getParameterValues("factoryIdSH");
		String[] productId = this.getParameterValues("productIdSH");
		String provinceId = (String)helper.getValueFromAllScopes("provinceId");
		String cityId = (String)helper.getValueFromAllScopes("cityId");
		String countyId = (String)helper.getValueFromAllScopes("countyId");
		String countryId = (String)helper.getValueFromAllScopes("countryId");
		String validateDate = (String)helper.getValueFromAllScopes("validateDate");
		
		String areaId =this.isNull(countryId)?countyId:countryId;
		areaId =this.isNull(areaId)?cityId:areaId;
		areaId =this.isNull(areaId)?provinceId:areaId;
		
		List<CustomerPriceBean> transPriceList=CustomerPriceRepository.getRouteList(customerId,factoryId, productId, areaId, validateDate);
		
		//RouteRepository routeRepository = new RouteRepository();
		//List<RouteBean> routeList=routeRepository.getRouteList(factoryId, productId, areaId);
		int totalCount = transPriceList==null?0:transPriceList.size();
		PageCtl pageCtl  =this.getPageCtl();
		pageCtl.setTotalCount(totalCount);
		int startRow = pageCtl.getBeginRow(),endRow = pageCtl.getEndRow();
		List<CustomerPriceBean> currentPriceList=new ArrayList<CustomerPriceBean>();
		for(int i=startRow;i<totalCount&&i<endRow;i++){
			currentPriceList.add(transPriceList.get(i));
		}
		 log.info(" currentPriceList  Size==="+(currentPriceList==null?0:currentPriceList.size()));
		//this.setCache("routeList", currentRouteList, "request");
		this.cachePriceList(currentPriceList);
		this.setCache("pageCtl", pageCtl,"request");
		
		 List<AreaBean> provinceList=RouteRepository.getProvinceList(),cityList=RouteRepository.getCityList(),
		 countyList=RouteRepository.getCountyList(),countryList=RouteRepository.getCountryList();
		 log.info(" transPriceList  Size==="+(transPriceList==null?0:transPriceList.size()));
		 log.info(" provinceList  Size==="+(provinceList==null?0:provinceList.size()));
		 log.info(" cityList  Size==="+(cityList==null?0:cityList.size()));
		 log.info(" countyList  Size==="+(countyList==null?0:countyList.size()));
		 log.info(" countryList  Size==="+(countryList==null?0:countryList.size()));
		 tools.tool.clear(transPriceList);
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
		 this.setCache("validateDateList", CustomerPriceRepository.getPriceValidateDateList(), "request");
		 
		 this.setCache("cacheCustomerId", customerId, "request");
		 this.setCache("cacheFactoryId", factoryId, "request");
		 this.setCache("cacheProductId", productId, "request");
		 this.setCache("cacheProvinceId", provinceId, "request");
		 this.setCache("cacheCityId", cityId, "request");
		 this.setCache("cacheCountyId", countyId, "request");
		 this.setCache("cacheCountryId", countryId, "request");
		 this.setCache("cacheValidateDate", validateDate, "request");
	}
	
	public String cachePriceList(List transList){
		/*ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");*/
		 if(transList==null){
			 return null;
		 }
		//log.info("list====================="+list);
		  List<CustomerPriceBean> transLists = new ArrayList<CustomerPriceBean>();
		 // List<CustomerPriceBean> transRouteLists = new ArrayList<CustomerPriceBean>();

		// Map<String, CustomerPriceBean> transMap=new HashMap<String, CustomerPriceBean>();
		 //Map<String, List<CustomerPriceBean>> transListMap=new HashMap<String, List<CustomerPriceBean>>();
		 //<customerId,<productId,<factoryId,<areaId,List<CustomerPriceBean>>>>>
		 Map<String,Map<String,Map<String,Map<String, List<CustomerPriceBean>>>>> custPricesMap=new HashMap<String,Map<String,Map<String,Map<String, List<CustomerPriceBean>>>>>();
		 Map<String,Map<String,Map<String, List<CustomerPriceBean>>>> productMap = null;
		 Map<String,Map<String, List<CustomerPriceBean>>> factoryMap=null;
		 Map<String, List<CustomerPriceBean>> areaMap=null;
		 CustomerPriceBean transBean=null;
		 String customerId = null,productId= null,factoryId= null,areaId= null;
		 for(int i=0,size=transList.size();i<size;i++){
			 transBean=(CustomerPriceBean)transList.get(i);
			 customerId = transBean.getCustomerId()+"";
			 productId= transBean.getProductId()+"";
			 factoryId= transBean.getFactoryId()+"";
			 areaId= transBean.getAreaId()+"";
			 
			 
			 
			 productMap=custPricesMap.get(customerId);
			 if(productMap==null){
				 productMap=new HashMap<String,Map<String,Map<String, List<CustomerPriceBean>>>>();
				 custPricesMap.put(customerId, productMap);
			 }
			 
			 factoryMap=productMap.get(productId);
			 if(factoryMap==null){
				 factoryMap=new HashMap<String,Map<String, List<CustomerPriceBean>>>();
				 productMap.put(productId, factoryMap);
			 }
			 
			 areaMap=factoryMap.get(factoryId);
			 if(areaMap==null){
				 areaMap=new HashMap<String,List<CustomerPriceBean>>();
				 factoryMap.put(factoryId, areaMap);
			 }
			 
			 
			 transLists=areaMap.get(areaId);
			 if(transLists==null){
				 transLists=new ArrayList<CustomerPriceBean>();
				 areaMap.put(areaId, transLists);
			 }
			 
			 transLists.add(transBean);
		 }
		 productMap=null;
		 factoryMap=null;
		 areaMap=null;
		 transLists=null;
		 //tools.tool.clear(transMap);
		 //this.setCache("transRouteLists", transRouteLists, "request");
		// this.setCache("transListMap", transListMap, "request");
		 this.setCache("custPricesMap", custPricesMap, "request");
		 
		 return null;
	}
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
		for(int i=startRow;i<totalCount&&i<endRow;i++){
			currentRouteList.add(routeList.get(i));
		}

		tools.tool.sortList(routeList, "areaId", false);
		tools.tool.sortList(routeList, "factoryId", false);
		tools.tool.sortList(routeList, "productId", false);
		
		this.setCache("routeList", currentRouteList, "request");
		this.setCache("totalCount", totalCount, "request");
		this.setCache("pricePageCtl", pageCtl,"request");
		
		 List<AreaBean> provinceList=RouteRepository.getProvinceList(),cityList=RouteRepository.getCityList(),
		 countyList=RouteRepository.getCountyList(),countryList=RouteRepository.getCountryList();
		 log.info(" routeAreaList  Size==="+(routeList==null?0:routeList.size()));
		 log.info(" provinceList  Size==="+(provinceList==null?0:provinceList.size()));
		 log.info(" cityList  Size==="+(cityList==null?0:cityList.size()));
		 log.info(" countyList  Size==="+(countyList==null?0:countyList.size()));
		 log.info(" countryList  Size==="+(countryList==null?0:countryList.size()));
		 //tools.tool.clear(routeList);
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
		 
		 this.setCache("cacheFactoryId", factoryId, "request");
		 this.setCache("cacheProductId", productId, "request");
		 this.setCache("cacheProvinceId", provinceId, "request");
		 this.setCache("cacheCityId", cityId, "request");
		 this.setCache("cacheCountyId", countyId, "request");
		 this.setCache("cacheCountryId", countryId, "request");
		 
		
		String customerId = (String)helper.getValueFromAllScopes("customerId");
		String priceType = (String)helper.getValueFromAllScopes("priceType");
		String priceUnit = (String)helper.getValueFromAllScopes("priceUnit");
		//String priceStart = (String)helper.getValueFromAllScopes("priceStart");
		//String priceEnd = (String)helper.getValueFromAllScopes("priceEnd");
		String freightModel = (String)helper.getValueFromAllScopes("freightModel");
		String validateDate = (String)helper.getValueFromAllScopes("validateDate");
		
		this.setCache("cacheCustomerId", customerId, "request");
		this.setCache("cachePriceType", priceType, "request");
		this.setCache("cachePriceUnit", priceUnit, "request");
		// this.setCache("cachePriceStart", priceStart, "request");
		// this.setCache("cachePriceEnd", priceEnd, "request");
		 this.setCache("cacheFreightModel", freightModel, "request");
		 this.setCache("cacheValidateDate", validateDate, "request");
		 HtmsLogger.log("ROUTE091", "批量增加运价查询线路", "1", this.getRequest());
		 return "listPage";
	}
}
