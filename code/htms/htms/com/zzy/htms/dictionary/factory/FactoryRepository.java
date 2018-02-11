package com.zzy.htms.dictionary.factory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.abcer.log.Logger;
import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;

/**
 * 工厂缓存类
 * @author zzy
 *
 */
public class FactoryRepository extends AbstractBusinessExecutor {
	private static Logger log= Logger.getLogger();
	private static Map<String,FactoryBean> factoryMaps = new HashMap<String,FactoryBean>();
	private static Map<String,FactoryBean> factoryCodeMaps = new HashMap<String,FactoryBean>();
	private static List<FactoryBean> factoryList = new ArrayList<FactoryBean>();
	public static List<FactoryBean> getFactoryList(){
		if(factoryList==null||factoryList.isEmpty()){
			FactoryRepository rep = new FactoryRepository();
			rep.load();
		}
		
		return factoryList;
	}
	private static boolean isLoad = false;

	/*是否同步其他远程主机*/
	/*private static boolean syncRemove = true;
	
	public static boolean isSyncRemove() {
		return syncRemove;
	}
	public static void setSyncRemove(boolean syncRemove) {
		FactoryRepository.syncRemove = syncRemove;
	}*/
	
	/**
	 * 清空缓存数据
	 */
	public static void reload(){
		tools.tool.clear(factoryMaps);
		tools.tool.clear(factoryCodeMaps);
		tools.tool.clear(factoryList);
		
		factoryList=null;
		factoryMaps=null;
		factoryCodeMaps=null;
		
		factoryList = new ArrayList<FactoryBean>();
		factoryMaps = new HashMap<String,FactoryBean>();
		factoryCodeMaps = new HashMap<String,FactoryBean>();
		/*if(isSyncRemove()){
			CacheSynker.syncRemoveHost(CacheSynker.FACTORY);
		}*/
	}
	
	/**
	 * 加载缓存数据
	 */
	public void load(){
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllFactory");
		ResultBean resultBean = this.dbOperator(operationBean, new HashMap(), false);
		List list =resultBean.getListResult("loadAllFactory");
		if(list==null){
			log.info("没用厂区信息");
			//System.out.println("没用厂区信息");
		}else{				
			FactoryBean factoryBean = null;
			String factoryId = null;
			Map<String,String>  tempMaps = new HashMap<String,String>();
			for(int i =0,size=list.size();i<size;i++){
				factoryBean = (FactoryBean)list.get(i);
				factoryId = factoryBean.getFactoryId()+"";
				if(tempMaps.get(factoryId)!=null){
					continue;
				}
				tempMaps.put(factoryId, factoryId);
				//System.out.println("FactoryBean="+factoryBean);
					
				factoryMaps.put(factoryId, factoryBean);
				factoryCodeMaps.put(factoryBean.getFactoryCode().trim(), factoryBean);
				factoryList.add(factoryBean);
			}

			tools.tool.clear(tempMaps);		
		}
	}
	
	/**
	 * 通过工厂编码获取工厂ID
	 * @param factoryCode
	 * @return
	 */
	public static String getFactoryId(String factoryCode){
		if(factoryCodeMaps==null||factoryCodeMaps.isEmpty()){
			FactoryRepository rep = new FactoryRepository();
			rep.load();
		}
		FactoryBean factoryBean = factoryCodeMaps.get(factoryCode);
		if(factoryBean==null){
			return "";
		}
		return factoryBean.getFactoryId()+"";
	}
	
	/**
	 * 通过工厂id获取工厂信息
	 * @param factoryId
	 * @return
	 */
	public static FactoryBean getFactory(String factoryId){
		if(factoryMaps==null||factoryMaps.isEmpty()){
			FactoryRepository rep = new FactoryRepository();
			rep.load();
		}
		return factoryMaps.get(factoryId);
	}
	
	
	public static String  getFactoryName(String factoryId){
		if(factoryMaps==null||factoryMaps.isEmpty()){
			FactoryRepository rep = new FactoryRepository();
			rep.load();
		}
		FactoryBean fac=factoryMaps.get(factoryId);
		if(fac!=null&&fac.getFactoryName()!=null){
			return fac.getFactoryName();
		}
		return null;
	}
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		FactoryRepository rep = new FactoryRepository();
		System.out.println(rep.getFactoryId("2000"));
	}

	
}
