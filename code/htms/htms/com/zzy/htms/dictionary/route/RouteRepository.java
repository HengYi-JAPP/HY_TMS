package com.zzy.htms.dictionary.route;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.abcer.log.Logger;
import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.dictionary.area.AreaBean;
import com.zzy.htms.dictionary.area.AreaRepository;


/**
 *  线路的缓存
 *  在后台有修改或调整时，需要重新加载才会生效。
 * @author Administrator
 *
 */
public class RouteRepository   extends AbstractBusinessExecutor {
	private static Logger log= Logger.getLogger();
	/*private static List<AreaBean> areaLists = new ArrayList<AreaBean>();
	private static List<AreaBean> rootAreaLists = new ArrayList<AreaBean>();
	public static List<AreaBean> getAreaLists() {
		(new RouteRepository()).reload();
		if(areaLists==null||areaLists.isEmpty()){
			(new RouteRepository()).load();
		}
		return areaLists;
	}
	
	private static Map<String,AreaBean> areaMaps = new HashMap<String,AreaBean>();
	private static Map<String,List<AreaBean>> areaChildren = new HashMap<String,List<AreaBean>>();*/
	private static boolean isLoad = false;

	/*是否同步其他远程主机*/
	/*private static boolean syncRemove = true;
	
	public static boolean isSyncRemove() {
		return syncRemove;
	}

	public static void setSyncRemove(boolean syncRemove) {
		RouteRepository.syncRemove = syncRemove;
	}*/

	/**
	 * 清空缓存
	 */
	public static void reload(){
		isLoad = false;
		 tools.tool.clear(allRoutesList);
		 tools.tool.clear(provinceList);
		 tools.tool.clear(cityList);
		 tools.tool.clear(countyList);
		 tools.tool.clear(countryList);
		 tools.tool.clear(productRouteMap);
		 tools.tool.clear(factoryRouteMap);
		 tools.tool.clear(areaRouteMap);
		 tools.tool.clear(routesMap);
		 
		 
		 allRoutesList=null;
		 provinceList=null;
		 cityList=null;		 
		 countyList=null;
		 countryList=null;

		 productRouteMap=null;
		 factoryRouteMap=null;
		 areaRouteMap=null;
		 routesMap=null;
		 
		 allRoutesList=new ArrayList<RouteBean>();
		 provinceList=new ArrayList<AreaBean>();
		 cityList=new ArrayList<AreaBean>();		 
		 countyList=new ArrayList<AreaBean>();
		 countryList=new ArrayList<AreaBean>();
		 
		 productRouteMap= new HashMap<String,List<RouteBean>>();
		 factoryRouteMap= new HashMap<String,List<RouteBean>>();
		 areaRouteMap= new HashMap<String,List<RouteBean>>();
		 routesMap= new HashMap<String,RouteBean>();
			/*if(isSyncRemove()){
				CacheSynker.syncRemoveHost(CacheSynker.ROUTE);
			}*/
	}
	private static  List<AreaBean> provinceList=new ArrayList<AreaBean>(),cityList=new ArrayList<AreaBean>(),
	 countyList=new ArrayList<AreaBean>(),countryList=new ArrayList<AreaBean>();
	private static  List<RouteBean> allRoutesList=new ArrayList<RouteBean>();
	private static Map<String,List<RouteBean>> productRouteMap= new HashMap<String,List<RouteBean>>();
	private static Map<String,List<RouteBean>> factoryRouteMap= new HashMap<String,List<RouteBean>>();

	private static Map<String,List<RouteBean>> areaRouteMap= new HashMap<String,List<RouteBean>>();
	private static Map<String,RouteBean> routesMap= new HashMap<String,RouteBean>();
	
	
	/**
	 * 加载缓存
	 */
	public  void load(){
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllRoute");
		ResultBean resultBean = this.dbOperator(operationBean, new HashMap(), false);
		List list =resultBean.getListResult("loadAllRoute");
		if(list==null){
			log.info("没用地址信息");
		//	System.out.println("没用地址信息");
		}else{	
			reload();
			RouteBean routeBean = null;
			List<RouteBean> routeList = null;
			
			String areaId = null;
			String areaName = null;
			String tempId = null,routeId=null;
			 List<AreaBean> areaList=null;
			 List<AreaBean> routeAreaList=new ArrayList<AreaBean>();
			 AreaRepository areaRep = new AreaRepository();
			 for(int i=0,size=list.size();i<size;i++){
				 routeBean=(RouteBean)list.get(i);
				 routeId=routeBean.getRouteId()+"";
				 tempId = routeBean.getProductId()+"";
				 routeList=productRouteMap.get(tempId);
				 if(routeList==null){
					 routeList= new ArrayList<RouteBean>();
					 productRouteMap.put(tempId, routeList);
				 }
				 routeList.add(routeBean);
				 
				 tempId = routeBean.getFactoryId()+"";
				 routeList=factoryRouteMap.get(tempId);
				 if(routeList==null){
					 routeList= new ArrayList<RouteBean>();
					 factoryRouteMap.put(tempId, routeList);
				 }
				 routeList.add(routeBean);
				 
				 if(routesMap.get(routeId)==null){
					 routesMap.put(routeId, routeBean);
					 allRoutesList.add(routeBean);
				 }
				
				 
				 areaId=routeBean.getAreaId()+"";
				 routeList=areaRouteMap.get(areaId);
				 if(routeList==null){
					 routeList= new ArrayList<RouteBean>();
					 areaRouteMap.put(areaId, routeList);
				 }
				 routeList.add(routeBean);
				 
				 areaList=areaRep.getAncestorArea(areaId);
				 areaName = areaRep.getFullAreaName(areaId, "", true);
				 routeBean.setAreaName(areaName);
				 if(areaList==null||areaList.isEmpty()){
					 continue;
				 }
				 routeAreaList.addAll(areaList);
			 }
			 AreaBean areaBean = null;
			 int level=0;
			
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
			 tools.tool.clear(routeAreaList);
			isLoad=true;
		}
	}
	
	public static RouteBean getRouteBean(String routeId){
		if(routesMap==null||routesMap.isEmpty()){
			RouteRepository rep = new RouteRepository();
			rep.load();
		}
		if(routesMap==null||routesMap.isEmpty()){
			return null;
		}
		
		return routesMap.get(routeId);
	}
	
	public static List<RouteBean> getRouteList(String factoryId,String productId,String areaId){
		if(allRoutesList==null||allRoutesList.isEmpty()){
			RouteRepository rep = new RouteRepository();
			rep.load();
		}
		if(allRoutesList==null||allRoutesList.isEmpty()){
			return null;
		}
		if((factoryId==null||"".equals(factoryId.trim()))&&(productId==null||"".equals(productId.trim()))&&(areaId==null||"".equals(areaId.trim()))){
			return allRoutesList;
		}
		List<RouteBean> tempRouteList = new ArrayList<RouteBean>();
		
		List<RouteBean> areaRouteList=getRouteListByAreaId(areaId);
		List<RouteBean> productRouteList =productRouteMap.get(productId);
		
		tempRouteList=getCommonRoute(productRouteList,areaRouteList);
		
		List<RouteBean> factoryRouteList =factoryRouteMap.get(factoryId);
		return tempRouteList=getCommonRoute(tempRouteList,factoryRouteList);
	}
	
	public static List<RouteBean> getRouteList(String[] factoryId,String[] productId,String areaId){
		if(allRoutesList==null||allRoutesList.isEmpty()){
			RouteRepository rep = new RouteRepository();
			rep.load();
		}
		if(allRoutesList==null||allRoutesList.isEmpty()){
			return null;
		}
		if((factoryId==null||factoryId.length==0)&&(productId==null||productId.length==0)&&(areaId==null||"".equals(areaId.trim()))){
			return allRoutesList;
		}
		List<RouteBean> commonRouteList = new ArrayList<RouteBean>(),tempList;
		
		List<RouteBean> areaRouteList=getRouteListByAreaId(areaId);
		
		List<RouteBean> productRouteList = new ArrayList<RouteBean> ();
		if(productId!=null){
			for(int i=0;i<productId.length;i++){
				tempList =productRouteMap.get(productId[i]);
				if(tempList==null||tempList.isEmpty()){
					continue;
				}
				productRouteList.addAll(tempList);
			}
		}
		commonRouteList=getCommonRoute(productRouteList,areaRouteList);
		List<RouteBean> factoryRouteList = new ArrayList<RouteBean> ();
		if(factoryId!=null){
			for(int i=0;i<factoryId.length;i++){
				tempList =factoryRouteMap.get(factoryId[i]);
				if(tempList==null||tempList.isEmpty()){
					continue;
				}
				factoryRouteList.addAll(tempList);
			}
		}
		//List<RouteBean> factoryRouteList =factoryRouteMap.get(factoryId);
		return commonRouteList=getCommonRoute(commonRouteList,factoryRouteList);
	}
	private static List<RouteBean> getCommonRoute(List<RouteBean> oneRouteList,List<RouteBean> secondRouteLlist){
		if(oneRouteList==null||oneRouteList.isEmpty()){
			return secondRouteLlist;
		}
		if(secondRouteLlist==null||secondRouteLlist.isEmpty()){
			return oneRouteList;
		}
		RouteBean routeBean=null;
		Map<String,RouteBean> tempRouteMap = new HashMap<String,RouteBean>();
		List<RouteBean> tempRouteList = new ArrayList<RouteBean>();
		for(int i=0,size=oneRouteList.size();i<size;i++){
			routeBean=oneRouteList.get(i);
			tempRouteMap.put(routeBean.getRouteId()+"", routeBean);
		}
		for(int i=0,size=secondRouteLlist.size();i<size;i++){
			routeBean=secondRouteLlist.get(i);
			if(tempRouteMap.get(routeBean.getRouteId()+"")==null){
				continue;
			}
			tempRouteList.add(routeBean);
		}
		
		tools.tool.clear(tempRouteMap);
		return tempRouteList;
	}

	
	public static RouteBean getMatchRouteBean(String productId,String factoryId,String areaId){
		if(productId==null||"".equals(productId.trim())||factoryId==null||"".equals(factoryId.trim())||areaId==null||"".equals(areaId.trim())){
			log.info("productId==null||\"\".equals(productId.trim())||factoryId==null||\"\".equals(factoryId.trim())||areaId==null||\"\".equals(areaId.trim())");
			return null;
		}
		AreaRepository areaRepository = new AreaRepository();
		AreaBean areaBean=areaRepository.getArea(areaId);
		if(areaBean==null){
			return null;
		}
		if(areaRouteMap==null||areaRouteMap.isEmpty()){
			RouteRepository rep = new RouteRepository();
			rep.load();
		}
		if(areaRouteMap==null||areaRouteMap.isEmpty()){
			return null;
		}
		List<RouteBean> tempList=areaRouteMap.get(areaId);
		if(tempList!=null&&tempList.isEmpty()==false){
			RouteBean routeBean= null;
			log.info("productId="+productId+"factoryId="+factoryId);
			for(int i =0,size=tempList.size();i<size;i++){
				routeBean=tempList.get(i);
				log.info("productId="+routeBean.getProductId()+"factoryId="+routeBean.getFactoryId());
				if(productId.equals(routeBean.getProductId()+"")&&factoryId.equals(routeBean.getFactoryId()+"")){
					return routeBean;
				}
			}
		}
		//if(tempList==null||tempList.isEmpty()){
		List<AreaBean> parentAreaList =areaRepository.getAncestorArea(areaId);
		if(parentAreaList==null||parentAreaList.isEmpty()){
			log.info("没有找到匹配的线路-001,areaId="+areaId);
			return null;
		}
		for(int i=parentAreaList.size()-1;i>=0;i--){
			areaBean=parentAreaList.get(i);
			log.info("areaBean areaId="+areaBean.getAreaId()+",areaName="+areaBean.getAreaName());
		}
		//tempList=new ArrayList<RouteBean>();
		//List<RouteBean> currentList =null;
		RouteBean routeBean= null;
		for(int i=0,size=parentAreaList.size();i<size;i++){
			areaBean=parentAreaList.get(i);
			tempList=areaRouteMap.get(areaBean.getAreaId()+"");
			if(tempList==null||tempList.isEmpty()){
				continue;
			}
			for(int n =0,nsize=tempList.size();n<nsize;n++){
				routeBean=tempList.get(n);
				//System.out.println("productId="+routeBean.getProductId()+"factoryId="+routeBean.getFactoryId());
				if(productId.equals(routeBean.getProductId()+"")&&factoryId.equals(routeBean.getFactoryId()+"")){
					return routeBean;
				}
			}
			//break;
			//tempList.addAll(currentList);
		}
		/*}else{
			RouteBean routeBean= null;
			System.out.println("productId="+productId+"factoryId="+factoryId);
			for(int i =0,size=tempList.size();i<size;i++){
				routeBean=tempList.get(i);
				System.out.println("productId="+routeBean.getProductId()+"factoryId="+routeBean.getFactoryId());
				if(productId.equals(routeBean.getProductId()+"")&&factoryId.equals(routeBean.getFactoryId()+"")){
					return routeBean;
				}
			}
		}*/
		log.info("没有找到匹配的线路-003,areaId="+areaId);
		return null;
	}
	
	
	public static List<RouteBean> getMatchRoutes(String productId,String factoryId,String areaId){
		if(productId==null||"".equals(productId.trim())||factoryId==null||"".equals(factoryId.trim())||areaId==null||"".equals(areaId.trim())){
			log.info("productId==null||\"\".equals(productId.trim())||factoryId==null||\"\".equals(factoryId.trim())||areaId==null||\"\".equals(areaId.trim())");
			return null;
		}
		AreaRepository areaRepository = new AreaRepository();
		AreaBean areaBean=areaRepository.getArea(areaId);
		if(areaBean==null){
			return null;
		}
		if(areaRouteMap==null||areaRouteMap.isEmpty()){
			RouteRepository rep = new RouteRepository();
			rep.load();
		}
		if(areaRouteMap==null||areaRouteMap.isEmpty()){
			return null;
		}
		List<RouteBean> matchRoulteList = new ArrayList<RouteBean>();
		List<RouteBean> tempList=areaRouteMap.get(areaId);
		if(tempList!=null&&tempList.isEmpty()==false){
			RouteBean routeBean= null;
			//log.info("productId="+productId+"factoryId="+factoryId);
			for(int i =0,size=tempList.size();i<size;i++){
				routeBean=tempList.get(i);
				//log.info("productId="+routeBean.getProductId()+"factoryId="+routeBean.getFactoryId());
				if(productId.equals(routeBean.getProductId()+"")&&factoryId.equals(routeBean.getFactoryId()+"")){
					matchRoulteList.add(routeBean);
				}
			}
		}
		
		
		//if(tempList==null||tempList.isEmpty()){
		List<AreaBean> parentAreaList =areaRepository.getAncestorArea(areaId);
		if(parentAreaList==null||parentAreaList.isEmpty()){
			log.info("没有找到匹配的线路-001,areaId="+areaId);
			return matchRoulteList;
		}
		for(int i=parentAreaList.size()-1;i>=0;i--){
			areaBean=parentAreaList.get(i);
			//log.info("areaBean areaId="+areaBean.getAreaId()+",areaName="+areaBean.getAreaName());
		}
		//tempList=new ArrayList<RouteBean>();
		//List<RouteBean> currentList =null;
		RouteBean routeBean= null;
		for(int i=0,size=parentAreaList.size();i<size;i++){
			areaBean=parentAreaList.get(i);
			tempList=areaRouteMap.get(areaBean.getAreaId()+"");
			if(tempList==null||tempList.isEmpty()){
				continue;
			}
			for(int n =0,nsize=tempList.size();n<nsize;n++){
				routeBean=tempList.get(n);
				//System.out.println("productId="+routeBean.getProductId()+"factoryId="+routeBean.getFactoryId());
				if(productId.equals(routeBean.getProductId()+"")&&factoryId.equals(routeBean.getFactoryId()+"")){
					matchRoulteList.add(routeBean);
				}
			}
			//break;
			//tempList.addAll(currentList);
		}
		
		log.info("找到匹配的线路-003,matchRoulteList.size="+matchRoulteList.size());
		return matchRoulteList;
	}
	public static List<RouteBean> getRouteListByAreaId(String areaId){
		AreaRepository areaRepository = new AreaRepository();
		AreaBean areaBean=areaRepository.getArea(areaId);
		if(areaBean==null){
			return null;
		}
		if(areaRouteMap==null||areaRouteMap.isEmpty()){
			RouteRepository rep = new RouteRepository();
			rep.load();
		}
		if(areaRouteMap==null||areaRouteMap.isEmpty()){
			return null;
		}
		List<AreaBean> childAreaList =areaRepository.getAllChildren(areaId);
		if(childAreaList==null||childAreaList.isEmpty()){
			return null;
		}
		
		//System.out.println("childAreaList size="+(childAreaList==null?0:childAreaList.size()));
		
		List<RouteBean> tempRouteList = new ArrayList<RouteBean>(),tempList=null;
		for(int i=0,size=childAreaList.size();i<size;i++){
			areaBean=childAreaList.get(i);
			
			tempList=areaRouteMap.get(areaBean.getAreaId()+"");
			//System.out.println("tempList size="+(tempList==null?0:tempList.size()));
			if(tempList==null||tempList.isEmpty()){
				continue;
			}
			tempRouteList.addAll(tempList);
		}
		
		return tempRouteList;
	}
	
	
	public static List<AreaBean> getProvinceList() {
		return provinceList;
	}
	public static void setProvinceList(List<AreaBean> provinceList) {
		RouteRepository.provinceList = provinceList;
	}
	public static List<AreaBean> getCityList() {
		return cityList;
	}
	public static void setCityList(List<AreaBean> cityList) {
		RouteRepository.cityList = cityList;
	}
	public static List<AreaBean> getCountyList() {
		return countyList;
	}
	public static void setCountyList(List<AreaBean> countyList) {
		RouteRepository.countyList = countyList;
	}
	public static List<AreaBean> getCountryList() {
		return countryList;
	}
	public static void setCountryList(List<AreaBean> countryList) {
		RouteRepository.countryList = countryList;
	}
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		RouteRepository rep = new RouteRepository();
		//河北省>>邯郸市>>邯郸县>>三陵乡
	//	RouteBean routeBean=rep.getMatchRouteBean(2,2,"2632");
	//	System.out.println("factory product area routeBean="+routeBean);
		
	/*	List<RouteBean> list=rep.getRouteListByAreaId("3102");
		System.out.println("List<RouteBean> list size="+(list==null?0:list.size()));
		
		list=rep.getRouteList("3","","");
		System.out.println("factory list size="+(list==null?0:list.size()));
		
		list=rep.getRouteList("","5","");
		System.out.println("product list size="+(list==null?0:list.size()));
		
		list=rep.getRouteList("","","3102");
		System.out.println("area list size="+(list==null?0:list.size()));
		
		list=rep.getRouteList("3","5","");
		System.out.println("factory product list size="+(list==null?0:list.size()));
		
		list=rep.getRouteList("3","5","3102");
		System.out.println("factory product area list size="+(list==null?0:list.size()));
		
		list=rep.getRouteList("","","");
		System.out.println("All list size="+(list==null?0:list.size()));*/
		
		//System.out.println(rep.getNextLevelChild("5827"));
		//rep.updateOrganizationStrId();
		//System.out.println("河南省南阳市唐河县ID:"+rep.getMatchOrganization("河南省南阳市唐河县 移动"));
		/*List<OrganizationBean> provincesLists=rep.getProvinces();
		OrganizationBean orgBean=null;
		String value=null;
		for(int i=0,size=provincesLists.size();i<size;i++){
			orgBean=provincesLists.get(i);
			value=orgBean.getOrganizationName();
			//System.out.println("\""+value.substring(0,value.length()-1)+"\",");
		}*/
		
		/*XmlBuffer xmlBuffer = new XmlBuffer();
		rep.generateChildXml("1", xmlBuffer);
		//System.out.println("================xmlBuffer================");
		//System.out.println(xmlBuffer.toString());*/
		/*List<OrganizationBean> orgList =rep.search("中");
		//System.out.println("getChildOrganizations================================");
		OrganizationBean OrganizationBean = null;
		for(int i =0,size=orgList.size();i<size;i++){
			OrganizationBean = orgList.get(i);
			//System.out.println("orgId="+OrganizationBean.getOrgId()+",orgName="+OrganizationBean.getOrganizationName());
		}
		//System.out.println("getAncestorOrganizations================================");
		orgList =rep.getAncestorOrganizations("100");
		//System.out.println("getAncestorOrganizations================================");
		for(int i =0,size=orgList.size();i<size;i++){
			OrganizationBean = orgList.get(i);
			//System.out.println("Ancestor:orgId="+OrganizationBean.getOrgId()+",orgName="+OrganizationBean.getOrganizationName());
		}
*/
	}

}
