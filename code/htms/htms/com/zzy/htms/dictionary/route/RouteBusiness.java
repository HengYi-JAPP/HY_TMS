package com.zzy.htms.dictionary.route;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.mobilecn.utils.PageCtl;
import com.mobilecn.utils.RequestHelper;
import com.zzy.htms.dictionary.area.AreaBean;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.log.HtmsLogger;

/**
 * 线路业务类
 * @author zzy
 *
 */
public class RouteBusiness  extends AbstractV2BusinessExecutor {
	
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
		//	HtmsLogger.log("ROUTE001", "增加线路成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("ROUTE002", "增加线路失败", "0", this.getRequest());
		}
		//RouteRepository.reload();
		return forward;
	}
	

	
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
		//	HtmsLogger.log("ROUTE011", "删除线路成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("ROUTE012", "删除线路失败", "0", this.getRequest());
		}
		//RouteRepository.reload();
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
		//	HtmsLogger.log("ROUTE021", "查看线路列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("ROUTE022", "查看线路列表失败", "0", this.getRequest());
		}
		searchRoute();
		return forward;
	}
	
	/**
	 * 查询线路
	 */
	public void searchRoute(){
		RequestHelper helper = new RequestHelper(this.getRequest());
		//String factoryId = (String)helper.getValueFromAllScopes("factoryId");
		//String productId = (String)helper.getValueFromAllScopes("productId");
		String[] factoryId = this.getParameterValues("factoryIdSH");
		String[] productId = this.getParameterValues("productIdSH");
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
		PageCtl pageCtl  =this.getPageCtl();
		pageCtl.setTotalCount(totalCount);
		int startRow = pageCtl.getBeginRow(),endRow = pageCtl.getEndRow();
		List<RouteBean> currentRouteList=new ArrayList<RouteBean>();
		for(int i=startRow;i<totalCount&&i<endRow;i++){
			currentRouteList.add(routeList.get(i));
		}
		
		this.setCache("routeList", currentRouteList, "request");
		this.setCache("pageCtl", pageCtl,"request");
		
		 List<AreaBean> provinceList=RouteRepository.getProvinceList(),cityList=RouteRepository.getCityList(),
		 countyList=RouteRepository.getCountyList(),countryList=RouteRepository.getCountryList();
		 log.info(" routeAreaList  Size==="+(routeList==null?0:routeList.size()));
		 log.info(" provinceList  Size==="+(provinceList==null?0:provinceList.size()));
		 log.info(" cityList  Size==="+(cityList==null?0:cityList.size()));
		 log.info(" countyList  Size==="+(countyList==null?0:countyList.size()));
		 log.info(" countryList  Size==="+(countryList==null?0:countryList.size()));
		 //tools.tool.clear(routeList);
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
		 
		
		 this.setCache("cacheProvinceId", provinceId, "request");
		 this.setCache("cacheCityId", cityId, "request");
		 this.setCache("cacheCountyId", countyId, "request");
		 this.setCache("cacheCountryId", countryId, "request");
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("ROUTE031", "查看线路成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("ROUTE032", "查看线路失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	HtmsLogger.log("ROUTE041", "修改线路成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("ROUTE042", "修改线路失败", "0", this.getRequest());
		}
	//	RouteRepository.reload();
		return forward;
	}
	
	/**
	 * 加载地址库列表
	 * @return
	 */
	public String loadAreaList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		 if(list==null){
			 return null;
		 }
		 String areaId = null;
		 RouteBean routeBean = null;
		 List<AreaBean> areaList=null;
		 List<AreaBean> routeAreaList=new ArrayList<AreaBean>();
		 AreaRepository areaRep = new AreaRepository();
		 for(int i=0,size=list.size();i<size;i++){
			 routeBean=(RouteBean)list.get(i);
			 areaId=routeBean.getAreaId()+"";
			 areaList=areaRep.getAncestorArea(areaId);
			 if(areaList==null||areaList.isEmpty()){
				 continue;
			 }
			 routeAreaList.addAll(areaList);
		 }
		 AreaBean areaBean = null;
		 int level=0;
		 List<AreaBean> provinceList=new ArrayList<AreaBean>(),cityList=new ArrayList<AreaBean>(),
		 countyList=new ArrayList<AreaBean>(),countryList=new ArrayList<AreaBean>();
		 Map<String,AreaBean> tempAreaMap=new HashMap<String,AreaBean>();
		 for(int i=0,size=routeAreaList.size();i<size;i++){
			 areaBean=routeAreaList.get(i);
			 if(tempAreaMap.get(areaBean.getAreaId()+"")!=null){
				 continue;
			 }
			 tempAreaMap.put(areaBean.getAreaId()+"",areaBean);
			 
			 level=areaBean.getAreaLevel();
			 if(level==1){//省
				 areaBean.setProvinceId(areaBean.getAreaId());
				 provinceList.add(areaBean);
			 }
			 if(level==2){//市
				 areaBean.setCityId(areaBean.getAreaId());
				 cityList.add(areaBean);
			 }
			 if(level==3){//区、县
				 areaBean.setCountyId(areaBean.getAreaId());
				 countyList.add(areaBean);
			 }
			 if(level==4){//乡镇、街道
				 areaBean.setCountryId(areaBean.getAreaId());
				 countryList.add(areaBean);
			 }
			 
		 }
		 log.info(" routeAreaList  Size==="+(routeAreaList==null?0:routeAreaList.size()));
		 log.info(" provinceList  Size==="+(provinceList==null?0:provinceList.size()));
		 log.info(" cityList  Size==="+(cityList==null?0:cityList.size()));
		 log.info(" countyList  Size==="+(countyList==null?0:countyList.size()));
		 log.info(" countryList  Size==="+(countryList==null?0:countryList.size()));
		 tools.tool.clear(tempAreaMap);
		 //tools.tool.clear(routeAreaList);
		
		 this.setCache("provinceList", provinceList, "request");
		 this.setCache("cityList", cityList, "request");
		 this.setCache("countyList", countyList, "request");
		 this.setCache("countryList", countryList, "request");
		 return null;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1853, MethodName:默认新增, MethodCode:add
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//DefautMethod,MethodId:1855, MethodName:默认删除, MethodCode:delete
	//DefautMethod,MethodId:1856, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1857, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1858, MethodName:默认查询, MethodCode:list
	//Self Define Method End.
}

