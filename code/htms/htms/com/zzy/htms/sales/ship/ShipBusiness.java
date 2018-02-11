package com.zzy.htms.sales.ship;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.utils.RequestHelper;
import com.zzy.htms.dictionary.area.AreaBean;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.dictionary.factory.FactoryBean;
import com.zzy.htms.dictionary.factory.FactoryRepository;
import com.zzy.htms.dictionary.product.ProductBean;
import com.zzy.htms.dictionary.product.ProductRepository;
import com.zzy.htms.log.HtmsLogger;
import com.zzy.htms.logistic.transfer.TransferBean;
import com.zzy.htms.logistic.transferdetail.TransferDetailBean;
import com.zzy.htms.sales.customeraddr.CustomerAddrBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;
import com.zzy.htms.sap.rfc.CustomerSynker;
import com.zzy.htms.sap.rfc.OrderStockSearcher;
import com.zzy.htms.services.business.EstimateFreightBean;
import com.zzy.htms.services.business.FreightBean;
import com.zzy.htms.services.business.HtmsEstimateFreightBusiness;
import com.zzy.htms.webservice.market.order.HtmsApplyOrderBussiness;

/**
 * 发货申请业务处理类
 * @author zzy
 *
 */
public class ShipBusiness  extends AbstractV2BusinessExecutor {
	
	public String deleteAppliedShip(){
		String forward = super.view();
		if (this.isSuccess()) {

		}else{
			HtmsLogger.log("APPROVE002", "加载申请审批列表失败", "0", this.getRequest());
		}
		return forward;
	}
	/**
	 * 检测发货申请状态是否正确
	 */
	public void  checkShipStatusApply(){
		try{
			RequestHelper helper = new RequestHelper(this.getRequest());
			String shipId = (String)helper.getValueFromAllScopes("shipId");
			Map parameters = new HashMap();
			parameters.put("shipId", shipId);
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("checkPassApplySql");
			ResultBean coorderResultBean = this.dbOperator(operationBean, parameters, false);
			List<TransferBean> transferList = new ArrayList<TransferBean>();
			transferList =coorderResultBean.getListResult("checkPassApplySql");
			if(transferList!=null&&transferList.size()>0){
				String SAP_INVOKE_MESSAGE="保存失败，审批之后的调拨单信息已存在，不能重复审批";
				this.setCache("INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
				return;
			}
			shipStatusCheck(0,"申请","shipId");
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 搜索我的申请列表
	 * @return
	 */
	public String beforeSearchApproveList(){
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
		
		String[] factoryIds =this.getParameterValues("factoryIdSH");
	/*	if(factoryIds==null){
			Object obj = helper.getValueFromAllScopes("factoryIdSH");
			if(obj!=null){
			if(obj instanceof String[]){
				factoryIds=(String[])obj;
			}else{
				factoryIds=new String[]{obj.toString()};
			}
			}
		}*/
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
			//this.setCache("checkFactoryList",checkFactoryList,"request");
			this.setCache("facorysIdsSH", buffer.toString(),"request");
		}
		String[] productIds =this.getParameterValues("productIdSH");
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
			//this.setCache("checkProductList",checkProductList,"request");
			this.setCache("productsIdsSH", buffer.toString(),"request");
		}
		
		
		

		/*String customerNameSH = (String)helper.getValueFromAllScopes("customerNameSH");
		String corderCodeSH = (String)helper.getValueFromAllScopes("corderCodeSH");
		String saleManSH = (String)helper.getValueFromAllScopes("saleManSH");
		String applyDateSH = (String)helper.getValueFromAllScopes("applyDateSH");
		String isUrgentSH = (String)helper.getValueFromAllScopes("isUrgentSH");*/
		/*log.info("==============================>transportCodeSH="+transportCodeSH);
		log.info("==============================>shipCodeSH="+shipCodeSH);
		log.info("==============================>sapTransCodeSH="+sapTransCodeSH);
		log.info("==============================>corderCodeSH="+corderCodeSH);*/
		/*this.setCache("customerNameSH", customerNameSH,"request");
		this.setCache("corderCodeSH", corderCodeSH,"request");
		this.setCache("saleManSH", saleManSH,"request");
		this.setCache("applyDateSH", applyDateSH,"request");
		this.setCache("isUrgentSH", isUrgentSH,"request");*/
		
		 
		/* this.setCache("cacheFactoryId", factoryIds, "request");
		 this.setCache("cacheProductId", productIds, "request");*/
		 this.setCache("cacheProvinceId", provinceId, "request");
		 this.setCache("cacheCityId", cityId, "request");
		 this.setCache("cacheCountyId", countyId, "request");
		 this.setCache("cacheCountryId", countryId, "request");
		return null;
	}
	
	/**
	 * 传入参数都不能为空
	 * @param status　　　　　需要验证的合法的状态
	 * @param operation　　　提示对应的关键字
	 * @param shipIdStr　　从页面传入的shipId　输入框组件的name
	 */
	private void shipStatusCheck(int status,String operation,String shipIdStr)throws Exception{
        String INVOKE_MESSAGE = "";
		
		//添加调拨单状态的检测，
		RequestHelper helper = new RequestHelper(this.getRequest());
		String shipId = (String)helper.getValueFromAllScopes(shipIdStr);
		Map parameters = new HashMap();
		parameters.put("shipId", shipId);
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("getShipBeanById");
		ResultBean checkResultBean = this.dbOperator(operationBean, parameters, false);
		List<ShipBean> shipList = new ArrayList<ShipBean>();
		shipList = checkResultBean.getListResult("getShipBeanById");
		
		if(shipList==null||shipList.size()==0){
			INVOKE_MESSAGE=operation+"发货申请失败:无法获取发货申请信息!";
			this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
			return ;
		}
		if(shipList!=null||shipList.size()>0){
			ShipBean shipBean=shipList.get(0);
			if(shipBean.getApplyStatus()!=status){
				String statusStr="";
				if(shipBean.getApplyStatus()==902){
					statusStr="已撤销";
				}
				if(shipBean.getApplyStatus()==901){
					statusStr="驳回";
				}
				if(shipBean.getApplyStatus()==3){
					statusStr="已排车";
				}
				if(shipBean.getApplyStatus()==2){
					statusStr="待排车";
				}
				if(shipBean.getApplyStatus()==1){
					statusStr="待物流分配";
				}		
				if(shipBean.getApplyStatus()==0){
					statusStr="待审批";
				}
				INVOKE_MESSAGE=operation+"失败:发货申请状态为 "+statusStr+"，不能"+operation+" !";
				this.setCache("INVOKE_MESSAGE",INVOKE_MESSAGE,"request");
				return ;
			}
		}	
	}
	
	//审批申请中审批页面中同意申请的状态判断
	public void  checkShipStatusNotPass(){
		try{
			shipStatusCheck(0,"驳回","shipId");
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
	}
	
	//审批中状态为撤销之前的判断
	public void  checkShipStatusCancel(){
        try{
        	shipStatusCheck(1,"撤销","shipId");
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
		
	}
	
	//我的申请页面，撤销申请判断
	public void  checkShipApplyCancel(){
        try{
        	shipStatusCheck(0,"撤销","shipId");
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
		
	}
	
	public void  checkShipApplyDelete(){
        try{
        	shipStatusCheck(902,"删除","shipId");
		}catch(Exception e){
			this.setCache("INVOKE_MESSAGE","操作失败:发生未知异常!","request");
			e.printStackTrace();
		}
		
	}
	
	
	/**
	 * 查询审批列表
	 * @return
	 */
	public String searchApproveList(){
		this.beforeSearchApproveList();
		String forward = super.list();
		if (this.isSuccess()) {
			//HtmsLogger.log("APPROVE001", "加载申请审批列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("APPROVE002", "加载申请审批列表失败", "0", this.getRequest());
		}
		loadApproveShipList();
		return forward;
	}
	
	
	public String loadApproveShipList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List shipLists =(List) resultBean.getListResult("SELECT");
		 if(shipLists==null){
			 return null;
		 }
	
		 ShipDetailBean shipBean=null;
		 String customerNo = null, orderNo = null, detailNo = null,shipId=null;
		 AreaRepository rep = new AreaRepository();
		 StringBuffer buffer = new StringBuffer();
		 List<String> shipList = new ArrayList<String>();
		 List<ShipDetailBean> detailList = null;
		 Map<String,String> tempMap = new HashMap<String,String>();
		 Map<String,List<ShipDetailBean>> shipListMap = new HashMap<String,List<ShipDetailBean>>();
		 String shipCode = null;
		 ProductBean productBean=null;
		 FactoryBean factoryBean=null;
		 for(int i=0,size=shipLists.size();i<size;i++){
			 shipBean=(ShipDetailBean)shipLists.get(i);
			 shipCode=shipBean.getShipCode();
			 if(tempMap.get(shipCode)==null){
				 tempMap.put(shipCode, shipCode);
				 shipList.add(shipCode);
			 }
			 detailList= shipListMap.get(shipCode);
			 if(detailList==null){
				 detailList = new ArrayList<ShipDetailBean>();
				 shipListMap.put(shipCode, detailList);
			 }
			 shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
			 productBean=ProductRepository.getProduct(shipBean.getProductId()+"");
			 
		
			 if(productBean!=null){
				 shipBean.setProductName(productBean.getProductName());
			 }
			 factoryBean=FactoryRepository.getFactory(shipBean.getFactoryId());
			 if(factoryBean!=null){
				 shipBean.setFactoryName(factoryBean.getFactoryName());
			 }
			 detailList.add(shipBean);
			/* if(i>0){
				 buffer.append("','");
			 }
			 buffer.append(shipBean.getShipId());*/
		 }
		// this.setCache("shipsIds", buffer.toString(), "request");
		// this.setCache("approveShipList", shipLists, "request");
		 this.setCache("shipList", shipList, "request");
		 this.setCache("shipListMap", shipListMap, "request");
		 return null;
	}
	public String getShipDetailList(){
		RequestHelper helper = new RequestHelper(this.getRequest());
		List approveShipList =(List)helper.getValueFromAllScopes("approveShipList");
		if(approveShipList==null||approveShipList.isEmpty()){
			log.info("================================>approveShipList==null||approveShipList.isEmpty()");
			return null;
		}
		String forward = super.list();
		ResultBean resultBean = this.getResultBean();
		List shipDetailList =(List) resultBean.getListResult("shipDetailList");
		Map<String,ShipDetailBean> detailMap = new HashMap<String,ShipDetailBean>();
		ShipDetailBean detailBean = null;
		if(shipDetailList!=null){
			for(int i=0,size=shipDetailList.size();i<size;i++){
				detailBean=(ShipDetailBean)shipDetailList.get(i);
				detailMap.put(detailBean.getShipId()+"", detailBean);
			}
			
		}else{
			log.info("================================>shipDetailList==null");
		}
		
		 ShipBean shipBean=null;
		 String transportId = null;//,areaId=null,factoryId=null,materialId=null,orderId=null,transferCode=null;
		
		 ProductBean productBean=null;
		 FactoryBean factoryBean=null;
		 for(int i=0,size=approveShipList.size();i<size;i++){
			 shipBean=(ShipBean)approveShipList.get(i);
			 transportId=shipBean.getShipId()+"";
			 detailBean= detailMap.get(transportId);
			 
			 if(detailBean!=null){
				 productBean=ProductRepository.getProduct(detailBean.getProductId()+"");
				 if(productBean!=null){
					 shipBean.setProductName(productBean.getProductName());
				 }
				 factoryBean=FactoryRepository.getFactory(detailBean.getFactoryId());
				 if(factoryBean!=null){
					 shipBean.setFactoryName(factoryBean.getFactoryName());
				 }
			 }
			/* 
			 sendBean= sendMap.get(transportId);
			 if(sendBean!=null){
				 transportBean.setDriverName(sendBean.getDriverName());
				 transportBean.setCarNo(sendBean.getVehicleNo());
				 transportBean.setSendStatus(sendBean.getSendStatus()+1);//派车
			 }*/
			 
		 }
		
		 this.setCache("approveShipList", approveShipList, "request");
		 return null;
	}
	public String setShipDetail(){
		ResultV2Bean rsBean =this.getResultV2Bean();
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
	/**
	 * @param args
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("APPROVE001", "通过审批成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("APPROVE002", "通过审批失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String passShipApply(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("APPROVE001", "通过审批成功", "1", this.getRequest());
			RequestHelper helper = new RequestHelper(this.getRequest());    
		    String shipId=(String) helper.getValueFromAllScopes("shipId");
		    HtmsApplyOrderBussiness   applyOrderBussiness=new HtmsApplyOrderBussiness();
		    boolean b=applyOrderBussiness.updateApplyStatus(Integer.valueOf(shipId),"1");
			if(!b){
				this.setCache("OPERATION_RESULT","false","request");
				String errorMessage="撤销失败：调用闭环系统取消订单接口失败";
				this.setCache("INVOKE_MESSAGE",errorMessage,"request");
				log.info(errorMessage);
			}
		}else{
			HtmsLogger.log("APPROVE002", "通过审批失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String passShipApplyEndCheck(){
		String forward=super.add();
		if (this.isSuccess()) {
			
		}else{
			HtmsLogger.log("APPROVE002", "撤销审批失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String cancelShipApprove(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("APPROVE001", "通过审批成功", "1", this.getRequest());
			RequestHelper helper = new RequestHelper(this.getRequest());    
		    String shipId=(String) helper.getValueFromAllScopes("shipId");
		    HtmsApplyOrderBussiness   applyOrderBussiness=new HtmsApplyOrderBussiness();
		    boolean b=applyOrderBussiness.updateApplyStatus(Integer.valueOf(shipId),"0");
			if(!b){
				this.setCache("OPERATION_RESULT","false","request");
				String errorMessage="撤销失败：调用闭环系统取消订单接口失败";
				this.setCache("INVOKE_MESSAGE",errorMessage,"request");
				log.info(errorMessage);
			}
		}else{
			HtmsLogger.log("APPROVE002", "撤销审批失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String updateCustOrderDetail(){
		String forward=super.add();
		if (this.isSuccess()) {
			
		}else{
			HtmsLogger.log("APPROVE002", "通过审批失败", "0", this.getRequest());
		}
		return forward;
	}
	
	
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("APPROVE011", "撤销审批成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("APPROVE012", "撤销审批失败", "0", this.getRequest());
		}
		setShipDetail();
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIP041", "修改发货申请成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SHIP042", "修改发货申请失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1904, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1903, MethodName:默认删除, MethodCode:delete
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	
	
	public String list(){
		RequestHelper helper = new RequestHelper(this.getRequest());
		String applyTimeSH = (String)helper.getValueFromAllScopes("applyTimeSH");
		String customerNameSH = (String)helper.getValueFromAllScopes("customerNameSH");
		String corderCodeSH = (String)helper.getValueFromAllScopes("corderCodeSH");
		String forward=super.list();
		loadMyApplyShipList();
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIP021", "查看发货申请列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SHIP022", "查看发货申请列表失败", "0", this.getRequest());
		}

		this.setCache("applyTimeSH", applyTimeSH,"request");
		this.setCache("customerNameSH", customerNameSH,"request");
		this.setCache("corderCodeSH", corderCodeSH,"request");
		return forward;
	}
	
	
	public String viewShipApply(){
		String forward=super.list();
		CustomerAddrBean custAddrBean=(CustomerAddrBean)this.getParameter("custAddrBean");
		if(custAddrBean!=null){
			AreaRepository rep = new AreaRepository();
			custAddrBean.setAreaName(rep.getFullAreaName(custAddrBean.getAreaId()+"", "", true));
			 this.setCache("custAddrBean", custAddrBean, "request");
		}
		loadShipApplyFreight();
		return forward;
	}
	
	//加载申请单运费
	public void loadShipApplyFreight(){
		ShipBean shipBean=(ShipBean) this.getParameter("shipViewBean");		
		List<ShipDetailBean> shipDetailList=(List<ShipDetailBean>) this.getParameter("shipDetailList");		
		
		CustomerAddrBean custAddrBean=(CustomerAddrBean) this.getParameter("custAddrBean");	
		
		ShipDetailBean detailBean = null;
		
		RequestHelper 	requestHelper=new RequestHelper(this.getRequest());
		String userId =(String)	requestHelper.getValueFromAllScopes("userId");
		
		List<EstimateFreightBean> estimateParamsList=new ArrayList<EstimateFreightBean>();
		 
		for(int j=0,dsize=shipDetailList.size();j<dsize;j++){
			 detailBean=(ShipDetailBean) shipDetailList.get(j);
			 
			// System.out.println("loadShipApplyFreight  getProductId:"+detailBean.getProductId()+"  getFactoryId:"+ detailBean.getFactoryId()+"  getAreaId:" + custAddrBean.getAreaId()+"  applyTime:"+ detailBean.getApplyTonNum()+"  applyTime:"+shipBean.getCreateTime());
			 
			 EstimateFreightBean freightBean=new EstimateFreightBean();
			 freightBean.setItemCode(detailBean.getItemCode());
			 freightBean.setProductId(detailBean.getProductId()+"");
			 freightBean.setFactoryId(detailBean.getFactoryId()+"");
			 freightBean.setAreaId(custAddrBean.getAreaId()+"");

			 freightBean.setApplyTonNum(detailBean.getApplyTonNum());
			 freightBean.setApplyTime(shipBean.getCreateTime());		
			 freightBean.setShipId(shipBean.getShipId()+"");
			
			 freightBean.setOrderId(shipBean.getCorderId()+"");
			 freightBean.setOrderCode(shipBean.getCorderCode());
			 freightBean.setItemId(detailBean.getShipDetailId()+"");
			 freightBean.setEstimateStep("3");
			 freightBean.setCustomerId(custAddrBean.getCustomerId()+"");
			 freightBean.setUserId(userId);
			 
			 if(shipBean.getSelfFetch()>0){
				 freightBean.setSelfFetch(true);
			 }
			 estimateParamsList.add(freightBean);
		}
		
		//计算运价
		HtmsEstimateFreightBusiness freight=new HtmsEstimateFreightBusiness();
		List<FreightBean> freightList=freight.getEstimateFreight(estimateParamsList);
		
		FreightBean freightBean = null ;
		if(freightList!=null&&freightList.size()>0){
			freightBean=(FreightBean) freightList.get(0);
			shipBean.setPlanFreight(freightBean.getTotalFreight());
			
			this.setCache("shipViewBean",shipBean,"request");
		}
		
	}
	
	public String beforeModify(){		
		this.setCache("modifyTime", tools.tool.getDateTime(), "request");
		return null;
	}
	
	public String cancelAppliedShip(){
		String forward=super.view();
		ShipBean shipBean=(ShipBean)this.getParameter("shipDetailViewBean");
		if(shipBean!=null){
			AreaRepository rep = new AreaRepository();
			shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
			this.setCache("shipDetailViewBean", shipBean, "request");
		}
		if (this.isSuccess()) {
		   //HtmsLogger.log("SHIP031", "查看发货申请成功", "1", this.getRequest());
	       RequestHelper helper = new RequestHelper(this.getRequest());    
		   String shipId=(String) helper.getValueFromAllScopes("shipId");

		   HtmsApplyOrderBussiness   applyOrderBussiness=new HtmsApplyOrderBussiness();
		   boolean b=applyOrderBussiness.updateApplyStatus(Integer.valueOf(shipId),"901");
		   if(!b){
				this.setCache("OPERATION_RESULT","false","request");
				String errorMessage="撤销失败：调用闭环系统取消订单接口失败";
				this.setCache("INVOKE_MESSAGE",errorMessage,"request");
				log.info(errorMessage);
		   }
		}else{
			HtmsLogger.log("SHIP032", "查看发货申请失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String view(){
		String forward=super.view();
		ShipBean shipBean=(ShipBean)this.getParameter("shipDetailViewBean");
		if(shipBean!=null){
			AreaRepository rep = new AreaRepository();
			 shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
			 this.setCache("shipDetailViewBean", shipBean, "request");
		}
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIP031", "查看发货申请成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SHIP032", "查看发货申请失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String rejectShipApprive(){
		String forward=super.view();
		ShipBean shipBean=(ShipBean)this.getParameter("shipDetailViewBean");
		if(shipBean!=null){
			AreaRepository rep = new AreaRepository();
			 shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
			 this.setCache("shipDetailViewBean", shipBean, "request");
		}
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIP031", "查看发货申请成功", "1", this.getRequest());
			
			RequestHelper helper = new RequestHelper(this.getRequest());    
		    String shipId=(String) helper.getValueFromAllScopes("shipId");

		    HtmsApplyOrderBussiness   applyOrderBussiness=new HtmsApplyOrderBussiness();
		    boolean b=applyOrderBussiness.updateApplyStatus(Integer.valueOf(shipId),"901");
			if(!b){
				this.setCache("OPERATION_RESULT","false","request");
				String errorMessage="撤销失败：调用闭环系统取消订单接口失败";
				this.setCache("INVOKE_MESSAGE",errorMessage,"request");
				log.info(errorMessage);
			}
		}else{
			HtmsLogger.log("SHIP032", "查看发货申请失败", "0", this.getRequest());
		}
		return forward;
	}
	
	
	
	public String loadMyApplyShipList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List shipLists =(List) resultBean.getListResult("SELECT");
		 if(shipLists==null){
			 return null;
		 }
	
		 ShipBean shipBean=null;
		 String customerNo = null, orderNo = null, detailNo = null,shipId=null;
		 AreaRepository rep = new AreaRepository();
		 for(int i=0,size=shipLists.size();i<size;i++){
			 shipBean=(ShipBean)shipLists.get(i);
			 shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
		 }
		
		 this.setCache("myApplyShipList", shipLists, "request");
		 return null;
	}
	public String loadShipList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		 if(list==null){
			 return null;
		 }
		//log.info("list====================="+list);
		  List<ShipBean> shipLists = new ArrayList<ShipBean>();
		  //List<ShipBean> shipRouteLists = new ArrayList<ShipBean>();

		 Map<String, ShipBean> shipMap=new HashMap<String, ShipBean>();
		/*<customer,<order,<orderdetail,shipbean>>>*/
		 Map<String, Map<String,Map<String,List<ShipBean>>>> customerOrderShipListMap=new HashMap<String, Map<String,Map<String,List<ShipBean>>>>();
		 Map<String,Map<String,List<ShipBean>>> orderShipMap = null;
		 Map<String,List<ShipBean>> detailShipMap=null;
		 ShipBean shipBean=null;
		 String customerNo = null, orderNo = null, detailNo = null,shipId=null;
		 AreaRepository rep = new AreaRepository();
		 for(int i=0,size=list.size();i<size;i++){
			 shipBean=(ShipBean)list.get(i);
			 shipId=shipBean.getShipId()+"";
			 customerNo=shipBean.getCustomerCode();
			 orderNo=shipBean.getCorderCode();
			 detailNo=orderNo+shipBean.getCodetailCertificate();
			 if(shipMap.get(shipId)!=null){
				 continue;
			 }
			 shipMap.put(shipId, shipBean);
			 //shipBean.setMapId(mapId);
			 //log.info("mapId==============="+mapId);
			
			 orderShipMap=customerOrderShipListMap.get(customerNo);
			 if(orderShipMap==null){
				 orderShipMap = new HashMap<String,Map<String,List<ShipBean>>>();
				 customerOrderShipListMap.put(customerNo, orderShipMap);
			 }
			 
			 detailShipMap=orderShipMap.get(orderNo);
			 if(detailShipMap==null){
				 detailShipMap = new HashMap<String,List<ShipBean>>();
				// log.info("===============orderNo="+orderNo);
				 orderShipMap.put(orderNo, detailShipMap);
			 }
			 
			 shipLists=detailShipMap.get(detailNo);
			 if(shipLists==null){
				 shipLists = new ArrayList<ShipBean>();
				 detailShipMap.put(detailNo,shipLists);
				 //log.info("===============detailNo="+detailNo);
			 }
			 
			 shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
			 shipLists.add(shipBean);
			//log.info("===============shipLists.size="+shipLists.size());
		 }
		 tools.tool.clear(shipMap);
		 shipMap=null;
		 orderShipMap=null;
		 detailShipMap=null;
		 this.setCache("customerOrderShipListMap", customerOrderShipListMap, "request");
		 //this.setCache("shipListMap", shipListMap, "request");
		 return null;
	}
	
	public String toApprove(){
		String forward=super.view();
		CustomerAddrBean custAddrBean=(CustomerAddrBean)this.getParameter("custAddrBean");
		if(custAddrBean!=null){
			AreaRepository rep = new AreaRepository();
			custAddrBean.setAreaName(rep.getFullAreaName(custAddrBean.getAreaId()+"", "", true));
			 this.setCache("custAddrBean", custAddrBean, "request");
		}
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIP031", "查看发货申请成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SHIP032", "查看发货申请失败", "0", this.getRequest());
		}
		this.getOrderAproveNum();
		return forward;
	}
	public String getFactoryMaterialStock(String  meterialFactory,String meterialNo){
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("selectUseStock");
		Map parameters = new HashMap();
		parameters.put("meterialNo", new String[]{meterialNo});
		parameters.put("meterialFactory", new String[]{meterialFactory});
		ResultBean resultBean = this.dbOperator(operationBean, parameters, false);
		if(resultBean==null||resultBean.isSuccess()==false){
			log.info("meterialNo="+meterialNo+",meterialFactory="+meterialFactory+"，获取未生成调拨单所占用的库存失败。");
			log.info("meterialNo="+meterialNo+",meterialFactory="+meterialFactory+"，获取未生成调拨单所占用的库存失败。");
			return null;
		}
		TransferDetailBean transferDetailBean =(TransferDetailBean)resultBean.getListFirstResult("selectUseStock");
		if(transferDetailBean==null){
			log.info("meterialNo="+meterialNo+",meterialFactory="+meterialFactory+"，没有未生成调拨单所占用的库存。");
			log.info("meterialNo="+meterialNo+",meterialFactory="+meterialFactory+"，没有未生成调拨单所占用的库存。");
			
		}
		String applyTonNum=transferDetailBean==null?null:transferDetailBean.getApplyTonNum();
		
		return applyTonNum;
		
	}
	/**
	 * 从SAP中获取订单的订单数以及可发货数量
	 */
	public void getOrderAproveNum(){
		ResultBean resultBean = this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			log.info("数据查询出错，无法获取订单可发货数量");
			return ;
		}
		ShipBean orderBean =(ShipBean) resultBean.getListFirstResult("shipViewBean");
		if(orderBean==null){
			log.info("未获取订单数据，无法获取订单可发货数量");
			return ;
		}
		List detailLit =(List) resultBean.getListResult("detailLit");
		if(detailLit==null||detailLit.isEmpty()){
			log.info("未获取订单明细数据，无法获取订单可发货数量");
			return ;
		}
		int size = detailLit.size();
		String[] ordersCodes=new String[size], itemsCodes=new String[size];
		ShipDetailBean detailBean = null;
		String orderCode = orderBean.getCorderCode(),itemCode=null,meterialNo=null,meterialFactory=null;
		OrderStockSearcher stockSynker= null;
		String sapStock=null,dbStock=null;
		BigDecimal dbStockNum = null,sapStockNum;
		for(int i=0;i<size;i++){
			detailBean=(ShipDetailBean)detailLit.get(i);
			
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
			
			/**
			 * 根据工厂及物料号从数据库中获取已经审批但未生存调拨单的库存
			 */
			dbStock=this.getFactoryMaterialStock( meterialFactory,meterialNo);
			log.info("meterialNo="+meterialNo+",meterialFactory="+meterialFactory+",sapStock="+sapStock+",dbStock="+dbStock);
			if(this.isNull(dbStock)){
				detailBean.setStockNum(sapStock);
				continue;
			}
			sapStockNum=new BigDecimal(sapStock);
			dbStockNum=new BigDecimal(dbStock);
			//if(sapStockNum.compareTo(dbStockNum)<1){
			//	detailBean.setStockNum("0");
			//}else{
				sapStockNum=sapStockNum.subtract(dbStockNum);
				detailBean.setStockNum(sapStockNum+"");
			//}
			
		}
		
		List transferDetailList =(List) resultBean.getListResult("transferDetailList");
		Map<String,String> useNumMap=new HashMap<String,String>();
		TransferDetailBean transferDetailBean = null;
		for(int i=0,iSize=transferDetailList==null?0:transferDetailList.size();i<iSize;i++){
			transferDetailBean=(TransferDetailBean)transferDetailList.get(i);
			useNumMap.put(transferDetailBean.getItemCode(), transferDetailBean.getApplyTonNum());
		}

		log.info("Start invoke OrderStockSearcher Api");
		long time = System.currentTimeMillis();
		OrderStockSearcher synker= new OrderStockSearcher();
		Map<String,Map<String,String>> sapStockMap=synker.getOrderStock(ordersCodes,itemsCodes);
		log.info("End invoke OrderStockSearcher Api,Use Time:"+(System.currentTimeMillis()-time));
		if(sapStockMap==null||sapStockMap.isEmpty()){
			log.info("未从SAP中获取订单可发货数量。");
			this.setCache("detailLit", detailLit, "request");
			return;
		}
		/*获取客户余额*/
		CustomerSynker custSynker= new CustomerSynker();
		String customerAmount=custSynker.getCustomerAccountMoney(orderBean.getCustomerCode(), orderBean.getSaleOrg());
		customerAmount=this.isNull(customerAmount)?"0.0":customerAmount;
		
		
		/*计算可申请数*/
		String sapStrNum=null,dbStrNum=null;
		BigDecimal sapApplyNum = null,dbApplyNum,freight=null,price=null,itemFreight=null,applyNum=null;
		Map<String,String > tempMap=null;
		for(int i=0;i<size;i++){
			detailBean=(ShipDetailBean)detailLit.get(i);
			itemCode=detailBean.getItemCode();
			
			
			applyNum =new BigDecimal(detailBean.getApplyTonNum());
			freight=new BigDecimal(detailBean.getFreight());
			price=new BigDecimal(detailBean.getUnitPrice());
			freight = freight.add(price);
			itemFreight=freight.multiply(applyNum);
			detailBean.setItemFreight(itemFreight+"");
			log.info("orderCode="+orderCode+",itemCode="+itemCode);
			tempMap=sapStockMap.get(orderCode+itemCode);
			if(tempMap==null||tempMap.isEmpty()){
				continue;
			}
			
			sapStrNum=tempMap.get("applyNum");
			sapStrNum=this.isNull(sapStrNum)?"0":sapStrNum;
			sapApplyNum=new BigDecimal(sapStrNum);
			
			dbStrNum=useNumMap.get(itemCode);
			dbStrNum=this.isNull(dbStrNum)?"0":dbStrNum;
			dbApplyNum=new BigDecimal(dbStrNum);
			
			log.info("sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum);
			if(sapApplyNum.compareTo(dbApplyNum)<1){
				detailBean.setAppliableAmount("0");
			}else{
				sapApplyNum=sapApplyNum.subtract(dbApplyNum);
				detailBean.setAppliableAmount(sapApplyNum+"");
			}
			log.info("orderCode="+orderCode+",sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum+",applyNum="+detailBean.getAppliableAmount());
		}
		tools.tool.clear(tempMap);
		tools.tool.clear(sapStockMap);
		tools.tool.clear(useNumMap);
		tools.tool.clear(transferDetailList);
		
		this.setCache("customerAmount", customerAmount, "request");
		this.setCache("detailLit", detailLit, "request");
	}
	//DefautMethod,MethodId:1901, MethodName:默认新增, MethodCode:add
	//DefautMethod,MethodId:1906, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1905, MethodName:默认修改, MethodCode:view
	//Self Define Method End.
	/*
	
	public String getAddress(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("CUSTOMER_ADDRESS");
		 if(list==null){
			 return null;
		 }
		 List<CustomerAddrBean> addrLists = new ArrayList<CustomerAddrBean>();
		 CustomerAddrBean addrBean = null;
		 AreaBean areaBean = null;
		 List addressList = null;
		 String areaId = null;
		 String areaName = null;
		 String addrDetail = null;
		 StringBuilder sb = new StringBuilder();
		 AreaRepository rep = new AreaRepository();
		 for(int i=0,size=list.size();i<size;i++){
			 addrBean=(CustomerAddrBean) list.get(i);
			 areaId = addrBean.getAreaId()+"";
			 addrDetail=addrBean.getCaddrDetail();
			 addressList =  rep.getAllPraentArea(areaId);
			 sb = new StringBuilder();
			 for(int j=0;j<addressList.size();j++){
				 areaBean = (AreaBean) addressList.get(j);
				 areaName = addrBean.getAreaName();
				 areaName= sb.append(areaBean.getAreaName()).toString();
			 }
			 areaName=sb.append(addrDetail).toString();
			 addrBean.setAreaName(areaName);
			 addrLists.add(addrBean);
		 }
		 this.getRequest().setAttribute("addrLists", addrLists);
		return null;
	}*/
}

