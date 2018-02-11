package com.zzy.htms.webservice.market.order;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.database.DBTool;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.utils.random.IntRandom;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;


/**
 * 闭环接口,排货接口处理业务类
 * @author zzy
 *
 */
public class HtmsArrangeGoodsBussiness extends AbstractBusinessExecutor{

	
	public static void main(String[] args) {
		JSONObject jsonObject = new JSONObject();   
        jsonObject.put("code","test");   
        jsonObject.put("account", "test");   
        jsonObject.put("passwd", "test");   
        jsonObject.put("shipId", "14");   
        jsonObject.put("userId", "1");   
        jsonObject.put("type", "0");   
//        jsonObject.put("shipDetailId", new String[]{"13"});
//        jsonObject.put("applyTonNum", new String[]{"27.00"});
       
        HtmsArrangeGoodsBussiness  bussiness= new HtmsArrangeGoodsBussiness();
        String s =  jsonObject.toString();

//		String result  = bussiness.agreeArrangeGoods(s);
		String result  = bussiness.rejectArrangeGoods(s);
		
	    System.out.println(result);
	}	
	
	
	
	
	/**
	 * 判断订单是否存在，判断订单状态是否正常
	 * @param shipId    订单的id
	 * @param isReject  是否是取消排货
	 * @return
	 */
	public WebServiceResultBean checkShipInfo(String shipId,boolean isReject,Map shipParameters,List<ShipDetailBean> shipDetailList) throws  Exception {
		WebServiceResultBean serviceBean = new WebServiceResultBean();
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("marketGetShipInfoById");
		Map parameters =  new HashMap();
		parameters.put("shipId", shipId);
		ResultBean resultBean = this.dbOperator(operationBean, parameters, false);
		if(resultBean==null||!resultBean.isSuccess()){
			serviceBean.setResult(false);
			serviceBean.setMsg("操作失败:获取发货信息为空");
			return serviceBean;
		}
		List<ShipBean>  shipBeanList = new ArrayList<ShipBean>();
		shipBeanList =resultBean.getListResult("shipViewBean");
		List<ShipDetailBean>  shipDetailBeanList = new ArrayList<ShipDetailBean>();
		shipDetailBeanList =resultBean.getListResult("shipDetailViewBean");
		
		if(shipBeanList==null||shipBeanList.isEmpty()){
			serviceBean.setResult(false);
			serviceBean.setMsg("操作失败:获取发货主表信息为空");
			return serviceBean;
		}
		if(shipDetailBeanList==null||shipDetailBeanList.isEmpty()){
			serviceBean.setResult(false);
			serviceBean.setMsg("操作失败:获取发货详细信息为空");
			return serviceBean;
		}
		
		
		if(shipBeanList!=null&&shipBeanList.size()>0){
			ShipBean shipBean= shipBeanList.get(0);
			int status=shipBean.getApplyStatus();
			if(!isReject&&status!=0){
				serviceBean.setResult(false);
				serviceBean.setMsg("操作失败:发货状态已经变化，不能继续排货");
				return serviceBean;
			}
			if(isReject&&!(status==0||status==1)){
				serviceBean.setResult(false);
				serviceBean.setMsg("操作失败:发货状态已经变化，不能继续排货");
				return serviceBean;
			}
		}
		if(!isReject){
			//判断detail信息的条数是否一致
			if(shipDetailList.size()!=shipDetailBeanList.size()){
				serviceBean.setResult(false);
				serviceBean.setMsg("操作失败:排货详情id传入数量不正确");
				return serviceBean;
			}
			String[]  codetailId= new String[shipDetailList.size()];
			String[]  reducedApplyTonNum= new String[shipDetailList.size()];
			
			for(int k=0;k<shipDetailBeanList.size();k++){
				ShipDetailBean shipDetailBean =shipDetailBeanList.get(k);
				codetailId[k]= shipDetailBean.getCodetailId()+"";
				reducedApplyTonNum[k]="0";
				for(ShipDetailBean detailBean:shipDetailList){
					if(detailBean.getShipDetailId()==shipDetailBean.getShipDetailId()){
						BigDecimal originalApplyTonNum= new BigDecimal(shipDetailBean.getApplyTonNum());
						BigDecimal currentApplyTonNum= new BigDecimal(detailBean.getApplyTonNum());
						reducedApplyTonNum[k] =(originalApplyTonNum.subtract(currentApplyTonNum)).toString();  
					}
				}
			}
			shipParameters.put("codetailId", codetailId);
			shipParameters.put("reducedApplyTonNum", reducedApplyTonNum);
		}
		if(isReject){
			String[]  codetailId= new String[shipDetailBeanList.size()];
			String[]  reducedApplyTonNum= new String[shipDetailBeanList.size()];
			for(int k=0;k<shipDetailBeanList.size();k++){
				ShipDetailBean shipDetailBean =shipDetailBeanList.get(k);
				codetailId[k]= shipDetailBean.getCodetailId()+"";
				reducedApplyTonNum[k]=shipDetailBean.getApplyTonNum();
			}
			shipParameters.put("codetailId", codetailId);
			shipParameters.put("reducedApplyTonNum", reducedApplyTonNum);
		}
		serviceBean.setResult(true);
		serviceBean.setMsg("操作成功");
		return serviceBean;
	}
	
	/**
	 * 排货结果写入到tms
	 * @return
	 */
	public String agreeArrangeGoods(String shipInfo){
		try{
			log.info(""+shipInfo);
			JSONObject jsonObj= JSONObject.fromObject(shipInfo);
			String code   =jsonObj.getString("code");
			String account=jsonObj.getString("account");
			String passwd=jsonObj.getString("passwd");
			String shipId=jsonObj.getString("shipId");
			String userId=jsonObj.getString("userId");
			
			JSONArray  jsonArray1=jsonObj.getJSONArray("shipDetailId");
			JSONArray  jsonArray2=jsonObj.getJSONArray("applyTonNum");
			
			Object[] obj1 =(Object[]) jsonArray1.toArray();
			Object[] obj2 =(Object[]) jsonArray2.toArray();
			
			String[] shipDetailId=new String[obj1.length];
			String[] applyTonNum=new String[obj2.length];
			
			int i=0;
			for(Object o:obj1){
				shipDetailId[i]=o.toString();
				i++;
			}
			int j=0;
	        for(Object o:obj2){
	        	applyTonNum[j]=o.toString();
				j++;
			}
			
			WebServiceResultBean  checkUserResultBean = WebServiceUtils.accountCheck(code, account, passwd);
			if(checkUserResultBean!=null&&!checkUserResultBean.isResult()){
				log.info(checkUserResultBean.getString());
				return checkUserResultBean.getString();
			}
			String approveNotice= "同意";
			
			if(shipId==null||shipId==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("shipId为空");
				log.info(checkUserResultBean.getString());
				return checkUserResultBean.getString();
			}
			if(userId==null||userId==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("userId为空");
				log.info(checkUserResultBean.getString());
				return checkUserResultBean.getString();
			}
			if(shipDetailId==null||shipDetailId.length==0){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("shipDetailId为空");
				log.info(checkUserResultBean.getString());
				return checkUserResultBean.getString();
			}
			if(applyTonNum==null||applyTonNum.length==0){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("applyTonNum为空");
				log.info(checkUserResultBean.getString());
				return checkUserResultBean.getString();
			}
			if(shipDetailId.length!=applyTonNum.length){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("shipDetailId与applyTonNum的长度不匹配");
				log.info(checkUserResultBean.getString());
				return checkUserResultBean.getString();
			}
			
			Map parameters =  new HashMap();

			
			List<ShipDetailBean>  shipDetailBeanList= new ArrayList<ShipDetailBean>();
			
			int m=0;
			for(String tonNum:applyTonNum){
				ShipDetailBean shipDetailBean = new ShipDetailBean();
				shipDetailBean.setShipId(Integer.valueOf(shipId));
				shipDetailBean.setShipDetailId(Integer.valueOf(shipDetailId[m]));
				shipDetailBean.setApplyTonNum(tonNum);
				shipDetailBeanList.add(shipDetailBean);
			    m++;
			}
			
			
			//判断发货信息是否存在
			checkUserResultBean=checkShipInfo(shipId,false,parameters,shipDetailBeanList);
			if(checkUserResultBean!=null&&!checkUserResultBean.isResult()){
				log.info(checkUserResultBean.getString());
				return checkUserResultBean.getString();
			}
			
			
			//String shipId = null ,userId= null,approveNotice= "同意";
			//String[] shipDetailId = null,applyTonNum = null;
			
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("marketPassShipApply");
			
			parameters.put("shipId", shipId);
			parameters.put("userId", userId);
			parameters.put("approveNotice", approveNotice);
			parameters.put("shipDetailId", shipDetailId);
			parameters.put("applyTonNum", applyTonNum);
			
			
		
			
			String transferCode = tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(10,99);
			parameters.put("transferCode", transferCode);
			DBTool dbTool = new DBTool();
			dbTool.setAutoCommint(false);
			ResultBean resultBean = dbTool.execute(operationBean, parameters, false);
			
			if(resultBean==null||resultBean.isSuccess()==false){
				 checkUserResultBean.setResult(false);
				 checkUserResultBean.setMsg("保存入库发生错误，操作失败");
			}else{
				checkUserResultBean.setResult(true);
				 checkUserResultBean.setMsg("操作成功");
			}
			log.info(checkUserResultBean.getString());
			return checkUserResultBean.getString();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		JSONObject jsonResult = new JSONObject();  
		jsonResult.put("result",false);
		jsonResult.put("message","操作失败:发生未知异常");
		log.info(jsonResult.toString());
		return jsonResult.toString();
		
	}
	
	
	/**
	 * 取消排货接口
	 * @return
	 */
	public String rejectArrangeGoods(String shipInfo){
		try{
			log.info(""+shipInfo);
			JSONObject jsonObj= JSONObject.fromObject(shipInfo);
			String code   = jsonObj.getString("code");
			String account= jsonObj.getString("account");
			String passwd = jsonObj.getString("passwd");
			String shipId = jsonObj.getString("shipId");
			String userId = jsonObj.getString("userId");
			String type = jsonObj.getString("type")+"";
			
			WebServiceResultBean  checkUserResultBean = WebServiceUtils.accountCheck(code, account, passwd);
			if(checkUserResultBean!=null&&!checkUserResultBean.isResult()){
				return checkUserResultBean.getString();
			}
			
			if(shipId==null||shipId==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("shipId为空");
				return checkUserResultBean.getString();
			}
			if(userId==null||userId==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("userId为空");
				return checkUserResultBean.getString();
			}
			if(type==null||type==""){
				checkUserResultBean.setResult(false);
				checkUserResultBean.setMsg("type为空");
				return checkUserResultBean.getString();
			}
			
			
			Map parameters =  new HashMap();
			
			boolean b=true;
			//判断发货信息是否存在
			if("1".equals(type)){	
				b=false;
			}
			
			checkUserResultBean=checkShipInfo(shipId,true,parameters,null);
			if(checkUserResultBean!=null&&!checkUserResultBean.isResult()){
				return checkUserResultBean.getString();
			}
			
			//type为0 表示拒绝申请单
			if("0".equals(type)){
				String approveNotice= "拒绝";
				
				OperationBean operationBean = OperationConfigRepository.getOperationConfig("marketNotPassShipApply");
			
				parameters.put("shipId", shipId);
				parameters.put("userId", userId);
				parameters.put("approveNotice", approveNotice);
			
				
				DBTool dbTool = new DBTool();
				dbTool.setAutoCommint(false);
				
				ResultBean resultBean = dbTool.execute(operationBean, parameters, false);
				
				if(resultBean==null||resultBean.isSuccess()==false){
					 checkUserResultBean.setResult(false);
					 checkUserResultBean.setMsg("保存入库发生错误，操作失败");
				}else{
					checkUserResultBean.setResult(true);
					 checkUserResultBean.setMsg("操作成功");
				}
				log.info("resultresult:   "+checkUserResultBean.toString());
				return checkUserResultBean.getString();
			}
			//type为1 表示撤销申请单,需要申请单状态为1
			if("1".equals(type)){				
				OperationBean operationBean = OperationConfigRepository.getOperationConfig("marketCancelShipApply");
			
				parameters.put("shipId", shipId);
				parameters.put("userId", userId);
				DBTool dbTool = new DBTool();
				dbTool.setAutoCommint(false);
				ResultBean resultBean = dbTool.execute(operationBean, parameters, false);
				
				if(resultBean==null||resultBean.isSuccess()==false){
					 checkUserResultBean.setResult(false);
					 checkUserResultBean.setMsg("保存入库发生错误，操作失败");
				}else{
					checkUserResultBean.setResult(true);
					checkUserResultBean.setMsg("操作成功");
				}
				log.info("resultresult:   "+checkUserResultBean.toString());
				return checkUserResultBean.getString();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		JSONObject jsonResult = new JSONObject();  
		jsonResult.put("result",false);
		jsonResult.put("message","操作失败:发生未知异常");
		log.info("resultresult:   "+jsonResult.toString());
		return jsonResult.toString();
		
	}
	
	/*
	public String setShipDetail(){
		ResultBean resultBean = this.getResultBean();
		List list =null;
		if(resultBean==null||resultBean.isSuccess()==false){
			log.info("\n\n resultBean==null||resultBean.isSuccess()==false \n\n");
			// return "listAction";
		}else{
			 list =(List) resultBean.getListResult("shipDetailList");
		}
		if(list==null||list.isEmpty()){
			list=(List) this.getParameter("shipDetailList");
		}
		
		 if(list==null||list.isEmpty()){
			 HtmsLogger.log("APPROVE701", "撤消时更新订单明细数据失败", "0", this.getRequest());
			 return "listAction";
		 }
		int size= list.size();
		log.info("\n\n ------------------------->shipDetailList.size="+size+"\n\n");
		ShipDetailBean detailBean = null;
		String[] applyTonNum=new String[size],codetailId=new String[size];
		for(int i=0;i<size;i++){
			detailBean = (ShipDetailBean)list.get(i);
			applyTonNum[i]=detailBean.getApplyTonNum();
			codetailId[i]=detailBean.getCodetailId()+"";
		}
		this.setCache("applyTonNum",applyTonNum,"request");
		this.setCache("codetailId",codetailId,"codetailId");
		return null;
	}
	*/
	
	

	
}
