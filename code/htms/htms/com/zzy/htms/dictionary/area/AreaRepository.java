package com.zzy.htms.dictionary.area;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.abcer.log.Logger;
import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;


/**
 *  
 *  地址的缓存
 *  在后台有修改或调整时，需要重新加载才会生效。
 * @author Administrator
 *
 */
public class AreaRepository   extends AbstractBusinessExecutor {
	private static Logger log= Logger.getLogger();
	private static List<AreaBean> areaLists = new ArrayList<AreaBean>();
	private static List<AreaBean> rootAreaLists = new ArrayList<AreaBean>();
	private static boolean isLoading = false;
	public static List<AreaBean> getAreaLists() {
		(new AreaRepository()).reload();
		if(areaLists==null||areaLists.isEmpty()){
			(new AreaRepository()).load();
		}
		return areaLists;
	}
	
	private static Map<String,AreaBean> areaMaps = new HashMap<String,AreaBean>();
	private static Map<String,List<AreaBean>> areaChildren = new HashMap<String,List<AreaBean>>();
	//private static List<AreaBean> provinceList = new ArrayList<AreaBean>();
	private static boolean isLoad = false;
	/*是否同步其他远程主机*/
	/*private static boolean syncRemove = true;
	public static boolean isSyncRemove() {
		return syncRemove;
	}
	public static void setSyncRemove(boolean syncRemove) {
		AreaRepository.syncRemove = syncRemove;
	}*/
	public static void reload(){
		if(isLoading==false){
			isLoad = false;
			tools.tool.clear(areaLists);
			areaLists=null;
			areaLists = new ArrayList<AreaBean>();
			
			tools.tool.clear(areaChildren);
			areaChildren=null;
			areaChildren = new HashMap<String,List<AreaBean>>();
			
			
			tools.tool.clear(rootAreaLists);
			rootAreaLists=null;
			rootAreaLists = new ArrayList<AreaBean>();
			
			tools.tool.clear(areaMaps);
			areaMaps=null;
			areaMaps = new HashMap<String,AreaBean>();
			/*if(isSyncRemove()){
				CacheSynker.syncRemoveHost(CacheSynker.AREA);
			}*/
		}
	}
	public static String replaceBlank(String str) {
		String dest = "";
		if (str!=null) {
			Pattern p = Pattern.compile("\\s*|\t|\r|\n");
			Matcher m = p.matcher(str);
			dest = m.replaceAll("");
		}
		return dest;
	}
	public void load(){
		if(isLoading==true){
			return ;
		}
		isLoading=true;
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllArea");
		ResultBean resultBean = this.dbOperator(operationBean, new HashMap(), false);
		List list =resultBean.getListResult("loadAllArea");
		if(list==null){
			log.info("没用地址信息");
			//System.out.println("没用地址信息");
		}else{				
			AreaBean areaBean = null;
			List<AreaBean> areaList = null;
			String areaName = null;
			for(int i =0,size=list.size();i<size;i++){
				areaBean = (AreaBean)list.get(i);
				areaName=areaBean.getAreaName();
				areaName=replaceBlank(areaName);
				areaBean.setAreaName(areaName);
				//System.out.println("areaBean="+areaBean);
				if(areaMaps.get(areaBean.getAreaId()+"")!=null){
					continue;
				}
				areaBean.setIntAreaId(areaBean.getAreaId());
				
				areaMaps.put(areaBean.getAreaId()+"", areaBean);	
				areaList =areaChildren.get(areaBean.getParentAreaId()+"");
				if(areaList==null){
					areaList = new ArrayList<AreaBean>();
					areaChildren.put(areaBean.getParentAreaId()+"", areaList);
				}
				
				if(areaBean.getParentAreaId()==0&&areaBean.getAreaLevel()==1){
					rootAreaLists.add(areaBean);
				}
				
				
				
				areaList.add(areaBean);
				areaLists.add(areaBean);
			}
			Set set= areaChildren.keySet();
			Iterator it = set.iterator();
			while(it.hasNext()){
				areaList=areaChildren.get(it.next());
				tools.tool.sortList(areaList, "intAreaId", false);
			}
			tools.tool.sortList(areaLists, "intAreaId", false);
			isLoad=true;
		}
		isLoading=false;
	}
	
	public AreaBean getArea(String areaId){
		if(areaMaps==null||areaMaps.isEmpty()){
			this.load();
		}
		return areaMaps.get(areaId);
	}
	public static List<AreaBean> getRootNodeList(){
		if(isLoad==false||(rootAreaLists==null||rootAreaLists.isEmpty())){
			AreaRepository rep = new AreaRepository();
			rep.load();
			isLoad=true;
		}

		return rootAreaLists;
	}
	
	public static List<AreaBean> getNextLevelChild(String areaId){
		if(isLoad==false){
			AreaRepository rep = new AreaRepository();
			rep.load();
			isLoad=true;
		}
		List<AreaBean> list=areaChildren.get(areaId);
		//System.out.print(list);
		return list;
	}
	
	/*public  List getAllPraentArea(String areaId){
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllPraentArea");
		Map parameters = new HashMap();
		parameters.put("areaId", new String[]{areaId});
		ResultBean resultBean = this.dbOperator(operationBean,parameters , false);
		if(resultBean==null||resultBean.isSuccess()==false){
			return null;
		}
		List praentAreaList =resultBean.getListResult("loadAllPraentArea");
		//System.out.println("praentAreaList============"+praentAreaList);
		return praentAreaList;
	}*/
	
	/*
	public  List getPraentArea(String areaId){
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadPraentArea");
		Map parameters = new HashMap();
		parameters.put("areaId", new String[]{areaId});
		ResultBean resultBean = this.dbOperator(operationBean,parameters , false);
		if(resultBean==null||resultBean.isSuccess()==false){
			return null;
		}
		List praentAreaList =resultBean.getListResult("loadPraentArea");
		//System.out.println("praentAreaList============"+praentAreaList);
		return praentAreaList;
	}*/
	
	/*public List getAreaLevel(String areaId){
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAreaLevel");
		Map parameters = new HashMap();
		parameters.put("areaId", new String[]{areaId});
		ResultBean resultBean = this.dbOperator(operationBean,parameters , false);
		if(resultBean==null||resultBean.isSuccess()==false){
			return null;
		}
		List areaLevelList =resultBean.getListResult("loadAreaLevel");
		return areaLevelList;
	}*/
	
	/**
	 * 根据指定结点的ID获得该结点下所有子结点
	 * @param areaId
	 * @return
	 */
	public List<AreaBean> getAllChildren(String areaId){
		if(isLoad==false){
			this.load();
			isLoad=true;
		}
		List<AreaBean> areaList = new ArrayList<AreaBean>();
		if(areaId==null||"".equals(areaId)){
			return areaList;
		}
		
		/*获取并判断当前结点*/
		AreaBean areaBean = areaMaps.get(areaId);
		if(areaBean==null){
			this.load();			
		}
		
		areaBean = areaMaps.get(areaId);
		if(areaBean==null){			
			return areaList;
		}
		
		areaList.add(areaBean);
		int count=1;
		
		/*遍历子结点*/
		List<AreaBean> tempList =null;
		for(int i =0;i<count;i++){
			areaBean = areaList.get(i);
			tempList = areaChildren.get(areaBean.getAreaId()+"");
			if(tempList==null){
				continue;
			}

			areaList.addAll(tempList);
			count=count+tempList.size();
		}
		
		return areaList;
	}
	
	

	public List<AreaBean> getAncestorArea(String areaId){
		if(isLoad==false){
			this.load();
			isLoad=true;
		}
		List<AreaBean> areaList = new ArrayList<AreaBean>();
		if(areaId==null||"".equals(areaId)){
			return areaList;
		}
		
		/*获取并判断当前结点*/
		AreaBean areaBean = areaMaps.get(areaId);
		if(areaBean==null){
			this.load();			
		}
		
		areaBean = areaMaps.get(areaId);
		if(areaBean==null){			
			return areaList;
		}
		
		areaList.add(areaBean);
		
		int count=1;
		
		/*遍历上级结点，把父辈结点都加进来*/
		AreaBean tempArea = null;
		for(int i =0;i<count;i++){
			areaBean = areaList.get(i);
			tempArea = areaMaps.get(areaBean.getParentAreaId()+"");
			if(tempArea==null){
				break;
			}
			areaList.add(tempArea);
			count=count+1;
		}
		
		return areaList;
	}
	
	/**
	 * 获取地址的全名称
	 * @param areaId
	 * @param split  地址中间需要的间隔符号
	 * @param desc   上下级排序规则
	 * @return
	 */
	public String getFullAreaName(String areaId,String split,boolean desc){
		List<AreaBean> areaList =this.getAncestorArea(areaId);
		if(areaList==null||areaList.isEmpty()){
			return "";
		}
		StringBuffer buffer = new StringBuffer();
		AreaBean areaBean= null;
		split = split==null?"":split.trim();
		if(desc){
			for(int i=areaList.size()-1,n=0;i>=0;i--,n++){
				areaBean=areaList.get(i);
				if(n>0){
					buffer.append(split);
				}
				buffer.append(areaBean.getAreaName());
			}
		}else{
			for(int i=0,size=areaList.size();i<size;i++){
				areaBean=areaList.get(i);
				if(i>0){
					buffer.append(split);
				}
				buffer.append(areaBean.getAreaName());
			}
		}
		
		return buffer.toString();
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		AreaRepository rep = new AreaRepository();
		//System.out.println(rep.getArea("1"));
		
		System.out.println(rep.getFullAreaName("4307", "", true));
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
