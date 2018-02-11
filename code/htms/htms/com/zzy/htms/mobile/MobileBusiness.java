package com.zzy.htms.mobile;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.zzy.htms.dictionary.area.AreaBean;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.log.HtmsLogger;
import com.zzy.htms.logistic.transferdetail.TransferDetailBean;
import com.zzy.htms.sales.customeraddr.CustomerAddrBean;
import com.zzy.htms.sales.custorder.CustOrderBean;
import com.zzy.htms.sales.custorderdetail.CustOrderDetailBean;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;
import com.zzy.htms.sap.rfc.CustomerSynker;
import com.zzy.htms.sap.rfc.OrderStockSearcher;
import com.zzy.htms.sap.rfc.OrderSynker;
import com.zzy.htms.user.HtmsUserBean;
import com.zzy.htms.webservice.market.order.HtmsApplyOrderBussiness;

import consts.SysConsts;


/**
 * 发货助手业务实现类
 * @author zzy
 *
 */
public class MobileBusiness extends AbstractV2BusinessExecutor {

	public static List<CustomerAddrBean> exchangeCustomerAddress(List<CustomerAddrBean> customerAddrList){
		if(customerAddrList==null||customerAddrList.isEmpty()){
			return null;
		}
		 List<CustomerAddrBean> addrLists = new ArrayList<CustomerAddrBean>();
		 CustomerAddrBean addrBean = null;
		String areaId = null;
		String areaName = null;
		 AreaRepository rep = new AreaRepository();
		 for(int i=0,size=customerAddrList.size();i<size;i++){
			 addrBean=(CustomerAddrBean) customerAddrList.get(i);
			 areaId = addrBean.getAreaId()+"";
			 areaName = rep.getFullAreaName(areaId, "", true);			 
			 addrBean.setAreaName(areaName);
			 addrLists.add(addrBean);
		 }
		 
		return addrLists;
		
	}
	
	/**
	 * 获取客户列表
	 */
	public void getCustList() {
		super.list();
		//getAddress();
		ResultBean resultBean = this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			return;
		}
		this.setCache("curpage", this.getParameter("curpage"), "request");
	}
	
	public void toAdd(){
		
		super.list();
		
		ResultBean resultBean = this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			return;
		}
		List customerAddrList =(List) resultBean.getListResult("CUSTOMERADDR");
		 if(customerAddrList==null){
			 customerAddrList = new ArrayList();
		 }
		 this.setCache("curpage", this.getParameter("curpage"), "request");

		 this.setCache("addrLists", MobileBusiness.exchangeCustomerAddress(customerAddrList), "request");
	}

	/*
	 * 获取地址列表
	 */
	public void listCustAddr() {
		super.list();
		//getAddress();
		ResultBean resultBean = this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			return;
		}
		
		List customerAddrList =(List) resultBean.getListResult("CUSTOMERADDR");
		 if(customerAddrList==null){
//			 return ;
			 customerAddrList = new ArrayList();
		 }
		 this.setCache("curpage", this.getParameter("curpage"), "request");

		// log.info("申请获取地址====" + customerAddrList);		 
//		this.getRequest().setAttribute("addrLists", MobileBusiness.exchangeCustomerAddress(customerAddrList));
		 this.setCache("addrLists", MobileBusiness.exchangeCustomerAddress(customerAddrList), "request");
	}
	
	/*
	 * 申请
	 */
	public void toApply() {
		super.list();
		//getAddress();
		ResultBean resultBean = this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			return;
		}
		
		List customerAddrList =(List) resultBean.getListResult("CUSTOMERADDR");
		 if(customerAddrList==null){
//			 return ;
			 customerAddrList = new ArrayList();
		 }
		 this.setCache("curpage", this.getParameter("curpage"), "request");
		 
		 this.getOrderApplyNum();
		 
		// log.info("申请获取地址====" + customerAddrList);		 
        // this.getRequest().setAttribute("addrLists", MobileBusiness.exchangeCustomerAddress(customerAddrList));
		 this.setCache("addrLists", MobileBusiness.exchangeCustomerAddress(customerAddrList), "request");
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
		
		List<CustOrderBean> detailLit =(List<CustOrderBean>) resultBean.getListResult("applyOrder");
		if(detailLit==null||detailLit.isEmpty()){
			log.info("未获取订单明细数据，无法获取订单可发货数量");
			return ;
		}
		CustOrderBean orderBean = (CustOrderBean)detailLit.get(0);
		int size = detailLit.size();
		String[] ordersCodes=new String[size], itemsCodes=new String[size];
		CustOrderBean detailBean = null;
		String orderCode = orderBean.getCorderCode(),itemCode=null;
		for(int i=0;i<size;i++){
			detailBean=(CustOrderBean)detailLit.get(i);
			
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
		CustomerSynker custSynker= new CustomerSynker();
		String customerAmount=custSynker.getCustomerAccountMoney(orderBean.getCustomerCode(), orderBean.getSaleOrg());
		customerAmount=this.isNull(customerAmount)?"0.0":customerAmount;
		
		String sapStrNum=null,dbStrNum=null;
		BigDecimal sapApplyNum = null;
		Map<String,String > tempMap=null;
		for(int i=0;i<size;i++){
			detailBean=(CustOrderBean)detailLit.get(i);
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
			
			log.info("sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum);
			if(sapApplyNum.compareTo(dbApplyNum)<1){
				detailBean.setAppliableAmount("0");
			}else{
				sapApplyNum=sapApplyNum.subtract(dbApplyNum);
				detailBean.setAppliableAmount(sapApplyNum+"");
			}
			log.info("sapStrNum="+sapStrNum+",dbStrNum="+dbStrNum+",applyNum="+detailBean.getAppliableAmount());
		}
		
		tools.tool.clear(tempMap);
		tools.tool.clear(sapStockMap);
		tools.tool.clear(useNumMap);
		tools.tool.clear(shipDetailList);
		
		log.info("detailLit===========" + detailLit);
		log.info("customerAmount===========" + customerAmount);
		this.setCache("customerAmount", customerAmount, "request");
		
		
		List<CustOrderDetailBean> orderDetailBeanList=new ArrayList<CustOrderDetailBean>(); 
		for(int i=0;i<detailLit.size();i++){
			CustOrderBean  custOrderBean= (CustOrderBean) detailLit.get(i);
			CustOrderDetailBean  orderDetailBean = new CustOrderDetailBean();
			orderDetailBean.setMeterialNo(custOrderBean.getMeterialNo());
			orderDetailBean.setCodetailCertificate(custOrderBean.getCodetailCertificate());
			
			orderDetailBeanList.add(orderDetailBean);
		}
		HtmsApplyOrderBussiness  applyOrderBussiness=new HtmsApplyOrderBussiness();
		Map<String ,String > map=applyOrderBussiness.getGoodsCount(orderBean, orderDetailBeanList);
		List<CustOrderBean>   finalOrderDetailBeanList=new ArrayList<CustOrderBean>();
		if(map!=null&&map.size()>0){
			for(int i=0;i<detailLit.size();i++){
				CustOrderBean  custOrderDetailBean= (CustOrderBean) detailLit.get(i);
				String marketAvailableNum= map.get(custOrderDetailBean.getMeterialNo());
				custOrderDetailBean.setMarketAvailableNum(marketAvailableNum);
				finalOrderDetailBeanList.add(custOrderDetailBean);
			}
			this.setCache("detailLit", finalOrderDetailBeanList, "request");
		}else{
			this.setCache("detailLit", detailLit, "request");
		}
	}

	
	/**
	 * 加载订单列表
	 * @return
	 */
	public String listApply(){
		String forward=super.list();
		getApplyList();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERORDER031", "查看订单列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERORDER032", "查看订单列表失败", "0", this.getRequest());
		}
		 this.setCache("curpage", this.getParameter("curpage"), "request");
		return forward;
	}

	/**
	 * 加载发货申请列表
	 * @return
	 */
	public String listApplyed(){
		String forward=super.list();						
		
		this.setCache("curpage", this.getParameter("curpage"), "request");
		
		getApplyedList();
		
		return forward;
	}
	
	/**
	 * 获取地址子节点
	 * @return
	 */
	public String listChild() {
		String parentAreaId = this.getRequest().getParameter("parentAreaId");
		String areaLevel = this.getRequest().getParameter("areaLevel");
		
//		AreaRepository areaRepository = new AreaRepository();
		List<AreaBean> childAddrList = AreaRepository.getNextLevelChild(parentAreaId);
		
		String outMsg = "{\"areaLevel\":" + areaLevel;
		outMsg += ",\"areaData\":[";
		boolean first = true;
		
		for (int i = 0; i < childAddrList.size(); i++) {
			if (!first) {
				outMsg += ",";
			}
			
			AreaBean areaBean = childAddrList.get(i);
			outMsg += "{\"value\":";
			outMsg += areaBean.getAreaId();
			outMsg += ",";
			
			outMsg += "\"code\":\"";
			outMsg += areaBean.getAreaCode();
			outMsg += "\",";
			
			outMsg += "\"text\":\"";
			outMsg += areaBean.getAreaName();
			outMsg += "\"}";
			
			first = false;
		}
		outMsg += "]}";
		
		this.out(outMsg, this.getResponse());
		
		
		return "NULL";
	}
	
	/**
	 * 修改地址
	 */
	public String modify(){
		super.modify();
		
		String outMsg = "{\"isSuccess\":";
		if (this.isSuccess()) {
			outMsg += 1;
		}else{
			outMsg += 0;
		}
		outMsg += "}";
		
		this.out(outMsg, this.getResponse());
		
		return "NULL";
	}
	
	/**
	 * 新增地址
	 */
	public String add(){
		super.add();
		
		String outMsg = "{\"isSuccess\":";
		if (this.isSuccess()) {
			outMsg += 1;
		}else{
			outMsg += 0;
		}
		outMsg += "}";
		
		this.out(outMsg, this.getResponse());
		
		return "NULL";
	}
	
	/**
	 * 删除地址
	 */
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERADDRESS011", "删除客户地址成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERADDRESS012", "删除客户地址失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String addMarketOrder(){
		String forward=super.list();
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
			//String errorMessage="申请成功：调用闭环系统创建订单成功";
			//this.setCache("INVOKE_MESSAGE",errorMessage,"request");
		}else{
			HtmsLogger.log("CUSTOMERADDRESS012", "创建订单失败", "0", this.getRequest());
			this.setCache("INVOKE_MESSAGE","创建订单失败","request");
		}
		return forward;
	}
	
	//获取发货申请列表
	public String getApplyList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("APPLYLIST");
		 if(list==null){
			 return null;
		 }

		 List<CustOrderBean> detailList = null;
		 
		 Map<String, List<CustOrderBean>> applyListMap=new HashMap<String, List<CustOrderBean>>();
		 List<String> applyKeyList = new ArrayList<String>();
		 
		 CustOrderBean orderBean=null;
		 String orderNo=null;
		 //log.info("list size=================="+(list==null?0:list.size()));
		 for(int i=0,size=list.size();i<size;i++){
			 orderBean=(CustOrderBean)list.get(i);
			 orderNo=orderBean.getCorderCode();
			
			 //log.info("customerCode=================="+customerCode);
			 
			 detailList=applyListMap.get(orderNo);
			// log.info("orderNo=================="+orderNo);
			 if(detailList==null){
				 detailList= new ArrayList<CustOrderBean>();
				 applyListMap.put(orderNo, detailList);
				 
				 applyKeyList.add(orderNo);
			 }
			 detailList.add(orderBean);
		 }
		 detailList=null;

		// log.info("\n\n");
		 this.getRequest().setAttribute("applyKeyList", applyKeyList);
		// this.setCache("applyListMap", applyListMap, "request");
		 this.getRequest().setAttribute("applyListMap",applyListMap);
		// log.info("applyListMap====" + applyListMap);
		 
		 return null;
	}
	
	/**
	 * 获取已申请列表
	 * @return
	 */
	public String getApplyedList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List appliedList =(List) resultBean.getListResult("SELECTAPPLYED");
		 if(appliedList==null){
			 return null;
		 }
		 
		 ShipBean shipBean=null;
		 AreaRepository rep = new AreaRepository();
		 
		 Map<Integer, List<ShipBean>> listMap = new HashMap<Integer, List<ShipBean>>();
		 List<Integer> appliedKeyList = new ArrayList<Integer>();
		 
		 for(int i=0,size=appliedList.size();i<size;i++){
			 shipBean=(ShipBean)appliedList.get(i);
			 
			 int shipId = shipBean.getShipId();
			 
			 List<ShipBean> list = listMap.get(shipId);
			 if (list == null) {
				 list = new ArrayList<ShipBean>();
				 listMap.put(shipId, list);
				 
				 appliedKeyList.add(shipId);
			 }
			 
			 list.add(shipBean);
			 
			 shipBean.setAreaName(rep.getFullAreaName(shipBean.getAreaId(), "", true));
		 }
		 
		// log.info("MobileBusiness->getApplyedList=" + appliedList);
		 
		 this.getRequest().setAttribute("appliedKeyList", appliedKeyList);
		 this.getRequest().setAttribute("appliedListMap", listMap);
		
		return null;
	}
	
	/*
	 * 同步订单
	 */
	public String orderSync() {
		
		String outMsg = "{\"isSuccess\":1}";		
		
		String startDate = (String)this.getParameter("startDate");
		String endDate = (String)this.getParameter("endDate");
		String salesNo =(String)this.getRequest().getSession().getAttribute("user_sales_no");
		salesNo= salesNo==null?"":salesNo.trim();
		
		HtmsUserBean userBean =(HtmsUserBean) this.getRequest().getSession().getAttribute(SysConsts.USER_BEAN);
		String userEmployNo= userBean.getSyncEmployNo();
		userEmployNo=userEmployNo==null?"":userEmployNo;
		if(userEmployNo.indexOf(",")!=-1){
			userEmployNo=userEmployNo.replaceAll(",", "-");
		}
		
		log.info("salesNo==========" + salesNo+"    userEmployNo=======  "+userEmployNo);
		
		if(salesNo==null||"".equals(salesNo.trim())){
			HtmsLogger.log("ORDER_SYNC_002", "同步销售组号为空", "0", this.getRequest());
			this.out(outMsg, this.getResponse());
			
			return "NULL";
		}
		if(salesNo.indexOf(",")!=-1){
			salesNo=salesNo.replaceAll(",", "-");
		}

		if(startDate==null||"".equals(startDate.trim())){			
			HtmsLogger.log("ORDER_SYNC_001", "同步开始日期为空", "0", this.getRequest());
			this.out(outMsg, this.getResponse());
			
			return "NULL";
		}

		this.setCache("startTime", tools.tool.getDateTime(), "request");
		long useTime = System.currentTimeMillis();
		OrderSynker synker= null;
		boolean result =true;
		try {
			synker= new OrderSynker();

			result =synker.sync(salesNo,userEmployNo,startDate, endDate);
		}catch (Exception e) {
			log.info("MobileOrderSynker"+e );			
			result = false ;
		}
		
		useTime=System.currentTimeMillis()-useTime;
		
		this.setCache("useTime", useTime, "request");
		this.setCache("endTime", tools.tool.getDateTime(), "request");
		HtmsLogger.log("ORDER_SYNC_003", "同步销售组订单结束", result?"1":"0", this.getRequest());
		
		super.add();
		
		outMsg = "{\"isSuccess\":";
		if (result) {
			outMsg += 1;
		}else{
			outMsg += 0;
		}
		outMsg += "}";
		
		this.out(outMsg, this.getResponse());
		
		return "NULL";
	}
	
	/**
	 * 申请检查SAP可申请数量
	 * @return
	 */
	public String checkApplyNum(){
		super.list();
		
		String outMsg = "";
		
		ResultBean resultBean = this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			System.out.print("checkApplyNum->数据查询出错，无法获取订单可发货数量");
			
			outMsg = "{\"code\":1,\"msg\":\"数据查询出错，无法获取订单可发货数量，请稍后重试！\"}";
			this.out(outMsg, this.getResponse());
			
			return "NULL";
		}	
		
		String itemCodes = this.getRequest().getParameter("itemCodes");
		String orderCodes = this.getRequest().getParameter("orderCodes");
		String itemCodeDescs = this.getRequest().getParameter("itemCodeDescs");
		String applyTonNums = this.getRequest().getParameter("applyTonNums");
		
		System.out.println("itemCodes=" + itemCodes);
		System.out.println("orderCodes=" + orderCodes);
		System.out.println("itemCodeDescs=" + itemCodeDescs);
		System.out.println("applyTonNums=" + applyTonNums);
		
		if (itemCodes.length() <= 0 || orderCodes.length() <= 0 || itemCodeDescs.length() <= 0 || applyTonNums.length() <= 0) {
			System.out.print("checkApplyNum->申请项数据异常，请刷新后重试！");
			
			outMsg = "{\"code\":1,\"msg\":\"申请项数据异常，请刷新后重试！\"}";
			this.out(outMsg, this.getResponse());
			
			return "NULL";
		}
		

		String[] ordersCodes = orderCodes.split(","); 
		String[] itemsCodes = itemCodes.split(",");
		String[] applysTonsNums = applyTonNums.split(",");
		
		String[] itemsCodesDescs = itemCodeDescs.split(",");
		
		int itemCodesSize = itemsCodes.length;
		int orderCodesSize = ordersCodes.length;
		int applyTonSize = applysTonsNums.length;
		
		if (itemCodesSize != orderCodesSize || itemCodesSize != applyTonSize) {
			System.out.print("checkApplyNum->itemCodesSize!=orderCodesSize");
			
			outMsg = "{\"code\":1,\"msg\":\"申请项内容不一致，请刷新后重试！\"}";
			this.out(outMsg, this.getResponse());
			
			return "NULL";
		}
	
		log.info("checkApplyNum Start invoke OrderStockSearcher Api");
		long time = System.currentTimeMillis();
		OrderStockSearcher synker= new OrderStockSearcher();
		Map<String,Map<String,String>> sapStockMap=synker.getOrderStock(ordersCodes,itemsCodes);
		log.info("checkApplyNum End invoke OrderStockSearcher Api,Use Time:"+(System.currentTimeMillis()-time));
		if(sapStockMap==null||sapStockMap.isEmpty()){
			log.info("checkApplyNum->未从SAP中获取订单可发货数量。");
			
			outMsg = "{\"code\":1,\"msg\":\"未从SAP中获取到订单可发货数量，请稍后再试！\"}";
			this.out(outMsg, this.getResponse());
			
			return "NULL";
		}
		
		List shipDetailList =(List) resultBean.getListResult("applyShipDetailList");
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
		List<TransferDetailBean> transDetailList = (List<TransferDetailBean>) resultBean.getListResult("applyTransferDetailList");
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
		
		String itemCode;
		String orderCode;
		String applyTonNum;
		
		String sapStrNum=null,dbStrNum=null;
		BigDecimal sapApplyNum = null;
		Map<String,String > tempMap=null;
		for(int i=0;i<itemCodesSize;i++){
			itemCode=itemsCodes[i];
			orderCode = ordersCodes[i];
			applyTonNum = applysTonsNums[i];

			tempMap=sapStockMap.get(orderCode+itemCode);
			if(tempMap==null||tempMap.isEmpty()){
				log.info("checkApplyNum->未从SAP中获取订单可发货数量。itemCode=" + itemCode + "orderCode=" + orderCode );
				
				String itemCodeDesc = "";
				if (itemsCodesDescs.length > i) {
					itemCodeDesc = itemsCodesDescs[i];
				}
				String msg = "物料号:" + itemCodeDesc + ";未从SAP中获取到订单可发货数量，请稍后再试！";
				
				outMsg = "{\"code\":1,\"msg\":\"" + msg;
				outMsg += "\"}";
				
				this.out(outMsg, this.getResponse());
				
				return "NULL";
			}
			
			
			sapStrNum=tempMap.get("applyNum");
			sapStrNum=this.isNull(sapStrNum)?"0":sapStrNum;
			sapApplyNum=new BigDecimal(sapStrNum);
			
			dbApplyNum=useNumMap.get(itemCode);
			dbApplyNum=dbApplyNum==null?new BigDecimal("0.0"):dbApplyNum;
			
			BigDecimal applyNum = new BigDecimal(applyTonNum);
			
			System.out.print("sapStrNum="+sapStrNum+",dbApplyNum="+dbApplyNum + ",applyNum=" + applyNum );
			
			BigDecimal totalNum = dbApplyNum.add(applyNum);
			
			log.info("sapStrNum="+sapStrNum+",dbApplyNum="+dbApplyNum + ",applyNum=" + applyNum + ",totalNum=" + totalNum);
			
			System.out.print("sapStrNum="+sapStrNum+",dbApplyNum="+dbApplyNum + ",applyNum=" + applyNum + ",totalNum=" + totalNum);
			if(sapApplyNum.compareTo(totalNum)<0){
				String subStr = totalNum.subtract(sapApplyNum) + "";
				
				log.info("checkApplyNum->申请数量超过可发货数量。itemCode=" + itemCode + "orderCode=" + orderCode );
				
				String itemCodeDesc = "";
				if (itemsCodesDescs.length > i) {
					itemCodeDesc = itemsCodesDescs[i];
				}
				String msg = "物料号:" + itemCodeDesc + ";申请数量超过可发货数量(" + subStr;
				msg += ")，请刷新后重试！";
				
				outMsg = "{\"code\":1,\"msg\":\"" + msg;
				outMsg += "\"}";
				
				this.out(outMsg, this.getResponse());
				
				return "NULL";
			}
		}
		
		tools.tool.clear(tempMap);
		tools.tool.clear(sapStockMap);
		
		outMsg = "{\"code\":0,\"msg\":\"成功\"}";
		
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
