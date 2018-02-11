package com.zzy.htms.services.business;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.dictionary.traderprice.TraderPriceBean;
import com.zzy.htms.dictionary.transprice.TransPriceBean;
import com.zzy.htms.logistic.freight.PriceUtil;
import com.zzy.htms.logistic.transferprice.TransferPriceBean;
import com.zzy.htms.sales.customer.CustomerBean;
import com.zzy.htms.sales.customerprice.CustomerPriceBean;


/**
 * 预估运费实现类
 * @author zzy
 *
 */
public class HtmsEstimateFreightBusiness  extends HtmsServiceBusiness {

	/**
	 * 记录预估运费日志
	 * @param estimateParamsList
	 * @return
	 */
	public List<FreightBean> getEstimateFreight(List<EstimateFreightBean> estimateParamsList){
		return getEstimateFreight(estimateParamsList,true);
	}
	
	
	/**获取预估运费
	 * 
	 * @param estimateParamsList
	 * @param toDataBase  是否记录日志到数据库
	 * @return
	 */
    public List<FreightBean> getEstimateFreight(List<EstimateFreightBean> estimateParamsList,boolean toDataBase){
		
		if(estimateParamsList==null||estimateParamsList.isEmpty()){
			log.info("estimateParamsList==null||estimateParamsList.isEmpty()");
			return null;
		}
		
		/*从数据库加载计算运费所需要的信息*/
		//SapTransferBean sapTransBean = sapTransList.get(0);
	
		BigDecimal  totalAplyTonNum=new BigDecimal("0.00"),detailTonNum=null;
		//ShipDetailBean detailBean =null;
		String applyTonNum = null;
		//Map<String,ShipDetailBean> detailMap = new HashMap<String,ShipDetailBean>();
		
		boolean selfFetch = false ;
		String selfFetchType ="1";
		String customerCode="";
		
		
		/*获取申请单的总重量*/
		EstimateFreightBean estimateBean=null;
		for(int i=0,size=estimateParamsList.size();i<size;i++){
			estimateBean=estimateParamsList.get(i);
			applyTonNum = estimateBean.getApplyTonNum();
			applyTonNum=applyTonNum==null?"0.00":applyTonNum;
			detailTonNum=new BigDecimal(applyTonNum);
			
			totalAplyTonNum=totalAplyTonNum.add(detailTonNum);
			
			selfFetch=estimateBean.isSelfFetch();
			selfFetchType = estimateBean.getSelfFetchType();
			customerCode = estimateBean.getCustomerCode();
		}
		
		//贸易商运费计算
		if(selfFetch&&"1".equals(selfFetchType)){
			List<FreightBean> freightList=null;
			//log.info("parameters: producted:"+shipDetailBean.getProductId()+" factoryid:"+ shipDetailBean.getFactoryId()+" areaId:"+ transferBean.getAreaId()+" totalApplyNum:"+ totalActualTonNum+"  shipbean createtime:"+ shipBean.getCreateTime());
			   
			EstimateFreightBean  estimateFreightBean= new EstimateFreightBean();
			estimateFreightBean = estimateParamsList.get(0);
			
			TraderPriceBean traderPriceBean=PriceUtil.getTraderPrice(estimateFreightBean.getProductId()+"", estimateFreightBean.getFactoryId(), estimateFreightBean.getAreaId(), totalAplyTonNum, estimateFreightBean.getApplyTime());
			if(traderPriceBean!=null&&traderPriceBean.getPriceId()>0){
				log.info("获取的承运商运价为  priceid:"+traderPriceBean.getPriceId()+"  validateDate:"+traderPriceBean.getValidateDate()+"  price:"+traderPriceBean.getCustomerPrice());
			}
			if(traderPriceBean!=null){
				freightList=this.calculateTraderFreight(traderPriceBean, estimateParamsList, totalAplyTonNum);
			}
			if(freightList!=null&&freightList.size()>0){
				this.saveFreight(freightList);
			}else{
				log.info("调用计算承运商运费功能出错,未计算出对应的运费  freightList=0 ");
			}
			return freightList;
		}
		//自备车自提运费计算
		if(selfFetch&&"2".equals(selfFetchType)){
			List<FreightBean> freightList=null;
			Map parameters =  new HashMap();
			parameters.put("customerCode", customerCode);
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("getCustemerSelfFetchFreight");
			ResultBean resultBean = this.dbOperator(operationBean,parameters, false);
			CustomerBean   customerBean =(CustomerBean)resultBean.getListFirstResult("customerBean");
			if(customerBean!=null&&customerBean.getManagementFee()!=null){
				log.info("获取的自提车管理费用为  priceid:"+customerBean.getFeeId()+"  price:"+customerBean.getManagementFee());
				freightList=this.calculateCustomerSelfFetchFreight(customerBean, estimateParamsList,  totalAplyTonNum);
			}else{
				log.info("获取的自提车管理费用为空");
			}
			return freightList;
		}
		
		/**
		 * 按正常方式进行运费计算
		 */
		List<FreightBean> freightList =this.calculateNormalFreight(estimateParamsList,totalAplyTonNum);
		/*if(freightList==null||freightList.isEmpty()){
			log.info("无法按正常方式进行运费估算，请查检线路及运价。freightList==null||freightList.isEmpty()");
		}*/
		EstimateFreightBean estimateFreightBean = estimateParamsList.get(0);
		
		//正常运费计算，freightType=1
		CustomerPriceBean customerPriceBean=PriceUtil.getCustomerPrice(estimateFreightBean.getProductId(), estimateFreightBean.getFactoryId(), estimateFreightBean.getAreaId(), estimateFreightBean.getCustomerId(),totalAplyTonNum, estimateFreightBean.getApplyTime());
		
		/*特殊客户运价计算，会对上一步的计算结果进行覆盖,优先第二，freightType=2*/
		if(customerPriceBean!=null){
			//this.specialCustomerFreight(customerPriceBean, freightList);
			if(freightList==null||freightList.isEmpty()){
				freightList=this.specialCustomerFreight(customerPriceBean, estimateParamsList, totalAplyTonNum);
			}else{
				this.specialCustomerFreight(customerPriceBean, freightList);
			}
		}
		
		log.info("++++++++++++++++++++++++++++++++++++++++++++++++estimateFreightBean.getTranferId():"+estimateFreightBean.getTranferId());
		/*到了申请单物流环节了,如果中外指定运价，可能会预估不一样*/
		if(estimateFreightBean.getTranferId()!=null&&!"".equals(estimateFreightBean.getTranferId())){
			Map parameters =  new HashMap();
			parameters.put("transId", new String[]{estimateFreightBean.getTranferId()});
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("getTransPriceBean");
			ResultBean resultBean = this.dbOperator(operationBean,parameters, false);
			if(resultBean!=null&&resultBean.isSuccess()==true){
				TransferPriceBean transPriceBean =(TransferPriceBean)resultBean.getListFirstResult("transPriceBean");
				/*按物流指定运价计算，会对上一步的计算结果进行覆盖,优先最高，freightType=3*/
				log.info("++++++++++++++++++++++++++++++++++++++++++++++++transPriceBean:"+transPriceBean);
				if(transPriceBean!=null){
					//this.specifyTransferFreight(transPriceBean, freightList);
					if(freightList==null||freightList.isEmpty()){
						freightList=this.specifyTransferFreight(transPriceBean, estimateParamsList, totalAplyTonNum);
					}else{
						this.specifyTransferFreight(transPriceBean, freightList);
					}
				}
			}
			
		}

		/*将运算结果保存到数据中，并且组装返回 结果，或写回到SAP中去。
		 * 
		 */
		if(toDataBase){
			this.saveFreight(freightList);
		}	
		return freightList;
	}
	
	
	
	
	
	
	
	
	public void saveEstimateFreight(List<FreightBean> freightList){
		this.saveFreight(freightList);
	}
	
	
	/**
	 * 按正常方式计算运费
	 * @param sapTransList
	 * @return
	 */
	private List<FreightBean> calculateNormalFreight(List<EstimateFreightBean> estimateParamsList,BigDecimal  totalAplyTonNum){
			
		/*获取申请单的总重量*/
		EstimateFreightBean estimateBean=null;

		String productId, factoryId, areaId, tonAmount, applyTime;
		TransPriceBean priceBean=null;
		
		Map<String,TransPriceBean> priceMap = new HashMap<String,TransPriceBean>();
		for(int i=0,size=estimateParamsList.size();i<size;i++){
			estimateBean=estimateParamsList.get(i);
			productId=estimateBean.getProductId();
			factoryId=estimateBean.getFactoryId();
			areaId=estimateBean.getAreaId();
			tonAmount=totalAplyTonNum+"";
			applyTime=estimateBean.getApplyTime();
			priceBean=PriceUtil.getRoutePrice(productId, factoryId, areaId, tonAmount, applyTime);
			if(priceBean==null){
				log.info("productId="+productId+",factoryId="+factoryId+",areaId="+areaId+",tonAmount="+tonAmount+",applyTime="+applyTime);
				log.info("priceBean==null,行项没有找到合适运价 001,getOrderCode="+estimateBean.getOrderCode()+",itemCode="+estimateBean.getItemCode());
				return null;
			}
			priceMap.put(estimateBean.getItemCode(), priceBean);
		}
		
		BigDecimal  totalTonNum=new BigDecimal("0.00"),priceNum=null,carrierPriceNum=null,carrierApplyNum=null,applyNum=null;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),carrirTotalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),carrierFreightAmount=null;
		List<FreightBean> feightList = new ArrayList<FreightBean>();
		FreightBean freightBean =null;
		int WEIGHT=6,type=0;//按重量计算字典ID
		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=null,unit=null;
		for(int i=0,size=estimateParamsList.size();i<size;i++){
			estimateBean=estimateParamsList.get(i);
			priceBean=priceMap.get(estimateBean.getItemCode());
			if(priceBean==null){
				log.info("priceBean==null,行项没有找到合适运价 001,getOrderCode="+estimateBean.getOrderCode()+",itemCode="+estimateBean.getItemCode());
				return null;
			}
			type=priceBean.getPriceType();
			if(WEIGHT!=type){
				log.info("WEIGHT!=type,行项没有找到合适运价 001,getOrderCode="+estimateBean.getOrderCode()+",itemCode="+estimateBean.getItemCode());
				return null;
			}
			freightBean =new FreightBean();
			freightBean.setFreightType("1");//正常估价
			freightBean.setFreightStyle(type+"");
			freightBean.setOrderId(estimateBean.getOrderId());
			freightBean.setOrderCode(estimateBean.getOrderCode());
			freightBean.setItemId(estimateBean.getItemId());
			freightBean.setItemCode(estimateBean.getItemCode());
			freightBean.setShipId(estimateBean.getShipId());
			freightBean.setTransferId(estimateBean.getTranferId());
			freightBean.setUserId(estimateBean.getUserId());
			freightBean.setAreaId(estimateBean.getAreaId());
			freightBean.setRouteId(priceBean.getRouteId()+"");
			freightBean.setCustomerId(estimateBean.getCustomerId());
			freightBean.setEstimateStep(estimateBean.getEstimateStep());
			
			freightBean.setValidateDate(priceBean.getValidateDate());
			freightBean.setApplyTonNum(estimateBean.getApplyTonNum());
			
			applyNum=new BigDecimal(estimateBean.getApplyTonNum());			
			carrierApplyNum=applyNum;
			totalTonNum=totalTonNum.add(applyNum);
			
			model=priceBean.getFreightModel();
			if(allModel.equals(model)){//一口价
				priceNum=new BigDecimal(priceBean.getCustomerOnePrice());
				carrierPriceNum=new BigDecimal(priceBean.getCarrierOnePrice());
				freightBean.setFreightModel("一口价");
				freightBean.setFreightPrice("");
				freightBean.setCarrierPrice("");
				
				freightAmount=priceNum.multiply(applyNum);//行项目运费=一口价
				freightAmount=freightAmount.divide(totalAplyTonNum,2,BigDecimal.ROUND_DOWN);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);//保留两位上数
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);//行项目运费=一口价
				carrierFreightAmount=carrierFreightAmount.divide(totalAplyTonNum,2,BigDecimal.ROUND_DOWN);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);//保留两位上数
			}
			
			if(singleModel.equals(model)){//单价
				priceNum=new BigDecimal(priceBean.getCustomerPrice());
				carrierPriceNum=new BigDecimal(priceBean.getCarrierPrice());
				freightBean.setFreightModel("单价");
				freightBean.setFreightPrice(priceNum+"");
				freightBean.setCarrierPrice(carrierPriceNum+"");
				
				unit=priceBean.getPriceUnit();
				if(TON.equals(unit)){//将按吨计转换成按公斤计算
					priceNum=priceNum.divide(new BigDecimal("1000.00"));
					carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				}
				freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);//保留两位上数
				
				carrierFreightAmount=carrierApplyNum.multiply(carrierPriceNum);//行项目运费=实际申请重量*单价
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);//保留两位上数
			}

		
			freightBean.setPriceId(priceBean.getPriceId()+"");
			
			freightBean.setFreightAmount(freightAmount+"");
			freightBean.setCarrierFreight(carrierFreightAmount+"");
			
			freightBean.setPlanFreight(freightAmount+"");
			freightBean.setPlanCarrierFreight(carrierFreightAmount+"");
			
			totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和
			carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
			
			freightBean.setFreightTime(tools.tool.getDateTime());
		
			feightList.add(freightBean);			
		}
		if(singleModel.equals(model)){//单价
			BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			if(totalFreightNum.compareTo(totalFreight)!=0&&feightList.isEmpty()==false){//不相等，而需要进行抹尾处理
				freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setPlanFreight(freightAmount+"");
			}
			
			BigDecimal totalCarrierFreight =totalTonNum.multiply(carrierPriceNum);//承运商：总运费=总重量*单价；
			totalCarrierFreight=totalCarrierFreight.setScale(2,BigDecimal.ROUND_DOWN);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			if(carrirTotalFreightNum.compareTo(totalFreight)!=0&&feightList.isEmpty()==false){//不相等，而需要进行抹尾处理
				freightBean=feightList.get(feightList.size()-1);//对承运商：最后一个行项进行抹尾处理
				BigDecimal spanFreight=totalCarrierFreight.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				freightBean.setCarrierFreight(freightAmount+"");
				freightBean.setPlanCarrierFreight(freightAmount+"");
			}
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalFreight(totalFreight+"");
				freightBean.setTotalCarrierFreight(totalCarrierFreight+"");
				
				freightBean.setPlanTotalFreight(totalFreight+"");
				freightBean.setPlanTotalCarrierFreight(totalCarrierFreight+"");
			}
		}
		if(allModel.equals(model)){//一口价
			priceNum=new BigDecimal(priceBean.getCustomerOnePrice());
			carrierPriceNum=new BigDecimal(priceBean.getCarrierOnePrice());
			if(priceNum.compareTo(totalFreightNum)!=0&&feightList.isEmpty()==false){//不相等，而需要进行抹尾处理
				freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setPlanFreight(freightAmount+"");
			}
			if(carrierPriceNum.compareTo(carrirTotalFreightNum)!=0&&feightList.isEmpty()==false){//不相等，而需要进行抹尾处理
				freightBean=feightList.get(feightList.size()-1);//对承运商：最后一个行项进行抹尾处理
				BigDecimal spanFreight=carrierPriceNum.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				freightBean.setCarrierFreight(freightAmount+"");
				freightBean.setPlanCarrierFreight(freightAmount+"");
			}
			
			//最后设置总价
			for(int i=0,size=feightList.size();i<size;i++){
				freightBean=feightList.get(i);
				freightBean.setTotalFreight(priceNum+"");
				freightBean.setTotalCarrierFreight(carrierPriceNum+"");
				
				freightBean.setPlanTotalFreight(priceNum+"");
				freightBean.setPlanTotalCarrierFreight(carrierPriceNum+"");
			}
		}
		return feightList;
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
	private List<FreightBean>  calculateCustomerSelfFetchFreight(CustomerBean  customerBean,List<EstimateFreightBean> estimateParamsList,BigDecimal  totalActualTonNum){
		List<FreightBean> freightList = new ArrayList<FreightBean>();
		if(customerBean==null||customerBean.getManagementFee()==null||estimateParamsList==null||estimateParamsList.isEmpty()){
			return null;
		}
		
		BigDecimal  totalTonNum=totalActualTonNum,priceNum=null,applyNum=null ;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),specifyAmount=null ;
		FreightBean freightBean =null;
		EstimateFreightBean estimateBean = null;
		
		String TON="24",unit=TON;
		List<FreightBean> feightList =new ArrayList<FreightBean>();
		for(int i=0,size=estimateParamsList.size();i<size;i++){
			estimateBean=estimateParamsList.get(i);			
			
			freightBean =new FreightBean();
			freightBean.setFreightType("5");//客户自备车自提类型
			
			freightBean.setOrderId(estimateBean.getOrderId());
			freightBean.setOrderCode(estimateBean.getOrderCode());
			freightBean.setItemId(estimateBean.getItemId());
			freightBean.setItemCode(estimateBean.getItemCode());
			freightBean.setShipId(estimateBean.getShipId());
			freightBean.setTransferId(estimateBean.getTranferId());
			freightBean.setUserId(estimateBean.getUserId());
			freightBean.setAreaId(estimateBean.getAreaId());
			freightBean.setCustomerId(estimateBean.getCustomerId());
			freightBean.setEstimateStep(estimateBean.getEstimateStep());
			freightBean.setApplyTonNum(estimateBean.getApplyTonNum());
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
	 * 计算贸易商运价
	 * @param sapTransList
	 * @param totalActualTonNum
	 * @param transferBean
	 * @param shipBean
	 * @param shipDetailList
	 * @return
	 */
	private List<FreightBean>  calculateTraderFreight(TraderPriceBean traderPriceBean,List<EstimateFreightBean> estimateParamsList,BigDecimal  totalActualTonNum){
		List<FreightBean> freightList = new ArrayList<FreightBean>();
		if(traderPriceBean==null||estimateParamsList==null||estimateParamsList.isEmpty()){
			return null;
		}
		
		BigDecimal  totalTonNum=totalActualTonNum,priceNum=null,applyNum=null ;//,carrierPriceNum=null,carrierApplyNum=null;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),specifyAmount=null ;
		//carrirTotalFreightNum=new BigDecimal("0.00"),,carrierFreightAmount=null;
		FreightBean freightBean =null;
		EstimateFreightBean estimateBean = null;
		
		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=traderPriceBean.getFreightModel(),unit=traderPriceBean.getPriceUnit();
		unit=traderPriceBean.getPriceUnit();
		model=traderPriceBean.getFreightModel();
		List<FreightBean> feightList =new ArrayList<FreightBean>();
		for(int i=0,size=estimateParamsList.size();i<size;i++){
			estimateBean=estimateParamsList.get(i);			
			
			freightBean =new FreightBean();
			freightBean.setFreightType("4");//正常估价
			freightBean.setFreightStyle(traderPriceBean.getPriceType()+"");
			freightBean.setOrderId(estimateBean.getOrderId());
			freightBean.setOrderCode(estimateBean.getOrderCode());
			freightBean.setItemId(estimateBean.getItemId());
			freightBean.setItemCode(estimateBean.getItemCode());
			freightBean.setShipId(estimateBean.getShipId());
			freightBean.setTransferId(estimateBean.getTranferId());
			freightBean.setUserId(estimateBean.getUserId());
			freightBean.setAreaId(estimateBean.getAreaId());
			freightBean.setRouteId(traderPriceBean.getRouteId()+"");
			freightBean.setCustomerId(estimateBean.getCustomerId());
			freightBean.setEstimateStep(estimateBean.getEstimateStep());
			freightBean.setApplyTonNum(estimateBean.getApplyTonNum());
			freightBean.setPriceId(traderPriceBean.getPriceId()+"");
			
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
				
				totalFreightNum=totalFreightNum.add(freightAmount);log.info("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
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
				//	carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				}
				
				freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				
				totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和
				//log.info("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				//carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				//carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_HALF_UP);
				//log.info("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
			    //carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				
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
	 * 按调拨单计算运费
	 * 物流可能指定调拨单的运价或总体价格（一口价时为整个调拨单的运价）
	 * 如果是一口价，则按重量进行均摊；如果是单价，则对实际运费进行计算；
	 * feightList中的SAP调拨单号、行项目号和重量，通过正常运费计算，都已经实际的从SAP传递过来的
	 * @param sapTransList
	 * @return
	 */
	public void specifyTransferFreight(TransferPriceBean transPriceBean,List<FreightBean> feightList){
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
		int WEIGHT=6,type=0;//按重量计算字典ID
		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=transPriceBean.getFreightModel(),unit=transPriceBean.getPriceUnit();
		unit=transPriceBean.getPriceUnit();
		model=transPriceBean.getFreightModel();
	
		for(int i=0,size=feightList.size();i<size;i++){
			freightBean=feightList.get(i);
			freightBean.setFreightType("3");//按调拨单运价估价
			
			freightBean.setValidateDate(transPriceBean.getValidateDate());
			freightBean.setFreightStyle(transPriceBean.getPriceType()+"");//默认按吨计
			freightBean.setPriceId(transPriceBean.getPriceId()+"");
			
			if(allModel.equals(model)){//总价
				priceNum=new BigDecimal(transPriceBean.getCustomerOnePrice());//此数目该用户该系统路的一口价为总价
				carrierPriceNum=new BigDecimal(transPriceBean.getCarrierOnePrice());//此数目承运商在该用户该系统路的一口价为总价
				applyNum=new BigDecimal(freightBean.getApplyTonNum());
				
				priceNum=priceNum.setScale(2,BigDecimal.ROUND_DOWN);
				carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_DOWN);
				
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
				freightAmount=freightAmount.divide(totalTonNum,2,BigDecimal.ROUND_DOWN);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);
				carrierFreightAmount=carrierFreightAmount.divide(totalTonNum,2,BigDecimal.ROUND_DOWN);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				totalFreightNum=totalFreightNum.add(freightAmount);log.info("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				//log.info("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			
			if(singleModel.equals(model)){//按单价计
				
				applyNum=new BigDecimal(freightBean.getApplyTonNum());//重量
				priceNum=new BigDecimal(transPriceBean.getCustomerPrice());
				carrierApplyNum=applyNum;
				carrierPriceNum=new BigDecimal(transPriceBean.getCarrierPrice());
				freightBean.setFreightModel("单价");
				freightBean.setFreightPrice(priceNum+"");
				freightBean.setCarrierPrice(carrierPriceNum+"");
				if(TON.equals(unit)){//将按吨计转换成按公斤计算
					priceNum=priceNum.divide(new BigDecimal("1000.00"));
					carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				}
				
				freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和
				//log.info("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				//log.info("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
		}
		if(allModel.equals(model)){//总价抹尾
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			priceNum=new BigDecimal(transPriceBean.getCustomerOnePrice());
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_DOWN);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			
			if(priceNum.compareTo(totalFreightNum)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			
			carrierPriceNum=new BigDecimal(transPriceBean.getCarrierOnePrice());
			carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_DOWN);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
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
			//删除此行，否则吨计算出的价格会有1000倍   priceNum=new BigDecimal(transPriceBean.getCustomerPrice());
			BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			

            //删除此行，否则吨计算出的价格会乘以1000倍   carrierPriceNum=new BigDecimal(transPriceBean.getCarrierPrice());
			BigDecimal carrierTotalFreight =totalTonNum.multiply(carrierPriceNum);//总运费=总重量*单价；
			carrierTotalFreight=carrierTotalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
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

	
	public List<FreightBean> specifyTransferFreight(TransferPriceBean transPriceBean,List<EstimateFreightBean> estimateParamsList,BigDecimal  totalAplyTonNum){
		if(transPriceBean==null||estimateParamsList==null||estimateParamsList.isEmpty()){
			return null;
		}
		
		BigDecimal  totalTonNum=new BigDecimal("0.00"),priceNum=null,applyNum=null,carrierPriceNum=null,carrierApplyNum=null;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),carrirTotalFreightNum=new BigDecimal("0.00"),carrierFreightAmount=null,specifyAmount=null;
		EstimateFreightBean estimateFreightBean = null;
		
		for(int i=0,size=estimateParamsList.size();i<size;i++){//计算订单总重量
			estimateFreightBean=estimateParamsList.get(i);
			applyNum=new BigDecimal(estimateFreightBean.getApplyTonNum());
			totalTonNum=totalTonNum.add(applyNum);
		}
		int WEIGHT=6,type=0;//按重量计算字典ID
		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=transPriceBean.getFreightModel(),unit=transPriceBean.getPriceUnit();
		unit=transPriceBean.getPriceUnit();
		model=transPriceBean.getFreightModel();
		FreightBean freightBean =null;
		List<FreightBean> feightList=new ArrayList<FreightBean>();
		for(int i=0,size=estimateParamsList.size();i<size;i++){
			estimateFreightBean=estimateParamsList.get(i);
			
			freightBean =new FreightBean();
			freightBean.setFreightType("3");//按调拨单运价估价

			freightBean.setFreightStyle(type+"");
			freightBean.setOrderId(estimateFreightBean.getOrderId());
			freightBean.setOrderCode(estimateFreightBean.getOrderCode());
			freightBean.setItemId(estimateFreightBean.getItemId());
			freightBean.setItemCode(estimateFreightBean.getItemCode());
			freightBean.setShipId(estimateFreightBean.getShipId());
			freightBean.setTransferId(estimateFreightBean.getTranferId());
			freightBean.setUserId(estimateFreightBean.getUserId());
			freightBean.setAreaId(estimateFreightBean.getAreaId());
			//freightBean.setRouteId(transPriceBean.getRouteId()+"");
			freightBean.setCustomerId(estimateFreightBean.getCustomerId());
			freightBean.setEstimateStep(estimateFreightBean.getEstimateStep());

			freightBean.setApplyTonNum(estimateFreightBean.getApplyTonNum());
			
			freightBean.setValidateDate(transPriceBean.getValidateDate());
			freightBean.setFreightStyle(transPriceBean.getPriceType()+"");//默认按吨计
			freightBean.setPriceId(transPriceBean.getPriceId()+"");
			
			if(allModel.equals(model)){//总价
				priceNum=new BigDecimal(transPriceBean.getCustomerOnePrice());//此数目该用户该系统路的一口价为总价
				carrierPriceNum=new BigDecimal(transPriceBean.getCarrierOnePrice());//此数目承运商在该用户该系统路的一口价为总价
				applyNum=new BigDecimal(freightBean.getApplyTonNum());
				
				priceNum=priceNum.setScale(2,BigDecimal.ROUND_DOWN);
				carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_DOWN);
				
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
				freightAmount=freightAmount.divide(totalTonNum,2,BigDecimal.ROUND_DOWN);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);
				carrierFreightAmount=carrierFreightAmount.divide(totalTonNum,2,BigDecimal.ROUND_DOWN);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				totalFreightNum=totalFreightNum.add(freightAmount);log.info("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				//log.info("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			
			if(singleModel.equals(model)){//按单价计
				
				applyNum=new BigDecimal(freightBean.getApplyTonNum());//重量
				priceNum=new BigDecimal(transPriceBean.getCustomerPrice());
				carrierApplyNum=applyNum;
				carrierPriceNum=new BigDecimal(transPriceBean.getCarrierPrice());
				freightBean.setFreightModel("单价");
				freightBean.setFreightPrice(priceNum+"");
				freightBean.setCarrierPrice(carrierPriceNum+"");
				if(TON.equals(unit)){//将按吨计转换成按公斤计算
					priceNum=priceNum.divide(new BigDecimal("1000.00"));
					carrierPriceNum=carrierPriceNum.divide(new BigDecimal("1000.00"));
				}
				
				freightAmount=applyNum.multiply(priceNum);//行项目运费=实际申请重量*单价
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和
                //log.info("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				//log.info("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			feightList.add(freightBean);
		}
		if(allModel.equals(model)){//总价抹尾
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			priceNum=new BigDecimal(transPriceBean.getCustomerOnePrice());
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_DOWN);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			
			if(priceNum.compareTo(totalFreightNum)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			
			carrierPriceNum=new BigDecimal(transPriceBean.getCarrierOnePrice());
			carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_DOWN);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
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
			//删除此行，否则吨计算出的价格会乘以1000倍   priceNum=new BigDecimal(transPriceBean.getCustomerPrice());
			BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			

			//删除此行，否则吨计算出的价格会乘以1000倍   carrierPriceNum=new BigDecimal(transPriceBean.getCarrierPrice());
			BigDecimal carrierTotalFreight =totalTonNum.multiply(carrierPriceNum);//总运费=总重量*单价；
			carrierTotalFreight=carrierTotalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
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

	
	/**
	 * 按特殊客户运价计算运费
	 * @param sapTransList
	 * @return
	 */
	
	private void specialCustomerFreight(CustomerPriceBean customerPriceBean,List<FreightBean> feightList){
		if(customerPriceBean==null||feightList==null||feightList.isEmpty()){
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
		int WEIGHT=6,type=0;//按重量计算字典ID
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
				
				priceNum=priceNum.setScale(2,BigDecimal.ROUND_DOWN);
				carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_DOWN);
				
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
				freightAmount=freightAmount.divide(totalTonNum,2,BigDecimal.ROUND_DOWN);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);
				carrierFreightAmount=carrierFreightAmount.divide(totalTonNum,2,BigDecimal.ROUND_DOWN);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				totalFreightNum=totalFreightNum.add(freightAmount);log.info("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				//log.info("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
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
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和
				log.info("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				log.info("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
		}
		
		
		
		
		if(allModel.equals(model)){//总价抹尾
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			priceNum=new BigDecimal(customerPriceBean.getCustomerOnePrice());
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_DOWN);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			
			if(priceNum.compareTo(totalFreightNum)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			
			carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierOnePrice());
			carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_DOWN);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
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
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			log.info("******totalFreightNum="+totalFreightNum+",totalFreight="+totalFreight+",freightAmount="+freightAmount);
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				log.info("******totalFreightNum="+totalFreightNum+",totalFreight="+totalFreight+",freightAmount="+freightAmount+",spanFreight="+spanFreight);
				freightAmount=freightAmount.add(spanFreight);
				totalFreightNum=totalFreight;
				log.info("******totalFreightNum="+totalFreightNum+",totalFreight="+totalFreight+",freightAmount="+freightAmount+",spanFreight="+spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			

			//carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierPrice());
			BigDecimal carrierTotalFreight =totalTonNum.multiply(carrierPriceNum);//总运费=总重量*单价；
			carrierTotalFreight=carrierTotalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			if(carrirTotalFreightNum.compareTo(carrierTotalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=carrierTotalFreight.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				//carrirTotalFreightNum=carrierTotalFreight;
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
	 * 按特殊客户运价计算运费
	 * @param sapTransList
	 * @return
	 */
	
	private List<FreightBean> specialCustomerFreight(CustomerPriceBean customerPriceBean,List<EstimateFreightBean> estimateParamsList,BigDecimal  totalAplyTonNum){
		if(customerPriceBean==null||estimateParamsList==null||estimateParamsList.isEmpty()){
			return null;
		}
		
		BigDecimal  totalTonNum=new BigDecimal("0.00"),priceNum=null,carrierPriceNum=null,carrierApplyNum=null,applyNum=null;
		BigDecimal totalFreightNum=new BigDecimal("0.00"),carrirTotalFreightNum=new BigDecimal("0.00"),freightAmount=new BigDecimal("0.00"),carrierFreightAmount=null,specifyAmount=null;
		EstimateFreightBean estimateFreightBean =null;
		for(int i=0,size=estimateParamsList.size();i<size;i++){//计算订单总重量
			estimateFreightBean=estimateParamsList.get(i);
			applyNum=new BigDecimal(estimateFreightBean.getApplyTonNum());
			totalTonNum=totalTonNum.add(applyNum);
		}
		int WEIGHT=6,type=0;//按重量计算字典ID
		String singleModel="1";//按单价计
		String allModel="2";//一口价
		String TON="24",KG="25",model=customerPriceBean.getFreightModel(),unit=customerPriceBean.getPriceUnit();
		unit=customerPriceBean.getPriceUnit();
		model=customerPriceBean.getFreightModel();
		FreightBean freightBean =null;
		List<FreightBean> feightList = new ArrayList<FreightBean>();
		for(int i=0,size=estimateParamsList.size();i<size;i++){
			estimateFreightBean=estimateParamsList.get(i);
			freightBean=new FreightBean();
			freightBean.setFreightType("2");//按特殊客户运价计算
			freightBean.setFreightStyle(type+"");
			freightBean.setOrderId(estimateFreightBean.getOrderId());
			freightBean.setOrderCode(estimateFreightBean.getOrderCode());
			freightBean.setItemId(estimateFreightBean.getItemId());
			freightBean.setItemCode(estimateFreightBean.getItemCode());
			freightBean.setShipId(estimateFreightBean.getShipId());
			freightBean.setTransferId(estimateFreightBean.getTranferId());
			freightBean.setUserId(estimateFreightBean.getUserId());
			freightBean.setAreaId(estimateFreightBean.getAreaId());
			freightBean.setRouteId(customerPriceBean.getRouteId()+"");
			freightBean.setCustomerId(estimateFreightBean.getCustomerId());
			freightBean.setEstimateStep(estimateFreightBean.getEstimateStep());

			freightBean.setApplyTonNum(estimateFreightBean.getApplyTonNum());
			
			
			freightBean.setValidateDate(customerPriceBean.getValidateDate());
			freightBean.setFreightStyle(customerPriceBean.getPriceType()+"");//默认按吨计
			freightBean.setPriceId(customerPriceBean.getPriceId()+"");
			
			if(allModel.equals(model)){//总价
				priceNum=new BigDecimal(customerPriceBean.getCustomerOnePrice());//此数目该用户该系统路的一口价为总价
				carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierOnePrice());//此数目承运商在该用户该系统路的一口价为总价
				applyNum=new BigDecimal(freightBean.getApplyTonNum());
				
				priceNum=priceNum.setScale(2,BigDecimal.ROUND_DOWN);
				carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_DOWN);
				
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
				freightAmount=freightAmount.divide(totalTonNum,2,BigDecimal.ROUND_DOWN);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);
				carrierFreightAmount=carrierFreightAmount.divide(totalTonNum,2,BigDecimal.ROUND_DOWN);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				totalFreightNum=totalFreightNum.add(freightAmount);log.info("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				//log.info("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
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
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				
				totalFreightNum=totalFreightNum.add(freightAmount);//总运费=各行项目运费之和
				log.info("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				log.info("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				
				
				freightBean.setFreightAmount(freightAmount+"");
				freightBean.setCarrierFreight(carrierFreightAmount+"");
			}
			
			feightList.add(freightBean);
		}
		
		
		
		
		if(allModel.equals(model)){//总价抹尾
			freightBean=feightList.get(feightList.size()-1);//对最后一个行项进行抹尾处理
			priceNum=new BigDecimal(customerPriceBean.getCustomerOnePrice());
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_DOWN);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			
			if(priceNum.compareTo(totalFreightNum)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=priceNum.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			
			carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierOnePrice());
			carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_DOWN);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
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
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			log.info("******totalFreightNum="+totalFreightNum+",totalFreight="+totalFreight+",freightAmount="+freightAmount);
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				log.info("******totalFreightNum="+totalFreightNum+",totalFreight="+totalFreight+",freightAmount="+freightAmount+",spanFreight="+spanFreight);
				freightAmount=freightAmount.add(spanFreight);
				totalFreightNum=totalFreight;
				log.info("******totalFreightNum="+totalFreightNum+",totalFreight="+totalFreight+",freightAmount="+freightAmount+",spanFreight="+spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			

			//carrierPriceNum=new BigDecimal(customerPriceBean.getCarrierPrice());
			BigDecimal carrierTotalFreight =totalTonNum.multiply(carrierPriceNum);//总运费=总重量*单价；
			carrierTotalFreight=carrierTotalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			carrirTotalFreightNum=carrirTotalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			if(carrirTotalFreightNum.compareTo(carrierTotalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=carrierTotalFreight.subtract(carrirTotalFreightNum);
				freightAmount=new BigDecimal(freightBean.getCarrierFreight());
				freightAmount=freightAmount.add(spanFreight);
				//carrirTotalFreightNum=carrierTotalFreight;
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
		  
		 String[]  orderId        =new String[size],
		    orderCode      =new String[size],
		    itemCode       =new String[size],
		    itemId         =new String[size],
		    shipId         =new String[size],
		    transferId     =new String[size],
		    freightType =new String[size],
		    freightStyle   =new String[size],
		    freightModel   =new String[size],
		    validateDate   =new String[size],
		    applyTonNum    =new String[size],
		    freightPrice   =new String[size],
		    freightAmount  =new String[size],
		    priceId        =new String[size],
		    freightTime    =new String[size],
		    userId         =new String[size],
		    areaId=new String[size],
		    routeId=new String[size],
		    customerId=new String[size],
		    estimateStep=new String[size],
		    totalFreight       =new String[size],
		    carrierPrice       =new String[size],
		    totalCarrierFreight=new String[size],
		    carrierFreight     =new String[size];
		FreightBean freightBean=null;
		for(int i=0;i<size;i++){
			freightBean=freightList.get(i);
		    orderId      [i]=freightBean.getOrderId();
		    orderCode    [i]=freightBean.getOrderCode();
		    itemCode     [i]=freightBean.getItemCode();
		    itemId       [i]=freightBean.getItemId();
		    shipId       [i]=freightBean.getShipId();
		    transferId   [i]=freightBean.getTransferId();
		    freightType[i]=freightBean.getFreightType();
		    freightStyle [i]=("null").equals(freightBean.getFreightStyle())?"":freightBean.getFreightStyle();
		    freightModel [i]=freightBean.getFreightModel();
		    validateDate [i]=freightBean.getValidateDate();
		    applyTonNum  [i]=freightBean.getApplyTonNum();
		    freightPrice [i]=freightBean.getFreightPrice();
		    freightAmount[i]=freightBean.getFreightAmount();
		    priceId      [i]=("null").equals(freightBean.getPriceId())?"":freightBean.getPriceId();
		    freightTime  [i]=freightBean.getFreightTime();
		    userId       [i]=freightBean.getUserId();
		    areaId[i]=freightBean.getAreaId();
		    routeId[i]=freightBean.getRouteId();
		    customerId[i]=freightBean.getCustomerId();
		    estimateStep[i]=freightBean.getEstimateStep();
		    totalFreight       [i]=freightBean.getTotalFreight();
		    carrierPrice       [i]=freightBean.getCarrierPrice();
		    totalCarrierFreight[i]=freightBean.getTotalCarrierFreight();
		    carrierFreight     [i]=freightBean.getCarrierFreight();
		}
		Map parameters =  new HashMap();
		parameters.put("orderId",orderId);
		parameters.put("orderCode",orderCode);
		parameters.put("itemCode",itemCode);
		parameters.put("itemId",itemId);
		parameters.put("shipId",shipId);
		parameters.put("transferId",transferId);
		parameters.put("freightType",freightType);
		parameters.put("freightStyle",freightStyle==null?"":freightStyle );
		parameters.put("freightModel",freightModel);
		parameters.put("validateDate",validateDate);
		parameters.put("applyTonNum",applyTonNum);
		parameters.put("freightPrice",freightPrice);
		parameters.put("freightAmount",freightAmount);
		
		parameters.put("priceId",priceId==null?"":priceId);
		parameters.put("freightTime",freightTime);
		parameters.put("userId",userId);
		parameters.put("areaId",areaId);
		parameters.put("routeId",routeId);
		parameters.put("customerId",customerId);
		parameters.put("estimateStep",estimateStep);
		parameters.put("totalFreight",totalFreight);
		parameters.put("carrierPrice",carrierPrice);
		parameters.put("totalCarrierFreight",totalCarrierFreight);
		parameters.put("carrierFreight",carrierFreight);

		OperationBean operationBean = OperationConfigRepository.getOperationConfig("saveEstimateFreight");
		
		ResultBean resultBean = this.dbOperator(operationBean,parameters, false);
		tools.tool.clear(parameters);
		parameters=null;
		if(resultBean==null|resultBean.isSuccess()==false){
			//return getResult("E","E004","。sapTransCode="+sapTransCode,true);
			log.info("保存预估运费结果不成功,resultBean==null|resultBean.isSuccess()==false");
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		HtmsEstimateFreightBusiness freightBusiness = new HtmsEstimateFreightBusiness();
		
		//productId=2,factoryId=3,areaId=12669,customerId=696,applyTime=2017-09-10 08:31:43
		//priceId=2
		//customerId=696,customerId
		//routeId=11318
		//,ship=28,transId=17,
		//orderId=11887,orderCode=0010650666,itemCode=000010,000020 itemID=13877,13878
		List<EstimateFreightBean> estimateParamsList = new ArrayList<EstimateFreightBean>();
		EstimateFreightBean efBean = new EstimateFreightBean();
		efBean.setEstimateStep("1");//申请环节
		efBean.setOrderId("11887");
		efBean.setOrderCode("0010650666");
		efBean.setItemId("13877");
		efBean.setItemCode("000010");
		efBean.setTranferId("17");
		efBean.setCustomerId("696");
		efBean.setFactoryId("3");
		efBean.setProductId("2");
		efBean.setAreaId("12669");
		efBean.setApplyTonNum("7211.7");
		efBean.setApplyTime("2017-09-10 08:31:43");
		efBean.setUserId("1");		
		estimateParamsList.add(efBean);
		
//		efBean = new EstimateFreightBean();
//		efBean.setEstimateStep("1");//申请环节
//		efBean.setOrderId("11887");
//		efBean.setOrderCode("0010650666");
//		efBean.setItemId("13878");
//		efBean.setItemCode("000020");
//		efBean.setTranferId("17");
//		efBean.setCustomerId("696");
//		efBean.setFactoryId("3");
//		efBean.setProductId("2");
//		efBean.setAreaId("12669");
//		efBean.setApplyTonNum("10833.6");
//		efBean.setApplyTime("2017-09-10 08:31:43");
//		efBean.setUserId("1");		
//		estimateParamsList.add(efBean);
		
		freightBusiness.getEstimateFreight(estimateParamsList);
	}
	
	

}
