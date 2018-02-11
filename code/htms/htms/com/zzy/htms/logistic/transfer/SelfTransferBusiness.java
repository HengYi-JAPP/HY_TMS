package com.zzy.htms.logistic.transfer;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.utils.RequestHelper;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.dictionary.traderprice.TraderPriceBean;
import com.zzy.htms.log.HtmsLogger;
import com.zzy.htms.logistic.freight.PriceUtil;
import com.zzy.htms.logistic.transferdetail.TransferDetailBean;
import com.zzy.htms.owncar.OwnCarBean;
import com.zzy.htms.sales.customer.CustomerBean;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sap.rfc.TransferSynker;
import com.zzy.htms.webservice.market.order.HtmsApplyOrderBussiness;

/**
 * 贸易商自提管理实现类
 * @author zzy
 *
 */
public class SelfTransferBusiness  extends AbstractV2BusinessExecutor {
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER001", "分配贸易商自提调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER002", "分配贸易商自提调拨单失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER011", "撤销贸易商自提调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER012", "撤销贸易商自提调拨单失败", "0", this.getRequest());
		}
		return forward;
	}
	
	
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER041", "修改贸易商自提调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER042", "修改贸易商自提调拨单失败", "0", this.getRequest());
		}
		
		return forward;
	}
	
	
	public String rejectSelfFetch(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER041", "修改贸易商自提调拨单成功", "1", this.getRequest());
			RequestHelper helper = new RequestHelper(this.getRequest());    
		    String shipId=(String) helper.getValueFromAllScopes("currentShipId");

		    HtmsApplyOrderBussiness   applyOrderBussiness=new HtmsApplyOrderBussiness();
		    boolean b=applyOrderBussiness.updateApplyStatus(Integer.valueOf(shipId),"901");
			if(!b){
				this.setCache("OPERATION_RESULT","false","request");
				String errorMessage="撤销失败：调用闭环系统取消订单接口失败";
				this.setCache("INVOKE_MESSAGE",errorMessage,"request");
				log.info(errorMessage);
			}
		}else{
			HtmsLogger.log("TRANSFER042", "修改贸易商自提调拨单失败", "0", this.getRequest());
		}
		
		return forward;
	}
	
	
	/**
	 * 传入参数都不能为空
	 * @param status　　　　　需要验证的合法的状态
	 * @param operation　　　提示对应的关键字
	 * @param selfFetchIdStr　　从页面传入的transId　输入框组件的name
	 */
	private void selfFetchStatusCheck(int status,String operation,String selfFetchIdStr) throws Exception {
        String INVOKE_MESSAGE = "";
		
		//添加调拨单状态的检测，
		RequestHelper helper = new RequestHelper(this.getRequest());
		String transId = (String)helper.getValueFromAllScopes(selfFetchIdStr);
		Map parameters = new HashMap();
		parameters.put("transId", transId);
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("getSelfFetchById");
		ResultBean checkResultBean = this.dbOperator(operationBean, parameters, false);
		List<TransferBean> transferList = new ArrayList<TransferBean>();
		transferList =checkResultBean.getListResult("getSelfFetchById");
		
		if(transferList==null||transferList.size()==0){
			INVOKE_MESSAGE=operation+"自提失败:无法获取自提信息!";
			this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
			return ;
		}
		if(transferList!=null||transferList.size()>0){
			TransferBean transferBean=transferList.get(0);
			if(transferBean.getTransStatus()!=status){
				String statusStr="";
				if(transferBean.getTransStatus()==1){
					statusStr="已分配";
				}		
				if(transferBean.getTransStatus()==0){
					statusStr="未分配";
				}
				INVOKE_MESSAGE=operation+"自提失败:自提信息状态为 "+statusStr+"，不能操作 !";
				this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
				return ;
			}
		}	
	}
	
	
	/**
	 * 检测同意此调拨单之前 ,状态是否为同意,如果是客户自提,是否有贸易商运价
	 */
	public void checkSelfFetchAgreeStatus(){
		try{
		    selfFetchStatusCheck(0,"同意","transId");
		    
		    RequestHelper helper = new RequestHelper(this.getRequest());
			String transId = (String)helper.getValueFromAllScopes("transId");
			String selfFetchType = (String)helper.getValueFromAllScopes("selfFetchType");
			if(selfFetchType==null||selfFetchType==""){
				selfFetchType="1";
			}
			//如果是自备车自提调拨单,则跳过贸易商运价检测
			if("2".equals(selfFetchType)){
				return;
			}
		    Map parameters = new HashMap();
			parameters.put("transId", transId);
		    OperationBean operationBean = OperationConfigRepository.getOperationConfig("getTranferAndDetailById");
			ResultBean resultBean = this.dbOperator(operationBean, parameters, false);
			List<TransferBean> transferList = new ArrayList<TransferBean>();
			TransferBean transferBean=(TransferBean)resultBean.getListFirstResult("transferBean");
			List<TransferDetailBean> transDetailList=(List<TransferDetailBean>)resultBean.getListResult("transDetailList");
			ShipBean shipBean=(ShipBean)resultBean.getListFirstResult("shipBean");
			if(transferBean!=null&&transDetailList!=null&&transDetailList.size()>0&&shipBean!=null){
				TransferDetailBean transferDetailBean=null;
				BigDecimal  totalActualTonNum=new BigDecimal("0.00"),actualApplyTon=null;
				for(int i=0,size=transDetailList.size();i<size;i++){
					transferDetailBean=transDetailList.get(i);
					actualApplyTon=new BigDecimal(transferDetailBean.getApplyTonNum());
					totalActualTonNum=totalActualTonNum.add(actualApplyTon);
				}
				log.info("parameters: producted:"+transferDetailBean.getProductId()+" factoryid:"+ transferDetailBean.getFactoryId()+" areaId:"+ transferBean.getAreaId()+" totalApplyNum:"+ totalActualTonNum+"  shipbean createtime:"+ shipBean.getCreateTime());
			    TraderPriceBean traderPriceBean=PriceUtil.getTraderPrice(transferDetailBean.getProductId()+"", transferDetailBean.getFactoryId(), transferBean.getAreaId(), totalActualTonNum, shipBean.getCreateTime());
			    
			    if(traderPriceBean==null){
			    	this.setCache("INVOKE_MESSAGE","操作失败:获取不到贸易商运价信息,不能提交!","request");
			    }else{
			    	log.info("priceid:"+traderPriceBean.getPriceId()+"  validateDate:"+traderPriceBean.getValidateDate()+"  price:"+traderPriceBean.getCustomerPrice());
			    }
			}else{
				this.setCache("INVOKE_MESSAGE","操作失败:获取不到调拨单或者申请单信息!","request");
			}
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			log.error("操作失败:发生未知异常!"+e.getMessage());
			e.printStackTrace();
		}
	}
	
	public void checkSelfFetchRejectStatus(){
		try{
		    selfFetchStatusCheck(0,"拒绝","transId");
        }catch(Exception e){
        	this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
	}
	
	public void checkSelfFetchCancelStatus(){
		try{
			selfFetchStatusCheck(1,"取消","transId");
         }catch(Exception e){
        	this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
 			e.printStackTrace();
		}
	}
	
	/**
	 * 创建sap中的调拨单
	 */
	public String createSapTransfer(){
		String forward=super.modify();
	
		ResultBean resultBean=this.getResultBean();
		String SAP_INVOKE_MESSAGE="";
		if(resultBean==null||resultBean.isSuccess()==false){
			SAP_INVOKE_MESSAGE="数据库没有获取查询结果，不能创建SAP中的调拨单";
			return "listPage";
		}
		
		TransferBean transferBean=(TransferBean)resultBean.getListFirstResult("transferBean");
		if(transferBean==null){
			SAP_INVOKE_MESSAGE="没有获取调拨单，不能创建SAP中的调拨单";
			this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
			return "listPage";
		}
		if(this.isNull(transferBean.getSapTransCode())==false){
			SAP_INVOKE_MESSAGE="该调拨单在SAP中已经创建调拨单，无须再创建。";
			this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
			return "listPage";
		}
		AreaRepository rep = new AreaRepository();
		transferBean.setAreaName(rep.getFullAreaName(transferBean.getAreaId(), "", true));
		//" beanClass="com.zzy.htms.logistic.transferdetail.TransferDetailBean
		List<TransferDetailBean> detailList=(List<TransferDetailBean>)resultBean.getListResult("detailList");
		if(detailList==null||detailList.isEmpty()){
			SAP_INVOKE_MESSAGE="没有获取调拨单，不能创建SAP中的调拨单";
			this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
			return "listPage";
		}
		
		RequestHelper helper = new RequestHelper(this.getRequest());
		String selfFetchType = (String)helper.getValueFromAllScopes("selfFetchType");
		if(selfFetchType==null||selfFetchType==""){
			selfFetchType="1";
		}
		//如果是自备车自提调拨单,则跳过贸易商运价检测
		if("2".equals(selfFetchType)){
			Map parameters =  new HashMap();
			parameters.put("customerCode", transferBean.getCustomerCode());
			parameters.put("customerId", transferBean.getCustomerId());
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("getCustemerSelfFetchFreight");
			ResultBean customerCodeResultBean = this.dbOperator(operationBean,parameters, false);
			CustomerBean   customerBean =(CustomerBean)   customerCodeResultBean.getListFirstResult("customerBean");
			if(customerBean!=null&&customerBean.getManagementFee()!=null&&customerBean.getFeeId()!=null){
				log.info("获取的自提车管理费用为  priceid:feeid: "+customerBean.getFeeId()+"  price:"+customerBean.getManagementFee());
				transferBean.setSelfFetchPriceExist(true);
			}else{
				log.info("获取的自提车管理费用为空");
			}
		}
		
		TransferSynker transSynker= new TransferSynker();
		Map<String,Map<String,String>> resutlMap=transSynker.createTransfer(transferBean, detailList);
	
		
		if(resutlMap==null){
			SAP_INVOKE_MESSAGE="SAP调用出错，调拨单分配不成功。";
			this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
		}
		Map<String,String> map=resutlMap.get(transferBean.getTransferCode());
		if(map==null){
			SAP_INVOKE_MESSAGE="SAP调用出错，没有返回信息，调拨单分配不成功。";
		}
		String result=map.get("result");
		String sapTransferCode= map.get(transferBean.getTransferCode());
		if("E".equals(result)){
			SAP_INVOKE_MESSAGE="SAP调用出错，返回信息:"+map.get("message");
		}else{		
			if(this.isNull(sapTransferCode)){
				SAP_INVOKE_MESSAGE="SAP调用出错，返回的调拨单号为空。";
				return null;
			}//else{
			if("S".equals(result)==false){
				SAP_INVOKE_MESSAGE="SAP调用出错，无法创建调拨单。"+result;
				this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
				return null;
			}
			/*写车牌号*/
			/*String fetchCar =transferBean.getFetchCar();
			if(this.isNull(fetchCar)){
				SAP_INVOKE_MESSAGE="自提车牌为空，无法写入SAP。但创建调拨单成功。";
				//return null;
			}
				
			CarSynker carSynker= new CarSynker();		
			
			result=carSynker.writeCarNo(sapTransferCode,fetchCar);
			if("S".equals(result)==false){
				SAP_INVOKE_MESSAGE="自提车牌写入SAP失败。但创建调拨单成功。返回信息："+result;
				this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
				//return null;
			}*/
			//}
		}
		//log.info("===================================>sapTransferCode="+sapTransferCode);
		//log.info("===================================>map="+map);
		//log.info("===================================>SAP_INVOKE_MESSAGE="+SAP_INVOKE_MESSAGE);
		this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
		this.setCache("sapTransferCode",sapTransferCode,"request");
		this.setCache("modifyTime",tools.tool.getDateTime(),"request");
		return this.isNull(SAP_INVOKE_MESSAGE)?null:"listPage";
	}
	/**
	 * 创建sap中的调拨单
	 */
	/*public String createSapTransfer(){
		String forward=super.modify();
		ResultBean resultBean=this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			log.info("数据库没有获取查询结果，不能创建SAP中的调拨单");
			return null;
		}
		
		TransferBean transferBean=(TransferBean)resultBean.getListFirstResult("transferBean");
		if(transferBean==null){
			log.info("没有获取调拨单，不能创建SAP中的调拨单");
			return null;
		}
		if(this.isNull(transferBean.getSapTransCode())==false){
			log.info("该调拨单在SAP中已经创建调拨单，无须再创建。");
			return null;
		}
		AreaRepository rep = new AreaRepository();
		transferBean.setAreaName(rep.getFullAreaName(transferBean.getAreaId(), "", true));
		//" beanClass="com.zzy.htms.logistic.transferdetail.TransferDetailBean
		List<TransferDetailBean> detailList=(List<TransferDetailBean>)resultBean.getListResult("detailList");
		if(detailList==null||detailList.isEmpty()){
			log.info("没有获取调拨单，不能创建SAP中的调拨单");
			return null;
		}
		TransferSynker transSynker= new TransferSynker();
		String sapTransferCode=transSynker.createTransfer(transferBean, detailList);
		log.info("===================================>sapTransferCode="+sapTransferCode);
		this.setCache("sapTransferCode",sapTransferCode,"request");
		return this.isNull(sapTransferCode)?null:"updateSapTransferCode";
	}*/
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1955, MethodName:默认新增, MethodCode:add
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER031", "查看贸易商自提调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER032", "查看贸易商自提调拨单失败", "0", this.getRequest());
		}
		//getTransportCode();
		TransferBean transferBean=(TransferBean)this.getParameter("tranferViewBean");
		if(transferBean!=null){
			AreaRepository rep = new AreaRepository();
			transferBean.setAreaName(rep.getFullAreaName(transferBean.getAreaId(), "", true));
			 this.setCache("tranferViewBean", transferBean, "request");
		}

		
		return forward;
	}
	
	public String list(){
		String forward=super.list();

		if(this.isSuccess()){
			//HtmsLogger.log("TRANSFER021","查看贸易商自提调拨单列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER022", "查看贸易商自提调拨单列表失败", "0", this.getRequest());
		}
		
		
		return forward;
	}
	
}

