package com.zzy.htms.dictionary.transprice;
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
 * 正常运价业务类
 * @author zzy
 *
 */
public class TransPriceBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
		//	HtmsLogger.log("TRANSPRICE001", "增加运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPRICE002", "增加运价失败", "0", this.getRequest());
		}
		//TranspriceRepository.reload();
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSPRICE011", "删除运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPRICE012", "删除运价失败", "0", this.getRequest());
		}
		//TranspriceRepository.reload();
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
		//	HtmsLogger.log("TRANSPRICE021", "查看运价列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPRICE022", "查看运价列表失败", "0", this.getRequest());
		}
		searchTransPrice();
		
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
		//	HtmsLogger.log("TRANSPRICE031", "查看运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPRICE032", "查看运价失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	HtmsLogger.log("TRANSPRICE041", "修改运价成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSPRICE042", "修改运价失败", "0", this.getRequest());
		}
		//TranspriceRepository.reload();
		return forward;
	}
	
	/**
	 * 搜索正常运价
	 */
	public void searchTransPrice(){
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
		
		List<TransPriceBean> transPriceList=TranspriceRepository.getRouteList(factoryId, productId, areaId, validateDate);
		
		//RouteRepository routeRepository = new RouteRepository();
		//List<RouteBean> routeList=routeRepository.getRouteList(factoryId, productId, areaId);
		int totalCount = transPriceList==null?0:transPriceList.size();
		PageCtl pageCtl  =this.getPageCtl();
		pageCtl.setTotalCount(totalCount);
		int startRow = pageCtl.getBeginRow(),endRow = pageCtl.getEndRow();
		List<TransPriceBean> currentPriceList=new ArrayList<TransPriceBean>();
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
		 this.setCache("validateDateList", TranspriceRepository.getPriceValidateDateList(), "request");
		 
		 this.setCache("cacheProvinceId", provinceId, "request");
		 this.setCache("cacheCityId", cityId, "request");
		 this.setCache("cacheCountyId", countyId, "request");
		 this.setCache("cacheCountryId", countryId, "request");
		 this.setCache("cacheValidateDate", validateDate, "request");
	}
	
	
	/**
	 * 缓存正常运价
	 * @param transList
	 * @return
	 */
	public String cachePriceList(List transList){
		/*ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");*/
		 if(transList==null){
			 return null;
		 }
		//System.out.println("list====================="+list);
		  List<TransPriceBean> transLists = new ArrayList<TransPriceBean>();
		  List<TransPriceBean> transRouteLists = new ArrayList<TransPriceBean>();
		 // List<TransPriceBean> transLists = new ArrayList<TransPriceBean>();
		 // List<TransPriceBean> transRouteLists = new ArrayList<TransPriceBean>();
		  Map<String,Map<String,Map<String, List<TransPriceBean>>>> transpriceMap = new HashMap<String,Map<String,Map<String, List<TransPriceBean>>>>();
			 Map<String,Map<String, List<TransPriceBean>>> factoryMap=null;
			 Map<String, List<TransPriceBean>> areaMap=null;
			 TransPriceBean transBean=null;
			 String customerId = null,productId= null,factoryId= null,areaId= null;
			 for(int i=0,size=transList.size();i<size;i++){
				 transBean=(TransPriceBean)transList.get(i);
				// customerId = transBean.getCustomerId()+"";
				 productId= transBean.getProductId()+"";
				 factoryId= transBean.getFactoryId()+"";
				 areaId= transBean.getAreaId()+"";
				 
				 
				 
				/* productMap=custPricesMap.get(customerId);
				 if(productMap==null){
					 productMap=new HashMap<String,Map<String,Map<String, List<TransPriceBean>>>>();
					 custPricesMap.put(customerId, productMap);
				 }*/
				 
				 factoryMap=transpriceMap.get(productId);
				 if(factoryMap==null){
					 factoryMap=new HashMap<String,Map<String, List<TransPriceBean>>>();
					 transpriceMap.put(productId, factoryMap);
				 }
				 
				 areaMap=factoryMap.get(factoryId);
				 if(areaMap==null){
					 areaMap=new HashMap<String,List<TransPriceBean>>();
					 factoryMap.put(factoryId, areaMap);
				 }
				 
				 
				 transLists=areaMap.get(areaId);
				 if(transLists==null){
					 transLists=new ArrayList<TransPriceBean>();
					 areaMap.put(areaId, transLists);
				 }
				 
				 transLists.add(transBean);
			 }
			 //transpriceMap=null;
			 factoryMap=null;
			 areaMap=null;
			 transLists=null;
			 
			 this.setCache("transpriceMap", transpriceMap, "request");
			 return null;
		/*ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		 if(transList==null){
			 return null;
		 }
		//System.out.println("list====================="+list);
		  List<TransPriceBean> transLists = new ArrayList<TransPriceBean>();
		  List<TransPriceBean> transRouteLists = new ArrayList<TransPriceBean>();

		 Map<String, TransPriceBean> transMap=new HashMap<String, TransPriceBean>();
		 Map<String, List<TransPriceBean>> transListMap=new HashMap<String, List<TransPriceBean>>();
		 TransPriceBean transBean=null;
		 String mapId = null;
		 for(int i=0,size=transList.size();i<size;i++){
			 transBean=(TransPriceBean)transList.get(i);
			 mapId=""+transBean.getAreaId()+transBean.getProductId()+transBean.getFactoryId();
			 transBean.setMapId(mapId);
			 //System.out.println("mapId==============="+mapId);
			
			 transLists=transListMap.get(mapId);
			 if(transLists==null){
				 transLists = new ArrayList<TransPriceBean>();
				 transListMap.put(mapId,transLists);
			 }
			 transLists.add(transBean);

			 if(transMap.get(mapId)==null){
				 transRouteLists.add(transBean);
				 transMap.put(mapId,transBean);
			 }
			 //System.out.println("transBean==============="+transBean);
		 }
		 tools.tool.clear(transMap);
		 this.setCache("transRouteLists", transRouteLists, "request");
		 this.setCache("transListMap", transListMap, "request");
		 return null;*/
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
		//System.out.println(" routeList  startRow==="+startRow+",endRow==="+endRow+",totalCount==="+totalCount+",curPage="+curPage);
		for(int i=startRow;i<totalCount&&i<endRow;i++){
			currentRouteList.add(routeList.get(i));
		}

		tools.tool.sortList(currentRouteList, "areaId", false);
		tools.tool.sortList(currentRouteList, "factoryId", false);
		tools.tool.sortList(currentRouteList, "productId", false);

		//System.out.println(" routeList  Size==="+(routeList==null?0:routeList.size()));
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

