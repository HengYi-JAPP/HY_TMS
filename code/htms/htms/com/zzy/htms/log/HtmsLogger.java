package com.zzy.htms.log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.database.DBTool;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.utils.RequestHelper;

/**
 * 日志保存公用方法
 * @author zzy
 *
 */
public class HtmsLogger {
	public static long CACHE_SIZE=100;
	public static long logSize=0;
	public static List<HtmsLogBean> logCache=new ArrayList<HtmsLogBean>();
	
	/**
	 * 调用此方法保存记录到日志表
	 * @param logCode
	 * @param logMessage
	 * @param operateResult
	 * @param request
	 */
	public static void log(String logCode,String logMessage,String operateResult,HttpServletRequest request){
		if(logCode==null||"".equals(logCode.trim())||logMessage==null||"".equals(logMessage.trim())||request==null){
			return;
		}
		String ipAddress=tools.tool.getIpAddress(request);
		RequestHelper 	requestHelper=new RequestHelper(request);
		String userId=(String)requestHelper.getValueFromAllScopes("userId");
		
		HtmsLogBean logBean = new HtmsLogBean();
		logBean.setLogAddress(request.getRequestURI());
		logBean.setLogCode(logCode);
		logBean.setLogDesc(logMessage);
		logBean.setLogResult(operateResult);
		logBean.setLogIp(ipAddress);
		logBean.setLogTime(tools.tool.getDateTime());
		logBean.setLogUser(userId);
		System.out.println(logBean);
		save(logBean);
		
	}
	
	/**
	 * 保存日志信息
	 * @param currLogBean
	 */
	public static void save(HtmsLogBean currLogBean){
		if(currLogBean==null){
			return;
		}
		logCache.add(currLogBean);
		logSize++;
		if(logSize<CACHE_SIZE){
			return;
		}
		List<HtmsLogBean> saveLogList=logCache;
		logCache=new ArrayList<HtmsLogBean>();
		logSize=0;
		
		//saveLogList.addAll(logCache);
		
		//return true;
		HtmsLogBean logBean =null;
		Map parameters=new HashMap();
		int size=saveLogList.size();
		String[] logCode=new String[size],logAddress=new String[size],
		logDesc=new String[size],logUser=new String[size],logTime=new String[size],
		logResult=new String[size],logIp=new String[size];
		for(int i=0;i<size;i++){
			logBean =saveLogList.get(i);
			logCode[i]=logBean.getLogCode();
			logAddress[i]=logBean.getLogAddress();
			logDesc[i]=logBean.getLogDesc();
			logUser[i]=logBean.getLogUser();
			logTime[i]=logBean.getLogTime();
			logResult[i]=logBean.getLogResult();
			logIp[i]=logBean.getLogIp();
		}
		
		parameters.put("logCode", logCode);
		parameters.put("logAddress", logAddress);
		parameters.put("logDesc", logDesc);
		parameters.put("logUser", logUser);
		parameters.put("logTime", logTime);
		parameters.put("logResult", logResult);
		parameters.put("logIp", logIp);
		saveLog("saveHtmsSystemLogs",parameters);
		
		tools.tool.clear(saveLogList);
		tools.tool.clear(parameters);
		saveLogList=null;
		parameters=null;
	}
	
	
	/**
	 * 保存日志信息
	 * @param operation
	 * @param parameters
	 */
	public static void saveLog(String operation,Map parameters){
		if(operation==null||"".equals(operation.trim())){
			return ;
		}
		OperationBean operationBean = OperationConfigRepository.getOperationConfig(operation);
		if(operationBean==null){
			System.out.println("exeOperation,operationBean==null,operation="+operation);
			return ;
		}
		parameters =parameters==null? new HashMap():parameters;
		
		DBTool dbtool = new DBTool();
		
		ResultBean resultBean = dbtool.execute(operationBean, parameters, false);
		if(resultBean==null||resultBean.isSuccess()==false){
			System.out.println("resultBean==null||resultBean.isSuccess()==false");
		}else{
			System.out.println("resultBean!=null&&resultBean.isSuccess()==true");
		}
		
		return ;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
