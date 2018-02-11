package com.zzy.htms.sales.custorder;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.utils.RequestHelper;
import com.zzy.htms.dictionary.route.RouteBean;
import com.zzy.htms.dictionary.route.RouteRepository;
import com.zzy.htms.log.HtmsLogger;
import com.zzy.htms.logistic.transferdetail.TransferDetailBean;
import com.zzy.htms.logistic.transferprice.TransferPriceBean;
import com.zzy.htms.sales.customeraddr.CustAddrUtils;
import com.zzy.htms.sales.custorderdetail.CustOrderDetailBean;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;
import com.zzy.htms.sap.rfc.OrderStockSearcher;
import com.zzy.htms.sap.rfc.SyncLogger;
import com.zzy.htms.services.business.EstimateFreightBean;
import com.zzy.htms.services.business.FreightBean;
import com.zzy.htms.services.business.HtmsEstimateFreightBusiness;
import com.zzy.htms.webservice.market.order.HtmsApplyOrderBussiness;

/**
 * 发货申请,我的申请实现类
 * @author zzy
 *
 */
public class CustOrderBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * 验证发货申请是否超发,验证订单是否重复提交,此两种情况下,发货申请会失败
	 */
	public void checkCustOrderDetail(){
		try{
		    String INVOKE_MESSAGE = "";
			//申请之前，确认申请的数量足够
			RequestHelper helper = new RequestHelper(this.getRequest());    
		    
		    String[] itemCodes= helper.getStringParameters(this.getRequest(), "itemCode");
		    String[] appliableAmounts = helper.getStringParameters(this.getRequest(),"appliableAmount");
		    String[] applyTonNums = helper.getStringParameters(this.getRequest(),"applyTonNum");
	
		    Map<String,ShipDetailBean> shipMap=new HashMap<String,ShipDetailBean>();
		    for(int i=0;i<applyTonNums.length;i++){
		    	String str=applyTonNums[i];
		    	if(str!=null&&str!=""){
		    		ShipDetailBean shipDetail=new ShipDetailBean();
		    		shipDetail.setItemCode(itemCodes[i]);
		    		shipDetail.setAppliableAmount(appliableAmounts[i]);
		    		shipDetail.setApplyTonNum(applyTonNums[i]);		
		    		shipMap.put(itemCodes[i], shipDetail);
		    		
		    		SyncLogger.log("","  \n\n\n\n\n\n\n\n\n\n itemCode: "+itemCodes[i]+"   appliableAmount: "+appliableAmounts[i]+"   applyTonNum: "+applyTonNums[i]);
		    	}
		    }
		
			String corderId = (String)helper.getValueFromAllScopes("corderId");
			Map parameters = new HashMap();
			parameters.put("corderId", corderId);
			OperationBean orderDetailOperationBean = OperationConfigRepository.getOperationConfig("getCustOrderDetailById");
			ResultBean orderDetailResultBean = this.dbOperator(orderDetailOperationBean, parameters, false);
			List<CustOrderDetailBean>  orderDetailList = new ArrayList<CustOrderDetailBean>();
			orderDetailList =orderDetailResultBean.getListResult("getCustOrderDetailById");
	
			if(orderDetailResultBean==null||orderDetailResultBean.isSuccess()==false){
				this.setCache("INVOKE_MESSAGE","申请失败：数据查询出错，无法获取订单可发货数量","request");
				return ;
			}
			if(orderDetailList==null||orderDetailList.isEmpty()){
				this.setCache("INVOKE_MESSAGE","申请失败：未获取订单明细数据，无法获取订单可发货数量","request");
				return ;
			}
			
			OperationBean orderOperationBean = OperationConfigRepository.getOperationConfig("getCustOrderById");
			ResultBean orderResultBean = this.dbOperator(orderOperationBean, parameters, false);
			List<CustOrderBean>  orderList = new ArrayList<CustOrderBean>();
			orderList =orderResultBean.getListResult("getCustOrderById");
			CustOrderBean orderBean;
			if(orderList==null||orderList.size()==0){
				this.setCache("INVOKE_MESSAGE","申请失败：未获取订单数据，无法获取订单可发货数量","request");
				return ;
			}else{
				orderBean =orderList.get(0);
			}
			
			int size = orderDetailList.size();
			String[] ordersCodes=new String[size], itemsCodes=new String[size];
			CustOrderDetailBean detailBean = null;
			String orderCode = orderBean.getCorderCode(),itemCode=null;
			for(int i=0;i<size;i++){
				detailBean=(CustOrderDetailBean)orderDetailList.get(i);
				
				ordersCodes[i]=orderCode;
				itemsCodes[i]=detailBean.getCodetailCertificate();
			}
			
			
			OperationBean shipOperationBean = OperationConfigRepository.getOperationConfig("getShipDetailById");
			ResultBean shipResultBean = this.dbOperator(shipOperationBean, parameters, false);
			Map<String,BigDecimal> useNumMap=new HashMap<String,BigDecimal>();
			BigDecimal dbApplyNum=new BigDecimal("0");
			/*从数据库中取已经申请未审批的和已经审批但未生成调拨单的申请数量*/
			if(shipResultBean!=null&&shipResultBean.isSuccess()==true){
				List<ShipDetailBean> shipDetailList =  (List<ShipDetailBean>)shipResultBean.getListResult("getShipDetailById");
				
				ShipDetailBean shipDetailBean = null;
				
				String dbApplyTonNum = null;
				log.info("  \n\n\n\n\n\n\n\n\n\n 001. iSize: "+(shipDetailList==null?0:shipDetailList.size()));
				for(int i=0,iSize=shipDetailList==null?0:shipDetailList.size();i<iSize;i++){
					shipDetailBean=(ShipDetailBean)shipDetailList.get(i);
					dbApplyTonNum=shipDetailBean.getApplyTonNum();
					log.info("  \n\n\n\n\n\n\n\n\n\n 001. dbApplyTonNum: "+dbApplyTonNum);
					dbApplyTonNum = this.isNull(dbApplyTonNum)?"0.0":dbApplyTonNum;
					dbApplyNum=new BigDecimal(dbApplyTonNum);
					
					log.info("  \n\n\n\n\n\n\n\n\n\n 001. shipDetailBean.getItemCode(): "+shipDetailBean.getItemCode()+",dbApplyNum="+dbApplyNum);
					useNumMap.put(shipDetailBean.getItemCode(), dbApplyNum);
					
					
				}
				tools.tool.clear(shipDetailList);
				
				List<TransferDetailBean> transDetailList = (List<TransferDetailBean>) shipResultBean.getListResult("transferDetailList");
				TransferDetailBean transDetailBean = null;
				BigDecimal shipApplyNum=new BigDecimal("0");
				/*把调用单中所定的库存加入 到申请单锁定的库存中*/
				log.info("  \n\n\n\n\n\n\n\n\n\n 001. iSize: "+(transDetailList==null?0:transDetailList.size()));
				for(int i=0,iSize=transDetailList==null?0:transDetailList.size();i<iSize;i++){
					transDetailBean=(TransferDetailBean)transDetailList.get(i);
					dbApplyTonNum=transDetailBean.getApplyTonNum();
					log.info("  \n\n\n\n\n\n\n\n\n\n 001. dbApplyTonNum: "+dbApplyTonNum);
					dbApplyTonNum = this.isNull(dbApplyTonNum)?"0.0":dbApplyTonNum;
					shipApplyNum=useNumMap.get(transDetailBean.getItemCode());
					if(shipApplyNum==null){
						shipApplyNum=new BigDecimal("0");
					}
					log.info("  \n\n\n\n\n\n\n\n\n\n 001. shipApplyNum: "+shipApplyNum);
					dbApplyNum=new BigDecimal(dbApplyTonNum);
					shipApplyNum=shipApplyNum.add(dbApplyNum);
					log.info("  \n\n\n\n\n\n\n\n\n\n 00x. shipApplyNum: "+shipApplyNum);
					useNumMap.put(transDetailBean.getItemCode(), shipApplyNum);
				}
				tools.tool.clear(transDetailList);
				tools.tool.clear(shipDetailList);
			}
	
			long time = System.currentTimeMillis();
			OrderStockSearcher synker= new OrderStockSearcher();
			Map<String,Map<String,String>> sapStockMap=synker.getOrderStock(ordersCodes,itemsCodes);
			log.info("End invoke OrderStockSearcher Api,Use Time:"+(System.currentTimeMillis()-time));
		
			if(sapStockMap==null||sapStockMap.isEmpty()){
				this.setCache("INVOKE_MESSAGE","申请失败：未从SAP中获取订单可发货数量。","request");
				return;
			}
			String sapStrNum=null,dbStrNum=null;
			BigDecimal sapApplyNum = null,totalAmount=null;//,dbApplyNum;
			Map<String,String > tempMap=null;
			for(int i=0;i<size;i++){
				detailBean=(CustOrderDetailBean) orderDetailList.get(i);
				itemCode=detailBean.getCodetailCertificate();
				
				tempMap=sapStockMap.get(orderCode+itemCode);
				if(tempMap==null||tempMap.isEmpty()){
					continue;
				}
				
				sapStrNum=tempMap.get("applyNum");
				sapStrNum=this.isNull(sapStrNum)?"0":sapStrNum;
				sapApplyNum=new BigDecimal(sapStrNum);
				
				dbApplyNum=useNumMap.get(itemCode);
				dbApplyNum=dbApplyNum==null?new BigDecimal("0.0"):dbApplyNum;
			
				
				log.info("  \n\n\n\n\n\n\n\n\n\n 001. itemCode: "+itemCode+"   sapApplyNum:"+sapApplyNum+"   dbApplyNum: "+dbApplyNum);
				
				ShipDetailBean shipDetailBeanFromPage=shipMap.get(itemCode);
				BigDecimal appTonNum=shipDetailBeanFromPage==null?new BigDecimal("0.0"):new BigDecimal(shipDetailBeanFromPage.getApplyTonNum());//page submit amount
				log.info("   002. itemCode: "+itemCode+"   sapApplyNum:"+sapApplyNum+"   appTonNum: "+appTonNum+"   dbApplyNum: "+dbApplyNum);
				
				totalAmount=dbApplyNum.add(appTonNum);

				log.info("   003. itemCode: "+itemCode+"   sapApplyNum:"+sapApplyNum+"   appTonNum: "+appTonNum+"   dbApplyNum: "+dbApplyNum+",totalAmount="+totalAmount+"\n\n\n\n\n\n\n\n\n\n");
				
				if(sapApplyNum.compareTo(totalAmount)<0){
					this.setCache("INVOKE_MESSAGE","申请失败：申请数量大于可申请数量!","request");
					return ;
				}
			}
			tools.tool.clear(tempMap);
			tools.tool.clear(sapStockMap);
			tools.tool.clear(useNumMap);
			/*程序生成申请号*/
			String shipCode = tools.tool.DateUtil.getFormatDate("MMddHHmmss")+tools.tool.getRandomUUID(2).toUpperCase(); 
			this.setCache("shipCode",shipCode,"request");
		}catch(Exception e){
			e.printStackTrace();
			this.setCache("INVOKE_MESSAGE","发生未知异常，请重新操作。","request");
		}
		
	}
	
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIP001", "申请成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SHIP002", "申请失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String addShipApply(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIP001", "申请成功", "1", this.getRequest());
			ResultBean resultBean = this.getResultBean();
			ShipBean shipBean =(ShipBean) resultBean.getListFirstResult("shipViewBean");
			List<ShipDetailBean> shipDetailList = resultBean.getListResult("shipDetailViewBean");
			this.setCache("shipId",shipBean.getShipId(),"request");
			HtmsApplyOrderBussiness   applyOrderBussiness=new HtmsApplyOrderBussiness();
			boolean b=applyOrderBussiness.createOrder(shipBean, shipDetailList);
			if(!b){
				this.setCache("OPERATION_RESULT","false","request");
				String errorMessage="申请失败：调用闭环系统创建订单失败";
				this.setCache("INVOKE_MESSAGE",errorMessage,"request");
				log.info(errorMessage);
			}
		}else{
			this.setCache("INVOKE_MESSAGE","创建订单失败","request");
			HtmsLogger.log("SHIP002", "申请失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERORDER011", "删除订单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERORDER012", "删除订单失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERORDER021", "查看订单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERORDER022", "查看订单失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERORDER041", "修改订单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERORDER042", "修改订单失败", "0", this.getRequest());
		}
		return forward;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
		ResultBean resultBean = this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			return;
		}
		getOrderApplyNum();
		List customerAddrList =(List) resultBean.getListResult("CUSTOMERADDR");
		if(customerAddrList==null){
			 return ;
	    }
		this.getRequest().setAttribute("addrLists", CustAddrUtils.exchangeCustomerAddress(customerAddrList));
	}
	/**
	 * 从SAP中获取订单的订单数以及可发货数量
	 */
	public void getOrderApplyNum(){
		ResultBean resultBean = this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			log.info("数据查询出错，无法获取订单可发货数量");
			return ;
		}
		CustOrderBean orderBean =(CustOrderBean) resultBean.getListFirstResult("orderBean");
		if(orderBean==null){
			log.info("未获取订单数据，无法获取订单可发货数量");
			return ;
		}
		List<CustOrderDetailBean> detailLit =(List<CustOrderDetailBean>) resultBean.getListResult("detailLit");
		if(detailLit==null||detailLit.isEmpty()){
			log.info("未获取订单明细数据，无法获取订单可发货数量");
			return ;
		}
		int size = detailLit.size();
		String[] ordersCodes=new String[size], itemsCodes=new String[size];
		CustOrderDetailBean detailBean = null;
		String orderCode = orderBean.getCorderCode(),itemCode=null;
		for(int i=0;i<size;i++){
			detailBean=(CustOrderDetailBean)detailLit.get(i);
			ordersCodes[i]=orderCode;
			itemsCodes[i]=detailBean.getCodetailCertificate();
		}
		
		List shipDetailList =(List) resultBean.getListResult("shipDetailList");
		Map<String,BigDecimal> useNumMap=new HashMap<String,BigDecimal>();
		ShipDetailBean shipDetailBean = null;
		String dbApplyTonNum = null;
		BigDecimal dbApplyNum;
		for(int i=0,iSize=shipDetailList==null?0:shipDetailList.size();i<iSize;i++){
			shipDetailBean=(ShipDetailBean)shipDetailList.get(i);
			dbApplyTonNum=shipDetailBean.getApplyTonNum();
			dbApplyTonNum = this.isNull(dbApplyTonNum)?"0.0":dbApplyTonNum;
			dbApplyNum=new BigDecimal(dbApplyTonNum);
			useNumMap.put(shipDetailBean.getItemCode(), dbApplyNum);
			//useNumMap.put(shipDetailBean.getItemCode(), shipDetailBean.getApplyTonNum());
		}
		List<TransferDetailBean> transDetailList = (List<TransferDetailBean>) resultBean.getListResult("transferDetailList");
		TransferDetailBean transDetailBean = null;
		BigDecimal shipApplyNum=new BigDecimal("0");
		/*把调用单中所定的库存加入 到申请单锁定的库存中*/
		for(int i=0,iSize=transDetailList==null?0:transDetailList.size();i<iSize;i++){
			transDetailBean=(TransferDetailBean)transDetailList.get(i);
			dbApplyTonNum=transDetailBean.getApplyTonNum();
			dbApplyTonNum = this.isNull(dbApplyTonNum)?"0.0":dbApplyTonNum;
			shipApplyNum=useNumMap.get(transDetailBean.getItemCode());
			if(shipApplyNum==null){
				shipApplyNum=new BigDecimal("0");
			}
			dbApplyNum=new BigDecimal(dbApplyTonNum);
			shipApplyNum=shipApplyNum.add(dbApplyNum);
			useNumMap.put(transDetailBean.getItemCode(), shipApplyNum);
		}
		tools.tool.clear(transDetailList);

		log.info("Start invoke OrderStockSearcher Api");
		long time = System.currentTimeMillis();
		OrderStockSearcher synker= new OrderStockSearcher();
		Map<String,Map<String,String>> sapStockMap=synker.getOrderStock(ordersCodes,itemsCodes);
		log.info("End invoke OrderStockSearcher Api,Use Time:"+(System.currentTimeMillis()-time));
		if(sapStockMap==null||sapStockMap.isEmpty()){
			log.info("未从SAP中获取订单可发货数量。");
			return;
		}
		String sapStrNum=null,dbStrNum=null;
		BigDecimal sapApplyNum = null;//,dbApplyNum;
		Map<String,String > tempMap=null;
		for(int i=0;i<size;i++){
			detailBean=(CustOrderDetailBean)detailLit.get(i);
			itemCode=detailBean.getCodetailCertificate();
			
			tempMap=sapStockMap.get(orderCode+itemCode);
			if(tempMap==null||tempMap.isEmpty()){
				continue;
			}
			
			sapStrNum=tempMap.get("applyNum");
			sapStrNum=this.isNull(sapStrNum)?"0":sapStrNum;
			sapApplyNum=new BigDecimal(sapStrNum);
			
			/*dbStrNum=useNumMap.get(itemCode);
			dbStrNum=this.isNull(dbStrNum)?"0":dbStrNum;
			dbApplyNum=new BigDecimal(dbStrNum);*/
			dbApplyNum=useNumMap.get(itemCode);
			dbApplyNum=dbApplyNum==null?new BigDecimal("0.0"):dbApplyNum;
			
			log.info("sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum);
			//if(sapApplyNum.compareTo(dbApplyNum)<1){
			//	detailBean.setAppliableAmount("0");
			//}else{
				sapApplyNum=sapApplyNum.subtract(dbApplyNum);
				detailBean.setAppliableAmount(sapApplyNum+"");
			//}
			log.info("sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum+",applyNum="+detailBean.getAppliableAmount());
		}
		tools.tool.clear(tempMap);
		tools.tool.clear(sapStockMap);
		tools.tool.clear(useNumMap);
		tools.tool.clear(shipDetailList);
		//this.setCache("detailLit", detailLit, "request");
		
		
		//
		HtmsApplyOrderBussiness  applyOrderBussiness=new HtmsApplyOrderBussiness();
		Map<String ,String > map=applyOrderBussiness.getGoodsCount(orderBean, detailLit);
		List<CustOrderDetailBean>   finalOrderDetailBeanList=new ArrayList<CustOrderDetailBean>();
		if(map!=null&&map.size()>0){
			for(CustOrderDetailBean  custOrderDetailBean:detailLit){
				String marketAvailableNum= map.get(custOrderDetailBean.getMeterialNo());
				custOrderDetailBean.setMarketAvailableNum(marketAvailableNum);
				finalOrderDetailBeanList.add(custOrderDetailBean);
			}
		}
		this.setCache("detailLit", finalOrderDetailBeanList, "request");
		//tools.tool.clear(finalOrderDetailBeanList);
	}

	public String list(){
		RequestHelper helper = new RequestHelper(this.getRequest());
		/*String orderTimeSH = (String)helper.getValueFromAllScopes("orderTimeSH");
		String customerNameSH = (String)helper.getValueFromAllScopes("customerNameSH");
		String corderCodeSH = (String)helper.getValueFromAllScopes("corderCodeSH");*/
//		String customerCode= (String) this.getRequest().getSession().getAttribute("user_customer_code");
//		this.setCache("user_customer_code", customerCode,"request");
		
		String forward=super.list();
		loadCustOrderList();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERORDER031", "查看订单列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERORDER032", "查看订单列表失败", "0", this.getRequest());
		}
		/*this.setCache("orderTimeSH", orderTimeSH,"request");
		this.setCache("customerNameSH", customerNameSH,"request");
		this.setCache("corderCodeSH", corderCodeSH,"request");*/
		return forward;
	}
	
	/**
	 * 加载订单列表
	 * @return
	 */
	public String loadCustOrderList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		 if(list==null){
			 return null;
		 }
		//System.out.println("list====================="+list);
		/*  List<CustOrderBean> custOrderLists = new ArrayList<CustOrderBean>();
		  List<CustOrderBean> custOrderRouteLists = new ArrayList<CustOrderBean>();

		 Map<String, CustOrderBean> custOrderMap=new HashMap<String, CustOrderBean>();
		 Map<String, List<CustOrderBean>> custOrderListMap=new HashMap<String, List<CustOrderBean>>();
		 CustOrderBean custOrderBean=null;
		 String mapId = null;
		 for(int i=0,size=list.size();i<size;i++){
			 custOrderBean=(CustOrderBean)list.get(i);
			 mapId=""+custOrderBean.getCustomerName();
			 custOrderBean.setMapId(mapId);
			 //System.out.println("mapId==============="+mapId);
			
			 custOrderLists=custOrderListMap.get(mapId);
			 if(custOrderLists==null){
				 custOrderLists = new ArrayList<CustOrderBean>();
				 custOrderListMap.put(mapId,custOrderLists);
			 }
			 custOrderLists.add(custOrderBean);

			 if(custOrderMap.get(mapId)==null){
				 custOrderRouteLists.add(custOrderBean);
				 custOrderMap.put(mapId,custOrderBean);
			 }
			
		 }
		 tools.tool.clear(custOrderMap);
		 this.setCache("custOrderRouteLists", custOrderRouteLists, "request");
		 this.setCache("custOrderListMap", custOrderListMap, "request");*/
		 
		 //List<CustOrderBean> customerLists = new ArrayList<CustOrderBean>();
		 List<CustOrderBean> detailList = null;
		 //Map<String, CustOrderBean> customerMap=new HashMap<String, CustOrderBean>();
		// Map<String, CustOrderBean> orderMap=new HashMap<String, CustOrderBean>();
		 
		 Map<String, Map<String, List<CustOrderBean>>> customerOrderListMap=new HashMap<String, Map<String, List<CustOrderBean>>>();
		 Map<String, List<CustOrderBean>> orderDetailListMap=new HashMap<String, List<CustOrderBean>>();
		 
		 CustOrderBean orderBean=null;
		 String orderNo=null;
		 //System.out.println("list size=================="+(list==null?0:list.size()));
		 List<String> orderKeyList = new ArrayList<String>();
		 for(int i=0,size=list.size();i<size;i++){
			 orderBean=(CustOrderBean)list.get(i);
			// customerCode=orderBean.getCustomerCode();
			 orderNo=orderBean.getCorderCode();
			
			 //System.out.println("orderNo=================="+orderNo);
			/* orderDetailListMap=customerOrderListMap.get(customerCode);
			 if(orderDetailListMap==null){
				 orderDetailListMap=new HashMap<String, List<CustOrderBean>>();
				 customerOrderListMap.put(customerCode, orderDetailListMap);
			 }*/
			 
			 detailList=orderDetailListMap.get(orderNo);
			// System.out.println("orderNo=================="+orderNo);
			 if(detailList==null){
				 detailList= new ArrayList<CustOrderBean>();
				 orderDetailListMap.put(orderNo, detailList);
				 orderKeyList.add(orderNo);
			 }
			 detailList.add(orderBean);
		 }
		 //detailList=null;
		 //orderDetailListMap=null;
		// Set set = customerOrderListMap.keySet();

		// System.out.println("customerLists size=================="+(customerLists==null?0:customerLists.size()));
		 //System.out.println("customerOrderListMap size=================="+(customerOrderListMap==null?0:customerOrderListMap.size()));
		 //System.out.println("orderDetailListMap size=================="+(orderDetailListMap==null?0:orderDetailListMap.size()));
		 //System.out.println("\n\n");
		 //tools.tool.clear(orderLists);
		 //tools.tool.clear(detailList);
		// tools.tool.clear(customerMap);
		 //tools.tool.clear(orderMap);
		// tools.tool.clear(customerLists);
		 //tools.tool.clear(orderDetailListMap);
		 //System.out.println("customerLists size=================="+(customerLists==null?0:customerLists.size()));
		 //System.out.println("customerOrderListMap size=================="+(customerOrderListMap==null?0:customerOrderListMap.size()));
		 //System.out.println("orderDetailListMap size=================="+(orderDetailListMap==null?0:orderDetailListMap.size()));
		 //this.setCache("customerLists", customerLists, "request");
		 this.setCache("customerOrderListMap", orderDetailListMap, "request");
		 this.setCache("orderKeyList", orderKeyList, "request");
		 
		// this.setCache("orderDetailListMap", orderDetailListMap, "request");
		 return null;
	}
	//DefautMethod,MethodId:1889, MethodName:默认新增, MethodCode:add
	//DefautMethod,MethodId:1891, MethodName:默认删除, MethodCode:delete
	//DefautMethod,MethodId:1892, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1893, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1894, MethodName:默认查询, MethodCode:list
	//Self Define Method End.
	
	/*public String getAddress(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("CUSTOMERADDR");
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
			 addressList =  rep.getAncestorArea(areaId);
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
	
	/**
	 * 获取自备车自提最近输入的联系人和联系电话
	 */
	public String ajaxGetDefultDriverAndMobile(){
		String outMsg = "{\"isSuccess\":";	
		try{
			String customerId   =  this.getRequest().getParameter("customerId");
			String fetchCar     =  this.getRequest().getParameter("fetchCar");
		    super.view();
		    ResultBean resultBean = this.getResultBean();
		    List<ShipBean> list= (List<ShipBean>) resultBean.getResult("shipFetchCarInfo");
			if(list!=null&&list.size()!=0){
				ShipBean shipBean = list.get(0);
				String driver = shipBean.getFetchDriver();
				String mobile = shipBean.getFetchMobile();
				outMsg += 1;
				outMsg+=",\"msg\":\"获取自提信息正确\"";
				outMsg+=",\"driver\":\""+driver+"\"";
				outMsg+=",\"mobile\":\""+mobile+"\"";
			    outMsg += "}";
			}
			else{
				outMsg += 0;
				outMsg+=",\"msg\":\"获取自提信息为空\"";
			    outMsg += "}";
			}
		}catch(Exception e){
			outMsg += 0;
			outMsg+=",\"msg\":\"获取运费发生异常\"";
		    outMsg += "}";
			e.printStackTrace();
		}
		
		this.out(outMsg, this.getResponse());
		return "NULL";
	}
	
	
	/**
	 * 运费统一接口
	 * 申请单中传入必要的参数 productId     factoryId   itemCode  areaId    customerId   applyTonNum  applyTime
	 * 其中productId     factoryId   itemCode  applyTonNum 需要根据明细传入多个参数,对应的字符串结构是   productId1,productId2,productId3
	 * 审批单中传入参数与申请单相同
	 * 调拨单中传入参数增加一个transId
	 */
	public String ajaxCalculationFreight(){
		String outMsg = "{\"isSuccess\":";	
		
		try{
			String showCarrierPriceStr = this.getRequest().getParameter("showCarrierPrice");
			showCarrierPriceStr=showCarrierPriceStr==null?"":showCarrierPriceStr;
			boolean showCarrierPrice=false;
			if("true".equals(showCarrierPriceStr)){
				showCarrierPrice = true;
			}
			
			String selfFetchStatus = this.getRequest().getParameter("selfFetchStatus");
			if(selfFetchStatus == null||selfFetchStatus == ""){
				selfFetchStatus = "false" ;
			}
			String applyTime  = this.getRequest().getParameter("applyTime");
			String areaId     = this.getRequest().getParameter("areaId");
			String areaCode   = this.getRequest().getParameter("areaCode");
			String customerId = this.getRequest().getParameter("customerId");
			String selfFetchType= this.getRequest().getParameter("selfFetchType");
			String customerCode=this.getRequest().getParameter("customerCode");
			if(selfFetchType == null||selfFetchType == ""){
				selfFetchType = "1" ;
			}
			if("false".equals(selfFetchStatus)){
				selfFetchType="1";
			}
			if(customerCode == null||customerCode == ""){
				customerCode = "" ;
			}
			String transferId =this.getRequest().getParameter("transId");
			if(transferId == null||transferId == ""){
				transferId = "" ;
			}
			
			String shipId =this.getRequest().getParameter("shipId");
			if(shipId == null||shipId == ""){
				shipId = "" ;
			}
			
			String estimateStep =this.getRequest().getParameter("estimateStep");
			if(estimateStep==null||estimateStep==""){
				estimateStep = "1" ;
			}	
			
			String orderId = this.getRequest().getParameter("orderId");
			if(orderId == null||orderId == ""){
				orderId = "" ;
			}
			if(orderId.indexOf(",")>0){
				orderId = orderId.split(",")[0];
			}
			String orderCode = this.getRequest().getParameter("orderCode");
			if(orderCode == null||orderCode == ""){
				orderCode = "" ;
			}
			if(orderCode.indexOf(",")>0){
				orderCode = orderCode.split(",")[0];
			}
			String itemCodeStr   = this.getRequest().getParameter("itemCode");
			String applyTonNumStr= this.getRequest().getParameter("applyTonNum");
			String productIdStr  = this.getRequest().getParameter("productId");
			String factoryIdStr  = this.getRequest().getParameter("factoryId");
			String itemIdStr  = this.getRequest().getParameter("itemId");
			
			
			RequestHelper 	requestHelper=new RequestHelper(this.getRequest());
			String userId =(String)	requestHelper.getValueFromAllScopes("userId");
			
			HtmsEstimateFreightBusiness freight=new HtmsEstimateFreightBusiness();
			List<EstimateFreightBean> estimateParamsList=new ArrayList<EstimateFreightBean>();
			
			log.info(" productId:"+productIdStr+"   factoryId:"+factoryIdStr+"   itemCode:"+itemCodeStr+"   areaId:"+areaId+
			        "   areaCode:"+areaCode+"   customerId:"+customerId+"   applyTonNum:"+applyTonNumStr+"   applyTime:"+applyTime);
			
			log.info(" transferId:"+transferId+"   shipId:"+shipId+"   estimateStep:"+estimateStep+"   orderId:"+orderId+
			        "   orderCode:"+orderCode+"   itemIdStr:"+itemIdStr+"   userId:"+userId);
			
			log.info(" selfFetchType:"+selfFetchType+"   customerCode:"+customerCode+"   selfFetchStatus:"+selfFetchStatus);
			
			
			String[] applyTonNum=applyTonNumStr.split(","); 
			if(applyTonNum!=null){
				String[] itemCode=null;
				if(itemCodeStr!=null&&itemCodeStr!=""){
					itemCode=itemCodeStr.split(","); 
				}
				
				String[] itemId=null;
				
				if(itemIdStr!=null&&itemIdStr!=""){
					itemId=itemIdStr.split(",");
				}
				
				String[] productId=productIdStr.split(","); 
				String[] factoryId=factoryIdStr.split(","); 
			
				for(int i=0;i<applyTonNum.length;i++){
					EstimateFreightBean freightBean=new EstimateFreightBean();
					
					freightBean.setTranferId(transferId);
					
					if(itemCode!=null&&itemCode[i]!=""){
						freightBean.setItemCode(itemCode[i]);
					}	
					freightBean.setProductId(productId[i]);
					freightBean.setFactoryId(factoryId[i]);
					if(itemId!=null&&itemId[i]!=""){
						freightBean.setItemId(itemId[i]);
					}	
					freightBean.setApplyTonNum(applyTonNum[i]);
					
					
					freightBean.setOrderId(orderId);
					freightBean.setOrderCode(orderCode);
					freightBean.setAreaId(areaId);
					freightBean.setAreaCode(areaCode);
					freightBean.setCustomerId(customerId);					
					freightBean.setApplyTime(applyTime);					
					freightBean.setUserId(userId);
					freightBean.setShipId(shipId);
					freightBean.setEstimateStep(estimateStep);
					if("true".equals(selfFetchStatus)){
						freightBean.setSelfFetch(true);
						freightBean.setSelfFetchType(selfFetchType);
						freightBean.setCustomerCode(customerCode);
					}
					estimateParamsList.add(freightBean);
				}
			}
			
			List<FreightBean> freightList=freight.getEstimateFreight(estimateParamsList);
			
			
			String customPrice=this.getRequest().getParameter("customPrice");
			if(("1").equals(customPrice)){			
				 TransferPriceBean transPriceBean = new TransferPriceBean();	
				 
				 String freightModel=this.getRequest().getParameter("freightModel");
				 if(("1").equals(freightModel)){
					 String priceType=this.getRequest().getParameter("priceType");
					 String priceUnit=this.getRequest().getParameter("priceUnit");
					 String customerPrice=this.getRequest().getParameter("customerPrice");
					 String carrierPrice=this.getRequest().getParameter("carrierPrice");
					 //String carrierPrice="0";
					 if(carrierPrice==null||"".equals(carrierPrice)){
						 carrierPrice="0";
                	 }
					 transPriceBean.setFreightModel("1");
					 transPriceBean.setPriceType(priceType);
					 transPriceBean.setPriceUnit(priceUnit);
					 transPriceBean.setCustomerPrice(customerPrice);
					 transPriceBean.setCarrierPrice(carrierPrice);
					 SyncLogger.log("","freightModel:1"+"  priceType:"+priceType+"  priceUnit:"+priceUnit+"  customerPrice:"+customerPrice);
				 }
                 if(("2").equals(freightModel)){
                	 String customerOnePrice=this.getRequest().getParameter("customerOnePrice");
                	 String carrierOnePrice=this.getRequest().getParameter("carrierOnePrice");
                	 if(carrierOnePrice==null||"".equals(carrierOnePrice)){
                		 carrierOnePrice="0";
                	 }
                	 //String carrierOnePrice="0";
                	 transPriceBean.setFreightModel("2");
                	 transPriceBean.setCustomerOnePrice(customerOnePrice);
                	 transPriceBean.setCarrierOnePrice(carrierOnePrice);
                	 SyncLogger.log("","freightModel:2"+"  customerOnePrice:"+customerOnePrice);
				 }
				 freight.specifyTransferFreight(transPriceBean, freightList);
			}          
			
			String freightMsg="";
			
			if(freightList!=null&&freightList.size()>0){
				for(FreightBean bean: freightList){
					freightMsg+="行号为:"+bean.getItemCode()+"的";
					freightMsg+="客户运费为:"+bean.getFreightAmount()+" ";
					if(showCarrierPrice){
						freightMsg+="承运商运费为:"+bean.getCarrierFreight();
					}
					freightMsg += ";\\n" ;
				}
				FreightBean bean=freightList.get(0);
				if(freightList.size()==1){
					freightMsg="客户运费为:"+bean.getTotalFreight()+" ";
					if(showCarrierPrice){
						freightMsg+="承运商运费为:"+bean.getTotalCarrierFreight();
					}
					freightMsg += ";\\n" ;
				}else{
					freightMsg+="总体客户运费为:"+bean.getTotalFreight()+" ";
					if(showCarrierPrice){
						freightMsg+="承运商运费为:"+bean.getTotalCarrierFreight();
					}
					freightMsg += ";\\n" ;
				}
				freight.saveEstimateFreight(freightList);
			}
			
			if (freightMsg!=null&&freightMsg!="") {
				outMsg += 1;
				outMsg+=",\"msg\":\""+freightMsg+"\"";
			}else{
				outMsg += 0;
			    if("2".equals(selfFetchType)){
					outMsg+=",\"msg\":\"未设置自备车自提管理费;\\n\"";
				}else{
					outMsg+=",\"msg\":\"未找到合适的运价，线路或运价不存在，或未指定运价;\\n\"";
				}
			}
			outMsg += "}";
		
		}catch(Exception e){
			outMsg += 0;
			outMsg+=",\"msg\":\"获取运费发生异常\"";
		    outMsg += "}";
			e.printStackTrace();
		}
		SyncLogger.log(""," \n\n\n\n\n\n "+outMsg+"   \n\n\n\n\n\n\n");
		
		
		this.out(outMsg, this.getResponse());
		return "NULL";
	}
	
	
	/**
	 * ajax获取线路的方法
	 * @return
	 */
	public String getRoute(){
		String outMsg = "{\"isSuccess\":1}";	
		String productId  = this.getRequest().getParameter("productId");
		String factoryId = this.getRequest().getParameter("factoryId");
		
		if((factoryId==null||"".equals(factoryId.trim()))||(productId==null||"".equals(productId.trim()))){
			outMsg = "{\"isSuccess\":";
				outMsg += 0;
			outMsg += "}";
			
			this.out(outMsg, this.getResponse());
			
			return null;
		}
		String areaId = this.getRequest().getParameter("areaId");
		//RouteRepository routeRep = new RouteRepository();
		List<RouteBean> routeBeanList = null;
		routeBeanList= RouteRepository.getMatchRoutes(productId, factoryId, areaId);
		
		outMsg = "{\"isSuccess\":";
		if (routeBeanList!=null&&routeBeanList.size()>0) {
			outMsg += 1;
		}else{
			outMsg += 0;
		}
		outMsg += "}";
		
		this.out(outMsg, this.getResponse());
		return "NULL";
	}
	
	private void out(String message, HttpServletResponse response) {
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
}

