package com.zzy.htms.parklogistics;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.database.DBTool;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.logistic.transfer.TransferBean;
import com.zzy.htms.sap.rfc.SyncLogger;

/**
 * 园区物流业务实现类
 * @author zzy
 *
 */
public class ParkLogisticsBussiness  extends AbstractV2BusinessExecutor
{
	private static final String PARKLOGISTICS_CONFIG = "parklogistics.properties";

	public static void main(String[] args) {
		String startDate=tools.tool.getDate();
		if(startDate.length()>10){
			startDate=startDate.substring(0,10);
		}
		System.out.println(startDate);
		
		ParkLogisticsBussiness park=new ParkLogisticsBussiness();
		park.sync("2017-09-01");
	}
	
	
	/**
	 * 根据给定的日期,获取物流调拨单数据,根据当前数据,调用园区物流接口获取这个日期之内的园区物流信息
	 * @param startDate
	 */
	public void sync(String startDate){
		Map parametersMap = new HashMap();
		if(startDate==null||startDate=="" ){
			startDate=tools.tool.getDate();
			if(startDate.length()>10){
				startDate=startDate.substring(0,10);
			}
		}
		parametersMap.put("startDate", startDate);
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllNoParkLogisticsInfoSapCode");
		DBTool dbTool = new DBTool();
		dbTool.setAutoCommint(true);
		ResultBean resultBean = dbTool.execute(operationBean, parametersMap, false);
		if(resultBean==null||resultBean.isSuccess()==false){
			SyncLogger.log("ParkLogisticsBussiness sync parklogistics 001", "resultBean==null||resultBean.isSuccess()==false 获取未调用园区物流调拨单号出错。");
			return ;
		}
		List list = resultBean.getListResult("loadAllNoParkLogisticsInfoSapCode");
		List existParkLogisticsList = resultBean.getListResult("loadAllParkLogisticsInfo");
		if(list==null||list.isEmpty()){
			SyncLogger.log("ParkLogisticsBussiness sync parklogistics 002", "list==null||list.isEmpty() 没有未派车调拨单号。");
			return ;
		}
		TransferBean transBean = null;
		
		//int size=200;
		
		 List<ParkLogisticsBean> parkLogisticsList = new ArrayList<ParkLogisticsBean>();
		int transBeanSize=list.size();
		int count =0;
		int countEnd=200;
		int loopNumbers=transBeanSize/200+1;
		//增加for循环，每次以200个为单位做sap的请求和本地数据库的更新
		for(int j=0;j<loopNumbers;j++){
			 count=(j+1)*200;
			 StringBuffer codeBuffer=new StringBuffer(); 
			 Map<String,String> tempMap = new HashMap<String,String>();
			 for(int i=j*200,size=transBeanSize;i<size&&i<count;i++){
				 transBean=(TransferBean) list.get(i);
				 codeBuffer.append("'"+transBean.getSapTransCode()+"',");
				 
			 }
			 String sapCodeStr=codeBuffer.toString();
			 if(sapCodeStr.length()>0){
				 sapCodeStr=sapCodeStr.substring(1,sapCodeStr.length()-2);
			 }
			 parkLogisticsList.addAll(getParkLogisticsService(sapCodeStr));
		}
		
		Map<String,ParkLogisticsBean> existMap=new HashMap<String,ParkLogisticsBean>();
		if(existParkLogisticsList!=null&&existParkLogisticsList.size()>0){
			for(int i=0;i<existParkLogisticsList.size();i++){
				ParkLogisticsBean parkBean =(ParkLogisticsBean)  existParkLogisticsList.get(i);
				existMap.put(parkBean.getSapCode(),parkBean);
			}
		}
		
		SyncLogger.log(" ","test result "+parkLogisticsList.size());
		
		
		Map syncParametersMap = new HashMap();
		this.setTableParameter(parkLogisticsList, existMap,syncParametersMap);
		
		OperationBean syncOperationBean = OperationConfigRepository.getOperationConfig("syncParkLogistics");
		DBTool syncDbTool = new DBTool();
		syncDbTool.setAutoCommint(true);
		ResultBean syncResultBean = syncDbTool.execute(syncOperationBean, syncParametersMap, false);

		if(syncResultBean==null||syncResultBean.isSuccess()==false){
			SyncLogger.log(" ","园区物流同步失败 resultBean==null");
		}else{
			SyncLogger.log(" ","园区物流同步成功 resultBean============================================================isSuccess");
		}
	}
	/**
	 * 园区物流接口数据处理,哪些需要新增,哪些需要修改
	 * @param parkLogisticsList
	 * @param existMap
	 * @param parametersMap
	 */
	public void setTableParameter( List<ParkLogisticsBean> parkLogisticsList,Map<String,ParkLogisticsBean> existMap,Map parametersMap){
		if(parkLogisticsList==null||parkLogisticsList.isEmpty()){
			return;
		}
		int iCount =0,uCount=0;
		String sapCode=null;

		Map tempMap = new HashMap();
		for (int i = 0; i < parkLogisticsList.size(); i++) 
        {
			ParkLogisticsBean  park=parkLogisticsList.get(i);
			sapCode=park.getSapCode();
			 tempMap.put(sapCode, sapCode);
			 if(existMap.get(sapCode)==null){
				 iCount++;
			 }else{
				 uCount++;
			 }
        }
  
		SyncLogger.log(" ","   icount: "+iCount+"   ucount: "+ uCount);

		String[] 
		insert_sapCode=new String[iCount],		
		insert_bindingTime=new String[iCount],
		insert_exitTime=new String[iCount],
		insert_parkStatus=new String[iCount];
		
		String[] 
		update_sapCode= new String[uCount],
		update_bindingTime=new String[uCount],
		update_exitTime=new String[uCount],
		update_parkStatus=new String[uCount];
		
		 iCount=0;
		 uCount=0;
		 ParkLogisticsBean parkBean = null;
		 
		 for (int i = 0; i < parkLogisticsList.size(); i++) 
	        {
			 ParkLogisticsBean  park=parkLogisticsList.get(i);
			 sapCode=park.getSapCode();
				
			 parkBean=existMap.get(sapCode);
			 
			 if(parkBean==null){
				 insert_sapCode[iCount]=park.getSapCode();      //sapcode
				 insert_bindingTime[iCount]=park.getBindingTime();    //进园区的时间
				 insert_exitTime[iCount]=park.getExitTime();          //出园区的时间
				 insert_parkStatus[iCount]=park.getParkStatus();      //园区物流状态
				 SyncLogger.log(" ","insert   "+park.getSapCode()+"    "+park.getParkStatus());
				 iCount++;
			 }else{
				 update_sapCode[uCount]=park.getSapCode();    //sapcode
				 update_bindingTime[uCount]=park.getBindingTime();  //进园区的时间
				 update_exitTime[uCount]=park.getExitTime();        //出园区的时间
				 update_parkStatus[uCount]=park.getParkStatus();    //园区物流状态
				 SyncLogger.log(" ","update   "+park.getSapCode()+"    "+park.getParkStatus());
				 uCount++;
			 }
	        }

		 
	
		 parametersMap.put("insert_sapCode",insert_sapCode);
		 parametersMap.put("insert_bindingTime",insert_bindingTime);
		 parametersMap.put("insert_exitTime",insert_exitTime);
		 parametersMap.put("insert_parkStatus",insert_parkStatus);
		
		 
		 parametersMap.put("update_sapCode",update_sapCode);
		 parametersMap.put("update_bindingTime",update_bindingTime);
		 parametersMap.put("update_exitTime",update_exitTime);
		 parametersMap.put("update_parkStatus",update_parkStatus);
		 
		 tools.tool.clear(tempMap);
	}
	
	
	/**
	 * 通过sap调拨单号,读取本地园区物流信息表,如果本地数据库中园区物流信息,则直接返回,如果没有则调用园区物流接口获取信息
	 * @param sapCode
	 * @return
	 */
	public ParkLogisticsBean doParkLogisticsService(String sapCode){
		boolean result = true;
		Map parameters =  new HashMap();
		parameters.put("sapCode",sapCode);
    	
		//根据transId获取所有运单坐标信息
		OperationBean getBean = OperationConfigRepository.getOperationConfig("getParkLogisticsBySapCode");			
		ResultBean getResult = this.dbOperator(getBean,parameters, false);
		List<ParkLogisticsBean> list= new ArrayList<ParkLogisticsBean>();
		list=(List<ParkLogisticsBean>) getResult.getListResult("getParkLogisticsBySapCode");
		
		
		ParkLogisticsBean parkLogisticsBean  =new ParkLogisticsBean(); 
		if(getResult==null|getResult.isSuccess()==false){
			SyncLogger.log("","获取园区接口信息失败,resultBean==null|resultBean.isSuccess()==false");
			result=false;
		}else{
			SyncLogger.log("","获取园区接口信息成功");
			if(list!=null&&list.size()>0){
				parkLogisticsBean = list.get(0);
			}else{
				parkLogisticsBean.setSapCode(sapCode);
			}
		}
		
		if(parkLogisticsBean!=null&&parkLogisticsBean.getSapCode()!=null&&"2".equals(parkLogisticsBean.getParkStatus())){
			SyncLogger.log(""," 园区物流信息已存在,且状态为已装货完毕, 不需要调用园区物流接口!");
			return parkLogisticsBean;
		}
		
		List<ParkLogisticsBean> listParkLogistics= getParkLogisticsService(sapCode);
		if(listParkLogistics==null||listParkLogistics.isEmpty()){
			SyncLogger.log(""," 调用园区物流接口成功，但获取的sapCode："+sapCode+"  的记录为空!");
			return parkLogisticsBean;
		}
		ParkLogisticsBean parkBean    =	listParkLogistics.get(0);
		if(parkBean!=null&&parkBean.getSapCode()!=null){
	    	if(parkBean.getBindingTime()!=null){
	    		parameters.put("parkStatus","1");
	    		
	    		parkLogisticsBean.setParkStatus("1");
	    		String bindingTime=parkBean.getBindingTime();
	    		if(bindingTime.contains(".")){
	    			bindingTime=bindingTime.substring(0,bindingTime.lastIndexOf("."));
	    		}
	    		parameters.put("bindingTime",bindingTime);
	    		parkLogisticsBean.setBindingTime(bindingTime);
	    	}
	    	if(parkBean.getExitTime()!=null){
	    		parameters.put("parkStatus","2");
	    	
	    		parkLogisticsBean.setParkStatus("2");
	    		String exitTime=parkBean.getExitTime();
	    		if(exitTime.contains(".")){
	    			exitTime=exitTime.substring(0,exitTime.lastIndexOf("."));
	    		}
	    		parameters.put("exitTime",exitTime);
	    		parkLogisticsBean.setExitTime(exitTime);
	    	}
	    	if(list==null||list.isEmpty()){
				OperationBean saveOperationBean = OperationConfigRepository.getOperationConfig("saveParkLogistics");			
				ResultBean saveBean = this.dbOperator(saveOperationBean,parameters, false);
				if(saveBean==null|saveBean.isSuccess()==false){
					SyncLogger.log("","保存园区接口信息失败,resultBean==null|resultBean.isSuccess()==false");
					result=false;
				}else{
					SyncLogger.log("","保存园区接口信息成功,sapCode="+sapCode);
				}	
		    }else{
				OperationBean updateOperationBean = OperationConfigRepository.getOperationConfig("updateParkLogistics");			
				ResultBean updateBean = this.dbOperator(updateOperationBean,parameters, false);
				if(updateBean==null|updateBean.isSuccess()==false){
					SyncLogger.log("","更新园区接口信息失败,resultBean==null|resultBean.isSuccess()==false");
					result=false;
				}else{
					SyncLogger.log("","更新园区接口信息成功,sapCode="+sapCode);
				}	
			}
	    }			
		if(result&&parkLogisticsBean!=null&&parkLogisticsBean.getSapCode()!=null){
			return parkLogisticsBean;
		}
		return null;
	}
	
	private static String PARKLOGISTICS_DRIVER    = tools.tool.getProperty(PARKLOGISTICS_CONFIG,"parklogistics.oracle.drivers");
	private static String PARKLOGISTICS_USERNAME  = tools.tool.getProperty(PARKLOGISTICS_CONFIG,"parklogistics.oracle.user");
	private static String PARKLOGISTICS_PASSWORD  = tools.tool.getProperty(PARKLOGISTICS_CONFIG,"parklogistics.oracle.password");
	private static String PARKLOGISTICS_URL       = tools.tool.getProperty(PARKLOGISTICS_CONFIG,"parklogistics.oracle.url");
	
	
	/*
	 * 园区物流接口
	 */
	private List<ParkLogisticsBean> getParkLogisticsService(String sapcode) {
		Connection con = null;
		Statement statement = null;
		try {
			Class.forName(PARKLOGISTICS_DRIVER);
			con = DriverManager.getConnection(PARKLOGISTICS_URL, PARKLOGISTICS_USERNAME, PARKLOGISTICS_PASSWORD);

			statement = con.createStatement();

			ResultSet result;
			
			String sql=" select * from bc_analyse.HY_VSM_VEHICLEINFORMATION_ALL  where DeliveryOrder in ('" + sapcode + "')  ";
			
			SyncLogger.log("","--  获取园区物流数据开始  --    "+sql);
			result = statement.executeQuery(sql);
			
			List<ParkLogisticsBean> list=new ArrayList<ParkLogisticsBean>();
			
			 
			while (result.next()) {	
				ParkLogisticsBean parkBean =new ParkLogisticsBean();
				parkBean.setId(checkObjectIsNull(result.getObject("ID")).toString());
				parkBean.setCompanyId(checkObjectIsNull(result.getObject("COMPANYID")).toString());
				parkBean.setLicenseNo(checkObjectIsNull(result.getObject("LICENSENO")).toString());
				parkBean.setIdNumber(checkObjectIsNull(result.getObject("IDNUMBER")).toString());
				parkBean.setDriver(checkObjectIsNull(result.getObject("DRIVER")).toString());
				parkBean.setTel(checkObjectIsNull(result.getObject("tel")).toString());
				parkBean.setEntryTime(checkObjectIsNull(result.getObject("entryTime")).toString());
				parkBean.setExitTime(checkObjectIsNull(result.getObject("exitTime")).toString());
				parkBean.setBindingTime(checkObjectIsNull(result.getObject("bindingTime")).toString());
				parkBean.setStartShipmentTime(checkObjectIsNull(result.getObject("startShipmentTime")).toString());
				parkBean.setEndShipmentTime(checkObjectIsNull(result.getObject("endShipmentTime")).toString());
				parkBean.setCreateUser(checkObjectIsNull(result.getObject("createUser")).toString());
				parkBean.setCreateTime(checkObjectIsNull(result.getObject("createTime")).toString());
				parkBean.setUpdateUser(checkObjectIsNull(result.getObject("updateUser")).toString());
				parkBean.setUpdateTime(checkObjectIsNull(result.getObject("updateTime")).toString());
				parkBean.setCompanyCode(checkObjectIsNull(result.getObject("companyCode")).toString());
				parkBean.setCompanyName(checkObjectIsNull(result.getObject("companyName")).toString());
				parkBean.setVehicleId(checkObjectIsNull(result.getObject("vehicleId")).toString());
				parkBean.setSapCode(checkObjectIsNull(result.getObject("DeliveryOrder")).toString());
				parkBean.setParkStatus("0");
				
				if(parkBean.getBindingTime()!=null){
					parkBean.setParkStatus("1");
		    		String bindingTime=parkBean.getBindingTime();
		    		if(bindingTime.contains(".")){
		    			bindingTime=bindingTime.substring(0,bindingTime.lastIndexOf("."));
		    		}
		    		parkBean.setBindingTime(bindingTime);
		    	}
		    	if(parkBean.getExitTime()!=null){
		    		parkBean.setParkStatus("2");
		    		String exitTime=parkBean.getExitTime();
		    		if(exitTime.contains(".")){
		    			exitTime=exitTime.substring(0,exitTime.lastIndexOf("."));
		    		}
		    		parkBean.setExitTime(exitTime);
		    	}
		    	SyncLogger.log("","   sapcode:"+parkBean.getSapCode() +"     bindtime: "+parkBean.getBindingTime()+"     exittime: "+parkBean.getExitTime());
				list.add(parkBean);
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (con != null) {
					statement.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return null;
	}
	
	private String checkObjectIsNull(Object obj){
		if(obj==null){
			return "";
		}
		return obj.toString();
	}
}
