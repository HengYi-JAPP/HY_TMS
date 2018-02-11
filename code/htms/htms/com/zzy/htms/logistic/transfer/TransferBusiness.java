package com.zzy.htms.logistic.transfer;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.utils.RequestHelper;
import com.mobilecn.utils.random.IntRandom;
import com.zzy.htms.dictionary.area.AreaBean;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.dictionary.factory.FactoryBean;
import com.zzy.htms.dictionary.factory.FactoryRepository;
import com.zzy.htms.dictionary.product.ProductBean;
import com.zzy.htms.dictionary.product.ProductRepository;
import com.zzy.htms.dictionary.transprice.TransPriceBean;
import com.zzy.htms.dictionary.transprice.TranspriceRepository;
import com.zzy.htms.location.SendLocation;
import com.zzy.htms.log.HtmsLogger;
import com.zzy.htms.logistic.freight.PriceUtil;
import com.zzy.htms.logistic.send.SendBean;
import com.zzy.htms.logistic.transferdetail.TransferDetailBean;
import com.zzy.htms.logistic.transport.TransportBean;
import com.zzy.htms.parklogistics.ParkLogisticsBean;
import com.zzy.htms.parklogistics.ParkLogisticsBussiness;
import com.zzy.htms.sales.customerprice.CustomerPriceBean;
import com.zzy.htms.sales.customerprice.CustomerPriceRepository;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sap.rfc.CustomerSynker;
import com.zzy.htms.sap.rfc.OrderStockSearcher;
import com.zzy.htms.sap.rfc.TransferSynker;
import com.zzy.htms.services.business.EstimateFreightBean;
import com.zzy.htms.services.business.FreightBean;
import com.zzy.htms.services.business.HtmsEstimateFreightBusiness;
import com.zzy.htms.services.business.HtmsFreightBusiness;

/**
 * 调拨单管理实现类
 * @author zzy
 *
 */
public class TransferBusiness  extends AbstractV2BusinessExecutor {
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER001", "分配调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER002", "分配调拨单失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER011", "撤销调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER012", "撤销调拨单失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER041", "修改调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER042", "修改调拨单失败", "0", this.getRequest());
		}
		return forward;
	}
	
	/**
	 * 车辆派送跟踪页面展示获取数据类
	 * @return
	 */
	public String viewTrack(){
		String forward=super.view();
		if (this.isSuccess()) {
		}else{
			HtmsLogger.log("TRANSFER052", "查看物流跟踪详情", "0", this.getRequest());
		}
		
		ResultBean resultBean = this.getResultBean();
		TransferBean transferBean =(TransferBean)  resultBean.getListFirstResult("VIEW_TRACK_TRANSFER");
		
		if(transferBean!=null&&transferBean.getSapTransCode()!=null){
			//加载园区物流信息
			ParkLogisticsBussiness  parkLog=new ParkLogisticsBussiness();		
			ParkLogisticsBean parkBean=parkLog.doParkLogisticsService(transferBean.getSapTransCode());
			this.setCache("parkLogisticsBean",parkBean,"request");
		}
		
		return forward;
	}
	
	
	/**
	 * 调拨单合并的预处理方法
	 * @return
	 */
	public String toMerge(){
		String forward=super.view();
		loadMergeTransferList();
		loadMergeTransferDetailList();
		loadRoute();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER031", "查看调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER032", "查看调拨单失败", "0", this.getRequest());
		}		
		return forward;
	}
	
		//PriceUtil.getCustomerPrice(productId, factoryId, areaId, customerId);
		
	/**
	 * 加载线路
	 */
	public void loadRoute(){
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("tranferList");
		
		List detailList =(List) resultBean.getListResult("detailList");
		
		 Map<String,List<TransPriceBean>> transpriceMap =new HashMap<String,List<TransPriceBean>>();
		 List<TransPriceBean> tempList = null;
		 
		 TransferBean transferBean=null;
		 TransferDetailBean detailBean = null;
		 String transId="";
		for(int i=0,size=list.size();i<size;i++){
			transferBean=(TransferBean)list.get(i);
			for(int j=0,dsize=detailList.size();j<dsize;j++){
				 detailBean=(TransferDetailBean) detailList.get(j);
				 transId=transferBean.getTransId()+"";
				 if(transId.equals(detailBean.getTransId()+"")){
					 tempList = transpriceMap.get(transId);
					 if(tempList==null){
						 tempList=new ArrayList<TransPriceBean>();
						 transpriceMap.put(transId, tempList);
					 }
					 TransPriceBean	priceBean=PriceUtil.getRoutePrice(detailBean.getProductId()+"", detailBean.getFactoryId(), transferBean.getAreaId(), transferBean.getActualTonNum(), transferBean.getShipApplyTime()); 
					 tempList.add(priceBean);
				 }
				
			}
			
		}
		 this.setCache("transpriceMap", transpriceMap, "request");
	}

	/**
	 * 检测合并之前的状态是否正常
	 */
	public void checkMergeTransferParams(){
		String INVOKE_MESSAGE="";
		try{
	
			String[] transferIds=this.getRequest().getParameterValues("checkTransferId");		
			String selectTransferIds="";
			if(transferIds==null){
				selectTransferIds="''";
			}else{
				StringBuffer buffer = new StringBuffer();
				for(int i=0;i<transferIds.length;i++){
					if(i>0){
						buffer.append("','");
					}
					if(i==0){
						buffer.append("'"+transferIds[i]);
					}else{
						buffer.append(transferIds[i]);
					}
				}
				selectTransferIds= buffer.toString()+"'";
			}
			
			//检查合并的调拨单数据是否符合要求
			Map parameters = new HashMap();
			parameters.put("transferIds", selectTransferIds);
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("getTransferMergeData");
			ResultBean resultBean = this.dbOperator(operationBean, parameters, false);
			List<TransferBean> transferList = new ArrayList<TransferBean>();
			transferList =resultBean.getListResult("SELECT_TRANSFER");
	
			
			String areaId="";
			String factoryId="";
			String productId="";
			String customerId="";
			
			TransferBean  transferBean=null;
			if(transferList==null||transferList.isEmpty()||transferList.size()<2){
				INVOKE_MESSAGE="合并调拨单失败:请选择两条或两条以上的调拨单!";
				this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
				return;
			}
			for(int i=0;i<transferList.size();i++){
				transferBean=(TransferBean) transferList.get(i);
				if(i==0){
					areaId=transferBean.getAreaId();
					factoryId=transferBean.getFactoryId();
					productId=transferBean.getProductId();
					customerId=transferBean.getCustomerId()+"";
				}else{
					if(!(areaId.equals(transferBean.getAreaId()))){
						INVOKE_MESSAGE="合并调拨单失败:选择的调拨单送货区域不一致!";
						this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
						break;
					}
					if(!(factoryId.equals(transferBean.getFactoryId()))){
						INVOKE_MESSAGE="合并调拨单失败:选择的调拨单工厂不一致!";
						this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
						break;			
					}
					if(!(customerId.equals(transferBean.getCustomerId()+""))){
						INVOKE_MESSAGE="合并调拨单失败:选择的调拨单客户不一致!";
						this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
						break;	
					}
					if(productId.equals("2")||productId.equals("4")){
						if(!(transferBean.getProductId().equals("2")||transferBean.getProductId().equals("4"))){
							INVOKE_MESSAGE="合并调拨单失败:选择的调拨单产品不一致!";
							this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
							break;
						}
					}else if(!(productId.equals(transferBean.getProductId()))){
						INVOKE_MESSAGE="合并调拨单失败:选择的调拨单产品不一致!";
						this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
						break;	
					}
				}
				if(transferBean.getIsMerger().equals("1")){
					INVOKE_MESSAGE="合并调拨单失败:选择的调拨单已经被合并!";
					this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
					break;
				}
			}
			if(INVOKE_MESSAGE.equals("")){
				this.setCache("isMerger","1","request");
				String mergerGroup = tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(100000,999999);
				this.setCache("mergerGroup",mergerGroup,"request");
				this.setCache("mergerTime",tools.tool.getDateTime(),"request");
				
				selectTransferIds=selectTransferIds.substring(1,selectTransferIds.length()-1);
				this.setCache("transferIds",selectTransferIds,"request");
				//this.setCache("mergerPerson","1","request");
			}
		}catch(Exception e){
			e.printStackTrace();
			INVOKE_MESSAGE="合并调拨单失败:程序发生异常!";
			this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
		}
	}
	
	
	/**
	 * 加载合并的单据列表
	 * @return
	 */
	public String loadMergeTransferList(){
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("tranferList");
		 if(list==null){
			 log.info("================================>list==null");
			 return null;
		 }
		  List<TransferBean> transferLists = new ArrayList<TransferBean>();
		  Map<String, String> transportsIdMap=new HashMap<String, String>();
		  
		  Map<String,Map<String,Map<String, List<TransferBean>>>> transfersMap=new HashMap<String,Map<String,Map<String, List<TransferBean>>>>();
	
		  Map<String,Map<String, List<TransferBean>>> orderMap=null;
		  Map<String, List<TransferBean>> applyMap=null;
		  TransferBean transferBean=null;
		 String transportId = null,areaId=null,factoryId=null,materialId=null,orderId=null,transferCode=null;
		 AreaRepository rep = new AreaRepository();
		 for(int i=0,size=list.size();i<size;i++){
			 transferBean=(TransferBean)list.get(i);
			 transportId = transferBean.getTransId()+"";
			 areaId=transferBean.getAreaId();
			 factoryId=transferBean.getMeterialFactory();
			 materialId=transferBean.getMeterialNo();
			 orderId=transferBean.getCorderId()+"";
			 transferCode=transferBean.getTransferCode();
			
			 orderMap=transfersMap.get(transportId);
			 if(orderMap==null){
				 orderMap= new HashMap<String,Map<String, List<TransferBean>>>();
				 transfersMap.put(transportId, orderMap);
			 }
			// log.info("================================>areaId:"+areaId+" , orderMap size="+orderMap.size());
			 applyMap=orderMap.get(orderId);
			 if(applyMap==null){
				 applyMap= new HashMap<String, List<TransferBean>>();
				 orderMap.put(orderId, applyMap);
			 }
			// log.info("================================>orderId:"+orderId+" , applyMap size="+applyMap.size());
			 transferLists=applyMap.get(transferCode);
			 if(transferLists==null){
				 transferLists = new ArrayList<TransferBean>();
				 applyMap.put(transferCode, transferLists);
			 }
			 transferBean.setAreaName( rep.getFullAreaName(transferBean.getAreaId(), "", true));
			 transferLists.add(transferBean);
			// log.info("================================>transferCode:"+transferCode+" , transportLists size="+transferLists.size());
			 
		 }
		 this.setCache("transfersMap", transfersMap, "request");
		 return null;
	}
	
	/**
	 * 加载合并单据的详细信息
	 * @return
	 */
	public String loadMergeTransferDetailList(){
		ResultBean resultBean = this.getResultBean();
		List detailList =(List) resultBean.getListResult("detailList");
		 if(detailList==null||detailList.isEmpty()){
			 return null;
		 }		
		 
		 TransferDetailBean detailBean = null;
		 List<TransferDetailBean> tempList = null;
		 Map<String,List<TransferDetailBean>> transportDetailMap =new HashMap<String,List<TransferDetailBean>>();
		 String transferId=null;
		 
		 
		 for(int i=0,size=detailList.size();i<size;i++){
			 detailBean=(TransferDetailBean) detailList.get(i);
			 transferId=detailBean.getTransId()+"";
			 tempList = transportDetailMap.get(transferId);
			 if(tempList==null){
				 tempList=new ArrayList<TransferDetailBean>();
				 transportDetailMap.put(transferId, tempList);
			 }
			 tempList.add(detailBean);
			 
		 }
		 
		 this.setCache("transferDetailMap", transportDetailMap, "request");
		 return null;
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
			//HtmsLogger.log("TRANSFER031", "查看调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER032", "查看调拨单失败", "0", this.getRequest());
		}
		//增加额外的运费等信息
		viewLoadTransportAndSendInfor();
		//增加运价信息
		viewLoadTransferPriceInfor();
		return forward;
	}
	
	private void viewLoadTransferPriceInfor(){
        TransferBean transferBean=(TransferBean) this.getParameter("tranferViewBean");		
		List<TransferDetailBean> transferDetailList=(List<TransferDetailBean>) this.getParameter("detailList");	
		
		List<FreightBean> freightList=(List<FreightBean>) this.getParameter("freightBean");	
		
		loadTransferPriceInfor(transferBean,transferDetailList);
		
		if(freightList!=null&&freightList.size()>0){
			this.setCache("sapFreightList", freightList, "request");	
		}
		

		
	}
	/**
	 * 传入参数都不能为空
	 * @param status　　　　　需要验证的合法的状态
	 * @param operation　　　提示对应的关键字
	 * @param transferStr　　从页面传入的transId　输入框组件的name
	 */
	private void transferStatusCheck(int status,String operation,String transferStr) throws Exception {
        String INVOKE_MESSAGE = "";
		
		//添加调拨单状态的检测，
		RequestHelper helper = new RequestHelper(this.getRequest());
		String transId = (String)helper.getValueFromAllScopes(transferStr);
		Map parameters = new HashMap();
		parameters.put("transId", transId);
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("getTransferById");
		ResultBean checkResultBean = this.dbOperator(operationBean, parameters, false);
		List<TransferBean> transferList = new ArrayList<TransferBean>();
		transferList =checkResultBean.getListResult("getTransferById");
		
		if(transferList==null||transferList.size()==0){
			INVOKE_MESSAGE=operation+"调拨单失败:无法获取调拨单信息!";
			this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
			return ;
		}
		if(transferList!=null||transferList.size()>0){
			TransferBean transferBean=transferList.get(0);
			if(transferBean.getTransStatus()!=status){
				String statusStr="";
				if(transferBean.getTransStatus()==2){
					statusStr="已排车";
				}
				if(transferBean.getTransStatus()==1){
					statusStr="已分配";
				}		
				if(transferBean.getTransStatus()==0){
					statusStr="未分配";
				}
				INVOKE_MESSAGE=operation+"调拨单失败:调拨单状态为 "+statusStr+"，不能"+operation+" !";
				this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
				return ;
			}
		}	
	}
	
	//currentTransId
	public void checkTransferSplitStatus(){
		try{
		
			int status = 0;
			String operation = "分拆";
			String transferStr = "currentTransId";
			String INVOKE_MESSAGE = "";
				
			//添加调拨单状态的检测，
			RequestHelper helper = new RequestHelper(this.getRequest());
			String transId = (String)helper.getValueFromAllScopes(transferStr);
			Map parameters = new HashMap();
			parameters.put("transId", transId);
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("getTransferById");
			ResultBean checkResultBean = this.dbOperator(operationBean, parameters, false);
			List<TransferBean> transferList = new ArrayList<TransferBean>();
			transferList =checkResultBean.getListResult("getTransferById");
			
			if(transferList==null||transferList.size()==0){
				INVOKE_MESSAGE=operation+"调拨单失败:无法获取调拨单信息!";
				this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
				return ;
			}
			//if(transferList!=null||transferList.size()>0){
				TransferBean transferBean=transferList.get(0);
				if(transferBean.getTransStatus()!=status){
					String statusStr="";
					if(transferBean.getTransStatus()==2){
						statusStr="已排车";
					}
					if(transferBean.getTransStatus()==1){
						statusStr="已分配";
					}		
					if(transferBean.getTransStatus()==0){
						statusStr="未分配";
					}
					INVOKE_MESSAGE=operation+"调拨单失败:调拨单状态为 "+statusStr+"，不能"+operation+" !";
					this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
					return ;
				}
			
			//验证分拆前后数量总数是否与我的申请一致
				if(transferBean.getShipId()>0){
					
					Map sendParameters = new HashMap();
					sendParameters.put("shipId", transferBean.getShipId());
					OperationBean shipOperationBean = OperationConfigRepository.getOperationConfig("getShipBeanById");
					ResultBean shipResultBean = this.dbOperator(shipOperationBean, sendParameters, false);
					List<ShipBean> shipBeanList = new ArrayList<ShipBean>();
					shipBeanList =shipResultBean.getListResult("getShipBeanById");
					
				
					
					if(shipBeanList==null||shipBeanList.size()==0){
						INVOKE_MESSAGE="分拆失败:无法判断输入信息的正确性!";
						this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
						return ;
					}else{
						ShipBean shipBean=shipBeanList.get(0);
						try{
							sendParameters.put("transId",transId);
							OperationBean transferOperationBean = OperationConfigRepository.getOperationConfig("getTransferByShipId");
							ResultBean transferResultBean = this.dbOperator(transferOperationBean, sendParameters, false);
							List<TransferBean> transferBeanList = new ArrayList<TransferBean>();
							transferBeanList =transferResultBean.getListResult("getTransferByShipId");
							
							
							BigDecimal applyTonNum= new BigDecimal(shipBean.getApplyTonNum());
							BigDecimal totalTon=new BigDecimal((String) helper.getValueFromAllScopes("totalTon"));
							BigDecimal splitTotalTon =new BigDecimal((String) helper.getValueFromAllScopes("splitTotalTon"));
							BigDecimal totalTonSum =new BigDecimal(0);
							if(transferBeanList!=null&&transferBeanList.size()>0){
								for(TransferBean transfer:transferBeanList){
									totalTonSum= totalTonSum.add(new BigDecimal(transfer.getApplyTonNum()));
								}
							}
							totalTonSum = totalTonSum.add(totalTon.add(splitTotalTon));
							boolean b=applyTonNum.compareTo(totalTonSum)>=0;
							if(!b){
								INVOKE_MESSAGE="分拆失败:分拆后的总数，超过申请总数!";
								this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
								return ;
							}
						}catch(Exception e){
							INVOKE_MESSAGE="分拆失败:发生未知错误，请重新操作!";
							this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
							return ;
						}
					}
				}else{
					INVOKE_MESSAGE="分拆失败:无法判断输入信息的正确性!";
					this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
					return ;
				}
			
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
		
		
	}
	
	public void  checkTransferAssignStatus(){
        try{
        	RequestHelper helper = new RequestHelper(this.getRequest());
    		String customPrice = (String)helper.getValueFromAllScopes("customPrice");
    		log.info(" /n/n/n/n/n/n/n    customPrice :    "+customPrice+"   /n/n/n/n/n/n/n");
        	transferStatusCheck(0,"分配","transId");
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
		
	}
	
	public void  checkTransferDeleteStatus(){
		try{
			transferStatusCheck(0,"删除","currentTransId");
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
		
	}
	
	public void  checkTransferCancelStatus(){
        try{
        	transferStatusCheck(1,"取消","transId");
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
		
	}
	
	
	
	public void viewLoadTransportAndSendInfor(){
		//缓存页面处理
//		PageCtl pageCtl  =this.getPageCtl();		
//		log.info("              curPage              "+ pageCtl.getCurPage());		
//		this.setCache("curPage", pageCtl.getCurPage(),"request");
		
		TransferBean transferBean=(TransferBean) this.getParameter("tranferViewBean");
		
		
		List<TransferDetailBean> transferDetailList=(List<TransferDetailBean>) this.getParameter("detailList");
		
		loadTransportAndSendInfor(transferBean,transferDetailList);
	}
	
	public void loadTransportAndSendInfor(TransferBean transferBean,List<TransferDetailBean> transferDetailList){
		
		if(transferBean!=null){
			AreaRepository rep = new AreaRepository();
			transferBean.setAreaName(rep.getFullAreaName(transferBean.getAreaId(), "", true));
			this.setCache("tranferViewBean", transferBean, "request");
		}
		
		List<TransferDetailBean> detailList=new ArrayList<TransferDetailBean>();
		if(transferDetailList!=null&&transferDetailList.size()>0){
			for(TransferDetailBean transDetailBean:transferDetailList){
				if(transDetailBean.getFreight()!=null){
					 BigDecimal  price=new BigDecimal(transDetailBean.getFreight()) ;
					 transDetailBean.setFreight(bigDecimalFormatDeletePointZero(String.valueOf(price.multiply(new BigDecimal(1000)))));
					 if(transDetailBean.getApplyTonNum()!=null){
						 BigDecimal transportTotalPrice=new BigDecimal(0) , weight=new BigDecimal(transDetailBean.getApplyTonNum());
						
						 transportTotalPrice=weight.multiply(price);
						 
						 transDetailBean.setTransportTotalPrice(bigDecimalFormatDeletePointZero(String.valueOf(transportTotalPrice)));
						 
					 }
				 }
				
				detailList.add(transDetailBean);
			}
			this.setCache("detailBeanList", detailList, "request");
		}
		
        TransportBean transportBean=null;
		
		List<TransportBean> transportBeanList = null;		
		if(transferBean!=null&&transferBean.getTransId()>0&&transferBean.getTransStatus()>0){
			Map parameters = new HashMap();
			parameters.put("transId", transferBean.getTransId());
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("SELECT_TRANSPORTBEANBYID");
			ResultBean coorderResultBean = this.dbOperator(operationBean, parameters, false);
			transportBeanList =coorderResultBean.getListResult("SELECT_TRANSPORTBEANBYID");
			if(transportBeanList!=null&&transportBeanList.size()>0){
				transportBean=transportBeanList.get(0);
				this.setCache("transportBean",transportBean , "request");
			}
			
		}
		
		List<SendBean> sendBeanList = null;		
		if(transportBean!=null&&transportBean.getTransportId()>0&&transferBean.getTransStatus()==2){
			Map parameters = new HashMap();
			parameters.put("transportId", transportBean.getTransportId());
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("SELECT_SENDBEAN");
			ResultBean coorderResultBean = this.dbOperator(operationBean, parameters, false);
			sendBeanList =coorderResultBean.getListResult("SELECT_SENDBEAN");
			if(sendBeanList!=null&&sendBeanList.size()>0){
				this.setCache("sendBean", sendBeanList.get(0), "request");
			}
			
		}
	}

	public String getAssignNum(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER231", "转向分配调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER232", "转向分配调拨单失败", "0", this.getRequest());
		}
		//getTransportCode();
		/*TransferBean transferBean=(TransferBean)this.getParameter("tranferViewBean");
		if(transferBean!=null){
			AreaRepository rep = new AreaRepository();
			transferBean.setAreaName(rep.getFullAreaName(transferBean.getAreaId(), "", true));
			 this.setCache("tranferViewBean", transferBean, "request");
		}*/
		//loadTransportAndSendInfor();
		getOrderNum();
		getAssignNumoadTransferPriceInfor();
		
		return forward;
	}
	
	private void getAssignNumoadTransferPriceInfor(){
		ResultBean resultBean = this.getResultBean();
		TransferBean transferBean =(TransferBean) resultBean.getListFirstResult("tranferViewBean");
		List<TransferDetailBean> detailList =(List<TransferDetailBean>) resultBean.getListResult("detailList");
		loadTransferPriceInfor(transferBean,detailList);
		
	}
	
	
	//分配的时候加载运价信息
	public void loadTransferPriceInfor(TransferBean transferBean,List<TransferDetailBean> transferDetailList){
		TransferDetailBean detailBean = null;
		String transId="";
		
		RequestHelper 	requestHelper=new RequestHelper(this.getRequest());
		String userId =(String)	requestHelper.getValueFromAllScopes("userId");
		
		List<EstimateFreightBean> estimateParamsList=new ArrayList<EstimateFreightBean>();
		 
		for(int j=0,dsize=transferDetailList.size();j<dsize;j++){
			 detailBean=(TransferDetailBean) transferDetailList.get(j);
			 
			// System.out.println("TransferBusiness  getProductId:"+detailBean.getProductId()+"  getFactoryId:"+ detailBean.getFactoryId()+"  getAreaId:" + transferBean.getAreaId()+"  applyTime:"+ detailBean.getApplyTonNum()+"  applyTime:"+transferBean.getShipApplyTime());
			 
			 EstimateFreightBean freightBean=new EstimateFreightBean();
			 freightBean.setItemCode(detailBean.getItemCode());
			 freightBean.setProductId(detailBean.getProductId()+"");
			 freightBean.setFactoryId(detailBean.getFactoryId()+"");
			 freightBean.setAreaId(transferBean.getAreaId());

			 freightBean.setApplyTonNum(detailBean.getApplyTonNum());
			 freightBean.setApplyTime(transferBean.getShipApplyTime());		
			 freightBean.setTranferId(transferBean.getTransId()+"");
			
			 
			 freightBean.setShipId(transferBean.getShipId()+"");
			 freightBean.setOrderId(transferBean.getCorderId()+"");
			 freightBean.setOrderCode(transferBean.getCorderCode());
			 freightBean.setItemId(detailBean.getTransDetailId()+"");
			 freightBean.setEstimateStep("3");
			 freightBean.setCustomerId(transferBean.getCustomerId()+"");
			 freightBean.setUserId(userId);
			 
			 estimateParamsList.add(freightBean);
		}
		
		//计算运价
		HtmsEstimateFreightBusiness freight=new HtmsEstimateFreightBusiness();
		List<FreightBean> freightList=freight.getEstimateFreight(estimateParamsList);

		Map<String,FreightBean> freightBeanMap =new HashMap<String,FreightBean>();
		Map<String,TransPriceBean> transpriceMap =new HashMap<String,TransPriceBean>();
		Map<String,CustomerPriceBean> customerPriceMap =new HashMap<String,CustomerPriceBean>();
		
		
		String freightType="";
		
		FreightBean freightBean = null ;
		if(freightList!=null&&freightList.size()>0){
			//按照运费查找线路对应的运价
			for(int i=0;i<freightList.size();i++){
				freightBean=(FreightBean) freightList.get(i);
				if(freightBean.getFreightType().equals("1")&&freightBean.getPriceId()!=null&&freightBean.getPriceId()!=""){
					transpriceMap.put(freightBean.getItemId(), TranspriceRepository.getTransPriceById(freightBean.getPriceId()));
					freightType="1";
				}
				if(freightBean.getFreightType().equals("2")&&freightBean.getPriceId()!=null&&freightBean.getPriceId()!=""){
					customerPriceMap.put(freightBean.getItemId(),CustomerPriceRepository.getCustemerPriceById(freightBean.getPriceId()));
					freightType="2";
				}
				System.out.println("TransferBusiness:loadTransferPriceInfor  itemcode:"+freightBean.getItemCode()+" ApplyTonNum:"+freightBean.getApplyTonNum()+" route:"+freightBean.getRouteId()+"");
				freightBeanMap.put(freightBean.getItemCode(), freightBean);
			}
			//按照我们系统中的线路和运价获取运价信息
			this.setCache("freightBeanMap", freightBeanMap, "request");		
			
			this.setCache("freightBean", freightBean, "request");		
			this.setCache("transpriceMap", transpriceMap, "request");
			this.setCache("customerPriceMap", customerPriceMap, "request");
			this.setCache("freightType", freightType, "request");
		}
	}
	
	
	
	public String list(){
		beforeSearch();
		String forward=super.list();		
		if(this.isSuccess()){
			//HtmsLogger.log("TRANSFER021","查看调拨单列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER022", "查看调拨单列表失败", "0", this.getRequest());
		}
		loadTransferList();
		//loadTransferList1();
		//loadTransferAreaList();
		return forward;
	}
	
	//缓存省市县缓存
	public void beforeSearch(){
		RequestHelper helper = new RequestHelper(this.getRequest());
		
		
		
		
		String provinceId = (String)helper.getValueFromAllScopes("provinceId");
		String cityId = (String)helper.getValueFromAllScopes("cityId");
		String countyId = (String)helper.getValueFromAllScopes("countyId");
		String countryId = (String)helper.getValueFromAllScopes("countryId");
		
		log.info("==============================>provinceId="+provinceId);
		log.info("==============================>cityId="+cityId);
		log.info("==============================>countyId="+countyId);
		log.info("==============================>countryId="+countryId);
		
		String areaId =this.isNull(countryId)?countyId:countryId;
		areaId =this.isNull(areaId)?cityId:areaId;
		areaId =this.isNull(areaId)?provinceId:areaId;
		AreaRepository areaRep = new AreaRepository();
		AreaBean areaBean =areaRep.getArea(areaId);
		if(areaBean!=null){
			this.setCache("areaCodeSH", areaBean.getAreaCode(),"request");
		}
		this.setCache("cacheProvinceId", provinceId, "request");
		this.setCache("cacheCityId", cityId, "request");
		this.setCache("cacheCountyId", countyId, "request");
		this.setCache("cacheCountryId", countryId, "request");
		
		//缓存页面当前页处理
		/*
		String curPage=(String)  helper.getValueFromAllScopes("curPage");
		if(!isNull(curPage)){
			PageCtl pageCtl  =this.getPageCtl();
			pageCtl.setCurPage(Integer.valueOf(curPage));
			this.setCache("pageCtl", pageCtl,"request");
		}*/
	}
	
	public String loadTransferList(){
		
		 List<ProductBean>  productList=ProductRepository.getProductList();		 
		 List<FactoryBean>  factoryList=FactoryRepository.getFactoryList();
		 
		 //缓存产品工厂信息
		String[] factoryIds =this.getRequest().getParameterValues("factoryIdSH");
		log.info("==============================>factoryIds.lenght="+(factoryIds==null?0:factoryIds.length));
		StringBuffer buffer = null;
		if(factoryIds!=null&&factoryIds.length>0){	
			buffer = new StringBuffer();
			 FactoryBean factoryBean=null;
			List<FactoryBean> checkFactoryList = new ArrayList<FactoryBean>();
			for(int i=0;i<factoryIds.length;i++){
				
				log.info("==============================>factoryIds[i]="+factoryIds[i]);
				if(i>0){
					buffer.append("','");
				}
				buffer.append(factoryIds[i]);
				factoryBean=FactoryRepository.getFactory(factoryIds[i]);
				checkFactoryList.add(factoryBean);
			}
			this.setCache("checkFactoryList",checkFactoryList,"request");
			this.setCache("facorysIdsSH", buffer.toString(),"request");
		}
		//缓存产品查询条件
		String[] productIds =this.getRequest().getParameterValues("productIdSH");
		log.info("==============================>productIds.lenght="+(productIds==null?0:productIds.length));
		if(productIds!=null&&productIds.length>0){	
			ProductBean productBean=null;
			List<ProductBean> checkProductList = new ArrayList<ProductBean>();
			buffer = new StringBuffer();
			for(int i=0;i<productIds.length;i++){
				log.info("==============================>productIds[i]="+productIds[i]);
				if(i>0){
					buffer.append("','");
				}
				buffer.append(productIds[i]);
				productBean=ProductRepository.getProduct(productIds[i]);
				checkProductList.add(productBean);
			}
			this.setCache("checkProductList",checkProductList,"request");
			this.setCache("productsIdsSH", buffer.toString(),"request");
		}
		
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List transferList =(List) resultBean.getListResult("SELECT");
		 if(transferList==null){
			 return null;
		 }
		//log.info("list====================="+list);
		
		 
		 List<TransferBean> detailList = null;
		 
		 
		 
	     String detailIdStr="";
		 for(int i=0,size=transferList.size();i<size;i++){
			 TransferBean transferBean=(TransferBean)transferList.get(i);
			 detailIdStr+="'" + transferBean.getTransId()+"',";
	    }
		
		
		List<TransferDetailBean> transdetailBeanList=null;
		if(detailIdStr!=null&&detailIdStr!=""&&detailIdStr.length()>0){
			detailIdStr+="'-1'";
			Map parameters = new HashMap();
			parameters.put("transDetailListId", detailIdStr);
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("SELECT_TRANSFERDETAILBEAN");
			ResultBean coorderResultBean = this.dbOperator(operationBean, parameters, false);
			transdetailBeanList =coorderResultBean.getListResult("SELECT_TRANSFERDETAILBEAN");
		}
		 
		 AreaRepository rep = new AreaRepository();
		 
		 //查看客户的客户余额
		 Map<String ,String>  customerAccountMark=new HashMap<String,String>();
		 CustomerSynker custSynker= new CustomerSynker();
		

		 //Map<String, Map<String, List<TransferBean>>> transferListMap=new HashMap<String, Map<String, List<TransferBean>>>();
		 Map<String, List<TransferBean>> transferDetailListMap=new HashMap<String, List<TransferBean>>();
		 
		 TransferBean transferBean=null;
		 String transId=null;
		 //log.info("list size=================="+(list==null?0:list.size()));
		 
		 List<String> transferKeyList = new ArrayList<String>();
		 for(int i=0,size=transferList.size();i<size;i++){
			 transferBean=(TransferBean)transferList.get(i);
			 
			 transferBean.setAreaName(rep.getFullAreaName(transferBean.getAreaId(), "", true));
			 
			 
			 if(transferBean.getCustomerCode()!=null&&transferBean.getCustomerCode()!=""){
			     String customerAmount= customerAccountMark.get(transferBean.getCustomerCode());
			     if(customerAmount==null){
			    	//System.out.println(transferBean.getCustomerCode());
			     	customerAmount=custSynker.getCustomerAccountMoney(transferBean.getCustomerCode(), transferBean.getSaleOrg());
			     	customerAccountMark.put(transferBean.getCustomerCode(), customerAmount);
			     }
			     transferBean.setCustomerAccount(customerAmount);
			 }
			 
			 
			 
			 if(transdetailBeanList!=null&&transdetailBeanList.size()>0){
				 for(TransferDetailBean transDetailBean:transdetailBeanList){
					 if(transferBean.getCodetailId()!=null&&transDetailBean.getCodetailId()!=null&&transferBean.getCodetailId().equals(transDetailBean.getCodetailId())){
						 if(transDetailBean.getFreight()!=null){
							 BigDecimal  price=new BigDecimal(transDetailBean.getFreight()) ;
							 
							 TransPriceBean	priceBean=PriceUtil.getRoutePrice(transDetailBean.getProductId()+"", transDetailBean.getFactoryId(), transferBean.getAreaId(), transDetailBean.getApplyTonNum(), transferBean.getShipApplyTime()); 
							 //transpriceMap.put(transId, priceBean);
							 
							 BigDecimal customerPrice=new BigDecimal(0);
							 if(priceBean!=null&&priceBean.getCustomerPrice()!=null&&priceBean.getCustomerPrice()!=""){
								 customerPrice=new BigDecimal(priceBean.getCustomerPrice());
								 String TON="24",KG="25",unit=null;
								 unit=priceBean.getPriceUnit();
								 if(TON.equals(unit)){//将按吨计转换成按公斤计算
									 customerPrice=customerPrice.divide(new BigDecimal(1000));
								 }
							 }
							 if(price.compareTo(customerPrice)==0){
								 transferBean.setFreight(bigDecimalFormatDeletePointZero(String.valueOf(price.multiply(new BigDecimal(1000)))));
							 }else{
								 transferBean.setFreight("<font color='red'>"+bigDecimalFormatDeletePointZero(String.valueOf(price.multiply(new BigDecimal(1000))))+"</font>");
							 }
							 
							
							 
							 
							 if(transferBean.getDetailApplyTonNum()!=null){
								 BigDecimal transportTotalPrice=new BigDecimal(0) , weight=new BigDecimal(transferBean.getDetailApplyTonNum());
								
								 transportTotalPrice=weight.multiply(price);
								 
								 transferBean.setTransportTotalPrice(bigDecimalFormatDeletePointZero(String.valueOf(transportTotalPrice)));
								 
								// log.info(" /n/n/n/n  ------------- transportTotalPrice:     "+bigDecimalFormatDeletePointZero(String.valueOf(transportTotalPrice))+"   /n/n/n/n   ");
							 }
						 }
						
						 if(transDetailBean.getUnitPrice()!=null){
							 transferBean.setUnitPrice(bigDecimalFormatDeletePointZero(String.valueOf(transDetailBean.getUnitPrice())));
						 }
						 
						 if(transDetailBean.getFactoryId()!=null){
							 transferBean.setFactoryId(transDetailBean.getFactoryId());
						 }
						 if(transDetailBean.getProductId()>0){
							 transferBean.setProductId(String.valueOf(transDetailBean.getProductId()));
						 }
						 if(transDetailBean.getShipPointDesc()!=null){
							 transferBean.setShipPointDesc(transDetailBean.getShipPointDesc());
						 }
						 
					 }
					 
				 }
			 }
			 if(transferBean.getFreight()==null){
				 transferBean.setFreight("");
			 }
			 if(transferBean.getUnitPrice()==null){
				 transferBean.setUnitPrice("");
			 }
			 if(transferBean.getTransportTotalPrice()==null){
				 transferBean.setTransportTotalPrice("");
			 }
			 if(transferBean.getFactoryId()!=null){
					for(FactoryBean factory:factoryList){
					     if(transferBean.getFactoryId().equals(String.valueOf(factory.getFactoryId()))){
					    	 transferBean.setFactoryName(factory.getFactoryName());
					     }
					}
		     } 
			 if(transferBean.getFactoryName()==null){
		    	 transferBean.setFactoryName(""); 
			 }
		    	
				 
			 if(transferBean.getProductId()!=null){
				for(ProductBean product:productList){
				     if(transferBean.getProductId().equals(String.valueOf(product.getProductId()))){
				    	 transferBean.setProductName(product.getProductName());
				     }
				}
			 }
			 if(transferBean.getProductName()==null){
		    	 transferBean.setProductName(""); 
			 }
			 //log.info("  ==============================  factory Name "+transferBean.getProductName());
			 
			 transId=String.valueOf(transferBean.getTransId());
			
			 //log.info("transId=================="+transId);
			 
			 detailList=transferDetailListMap.get(transId);
			 if(detailList==null){
				 detailList= new ArrayList<TransferBean>();
				 transferDetailListMap.put(transId, detailList);
				 transferKeyList.add(transId);
			 }
			 detailList.add(transferBean);
		 }
		 //log.info("\n\n");
		 
		 this.setCache("transferDetailListMap", transferDetailListMap, "request");
		 this.setCache("transferKeyList", transferKeyList, "request");
		 
		 
		 
		 
		 return null;
	}
	
	public static String delEndZero(String tmpStr) {
		if (tmpStr.endsWith("0")){
			return delEndZero(tmpStr.substring(0, tmpStr.length() - 1));
		}else{
			return tmpStr;
		}
	}
	
	public static String bigDecimalFormatDeletePointZero(String data){
		if(data==null||data==""){
			return "";
		}
		data=delEndZero(data);
		if (data.endsWith(".")){
			 return data.substring(0, data.length() - 1);
		}else{
			return data;
		}
	}
	
	public static String bigDecimalFormat(String data){
		 if(data==null||data==""){
			return "";
		 }
		 String formatStr="0.0";
		 DecimalFormat df = new DecimalFormat(formatStr);
		 BigDecimal  unitPrice=new BigDecimal(data) ;
		 return String.valueOf(df.format(unitPrice));
	}
	
	/**
	 * 从SAP中获取订单的订单数以及可发货数量
	 */
	public void getOrderNum(){
		ResultBean resultBean = this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			log.info("数据查询出错，无法获取订单可发货数量");
			return ;
		}
		TransferBean transferBean =(TransferBean) resultBean.getListFirstResult("tranferViewBean");
		if(transferBean!=null){
			AreaRepository rep = new AreaRepository();
			transferBean.setAreaName(rep.getFullAreaName(transferBean.getAreaId(), "", true));
			 this.setCache("tranferViewBean", transferBean, "request");
		}
		if(transferBean==null){
			log.info("getOrderNum未获取订单数据，无法获取订单可发货数量 tranferViewBean");
			return ;
		}
		List detailLit =(List) resultBean.getListResult("detailList");
		if(detailLit==null||detailLit.isEmpty()){
			log.info("getOrderNum未获取订单明细数据，无法获取订单可发货数量 detailList");
			return ;
		}
		int size = detailLit.size();
		String[] ordersCodes=new String[size], itemsCodes=new String[size];
		TransferDetailBean detailBean = null;
		String orderCode = transferBean.getCorderCode(),itemCode=null,meterialNo=null,meterialFactory=null;
		OrderStockSearcher stockSynker= null;
		String sapStock=null;
		for(int i=0;i<size;i++){
			detailBean=(TransferDetailBean)detailLit.get(i);
			
			ordersCodes[i]=orderCode;
			itemsCodes[i]=detailBean.getCodetailCertificate();
			meterialNo=detailBean.getMeterialNo();
			meterialFactory=detailBean.getMeterialFactory();
			/**
			 * 根据工厂及物料号从SAP中获取可用库存
			 */
			stockSynker= new OrderStockSearcher();
			sapStock=stockSynker.getFactoryMaterialStock( meterialFactory,meterialNo);
			sapStock=this.isNull(sapStock)?"0":sapStock;
			
			detailBean.setStockNum(sapStock);
			
			
			//添加计算运费的代码
			if(detailBean.getFreight()!=null){
				 BigDecimal  price=new BigDecimal(detailBean.getFreight()) ;
				 if(detailBean.getApplyTonNum()!=null){
					 BigDecimal transportTotalPrice=new BigDecimal(0) , weight=new BigDecimal(detailBean.getApplyTonNum());
					 transportTotalPrice=weight.multiply(price);
					 detailBean.setTransportTotalPrice(bigDecimalFormatDeletePointZero(String.valueOf(transportTotalPrice)));
				 }
				 //将单价转换为元/吨
				 detailBean.setFreight(bigDecimalFormatDeletePointZero(String.valueOf(price.multiply(new BigDecimal(1000)))));
			 }
		}
		
	/*	List transferDetailList =(List) resultBean.getListResult("transferDetailList");
		Map<String,String> useNumMap=new HashMap<String,String>();
		TransferDetailBean transferDetailBean = null;
		for(int i=0,iSize=transferDetailList==null?0:transferDetailList.size();i<iSize;i++){
			transferDetailBean=(TransferDetailBean)transferDetailList.get(i);
			useNumMap.put(transferDetailBean.getItemCode(), transferDetailBean.getApplyTonNum());
		}
*/
		log.info("Start invoke OrderStockSearcher Api");
		long time = System.currentTimeMillis();
		OrderStockSearcher synker= new OrderStockSearcher();
		Map<String,Map<String,String>> sapStockMap=synker.getOrderStock(ordersCodes,itemsCodes);
		log.info("End invoke OrderStockSearcher Api,Use Time:"+(System.currentTimeMillis()-time));
		if(sapStockMap==null||sapStockMap.isEmpty()){
			log.info("未从SAP中获取订单可发货数量。");
			//loadTransportAndSendInfor(transferBean,detailLit);
			this.setCache("detailLit", detailLit, "request");
			return;
		}
		CustomerSynker custSynker= new CustomerSynker();
		String customerAmount=custSynker.getCustomerAccountMoney(transferBean.getCustomerCode(), transferBean.getSaleOrg());
		customerAmount=this.isNull(customerAmount)?"0.0":customerAmount;
		
		String sapStrNum=null,dbStrNum=null;
		BigDecimal sapApplyNum = null,dbApplyNum;
		Map<String,String > tempMap=null;
		for(int i=0;i<size;i++){
			detailBean=(TransferDetailBean)detailLit.get(i);
			itemCode=detailBean.getItemCode();
			log.info("orderCode="+orderCode+",itemCode="+itemCode);
			tempMap=sapStockMap.get(orderCode+itemCode);
			if(tempMap==null||tempMap.isEmpty()){
				continue;
			}
			
			sapStrNum=tempMap.get("applyNum");
			sapStrNum=this.isNull(sapStrNum)?"0":sapStrNum;
			//sapApplyNum=new BigDecimal(sapStrNum);
			detailBean.setAppliableAmount(sapStrNum);
			/*dbStrNum=useNumMap.get(itemCode);
			dbStrNum=this.isNull(dbStrNum)?"0":dbStrNum;
			dbApplyNum=new BigDecimal(dbStrNum);
			
			log.info("sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum);
			if(sapApplyNum.compareTo(dbApplyNum)<1){
				detailBean.setAppliableAmount("0");
			}else{
				sapApplyNum=sapApplyNum.subtract(dbApplyNum);
				detailBean.setAppliableAmount(sapApplyNum+"");
			}
			log.info("sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum+",applyNum="+detailBean.getAppliableAmount());*/
		}
		tools.tool.clear(tempMap);
		tools.tool.clear(sapStockMap);
		//tools.tool.clear(useNumMap);
		//tools.tool.clear(transferDetailList);
		
		this.setCache("customerAmount", customerAmount, "request");
		
		//loadTransportAndSendInfor(transferBean,detailLit);
		this.setCache("detailLit", detailLit, "request");
	}
	
	
	public String loadTransferList1(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		List transferDetailList =(List) resultBean.getListResult("SELECT_TRANSFERDETAILBEAN");
		
		 if(list==null){
			 return null;
		 }
		//log.info("list====================="+list);
		  List<TransferBean> transferLists = new ArrayList<TransferBean>();
		  Map<String, String> transfersIdMap=new HashMap<String, String>();
		  
		 //map<areaId,<orderId,<applyId,List<transferBean>>>>>>
		  //Map<String,Map<String,Map<String,Map<String,Map<String, List<TransferBean>>>>>> transfersMap=new HashMap<String,Map<String,Map<String,Map<String,Map<String, List<TransferBean>>>>>>();
		  Map<String,Map<String,Map<String, List<TransferBean>>>> transfersMap=new HashMap<String,Map<String,Map<String, List<TransferBean>>>>();
		  Map<String,List<TransferDetailBean>>  transferDetailsMap=new HashMap<String,List<TransferDetailBean> >();
		 
		  
		  TransferDetailBean transferDetailBean=null;
		  
		  for(int j=0;j<transferDetailList.size();j++){
			  transferDetailBean=(TransferDetailBean) transferDetailList.get(j);
			  String key=Integer.toString(transferDetailBean.getTransId());
			  List<TransferDetailBean> beanList=new ArrayList<TransferDetailBean>();
			  
			  
			  if(transferDetailsMap.containsKey(key)){
				  beanList=transferDetailsMap.get(key);
				  beanList.add(transferDetailBean);
				  //log.info("  detailmapDuplicate :   "+key+"   "+beanList.size());
				  transferDetailsMap.put(key, beanList);
			  }else{
				  beanList.add(transferDetailBean);
				  //log.info("  detailmap :   "+key+"   "+beanList.size());
				  transferDetailsMap.put(key, beanList);
			  }
		  } 
		 
		 
		  
		  
		  // Map<String,Map<String,Map<String,Map<String, List<TransferBean>>>>> factoryMap = null;
		  //Map<String,Map<String,Map<String, List<TransferBean>>>> materialMap=null;
		  Map<String,Map<String, List<TransferBean>>> orderMap=null;
		  Map<String, List<TransferBean>> applyMap=null;
		 TransferBean transferBean=null;
		 String transferId = null,areaId=null,factoryId=null,materialId=null,orderId=null,applyCode=null;
		 AreaRepository rep = new AreaRepository();
		 for(int i=0,size=list.size();i<size;i++){
			 transferBean=(TransferBean)list.get(i);
			 transferId = transferBean.getTransId()+"";
			 areaId=transferBean.getAreaId();
			 factoryId=transferBean.getMeterialFactory();
			 materialId=transferBean.getMeterialNo();
			 orderId=transferBean.getCorderId()+"";
			 applyCode=transferBean.getShipCode();
			 
			 if(transfersIdMap.get(transferId)!=null){
				 continue;
			 }
			 transfersIdMap.put(transferId, transferId);
			 
			 /*
			  factoryMap=transfersMap.get(areaId);
			 if(factoryMap==null){
				 factoryMap= new HashMap<String,Map<String,Map<String,Map<String, List<TransferBean>>>>>();
				 transfersMap.put(areaId, factoryMap);
			 }
			 
			 materialMap=factoryMap.get(factoryId);
			 if(materialMap==null){
				 materialMap= new HashMap<String,Map<String,Map<String, List<TransferBean>>>>();
				 factoryMap.put(factoryId, materialMap);
			 }*/
			 
			 orderMap=transfersMap.get(areaId);
			 if(orderMap==null){
				 orderMap= new HashMap<String,Map<String, List<TransferBean>>>();
				 transfersMap.put(areaId, orderMap);
			 }
			 
			 applyMap=orderMap.get(orderId);
			 if(applyMap==null){
				 applyMap= new HashMap<String, List<TransferBean>>();
				 orderMap.put(orderId, applyMap);
			 }
			 
			 transferLists=applyMap.get(applyCode);
			 if(transferLists==null){
				 transferLists = new ArrayList<TransferBean>();
				 applyMap.put(applyCode, transferLists);
			 }
			 
			 transferBean.setAreaName(rep.getFullAreaName(transferBean.getAreaId(), "", true));
			 transferLists.add(transferBean);
			 tools.tool.sortList(transferLists, "transId", true);
		 }
		 this.setCache("transfersMap", transfersMap, "request");
		 this.setCache("transferDetailsMap", transferDetailsMap, "request");
		 return null;
	}
	
	
	//DefautMethod,MethodId:1960, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1958, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1959, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1957, MethodName:默认删除, MethodCode:delete
	//Self Define Method End.	
	public String getTransportCode(){
		Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Random random = new Random();
        int x = random.nextInt(1000);
        String transportCode = sdf.format(d)+x;
        this.getRequest().setAttribute("transportCode", transportCode);
		return transportCode;
	}
	
	public void performGetFreight(){
		try{
			HtmsFreightBusiness freightBussiness=new HtmsFreightBusiness();
			RequestHelper helper = new RequestHelper(this.getRequest());
			String sapTransCode = (String) helper.getValueFromAllScopes("sapTransCode");
			if(sapTransCode==null||sapTransCode.equals("")){
				this.setCache("SAP_INVOKE_MESSAGE","操作失败:SAP调拨单为空!","request");
				return ;
			}
			String result = freightBussiness.menualCalculateFreight(sapTransCode);
			if(result==null||result.equals("")){
				this.setCache("SAP_INVOKE_MESSAGE","操作成功:调用运费成功!","request");
			}else{
				this.setCache("SAP_INVOKE_MESSAGE","操作失败:"+result,"request");
			}
		}catch(Exception e){
			this.setCache("SAP_INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
	}
	
	public String cancelSelfFetch(){
		this.setCache("listSelfFtech", "true", "request");
		this.setCache("SAP_INVOKE_MESSAGE","取消调拨单失败。","request");
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER071", "取消调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER072", "取消调拨单失败", "0", this.getRequest());
		}
		ResultBean resultBean=this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			log.info("数据库没有获取查询结果，不能取消SAP中的调拨单");
			return null;
		}
		
		TransferBean transferBean=(TransferBean)resultBean.getListFirstResult("transferBean");
		if(transferBean==null){
			log.info("没有获取调拨单，不能取消SAP中的调拨单");
			return null;
		}
		TransferSynker transSynker= new TransferSynker();
		String message =transSynker.dropTransfer(transferBean.getSapTransCode(),transferBean.getShipId()+"");
		if ("S".equalsIgnoreCase(message)) {
			HtmsLogger.log("TRANSFER075", "取消SAP中的调拨单成功", "1", this.getRequest());
			this.setCache("modifyTime", tools.tool.getDateTime(), "request");
			this.setCache("listSelfFtech", "", "request");
			this.setCache("SAP_INVOKE_MESSAGE","","request");
			this.setCache("sapTransferCode","","request");
			
		}else{
			this.setCache("SAP_INVOKE_MESSAGE","取消调拨单失败。"+message,"request");
			HtmsLogger.log("TRANSFER076", "取消SAP中的调拨单失败", "0", this.getRequest());
		}
		return forward;
	}
	
	private void outLocation(String message, HttpServletResponse response) {
		if (message==null||"".equals(message.trim())) {
			return;
		}
		PrintWriter out = null;
		try {
			
			response.setContentType("application/x-www-form-urlencoded; charset=utf-8");
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			out.write(message);
			out.flush();
			out.close();
			
			out = null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
	}
	
	public String getLocation(){
		String outMsg = "{\"code\":";	
		super.list();
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List localtionList =(List) resultBean.getListResult("SELECTLOCATION");
		 if(localtionList==null || localtionList.size() == 0){
			 
			 outMsg += "1001,\"msg\":\"没有获取到坐标\"}";
			 this.outLocation(outMsg, this.getResponse());
			 
			 return "NULL";
		 }
		 SendLocation sendLocation = (SendLocation) localtionList.get(0);
		 outMsg += ("0,\"latitude\":" + sendLocation.getLatitude()+ ",\"longitude\":" + sendLocation.getLongitude()+ "}");
		 this.outLocation(outMsg, this.getResponse());
		return "NULL";
	}
}

