package com.zzy.htms.fetchprivilege;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.utils.RequestHelper;
import com.zzy.htms.log.HtmsLogger;
import com.zzy.htms.user.HtmsUserBean;

/**
 * 贸易商权限管理实现类
 * @author zzy
 *
 */
public class FetchPrivilegeBusiness extends AbstractV2BusinessExecutor{
	
	/**
	 * 执行添加权限之前的预处理
	 */
	public String beforeAdd(){
		String forward=super.add();
		
		List<HtmsUserBean> userList=new ArrayList<HtmsUserBean>();
		
		ResultBean resultBean = this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			return "";
		}
		userList =  (List<HtmsUserBean>) this.getParameter("SELECT_USER_FACTORY");  // resultBean.getListResult("SELECT_USER_FACTORY");
		
		Map<String,List<String>>  userMap=new HashMap<String,List<String>>();
		
		List<String> tmpUserList =null;
		String mapId=null;
		if(userList!=null&&userList.size()>0){
			for(HtmsUserBean user:userList){
				mapId=user.getUserId();
				tmpUserList=userMap.get(user.getUserId());
				if(tmpUserList==null){
					tmpUserList = new ArrayList<String>();
					userMap.put(mapId,tmpUserList);
				 }
				 tmpUserList.add(user.getFactoryId());
				 if(userMap.get(mapId)==null){
					 tmpUserList.add(user.getFactoryId());
					 userMap.put(mapId,tmpUserList);
				 }
			}
		}

		RequestHelper helper = new RequestHelper(this.getRequest());    
		String[] user = this.getParameterValues("userId");
		String[] factory = this.getParameterValues("factoryIdSH");
		                    
		System.out.println(" userlength:"+user.length+"    factoryLength " +factory.length);
		
		//String[] user=userIds.split(",");
		//String[] factory=factoryIds.split(",");
		
	    
		
		for(String u:user){
			String factoryId="";
			for(String f:factory){
				List<String> factoryIdList=userMap.get(u);
				if(factoryIdList==null||!factoryIdList.contains(f)){
					factoryId+=f+",";
				}
			}
			if(factoryId.length()>0){
				factoryId=factoryId.substring(0,factoryId.length()-1);
			}
			Map parameters =  new HashMap();
			parameters.put("userIds",u);
			parameters.put("factoryIds",factoryId.split(","));	
			
			System.out.println("  user :" + u+"  factoryId : "+factoryId);
			
			if(u!=null&&!u.equals("")&&factoryId!=null&&!factoryId.equals("")){
				OperationBean operationBean = OperationConfigRepository.getOperationConfig("saveFetchPrivileges");			
				ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
				if(saveBean==null|saveBean.isSuccess()==false){
					log.info("保存贸易商权限结果不成功,resultBean==null|resultBean.isSuccess()==false");
				}
			}
			
		}
		
		if (this.isSuccess()) {
		}else{
			HtmsLogger.log("FETCH002", "增加自提权限失败", "0", this.getRequest());
		}
		return forward;
	}
	
	
	public String add(){
		
		String forward=super.add();
		if (this.isSuccess()) {
		}else{
			HtmsLogger.log("FETCH002", "增加自提权限失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
		}else{
			HtmsLogger.log("FETCH012", "删除自提权限失败", "0", this.getRequest());
		}
		return forward;
	}
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
		}else{
			HtmsLogger.log("FETCH022", "查看自提权限列表失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
		}else{
			HtmsLogger.log("FETCH032", "查看自提权限失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		}else{
			HtmsLogger.log("FETCH042", "修改自提权限失败", "0", this.getRequest());
		}
		return forward;
	}
	public void toAdd(){
		super.add();
	}
	
	
	
}
