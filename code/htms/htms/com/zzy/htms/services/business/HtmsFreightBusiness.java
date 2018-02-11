package com.zzy.htms.services.business;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.dictionary.traderprice.TraderPriceBean;
import com.zzy.htms.dictionary.transprice.TransPriceBean;
import com.zzy.htms.logistic.freight.PriceUtil;
import com.zzy.htms.logistic.transfer.TransferBean;
import com.zzy.htms.logistic.transferprice.TransferPriceBean;
import com.zzy.htms.sales.customer.CustomerBean;
import com.zzy.htms.sales.customerprice.CustomerPriceBean;
import com.zzy.htms.sales.custorder.CustOrderBean;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;
import com.zzy.htms.sap.rfc.SapFreightSynker;
import com.zzy.htms.sap.rfc.SyncLogger;


/**
 * 正式运费接口实现类
 * @author zzy
 *
 */
public class HtmsFreightBusiness  extends HtmsServiceBusiness {

	public List<FreightBean> getFreight(List<SapTransferBean> sapTransList){
		return getFreight(sapTransList,true);
	}
	
	/**
	 * 获取正式运费
	 * @param sapTransList
	 * @param toDataBase 是否记录日志到数据库
	 * @return
	 */
	public List<FreightBean> getFreight(List<SapTransferBean> sapTransList,boolean toDataBase){
		/*if(this.validateUser(pxml)==false){
			return getResult("E","E000","访问凭证不合法，请和管理员联系。",true);
		}*/
		/*解析SAP传过来的参数*/
		/*List<SapTransferBean> sapTransList =PxmlParser.getSapTransferBean(pxml);*/
		if(sapTransList==null||sapTransList.isEmpty()){
			SyncLogger.log("ZRFC_HTMS_008 007","调用参数中没有调拨单及行项的有效数据，请与SAP管理员联系。");
			//return getResult("E","E001","调用参数中没有调拨单及行项的有效数据，请与SAP管理员联系。",true);
			return null;
		}
		
		/*从数据库加载计算运费所需要的信息*/
		SapTransferBean sapTransBean = sapTransList.get(0);
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("getCalculateFreightInfo");
		String sapTransCode = sapTransBean.getTransferCode();
		Map parameters =  new HashMap();
		parameters.put("sapTransferCode", new String[]{sapTransCode});

		ResultBean resultBean = this.dbOperator(operationBean,parameters, false);
		if(resultBean==null|resultBean.isSuccess()==false){
			//return getResult("E","E002","数据库查询异常，请检查日志。sapTransCode="+sapTransCode,true);
			return null;
		}
		
		CustOrderBean orderBean =(CustOrderBean)resultBean.getListFirstResult("orderBean");
		TransferPriceBean transPriceBean =(TransferPriceBean)resultBean.getListFirstResult("transPriceBean");
		TransferBean transferBean=(TransferBean)resultBean.getListFirstResult("transferBean");
		List<TransferBean> transDetailList=(List<TransferBean>)resultBean.getListResult("transDetailList");
		ShipBean shipBean=(ShipBean)resultBean.getListFirstResult("shipBean");
		List<ShipDetailBean> shipDetailList=(List<ShipDetailBean>)resultBean.getListResult("shipDetailList");
		
		if(orderBean==null||transferBean==null||shipBean==null||transDetailList==null||transDetailList.isEmpty()||shipDetailList==null||shipDetailList.isEmpty()){
			//return getResult("E","E003","数据库中没有找到计算运费所需要的合适数据。请各管理员联系。sapTransCode="+sapTransCode,true);
			log.info("无法按正常方式进行运费计算,orderBean==null||transferBean==null||shipBean==null||transDetailList==null||transDetailList.isEmpty()||shipDetailList==null||shipDetailList.isEmpty())");
			return null;
		}
		
		if(orderBean.getCustomerId()<=0){
			if(orderBean.getCustomerId()<=0&&shipBean.getCustomerId()>0){
				orderBean.setCustomerId(shipBean.getCustomerId());
				SyncLogger.log("customerid赋值成功","shipBean customerid："+shipBean.getCustomerId());
			}
//			if(orderBean.getCustomerId()<=0&&transferBean.getCustomerId()>0){
//				orderBean.setCustomerId(transferBean.getCustomerId());
//				SyncLogger.log("customerid赋值成功","transferBean customerid："+transferBean.getCustomerId());
//			}
			if(orderBean.getCustomerId()<=0){
				SyncLogger.log("customerid赋值失败","无法进行运费计算,orderBean  getCustomerId ==null  获取订单的客户ID为空");
				return null;
			}
		}
		
		ShipDetailBean shipDetailBean=shipDetailList.get(0);
		
		/*计算实际出库的总重量*/
		SapTransferBean sapTransferBean=null;
		BigDecimal  totalActualTonNum=new BigDecimal("0.00"),actualApplyTon=null;
		for(int i=0,size=sapTransList.size();i<size;i++){
			sapTransferBean=sapTransList.get(i);
			actualApplyTon=new BigDecimal(sapTransferBean.getApplyTonNum());
			totalActualTonNum=totalActualTonNum.add(actualApplyTon);
		}
		

		/*
		 //注释调拨单合并部分的代码,先保留
		if(transferBean.getIsMerger()!=null&&transferBean.getIsMerger().equals("1")){
			SyncLogger.log("HtmsFreightBusiness:getFreight ZRFC_HTMS_008","计算运费开始，按照合并之后的重量计算运费。"+" transId:"+transferBean.getTransId());
			Map mergerParameters =  new HashMap();
			mergerParameters.put("mergerGroup", transferBean.getMergerGroup());
			//通过mergerGroup获取调拨单及细项信息
			OperationBean mergerOperationBean = OperationConfigRepository.getOperationConfig("getTransferMergeDataByGroup");
			ResultBean mergerResultBean = this.dbOperator(mergerOperationBean, mergerParameters, false);
			List<TransferBean> transferList = new ArrayList<TransferBean>();
			transferList =mergerResultBean.getListResult("getTransferMergeDataByGroup");
			TransferBean  transferMergerBean=null;
			if(transferList!=null&&transferList.size()>0){
				//重置总重量为0
				totalActualTonNum=new BigDecimal("0.00");
				//根据细项重量计算出总重量
				for(int i=0,size=transferList.size();i<size;i++){
					transferMergerBean=transferList.get(i);
					actualApplyTon=new BigDecimal(transferMergerBean.getDetailApplyTonNum());
					totalActualTonNum=totalActualTonNum.add(actualApplyTon);
				}
				//合并后，取合并的时间为运费计算的时间
				if(transferBean.getMergerTime()!=null&&transferBean.getMergerTime()!=""){
					shipBean.setApplyTime(transferBean.getMergerTime());
					shipBean.setCreateTime(transferBean.getMergerTime());
				}
			}
			SyncLogger.log("HtmsFreightBusiness:getFreight ZRFC_HTMS_008","合并计算运费传入参数：totalActualTonNum:"+totalActualTonNum+
					"  mergerGroup:"+transferBean.getMergerGroup()+" transId:"+transferBean.getTransId()+" 合并时间作为运费计算时间   merger time:"+transferBean.getMergerTime());
		}
		*/
		
		
		/*
		 * 如果是自提单则,按承运商运价 进行运费计算,此时freightType=4
		 * 计算完成后返回,不作后续的运费计算
		 */
		if("1".equals((transferBean.getSelfFetch()+""))||"9".equals((transferBean.getSelfFetch()+""))){
			List<FreightBean> freightList=null;
			log.info("parameters: producted:"+shipDetailBean.getProductId()+" factoryid:"+ shipDetailBean.getFactoryId()+" areaId:"+ transferBean.getAreaId()+" totalApplyNum:"+ totalActualTonNum+"  shipbean createtime:"+ shipBean.getCreateTime());
			   
			TraderPriceBean traderPriceBean=PriceUtil.getTraderPrice(shipDetailBean.getProductId()+"", shipDetailBean.getFactoryId(), transferBean.getAreaId(), totalActualTonNum, shipBean.getCreateTime());
			if(traderPriceBean!=null&&traderPriceBean.getPriceId()>0){
				log.info("获取的承运商运价为  priceid:"+traderPriceBean.getPriceId()+"  validateDate:"+traderPriceBean.getValidateDate()+"  price:"+traderPriceBean.getCustomerPrice());
			}
			if(traderPriceBean!=null){
				freightList=this.calculateTraderFreight(traderPriceBean, sapTransList, totalActualTonNum, transferBean, shipBean);
			}
			if(freightList!=null&&freightList.size()>0){
				this.saveFreight(freightList);
			}else{
				log.info("调用计算承运商运费功能出错,未计算出对应的运费  freightList=0 ");
			}
			return freightList;
		}
		if("2".equals((transferBean.getSelfFetch()+""))||"10".equals((transferBean.getSelfFetch()+""))){
			List<FreightBean> freightList=null;
			Map selfFetchParameters =  new HashMap();
			selfFetchParameters.put("customerId", orderBean.getCustomerId());
			OperationBean selfFetchOperationBean = OperationConfigRepository.getOperationConfig("getCustemerSelfFetchFreight");
			ResultBean selfFetchResultBean = this.dbOperator(selfFetchOperationBean,selfFetchParameters, false);
			CustomerBean   customerBean =(CustomerBean) selfFetchResultBean.getListFirstResult("customerBean");
			if(customerBean!=null&&customerBean.getManagementFee()!=null){
				log.info("获取的自提车管理费用为  priceid:"+customerBean.getFeeId()+"  price:"+customerBean.getManagementFee());
				freightList=this.calculateCustomerSelfFetchFreight(customerBean, sapTransList,  totalActualTonNum, transferBean, shipBean);
			}else{
//				customerBean.setManagementFee("0");
//				customerBean.setFeeId("0");
//				customerBean.getCreateTime("2017-12-14 00:00:00")
//				log.info("获取的自提车管理费用为  priceid:"+customerBean.getFeeId()+"  price:"+customerBean.getManagementFee());
//				freightList=this.calculateCustomerSelfFetchFreight(customerBean, sapTransList,  totalActualTonNum, transferBean, shipBean);
				log.info("获取的自提车管理费用为空"+orderBean.getCustomerCode());
			}
			if(freightList!=null&&freightList.size()>0){
				this.saveFreight(freightList);
			}else{
				log.info("调用计算承运商运费功能出错,未计算出对应的运费  freightList=0 ");
			}
			return freightList;
		}
	
		/**
		 * 按正常方式进行运费计算 freightType=1
		 */
		List<FreightBean> freightList =this.calculateNormalFreight(sapTransList,totalActualTonNum, transferBean, shipBean, shipDetailList);
		if(freightList==null||freightList.isEmpty()){
			log.info("无法按正常方式进行运费计算，请查检线路及运价。freightList==null||freightList.isEmpty()");
		}else{
			
		}
		
	  	 
	
		CustomerPriceBean customerPriceBean=PriceUtil.getCustomerPrice(shipDetailBean.getProductId()+"", shipDetailBean.getFactoryId(), transferBean.getAreaId(), orderBean.getCustomerId()+"",totalActualTonNum, shipBean.getCreateTime());
		
		/*特殊客户运价计算，会对上一步的计算结果进行覆盖,优先第二，freightType=2*/
		if(customerPriceBean!=null){
			if(freightList==null||freightList.isEmpty()){
				freightList=this.specialCustomerFreight(customerPriceBean, sapTransList, totalActualTonNum, transferBean, shipBean);
			}else{
				this.specialCustomerFreight(customerPriceBean, freightList);
			}
		}
		
		/*按物流指定运价计算，会对上一步的计算结果进行覆盖,优先最高，freightType=3*/
		log.info("++++++++++++++++++++++++++++++++++++++++++++++++transPriceBean:"+transPriceBean);
		if(transPriceBean!=null){
			if(freightList==null||freightList.isEmpty()){
				freightList=this.specifyTransferFreight(transPriceBean, sapTransList, totalActualTonNum, transferBean, shipBean);
			}else{
				this.specifyTransferFreight(transPriceBean, freightList);
			}
		}
		
		//将运算结果保存到数据中
		if(toDataBase){
			this.saveFreight(freightList);
		}
		
		return freightList;
	}
	
	
	
	
	private TransPriceBean getPriceBean(Map<String,TransPriceBean> priceMap){
		if(priceMap==null||priceMap.isEmpty()){
			return null;
		}
		Set set = priceMap.keySet();
		Iterator it = set.iterator();
		TransPriceBean priceBean = null;
		while(it.hasNext()){
			priceBean=priceMap.get(it.next());
			if(priceBean!=null){
				return priceBean;
			}
		}
		return priceBean;
	}
	
	/**
	 * 计算客户自备车自提管理费
	 * @param sapTransList
	 * @param totalActualTonNum
	 * @param transferBean
	 * @param shipBean
	 * @param shipDetailList
	 * @return
	 */
	private List<FreightBean>  calculateCustomerSelfFetchFreight(CustomerBean   customerBean,List<SapTransferBean> sapTransList,BigDecimal  totalActualTonNum,TransferBean transferBean,ShipBean shipBean){
		List<FreightBean> freightList = new ArrayList<FreightBean>();
		if(customerBean==null||customerBean.getManagementFee()==null||sapTransList==null||sapTransList.isEmpty()){
			return null;
		}
		
		BigDecimal  totalTonNum=totalActualTonNum,priceNum=null,applyNum=null ;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),specifyAmount=null ;
		FreightBean freightBean =null;
		SapTransferBean sapTransferBean = null;
		
		String TON="24",unit=TON;
		List<FreightBean> feightList =new ArrayList<FreightBean>();
		for(int i=0,size=sapTransList.size();i<size;i++){
			sapTransferBean=sapTransList.get(i);	
			
			freightBean =new FreightBean();			
			freightBean.setFreightType("5");//客户自备车自提类型
			freightBean.setShipId(shipBean.getShipId()+"");
			freightBean.setTransferId(transferBean.getTransId()+"");
			freightBean.setSapCode(sapTransferBean.getTransferCode());
			freightBean.setItemCode(sapTransferBean.getItemCode());
			freightBean.setSubItemCode(sapTransferBean.getSubItemCode());
			freightBean.setAreaId(transferBean.getAreaId());

			
			freightBean.setValidateDate(customerBean.getCreateTime());
			freightBean.setApplyTonNum(sapTransferBean.getApplyTonNum());
			freightBean.setFreightStyle("6");//默认按吨计
			freightBean.setPriceId(customerBean.getFeeId()+"");
			freightBean.setIsEstimate(sapTransferBean.isEstimate()?"1":"0");//设置是否预估运费
			
			
			
			freightBean.setPriceId(customerBean.getFeeId());
			
			applyNum=new BigDecimal(freightBean.getApplyTonNum());//重量
			priceNum=new BigDecimal(customerBean.getManagementFee());
			freightBean.setFreightModel("单价");
			freightBean.setFreightPrice(priceNum+"");
			if(TON.equals(unit)){//将按吨计转换成按公斤计算
				priceNum=priceNum.divide(new BigDecimal("1000.00"));
			}
			
			freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
			freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
			
			totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和

			freightBean.setFreightAmount(freightAmount+"");
				
			freightBean.setFreightTime(tools.tool.getDateTime());
			feightList.add(freightBean);
		}
		
		
		//按客户自备车自提管理费计算
		freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
		BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
		totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
		totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
		if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
			BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
			freightAmount=new BigDecimal(freightBean.getFreightAmount());
			freightAmount=freightAmount.add(spanFreight);
			freightBean.setFreightAmount(freightAmount+"");
		}
		
		//最后设置总价
		for(int i=0,size=feightList.size();i<size;i++){
			freightBean=feightList.get(i);
			freightBean.setTotalFreight(totalFreight+"");
		}
		return feightList;
	}
	
	
    /**
     * 计算承运商运价
     * @param customerPriceBean
     * @param freightList
     * @return
     */
	private void  specialTraderFreight(TraderPriceBean traderPriceBean,List<FreightBean> feightList){
		if(traderPriceBean==null||feightList==null||feightList.isEmpty()){
			return;
		}
		
		BigDecimal  totalTonNum=new BigDecimal("0.00"),priceNum=null,carrierPriceNum=null,carrierApplyNum=null,applyNum=null;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),carrirTotalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),carrierFreightAmount=null,specifyAmount=null;
		FreightBean freightBean =null;
		for(int i=0,size=feightList.size();i<size;i++){//计算订单总重量
			freightBean=feightList.get(i);
			applyNum=new BigDecimal(freightBean.getApplyTonNum());
			totalTonNum=totalTonNum.add(applyNum);
		}

		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=traderPriceBean.getFreightModel(),unit=traderPriceBean.getPriceUnit();
		unit=traderPriceBean.getPriceUnit();
		model=traderPriceBean.getFreightModel();
	
		for(int i=0,size=feightList.size();i<size;i++){
			freightBean=feightList.get(i);
			freightBean.setFreightType("4");//按照贸易商运价计算
			
			freightBean.setValidateDate(traderPriceBean.getValidateDate());
			freightBean.setFreightStyle(traderPriceBean.getPriceType()+"");//默认按吨计
			freightBean.setPriceId(traderPriceBean.getPriceId()+"");
			
			if(allModel.equals(model)){//总价
				priceNum=new BigDecimal(traderPriceBean.getCustomerOnePrice());//此数目该用户该系统路的一口价为总价
				carrierPriceNum=new BigDecimal(traderPriceBean.getCarrierOnePrice());//此数目承运商在该用户该系统路的一口价为总价
				applyNum=new BigDecimal(freightBean.getApplyTonNum());
				
				priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				freightBean.setTotalFreight(priceNum+"");
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				
				freightBean.setFreightModel("总价");
				freightBean.setFreightPrice("");
				freightBean.setCarrierPrice("");
				
				freightAmount=priceNum.multiply(applyNum);
				freightAmount=freightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);
				carrierFreightAmount=carrierFreightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);log.info("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				log.info("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			
			if(singleModel.equals(model)){//按单价计
				
				applyNum=new BigDecimal(freightBean.getApplyTonNum());//重量
				priceNum=new BigDecimal(traderPriceBean.getCustomerPrice());
				carrierApplyNum=applyNum;
				carrierPriceNum=new BigDecimal(traderPriceBean.getCarrierPrice());
				freightBean.setFreightModel("单价");
				freightBean.setFreightPrice(priceNum+"");
				freightBean.setCarrierPrice(carrierPriceNum+"");
				if(TON.equals(unit)){//将按吨计转换成按公斤计算
					priceNum=priceNum.divide(new BigDecimal("1000.00"));
					carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				}
				
				freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和
				//log.info("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				//log.info("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
		}
		if(allModel.equals(model)){//总价抹尾
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			priceNum=new BigDecimal(traderPriceBean.getCustomerOnePrice());
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			
			if(priceNum.compareTo(totalFreightNum)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			
			carrierPriceNum=new BigDecimal(traderPriceBean.getCarrierOnePrice());
			carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(carrierPriceNum.compareTo(carrirTotalFreightNum)!=0){//承运商抹尾处理
				BigDecimal spanFreight=carrierPriceNum.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setCarrierFreight(freightAmount+"");
			}
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				freightBean.setTotalFreight(priceNum+"");
			}
		}
		
		if(singleModel.equals(model)){//按单价计
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			//priceNum=new BigDecimal(traderPriceBean.getCustomerPrice());
			BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			

			//carrierPriceNum=new BigDecimal(traderPriceBean.getCarrierPrice());
			BigDecimal carrierTotalFreight =totalTonNum.multiply(carrierPriceNum);//总运费=总重量*单价；
			carrierTotalFreight=carrierTotalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(carrirTotalFreightNum.compareTo(carrierTotalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=carrierTotalFreight.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setCarrierFreight(freightAmount+"");
			}
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalCarrierFreight(carrierTotalFreight+"");
				freightBean.setTotalFreight(totalFreight+"");
			}
		}
		return ;
		
	}
	
	/**
	 * 计算承运商运价
	 * @param sapTransList
	 * @param totalActualTonNum
	 * @param transferBean
	 * @param shipBean
	 * @param shipDetailList
	 * @return
	 */
	private List<FreightBean>  calculateTraderFreight(TraderPriceBean traderPriceBean,List<SapTransferBean> sapTransList,BigDecimal  totalActualTonNum,TransferBean transferBean,ShipBean shipBean){
		List<FreightBean> freightList = new ArrayList<FreightBean>();
		if(traderPriceBean==null||sapTransList==null||sapTransList.isEmpty()){
			return null;
		}
		
		BigDecimal  totalTonNum=totalActualTonNum,priceNum=null,applyNum=null;//carrierPriceNum=null,carrierApplyNum=null,;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),specifyAmount=null;
		//carrirTotalFreightNum=new BigDecimal("0.00"),carrierFreightAmount=null
		FreightBean freightBean =null;
		SapTransferBean sapTransferBean = null;
		
		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=traderPriceBean.getFreightModel(),unit=traderPriceBean.getPriceUnit();
		unit=traderPriceBean.getPriceUnit();
		model=traderPriceBean.getFreightModel();
		List<FreightBean> feightList =new ArrayList<FreightBean>();
		for(int i=0,size=sapTransList.size();i<size;i++){
			sapTransferBean=sapTransList.get(i);			
			
			freightBean=new FreightBean();
			freightBean.setShipId(shipBean.getShipId()+"");
			freightBean.setTransferId(transferBean.getTransId()+"");
			freightBean.setSapCode(sapTransferBean.getTransferCode());
			freightBean.setItemCode(sapTransferBean.getItemCode());
			freightBean.setSubItemCode(sapTransferBean.getSubItemCode());
			freightBean.setAreaId(transferBean.getAreaId());
			freightBean.setRouteId(traderPriceBean.getRouteId()+"");
			freightBean.setFreightType("4");//按照贸易商运价计算
			
			freightBean.setValidateDate(traderPriceBean.getValidateDate());
			freightBean.setApplyTonNum(sapTransferBean.getApplyTonNum());
			freightBean.setFreightStyle(traderPriceBean.getPriceType()+"");//默认按吨计
			freightBean.setPriceId(traderPriceBean.getPriceId()+"");
			freightBean.setIsEstimate(sapTransferBean.isEstimate()?"1":"0");//设置是否预估运费
			
			
			if(allModel.equals(model)){//总价
				priceNum=new BigDecimal(traderPriceBean.getCustomerOnePrice());//此数目该用户该系统路的一口价为总价
				//carrierPriceNum=new BigDecimal(traderPriceBean.getCarrierOnePrice());//此数目承运商在该用户该系统路的一口价为总价
				applyNum=new BigDecimal(freightBean.getApplyTonNum());
				
				priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				//carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				freightBean.setTotalFreight(priceNum+"");
				//freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				
				freightBean.setFreightModel("总价");
				freightBean.setFreightPrice("");
				freightBean.setCarrierPrice("");
				
				freightAmount=priceNum.multiply(applyNum);
				freightAmount=freightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				/*carrierFreightAmount=carrierPriceNum.multiply(applyNum);
				carrierFreightAmount=carrierFreightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);*/
				
				totalFreightNum=totalFreightNum.add(freightAmount);
				log.info("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				//carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				//log.info("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
				freightBean.setFreightAmount(freightAmount+"");
				//freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			
			if(singleModel.equals(model)){//按单价计
				applyNum=new BigDecimal(freightBean.getApplyTonNum());//重量
				priceNum=new BigDecimal(traderPriceBean.getCustomerPrice());
				//carrierApplyNum=applyNum;
				//carrierPriceNum=new BigDecimal(traderPriceBean.getCarrierPrice());
				freightBean.setFreightModel("单价");
				freightBean.setFreightPrice(priceNum+"");
				//freightBean.setCarrierPrice(carrierPriceNum+"");
				if(TON.equals(unit)){//将按吨计转换成按公斤计算
					priceNum=priceNum.divide(new BigDecimal("1000.00"));
					//carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				}
				
				freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和
				//log.info("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				/*carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);*/
				
				freightBean.setFreightAmount(freightAmount+"");
				//freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			freightBean.setFreightTime(tools.tool.getDateTime());
			feightList.add(freightBean);
		}
		
		
		if(allModel.equals(model)){//总价抹尾
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			priceNum=new BigDecimal(traderPriceBean.getCustomerOnePrice());
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			
			if(priceNum.compareTo(totalFreightNum)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			
			/*carrierPriceNum=new BigDecimal(traderPriceBean.getCarrierOnePrice());
			carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(carrierPriceNum.compareTo(carrirTotalFreightNum)!=0){//承运商抹尾处理
				BigDecimal spanFreight=carrierPriceNum.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setCarrierFreight(freightAmount+"");
			}*/
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				//freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				freightBean.setTotalFreight(priceNum+"");
			}
		}
		
		if(singleModel.equals(model)){//按单价计
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			//priceNum=new BigDecimal(traderPriceBean.getCustomerPrice());
			BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			

			/*BigDecimal carrierTotalFreight =totalTonNum.multiply(carrierPriceNum);//总运费=总重量*单价；
			carrierTotalFreight=carrierTotalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(carrirTotalFreightNum.compareTo(carrierTotalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=carrierTotalFreight.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setCarrierFreight(freightAmount+"");
			}*/
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				//freightBean.setTotalCarrierFreight(carrierTotalFreight+"");
				freightBean.setTotalFreight(totalFreight+"");
			}
		}
		return feightList;
	}
	
	
	
	/**
	 * 按正常方式计算运费
	 * @param sapTransList
	 * @return
	 */
	private List<FreightBean> calculateNormalFreight(List<SapTransferBean> sapTransList,BigDecimal  totalActualTonNum,TransferBean transferBean,ShipBean shipBean,List<ShipDetailBean> shipDetailList){
		String productId, factoryId, areaId, tonAmount, applyTime;
		TransPriceBean priceBean=null;
		ShipDetailBean detailBean =null;
		SapTransferBean sapTransferBean=sapTransList.get(0);
		Map<String,TransPriceBean> priceMap = new HashMap<String,TransPriceBean>();
		for(int i=0,size=shipDetailList.size();i<size;i++){
			detailBean=shipDetailList.get(i);
			productId=detailBean.getProductId()+"";
			factoryId=detailBean.getFactoryId();
			areaId=transferBean.getAreaId();
			tonAmount=totalActualTonNum+"";
			//applyTime=detailBean.getCreateTime();
			applyTime=shipBean.getApproveTime();/*运费计算时间统一按内勤审批通过时间进行计算*/
			priceBean=PriceUtil.getRoutePrice(productId, factoryId, areaId, tonAmount, applyTime);
			if(priceBean==null){
				log.info("productId="+productId+",factoryId="+factoryId+",areaId="+areaId+",tonAmount="+tonAmount+",applyTime="+applyTime);
				log.info("priceBean==null,行项没有找到合适运价 001,sapTransferCode="+sapTransferBean.getTransferCode()+",itemCode="+detailBean.getItemCode());
				//return null;
				continue;
			}
			priceMap.put(detailBean.getItemCode(), priceBean);
		}
		
		
		
		BigDecimal  totalTonNum=new BigDecimal("0.00"),priceNum=null,carrierPriceNum=null,carrierApplyNum=null,applyNum=null;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),carrirTotalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),carrierFreightAmount=null;
		//Map<String,TransPriceBean> itemPriceMap = new HashMap<String,TransPriceBean>();
		List<FreightBean> feightList = new ArrayList<FreightBean>();
		FreightBean freightBean =null;
		int WEIGHT=6,type=0;//按重量计算字典ID
		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=null,unit=null;
		for(int i=0,size=sapTransList.size();i<size;i++){
			sapTransferBean=sapTransList.get(i);
			priceBean=priceMap.get(sapTransferBean.getItemCode());
			priceBean=priceBean==null?getPriceBean(priceMap):priceBean;/*当行项目不匹配时，从运价表中随机找一个进行运算*/
			if(priceBean==null){
				log.info("priceBean==null,行项没有找到合适运价 002,sapTransferCode="+sapTransferBean.getTransferCode()+",itemCode="+sapTransferBean.getItemCode());
				return null;
			}
			type=priceBean.getPriceType();
			if(WEIGHT!=type){
				log.info("priceBean ,不是按重计价 002,sapTransferCode="+sapTransferBean.getTransferCode()+",itemCode="+sapTransferBean.getItemCode());
				return null;
			}
			freightBean =new FreightBean();
			
			freightBean.setShipId(shipBean.getShipId()+"");
			freightBean.setTransferId(transferBean.getTransId()+"");
			freightBean.setSapCode(sapTransferBean.getTransferCode());
			freightBean.setItemCode(sapTransferBean.getItemCode());
			freightBean.setSubItemCode(sapTransferBean.getSubItemCode());
			freightBean.setAreaId(transferBean.getAreaId());
			freightBean.setRouteId(priceBean.getRouteId()+"");
			freightBean.setFreightType("1");//正常计费模式
			
			freightBean.setValidateDate(priceBean.getValidateDate());
			freightBean.setApplyTonNum(sapTransferBean.getApplyTonNum());
			freightBean.setFreightStyle(type+"");
			freightBean.setIsEstimate(sapTransferBean.isEstimate()?"1":"0");//设置是否预估运费
		
		
			freightBean.setPlanValidateDate(priceBean.getValidateDate());
			freightBean.setPlanFreightStyle(type+"");
			
			/*行项目重量*/
			applyNum=new BigDecimal(sapTransferBean.getApplyTonNum());			
			carrierApplyNum=applyNum;
			totalTonNum=totalTonNum.add(applyNum);
			
			model=priceBean.getFreightModel();
			if(allModel.equals(model)){//一口价
				priceNum=new BigDecimal(priceBean.getCustomerOnePrice());
				carrierPriceNum=new BigDecimal(priceBean.getCarrierOnePrice());				

				freightBean.setFreightModel("一口价");
				freightBean.setPlanFreightModel("一口价");
				freightBean.setFreightPrice("");
				freightBean.setCarrierPrice("");
				freightBean.setPlanFreightPrice("");
				freightBean.setPlanCarrierPrice("");
				
				freightAmount=priceNum.multiply(applyNum);//行项目运费=一口价
				freightAmount=freightAmount.divide(totalActualTonNum,2,BigDecimal.ROUND_HALF_UP);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);//保留两位上数
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);//行项目运费=一口价
				carrierFreightAmount=carrierFreightAmount.divide(totalActualTonNum,2,BigDecimal.ROUND_HALF_UP);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);//保留两位上数
			}
			
			if(singleModel.equals(model)){//单价
				priceNum=new BigDecimal(priceBean.getCustomerPrice());
				carrierPriceNum=new BigDecimal(priceBean.getCarrierPrice());
				
				freightBean.setFreightModel("单价");
				freightBean.setPlanFreightModel("单价");
				freightBean.setFreightPrice(priceNum+"");
				freightBean.setCarrierPrice(carrierPriceNum+"");
				freightBean.setPlanFreightPrice(priceNum+"");
				freightBean.setPlanCarrierPrice(carrierPriceNum+"");
				
				unit=priceBean.getPriceUnit();
				if(TON.equals(unit)){//将按吨计转换成按公斤计算
					priceNum=priceNum.divide(new BigDecimal("1000.00"));
					carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				}
				
				freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);//保留两位上数
				
				carrierFreightAmount=carrierApplyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);//保留两位上数
			}
			
			freightBean.setPriceId(priceBean.getPriceId()+"");
			freightBean.setPlanPriceId(priceBean.getPriceId()+"");
			
			freightBean.setFreightAmount(freightAmount+"");
			freightBean.setCarrierFreight(carrierFreightAmount+"");

			freightBean.setPlanFreight(freightAmount+"");
			freightBean.setPlanCarrierFreight(carrierFreightAmount+"");
			
			totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和	
			carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
			
			
			freightBean.setFreightTime(tools.tool.getDateTime());
		
			feightList.add(freightBean);			
		}
		if(singleModel.equals(model)){//单价抹尾处理
			BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(totalFreight.compareTo(totalFreightNum)!=0&&feightList.isEmpty()==false){//不相等，而需要进行抹尾处理
				freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setPlanFreight(freightAmount+"");
			}
			
			BigDecimal totalCarrierFreight =totalTonNum.multiply(carrierPriceNum);//承运商：总运费=总重量*单价；
			totalCarrierFreight=totalCarrierFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(totalCarrierFreight.compareTo(carrirTotalFreightNum)!=0&&feightList.isEmpty()==false){//不相等，而需要进行抹尾处理
				freightBean=feightList.get(feightList.size()-1);//对承运商：最后一个行项进行抹尾处理
				BigDecimal spanFreight=totalCarrierFreight.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				freightBean.setCarrierFreight(freightAmount+"");
				freightBean.setPlanCarrierFreight(freightAmount+"");
			}
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalFreight(totalFreight+"");
				freightBean.setPlanTotalFreight(totalFreight+"");
	
				freightBean.setTotalCarrierFreight(totalCarrierFreight+"");
				freightBean.setPlanTotalCarrierFreight(totalCarrierFreight+"");
			}
		}
		if(allModel.equals(model)){//一口价抹尾处理
			priceNum=new BigDecimal(priceBean.getCustomerOnePrice());
			carrierPriceNum=new BigDecimal(priceBean.getCarrierOnePrice());	
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(priceNum.compareTo(totalFreightNum)!=0&&feightList.isEmpty()==false){//不相等，而需要进行抹尾处理
				freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setPlanFreight(freightAmount+"");
			}
			
			if(carrierPriceNum.compareTo(carrirTotalFreightNum)!=0&&feightList.isEmpty()==false){//不相等，而需要进行抹尾处理
				freightBean=feightList.get(feightList.size()-1);//对承运商：最后一个行项进行抹尾处理
				BigDecimal spanFreight=carrierPriceNum.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				freightBean.setCarrierFreight(freightAmount+"");
				freightBean.setPlanCarrierFreight(freightAmount+"");
			}
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalFreight(priceNum+"");
				freightBean.setPlanTotalFreight(priceNum+"");
	
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				freightBean.setPlanTotalCarrierFreight(carrierPriceNum+"");
			}
			
		}
		return feightList;
	}
	
	
	/**
	 * 按调拨单计算运费
	 * 物流可能指定调拨单的运价或总体价格（一口价时为整个调拨单的运价）
	 * 如果是一口价，则按重量进行均摊；如果是单价，则对实际运费进行计算；
	 * feightList中的SAP调拨单号、行项目号和重量，通过正常运费计算，都已经实际的从SAP传递过来的
	 * @param sapTransList
	 * @return
	 */
	private void specifyTransferFreight(TransferPriceBean transPriceBean,List<FreightBean> feightList){
		if(transPriceBean==null||feightList==null||feightList.isEmpty()){
			return;
		}
		
		BigDecimal  totalTonNum=new BigDecimal("0.00"),priceNum=null,applyNum=null,carrierPriceNum=null,carrierApplyNum=null;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),carrirTotalFreightNum=new BigDecimal("0.00"),carrierFreightAmount=null,specifyAmount=null;
		FreightBean freightBean =null;
		for(int i=0,size=feightList.size();i<size;i++){//计算订单总重量
			freightBean=feightList.get(i);
			applyNum=new BigDecimal(freightBean.getApplyTonNum());
			totalTonNum=totalTonNum.add(applyNum);
		}
		//int WEIGHT=6,type=0;//按重量计算字典ID
		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=transPriceBean.getFreightModel(),unit=transPriceBean.getPriceUnit();
		unit=transPriceBean.getPriceUnit();
		model=transPriceBean.getFreightModel();
	
		for(int i=0,size=feightList.size();i<size;i++){
			freightBean=feightList.get(i);
			freightBean.setFreightType("3");//按特殊客户运价计算
			
			freightBean.setValidateDate(transPriceBean.getValidateDate());
			freightBean.setFreightStyle(transPriceBean.getPriceType()+"");//默认按吨计
			freightBean.setPriceId(transPriceBean.getPriceId()+"");
			
			if(allModel.equals(model)){//总价
				priceNum=new BigDecimal(transPriceBean.getCustomerOnePrice());//此数目该用户该系统路的一口价为总价
				carrierPriceNum=new BigDecimal(transPriceBean.getCarrierOnePrice());//此数目承运商在该用户该系统路的一口价为总价
				applyNum=new BigDecimal(freightBean.getApplyTonNum());
				
				priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				freightBean.setTotalFreight(priceNum+"");
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				
				freightBean.setFreightModel("总价");
				freightBean.setFreightPrice("");
				freightBean.setCarrierPrice("");
				
				//if(TON.equals(unit)){//将按吨计转换成按公斤计算
				//	priceNum=priceNum.divide(new BigDecimal("1000.00"));
				//	carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				//}
				
				freightAmount=priceNum.multiply(applyNum);
				freightAmount=freightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);
				carrierFreightAmount=carrierFreightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);log.info("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				//log.info("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			
			if(singleModel.equals(model)){//按单价计
				
				applyNum=new BigDecimal(freightBean.getApplyTonNum());//重量
				priceNum=new BigDecimal(transPriceBean.getCustomerPrice());
				//carrierApplyNum=applyNum;
				carrierPriceNum=new BigDecimal(transPriceBean.getCarrierPrice());
				freightBean.setFreightModel("单价");
				freightBean.setFreightPrice(priceNum+"");
				freightBean.setCarrierPrice(carrierPriceNum+"");
				if(TON.equals(unit)){//将按吨计转换成按公斤计算
					priceNum=priceNum.divide(new BigDecimal("1000.00"));
					carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				}
				
				freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和
				//log.info("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				//log.info("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
		}
		if(allModel.equals(model)){//总价抹尾
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			priceNum=new BigDecimal(transPriceBean.getCustomerOnePrice());
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(priceNum.compareTo(totalFreightNum)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			

			carrierPriceNum=new BigDecimal(transPriceBean.getCarrierOnePrice());
			carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(carrierPriceNum.compareTo(carrirTotalFreightNum)!=0){//承运商抹尾处理
				BigDecimal spanFreight=carrierPriceNum.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setCarrierFreight(freightAmount+"");
			}
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				freightBean.setTotalFreight(priceNum+"");
			}
		}
		
		if(singleModel.equals(model)){//按单价计
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			//删除此行，否则吨计算出的价格会乘以1000倍priceNum=new BigDecimal(transPriceBean.getCustomerPrice());
			BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			

			//删除此行，否则吨计算出的价格会乘以1000倍carrierPriceNum=new BigDecimal(transPriceBean.getCarrierPrice());
			BigDecimal carrierTotalFreight =totalTonNum.multiply(carrierPriceNum);//总运费=总重量*单价；
			carrierTotalFreight=carrierTotalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(carrirTotalFreightNum.compareTo(carrierTotalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=carrierTotalFreight.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setCarrierFreight(freightAmount+"");
			}
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalCarrierFreight(carrierTotalFreight+"");
				freightBean.setTotalFreight(totalFreight+"");
			}
		}
	}

	
	private List<FreightBean> specifyTransferFreight(TransferPriceBean transPriceBean,List<SapTransferBean> sapTransList,BigDecimal  totalActualTonNum,TransferBean transferBean,ShipBean shipBean){
		if(transPriceBean==null||sapTransList==null||sapTransList.isEmpty()){
			return null;
		}
		
		BigDecimal  totalTonNum=totalActualTonNum,priceNum=null,applyNum=null,carrierPriceNum=null,carrierApplyNum=null;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),carrirTotalFreightNum=new BigDecimal("0.00"),carrierFreightAmount=null,specifyAmount=null;
		FreightBean freightBean =null;
		
		//int WEIGHT=6,type=0;//按重量计算字典ID
		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=transPriceBean.getFreightModel(),unit=transPriceBean.getPriceUnit();
		unit=transPriceBean.getPriceUnit();
		model=transPriceBean.getFreightModel();
		List<FreightBean> feightList =new ArrayList<FreightBean>();
		SapTransferBean sapTransferBean = null;
		for(int i=0,size=sapTransList.size();i<size;i++){
			sapTransferBean=sapTransList.get(i);
			
			freightBean=new FreightBean();
			
			freightBean.setShipId(shipBean.getShipId()+"");
			freightBean.setTransferId(transferBean.getTransId()+"");
			freightBean.setSapCode(sapTransferBean.getTransferCode());
			freightBean.setItemCode(sapTransferBean.getItemCode());
			freightBean.setSubItemCode(sapTransferBean.getSubItemCode());
			freightBean.setAreaId(transferBean.getAreaId());
			//freightBean.setRouteId("");
			freightBean.setFreightType("3");//按特殊客户运价计算
			
			freightBean.setValidateDate(transPriceBean.getValidateDate());
			freightBean.setApplyTonNum(sapTransferBean.getApplyTonNum());
			freightBean.setFreightStyle(transPriceBean.getPriceType()+"");//默认按吨计
			freightBean.setPriceId(transPriceBean.getPriceId()+"");
			freightBean.setIsEstimate(sapTransferBean.isEstimate()?"1":"0");//设置是否预估运费
			
			freightBean.setCarrierPrice("0");
			//System.out.println("transPriceBean.getCarrierPrice()    "+transPriceBean.getCarrierPrice());
			if(transPriceBean.getCarrierPrice()!=null&&!transPriceBean.getCarrierPrice().equals("")){
				freightBean.setCarrierPrice(transPriceBean.getCarrierPrice());
			}
		
			
			if(allModel.equals(model)){//总价
				priceNum=new BigDecimal(transPriceBean.getCustomerOnePrice());//此数目该用户该系统路的一口价为总价
				carrierPriceNum=new BigDecimal(transPriceBean.getCarrierOnePrice());//此数目承运商在该用户该系统路的一口价为总价
				applyNum=new BigDecimal(freightBean.getApplyTonNum());
				
				priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				freightBean.setTotalFreight(priceNum+"");
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				
				freightBean.setFreightModel("总价");
				freightBean.setFreightPrice("");
				freightBean.setCarrierPrice("");
				
				//if(TON.equals(unit)){//将按吨计转换成按公斤计算
				//	priceNum=priceNum.divide(new BigDecimal("1000.00"));
				//	carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				//}
				
				freightAmount=priceNum.multiply(applyNum);
				freightAmount=freightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);
				carrierFreightAmount=carrierFreightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);
				log.info("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				//log.info("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			
			if(singleModel.equals(model)){//按单价计
				
				applyNum=new BigDecimal(freightBean.getApplyTonNum());//重量
				priceNum=new BigDecimal(transPriceBean.getCustomerPrice());
				//carrierApplyNum=applyNum;
				carrierPriceNum=new BigDecimal(transPriceBean.getCarrierPrice());
				freightBean.setFreightModel("单价");
				freightBean.setFreightPrice(priceNum+"");
				freightBean.setCarrierPrice(carrierPriceNum+"");
				if(TON.equals(unit)){//将按吨计转换成按公斤计算
					priceNum=priceNum.divide(new BigDecimal("1000.00"));
					carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				}
				
				freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和

				freightBean.setFreightAmount(freightAmount+"");
				
				carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				//log.info("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			freightBean.setFreightTime(tools.tool.getDateTime());
			feightList.add(freightBean);
		}
		if(allModel.equals(model)){//总价抹尾
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			priceNum=new BigDecimal(transPriceBean.getCustomerOnePrice());
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(priceNum.compareTo(totalFreightNum)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				freightBean.setTotalFreight(priceNum+"");
			}
		}
		
		if(singleModel.equals(model)){//按单价计
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			//删除此行，否则吨计算出的价格会乘以1000倍  priceNum=new BigDecimal(transPriceBean.getCustomerPrice());
			BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			
			//删除此行，否则吨计算出的价格会乘以1000倍  carrierPriceNum=new BigDecimal(transPriceBean.getCarrierPrice());
			BigDecimal carrierTotalFreight =totalTonNum.multiply(carrierPriceNum);//总运费=总重量*单价；
			carrierTotalFreight=carrierTotalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			if(carrirTotalFreightNum.compareTo(carrierTotalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=carrierTotalFreight.subtract(carrirTotalFreightNum);
				
				//System.out.println("freightBean.getCarrierFreight()   "+freightBean.getCarrierFreight());
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setCarrierFreight(freightAmount+"");
			}
			
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalCarrierFreight(carrierTotalFreight+"");
				freightBean.setTotalFreight(totalFreight+"");
			}
		}
		return feightList;
	}
	
	/**
	 * 按特殊客户运价计算运费
	 * @param sapTransList
	 * @return
	 */
	
	private void specialCustomerFreight(CustomerPriceBean customerPriceBean,List<FreightBean> feightList){
		if(customerPriceBean==null||feightList==null||feightList.isEmpty()){
			log.info("无法按正常方式进行运费计算，请查检线路及运价。customerPriceBean is  null || freightList==null||freightList.isEmpty()  ");
			return;
		}
		
		BigDecimal  totalTonNum=new BigDecimal("0.00"),priceNum=null,carrierPriceNum=null,carrierApplyNum=null,applyNum=null;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),carrirTotalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),carrierFreightAmount=null,specifyAmount=null;
		FreightBean freightBean =null;
		for(int i=0,size=feightList.size();i<size;i++){//计算订单总重量
			freightBean=feightList.get(i);
			applyNum=new BigDecimal(freightBean.getApplyTonNum());
			totalTonNum=totalTonNum.add(applyNum);
		}
		//int WEIGHT=6,type=0;//按重量计算字典ID
		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=customerPriceBean.getFreightModel(),unit=customerPriceBean.getPriceUnit();
		unit=customerPriceBean.getPriceUnit();
		model=customerPriceBean.getFreightModel();
	
		for(int i=0,size=feightList.size();i<size;i++){
			freightBean=feightList.get(i);
			freightBean.setFreightType("2");//按特殊客户运价计算
			
			freightBean.setValidateDate(customerPriceBean.getValidateDate());
			freightBean.setFreightStyle(customerPriceBean.getPriceType()+"");//默认按吨计
			freightBean.setPriceId(customerPriceBean.getPriceId()+"");
			
			if(allModel.equals(model)){//总价
				priceNum=new BigDecimal(customerPriceBean.getCustomerOnePrice());//此数目该用户该系统路的一口价为总价
				carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierOnePrice());//此数目承运商在该用户该系统路的一口价为总价
				applyNum=new BigDecimal(freightBean.getApplyTonNum());
				
				priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				freightBean.setTotalFreight(priceNum+"");
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				
				freightBean.setFreightModel("总价");
				freightBean.setFreightPrice("");
				freightBean.setCarrierPrice("");
				
				//if(TON.equals(unit)){//将按吨计转换成按公斤计算
				//	priceNum=priceNum.divide(new BigDecimal("1000.00"));
				//	carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				//}
				
				freightAmount=priceNum.multiply(applyNum);
				freightAmount=freightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);
				carrierFreightAmount=carrierFreightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);log.info("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				log.info("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			
			if(singleModel.equals(model)){//按单价计
				
				applyNum=new BigDecimal(freightBean.getApplyTonNum());//重量
				priceNum=new BigDecimal(customerPriceBean.getCustomerPrice());
				carrierApplyNum=applyNum;
				carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierPrice());
				freightBean.setFreightModel("单价");
				freightBean.setFreightPrice(priceNum+"");
				freightBean.setCarrierPrice(carrierPriceNum+"");
				if(TON.equals(unit)){//将按吨计转换成按公斤计算
					priceNum=priceNum.divide(new BigDecimal("1000.00"));
					carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				}
				
				freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和
				//log.info("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				//log.info("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
		}
		if(allModel.equals(model)){//总价抹尾
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			priceNum=new BigDecimal(customerPriceBean.getCustomerOnePrice());
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			
			if(priceNum.compareTo(totalFreightNum)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			
			carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierOnePrice());
			carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(carrierPriceNum.compareTo(carrirTotalFreightNum)!=0){//承运商抹尾处理
				BigDecimal spanFreight=carrierPriceNum.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setCarrierFreight(freightAmount+"");
			}
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				freightBean.setTotalFreight(priceNum+"");
			}
		}
		
		if(singleModel.equals(model)){//按单价计
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			//priceNum=new BigDecimal(customerPriceBean.getCustomerPrice());
			BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			

			//carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierPrice());
			BigDecimal carrierTotalFreight =totalTonNum.multiply(carrierPriceNum);//总运费=总重量*单价；
			carrierTotalFreight=carrierTotalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(carrirTotalFreightNum.compareTo(carrierTotalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=carrierTotalFreight.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setCarrierFreight(freightAmount+"");
			}
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalCarrierFreight(carrierTotalFreight+"");
				freightBean.setTotalFreight(totalFreight+"");
			}
		}
		return ;
	}
	
	
	
	private List<FreightBean> specialCustomerFreight(CustomerPriceBean customerPriceBean,List<SapTransferBean> sapTransList,BigDecimal  totalActualTonNum,TransferBean transferBean,ShipBean shipBean){
		if(customerPriceBean==null||sapTransList==null||sapTransList.isEmpty()){
			return null;
		}
		
		BigDecimal  totalTonNum=totalActualTonNum,priceNum=null,carrierPriceNum=null,carrierApplyNum=null,applyNum=null;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),carrirTotalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),carrierFreightAmount=null,specifyAmount=null;
		FreightBean freightBean =null;
		SapTransferBean sapTransferBean = null;
		
		//int WEIGHT=6,type=0;//按重量计算字典ID
		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=customerPriceBean.getFreightModel(),unit=customerPriceBean.getPriceUnit();
		unit=customerPriceBean.getPriceUnit();
		model=customerPriceBean.getFreightModel();
		List<FreightBean> feightList =new ArrayList<FreightBean>();
		for(int i=0,size=sapTransList.size();i<size;i++){
			sapTransferBean=sapTransList.get(i);			
			
			freightBean=new FreightBean();
			freightBean.setShipId(shipBean.getShipId()+"");
			freightBean.setTransferId(transferBean.getTransId()+"");
			freightBean.setSapCode(sapTransferBean.getTransferCode());
			freightBean.setItemCode(sapTransferBean.getItemCode());
			freightBean.setSubItemCode(sapTransferBean.getSubItemCode());
			freightBean.setAreaId(transferBean.getAreaId());
			freightBean.setRouteId(customerPriceBean.getRouteId()+"");
			freightBean.setFreightType("2");//按特殊客户运价计算
			
			freightBean.setValidateDate(customerPriceBean.getValidateDate());
			freightBean.setApplyTonNum(sapTransferBean.getApplyTonNum());
			freightBean.setFreightStyle(customerPriceBean.getPriceType()+"");//默认按吨计
			freightBean.setPriceId(customerPriceBean.getPriceId()+"");
			freightBean.setIsEstimate(sapTransferBean.isEstimate()?"1":"0");//设置是否预估运费
			
			
			if(allModel.equals(model)){//总价
				priceNum=new BigDecimal(customerPriceBean.getCustomerOnePrice());//此数目该用户该系统路的一口价为总价
				carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierOnePrice());//此数目承运商在该用户该系统路的一口价为总价
				applyNum=new BigDecimal(freightBean.getApplyTonNum());
				
				priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				freightBean.setTotalFreight(priceNum+"");
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				
				freightBean.setFreightModel("总价");
				freightBean.setFreightPrice("");
				freightBean.setCarrierPrice("");
				
				//if(TON.equals(unit)){//将按吨计转换成按公斤计算
				//	priceNum=priceNum.divide(new BigDecimal("1000.00"));
				//	carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				//}
				
				freightAmount=priceNum.multiply(applyNum);
				freightAmount=freightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);
				carrierFreightAmount=carrierFreightAmount.divide(totalTonNum,2,BigDecimal.ROUND_HALF_UP);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);log.info("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				log.info("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			
			if(singleModel.equals(model)){//按单价计
				applyNum=new BigDecimal(freightBean.getApplyTonNum());//重量
				priceNum=new BigDecimal(customerPriceBean.getCustomerPrice());
				carrierApplyNum=applyNum;
				carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierPrice());
				freightBean.setFreightModel("单价");
				freightBean.setFreightPrice(priceNum+"");
				freightBean.setCarrierPrice(carrierPriceNum+"");
				if(TON.equals(unit)){//将按吨计转换成按公斤计算
					priceNum=priceNum.divide(new BigDecimal("1000.00"));
					carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				}
				
				freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和
				//log.info("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				//log.info("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			freightBean.setFreightTime(tools.tool.getDateTime());
			feightList.add(freightBean);
		}
		
		
		if(allModel.equals(model)){//总价抹尾
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			priceNum=new BigDecimal(customerPriceBean.getCustomerOnePrice());
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			
			if(priceNum.compareTo(totalFreightNum)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			
			carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierOnePrice());
			carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(carrierPriceNum.compareTo(carrirTotalFreightNum)!=0){//承运商抹尾处理
				BigDecimal spanFreight=carrierPriceNum.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setCarrierFreight(freightAmount+"");
			}
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				freightBean.setTotalFreight(priceNum+"");
			}
		}
		
		if(singleModel.equals(model)){//按单价计
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			//priceNum=new BigDecimal(customerPriceBean.getCustomerPrice());
			BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			

			//carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierPrice());
			BigDecimal carrierTotalFreight =totalTonNum.multiply(carrierPriceNum);//总运费=总重量*单价；
			carrierTotalFreight=carrierTotalFreight.setScale(2,BigDecimal.ROUND_HALF_UP);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_HALF_UP);
			if(carrirTotalFreightNum.compareTo(carrierTotalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=carrierTotalFreight.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setCarrierFreight(freightAmount+"");
			}
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalCarrierFreight(carrierTotalFreight+"");
				freightBean.setTotalFreight(totalFreight+"");
			}
		}
		return feightList;
	}

	
	private void saveFreight(List<FreightBean> freightList){
		if(freightList==null||freightList.isEmpty()){
			return;
		}
		int size = freightList.size();
		String[] freightId=new String[size],shipId=new String[size],transferId=new String[size],sapCode=new String[size],itemCode=new String[size],freightType=new String[size],freightStyle=new String[size],freightModel=new String[size],
		validateDate=new String[size],applyTonNum=new String[size],freightPrice=new String[size],freightAmount=new String[size],priceId=new String[size],carrierPrice=new String[size],carrierFreight=new String[size],totalFreight=new String[size],totalCarrierFreight=new String[size],
		planFreightStyle=new String[size],planFreightModel=new String[size],planValidateDate=new String[size],planFreightPrice=new String[size],planPriceId=new String[size],planFreight=new String[size],
		planTotalFreight=new String[size],planTotalCarrierFreight=new String[size],favourFreight=new String[size],planCarrierPrice=new String[size],planCarrierFreight=new String[size],freightBalance=new String[size],freightTime=new String[size],
		isEstimate=new String[size],areaId=new String[size],routeId=new String[size],subItemCode=new String[size];
		FreightBean freightBean=null;
		for(int i=0;i<size;i++){
			freightBean=freightList.get(i);
			shipId              [i]=freightBean.getShipId();
			transferId          [i]=freightBean.getTransferId();
			sapCode             [i]=freightBean.getSapCode();
			itemCode            [i]=freightBean.getItemCode();
			subItemCode[i]=freightBean.getSubItemCode();
			freightType         [i]=freightBean.getFreightType();
			freightStyle        [i]=freightBean.getFreightStyle();
			freightModel        [i]=freightBean.getFreightModel();
			validateDate        [i]=freightBean.getValidateDate();
			applyTonNum         [i]=freightBean.getApplyTonNum();
			freightPrice        [i]=freightBean.getFreightPrice();
			freightAmount       [i]=freightBean.getFreightAmount();
			priceId             [i]=freightBean.getPriceId();
			carrierPrice        [i]=freightBean.getCarrierPrice();
			carrierFreight      [i]=freightBean.getCarrierFreight();
			totalFreight        [i]=freightBean.getTotalFreight();
			totalCarrierFreight [i]=freightBean.getTotalCarrierFreight();
			planFreightStyle    [i]=freightBean.getPlanFreightStyle();
			planFreightModel    [i]=freightBean.getPlanFreightModel();
			planValidateDate    [i]=freightBean.getPlanValidateDate();
			planFreightPrice    [i]=freightBean.getPlanFreightPrice();
			planPriceId         [i]=freightBean.getPlanPriceId();
			planFreight         [i]=freightBean.getPlanFreight();
			planTotalFreight    [i]=freightBean.getPlanTotalFreight();
			favourFreight       [i]=freightBean.getFavourFreight();
			planCarrierPrice    [i]=freightBean.getPlanCarrierPrice();
			planCarrierFreight  [i]=freightBean.getPlanCarrierFreight();
			freightBalance      [i]=freightBean.getFreightBalance();
			freightTime         [i]=freightBean.getFreightTime();
			planTotalCarrierFreight[i]=freightBean.getPlanTotalCarrierFreight();
			isEstimate[i]=freightBean.getIsEstimate();
			areaId[i]=freightBean.getAreaId();
			routeId[i]=freightBean.getRouteId();
		}
		Map parameters =  new HashMap();
		parameters.put("shipId",shipId);
		parameters.put("transferId",transferId);
		parameters.put("sapCode",sapCode);
		parameters.put("itemCode",itemCode);
		parameters.put("subItemCode",subItemCode);
		parameters.put("freightType",freightType);
		parameters.put("freightStyle",freightStyle);
		parameters.put("freightModel",freightModel);
		parameters.put("validateDate",validateDate);
		parameters.put("applyTonNum",applyTonNum);
		parameters.put("freightPrice",freightPrice);
		parameters.put("freightAmount",freightAmount);
		parameters.put("priceId",priceId);
		parameters.put("carrierPrice",carrierPrice);
		parameters.put("carrierFreight",carrierFreight);
		parameters.put("totalFreight",totalFreight);
		parameters.put("totalCarrierFreight",totalCarrierFreight);
		parameters.put("planFreightStyle",planFreightStyle);
		parameters.put("planFreightModel",planFreightModel);
		parameters.put("planValidateDate",planValidateDate);
		parameters.put("planFreightPrice",planFreightPrice);
		parameters.put("planPriceId",planPriceId);
		parameters.put("planFreight",planFreight);
		parameters.put("planTotalFreight",planTotalFreight);
		parameters.put("planTotalCarrierFreight",planTotalCarrierFreight);
		parameters.put("favourFreight",favourFreight);
		parameters.put("planCarrierPrice",planCarrierPrice);
		parameters.put("planCarrierFreight",planCarrierFreight);
		parameters.put("freightBalance",freightBalance);
		parameters.put("freightTime",freightTime);
		parameters.put("isEstimate",isEstimate);
		parameters.put("areaId",areaId);
		parameters.put("routeId",routeId);

		OperationBean operationBean = OperationConfigRepository.getOperationConfig("saveFreightInfo");
		
		ResultBean resultBean = this.dbOperator(operationBean,parameters, false);
		tools.tool.clear(parameters);
		parameters=null;
		if(resultBean==null|resultBean.isSuccess()==false){
			//return getResult("E","E004","。sapTransCode="+sapTransCode,true);
			log.info("保存运费结果不成功,resultBean==null|resultBean.isSuccess()==false");
		}
	}
	
	public String menualCalculateFreight(String sapTransferCode){
		if(sapTransferCode==null||"".equals(sapTransferCode.trim())){
			SyncLogger.log("menualCalculateFreight  001","调拨单号为空，无法手工计算运费。");
			return "调拨单号为空，无法手工计算运费。";
		}
		
		
    	SapFreightSynker	synker= new SapFreightSynker();
    	List<SapTransferBean> 	sapTransList=synker.getTransferInfo(sapTransferCode);     
    	if(sapTransList==null||sapTransList.isEmpty()){
    		SyncLogger.log("menualCalculateFreight  002","sapTransList==null||sapTransList.isEmpty() 调拨单行项信息为空，无法手工计算运费。");
			return "调拨单行项信息为空，无法手工计算运费。";
    	}
    	
    	//HtmsFreightBusiness freightBusiness = new HtmsFreightBusiness();
    	List<FreightBean> freightList =this.getFreight(sapTransList);
    	if(freightList==null||freightList.isEmpty()){
    		SyncLogger.log("menualCalculateFreight  003","freightList==null||freightList.isEmpty() 调拨单运费计算结果为空，无法手工计算运费。");
			return "调拨单运费计算结果为空，无法手工计算运费。";
    	}
    	
    	synker= new SapFreightSynker();
    	 Map<String,String> resultMap=synker.writeFreight(freightList);
    	 if(resultMap==null||resultMap.isEmpty()){
    		 SyncLogger.log("menualCalculateFreight  004","resultMap==null||resultMap.isEmpty() 写回运费计算结果不成功，手工计算运费失败。");
    		 return "写回运费计算结果不成功，手工计算运费失败。";
    	 }else{
    		 SyncLogger.log("menualCalculateFreight  005","写回运费计算结果成功，手工计算运费完成。");
    		 return "";
    	 }
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		HtmsFreightBusiness freightBusiness = new HtmsFreightBusiness();
		//freightBusiness.saveWrongFreight("0081384970");
		/*XmlBuffer stockBuffer = new XmlBuffer();
		stockBuffer.rootStart();
		 stockBuffer.start("system").newLine();
		 stockBuffer.element("code", "SAP").newLine();//状态,S=成功
		 stockBuffer.element("account", "sap").newLine();//编码
		 stockBuffer.element("passwd", "123456").newLine();//消息
		 stockBuffer.end("system").newLine();


		 stockBuffer.start("DELIVERY_INFO").newLine();
		 stockBuffer.element("VBELN", "0081384970").newLine();//交货单号
		 stockBuffer.element("POSNR", "000010").newLine();//行项目号
		 stockBuffer.element("MATNR", "DTY").newLine();//物料号
		 stockBuffer.element("LFIMG", "7211.7").newLine();//数量
		 stockBuffer.element("MEINS", "KG").newLine();//单位
		 stockBuffer.element("ESIMT", "FALSE").newLine();//是否预估
		 stockBuffer.end("DELIVERY_INFO").newLine();
		 
		 stockBuffer.start("DELIVERY_INFO").newLine();
		 stockBuffer.element("VBELN", "0081384970").newLine();//交货单号
		 stockBuffer.element("POSNR", "000020").newLine();//行项目号
		 stockBuffer.element("MATNR", "DTY").newLine();//物料号
		 stockBuffer.element("LFIMG", "10833.6").newLine();//数量
		 stockBuffer.element("MEINS", "KG").newLine();//单位
		 stockBuffer.element("ESIMT", "FALSE").newLine();//是否预估
		 stockBuffer.end("DELIVERY_INFO").newLine();
		stockBuffer.rootEnd();
		log.info("-------------------- pxml -----------------------");
		log.info(stockBuffer);
		log.info("-------------------- pxml -----------------------");*/

		List<SapTransferBean> sapTransList=new ArrayList<SapTransferBean>();
		SapTransferBean transBean = new SapTransferBean();
		
		/* productId=2,factoryId=1,areaId=341,tonAmount=212.00,applyTime=2017-09-25 09:49:33
priceBean==null,行项没有找到合适运价 001,sapTransferCode=0080001574,itemCode=000010
无法按正常方式进行运费计算，请查检线路及运价。freightList==null||freightList.isEmpty()*/
//Stirng productId=2,factoryId=1,areaId=341,customerId=3203,applyTime=2017-09-25 09:49:33
		 
		
		
		//   0080001870    0080001864
		transBean.setTransferCode("0080001944");
		transBean.setItemCode("000010");
		transBean.setApplyTonNum("2250");
		transBean.setEstimate("false");
		
	
		sapTransList.add(transBean);
		
		freightBusiness.getFreight(sapTransList);
		//stockBusiness.getTransferHoldStock(stockBuffer.toString());
		//freightBusiness.getFreight(stockBuffer.toString());
	}
	
	
	public void saveWrongFreight(String sapCode){
		if(this.isNull(sapCode)){
			return;
		}
		Map parameters =  new HashMap();
		parameters.put("sapCode",new String[]{sapCode});
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("saveWrongFreight");
		
		ResultBean resultBean = this.dbOperator(operationBean,parameters, false);
		tools.tool.clear(parameters);
		parameters=null;
		if(resultBean==null|resultBean.isSuccess()==false){
			//return getResult("E","E004","。sapTransCode="+sapTransCode,true);
			log.info("保存出错SAP单号不成功,resultBean==null|resultBean.isSuccess()==false,sapCode="+sapCode);
		}
	}
	

}
