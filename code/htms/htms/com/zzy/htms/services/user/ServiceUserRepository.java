package com.zzy.htms.services.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.abcer.log.Logger;
import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;

/**
 * web服务凭证管理缓存
 * @author zzy
 *
 */
public class ServiceUserRepository  extends AbstractBusinessExecutor{
	private static Logger log= Logger.getLogger();
	private static Map<String,Map<String,ServiceUserBean>>  serviceUserMap = new HashMap<String,Map<String,ServiceUserBean>>();
	private static boolean isLoad = false;
	
	public void load(){
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllServiceUser");
		ResultBean resultBean = this.dbOperator(operationBean, new HashMap(), false);
		List list =resultBean.getListResult("loadAllServiceUser");
		if(list==null){
			log.info("没用服务用户信息");
		}else{				
			ServiceUserBean userBean = null;
			Map<String,ServiceUserBean>  tempMaps = new HashMap<String,ServiceUserBean>();
			String systemCode = null;
			for(int i =0,size=list.size();i<size;i++){
				userBean = (ServiceUserBean)list.get(i);
				systemCode=userBean.getSyscode();
				tempMaps=serviceUserMap.get(systemCode);
				if(tempMaps==null){
					tempMaps = new HashMap<String,ServiceUserBean>();
					serviceUserMap.put(systemCode, tempMaps);
				}
				tempMaps.put(userBean.getAccount(), userBean);
			}
			//tools.tool.clear(tempMaps);
		}
	}
	public static void reload(){
		tools.tool.clear(serviceUserMap);
		serviceUserMap=null;
		serviceUserMap = new HashMap<String,Map<String,ServiceUserBean>>();
	}
	public static ServiceUserBean getServiceUser(String systemCode,String account){
		if(serviceUserMap==null||serviceUserMap.isEmpty()){
			ServiceUserRepository rep = new ServiceUserRepository();
			rep.load();
		}
		if(serviceUserMap==null||serviceUserMap.isEmpty()){
			return null;
		}
		Map<String,ServiceUserBean>  tempMaps=serviceUserMap.get(systemCode);
		if(tempMaps==null){
			return null;
		}
		//log.info("----------------------------->productId=="+productId);
		return  tempMaps.get(account);
	}
	
	
	
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		 ServiceUserRepository rep = new ServiceUserRepository();
		log.info("productId:"+rep.getServiceUser("SAP","sap"));
	}
	
}
