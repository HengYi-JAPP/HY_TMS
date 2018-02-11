package com.zzy.htms.services.business;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jdom.Element;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.dictionary.transprice.TransPriceBean;
import com.zzy.htms.logistic.freight.PriceUtil;
import com.zzy.htms.logistic.transfer.TransferBean;
import com.zzy.htms.logistic.transferprice.TransferPriceBean;
import com.zzy.htms.sales.customerprice.CustomerPriceBean;
import com.zzy.htms.sales.custorder.CustOrderBean;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;
import com.zzy.htms.sap.rfc.SyncLogger;
import com.zzy.htms.services.user.ServiceUserBean;
import com.zzy.htms.services.user.ServiceUserRepository;

public class CopyOfHtmsFreightBusiness  extends HtmsServiceBusiness {

	public List<FreightBean> getFreight(List<SapTransferBean> sapTransList){
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
			return null;
		}
		
		/**
		 * 按正常方式进行运费计算
		 */
		List<FreightBean> freightList =this.calculateNormalFreight(sapTransList, transferBean, shipBean, shipDetailList);
		if(freightList==null||freightList.isEmpty()){
			System.out.println("无法按正常方式进行运费计算，请查检线路及运价。freightList==null||freightList.isEmpty()");
		}
		ShipDetailBean shipDetailBean=shipDetailList.get(0);
		//正常运费计算，freightType=1
		CustomerPriceBean customerPriceBean=PriceUtil.getCustomerPrice(shipDetailBean.getProductId()+"", shipDetailBean.getFactoryId(), transferBean.getAreaId(), orderBean.getCustomerId()+"", new BigDecimal(0),shipBean.getCreateTime());
		
		/*特殊客户运价计算，会对上一步的计算结果进行覆盖,优先第二，freightType=2*/
		if(customerPriceBean!=null){
			this.specialCustomerFreight(customerPriceBean, freightList);
		}
		
		/*按物流指定运价计算，会对上一步的计算结果进行覆盖,优先最高，freightType=3*/
		System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++transPriceBean:"+transPriceBean);
		if(transPriceBean!=null){
			this.specifyTransferFreight(transPriceBean, freightList);
		}
		
		/*将运算结果保存到数据中，并且组装返回 结果，或写回到SAP中去。
		 * 
		 */
		this.saveFreight(freightList);
		
		return freightList;
	}
	
	
	
	
	/**
	 * 按正常方式计算运费
	 * @param sapTransList
	 * @return
	 */
	private List<FreightBean> calculateNormalFreight(List<SapTransferBean> sapTransList,TransferBean transferBean,ShipBean shipBean,List<ShipDetailBean> shipDetailList){
		BigDecimal  shipTonNum=new BigDecimal("0.00"),detailTonNum=null;
		ShipDetailBean detailBean =null;
		String applyTonNum = null;
		Map<String,ShipDetailBean> detailMap = new HashMap<String,ShipDetailBean>();
		
		/*获取申请单的总重量，通过客户申请的重量来找运价*/
		for(int i=0,size=shipDetailList.size();i<size;i++){
			detailBean=shipDetailList.get(i);
			applyTonNum = detailBean.getApplyTonNum();
			applyTonNum=applyTonNum==null?"0.00":applyTonNum;
			detailTonNum=new BigDecimal(applyTonNum);
			
			shipTonNum=shipTonNum.add(detailTonNum);
			
			detailMap.put(detailBean.getItemCode(), detailBean);
		}
		
		String productId, factoryId, areaId, tonAmount, applyTime;
		TransPriceBean priceBean=null;
		SapTransferBean sapTransferBean=sapTransList.get(0);
		Map<String,TransPriceBean> priceMap = new HashMap<String,TransPriceBean>();
		for(int i=0,size=shipDetailList.size();i<size;i++){
			detailBean=shipDetailList.get(i);
			productId=detailBean.getProductId()+"";
			factoryId=detailBean.getFactoryId();
			areaId=transferBean.getAreaId();
			tonAmount=shipTonNum+"";
			applyTime=detailBean.getCreateTime();
			priceBean=PriceUtil.getRoutePrice(productId, factoryId, areaId, tonAmount, applyTime);
			if(priceBean==null){
				System.out.println("productId="+productId+",factoryId="+factoryId+",areaId="+areaId+",tonAmount="+tonAmount+",applyTime="+applyTime);
				System.out.println("priceBean==null,行项没有找到合适运价 001,sapTransferCode="+sapTransferBean.getTransferCode()+",itemCode="+detailBean.getItemCode());
				return null;
			}
			priceMap.put(detailBean.getItemCode(), priceBean);
		}
		
		/*计算实际出库的总重量*/
		BigDecimal  totalActualTonNum=new BigDecimal("0.00"),actualApplyTon=null;
		for(int i=0,size=sapTransList.size();i<size;i++){
			sapTransferBean=sapTransList.get(i);
			actualApplyTon=new BigDecimal(sapTransferBean.getApplyTonNum());
			totalActualTonNum=totalActualTonNum.add(actualApplyTon);
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
			if(priceBean==null){
				System.out.println("priceBean==null,行项没有找到合适运价 002,sapTransferCode="+sapTransferBean.getTransferCode()+",itemCode="+sapTransferBean.getItemCode());
				return null;
			}
			type=priceBean.getPriceType();
			if(WEIGHT!=type){
				System.out.println("priceBean ,不是按重计价 002,sapTransferCode="+sapTransferBean.getTransferCode()+",itemCode="+sapTransferBean.getItemCode());
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
				freightAmount=freightAmount.divide(totalActualTonNum,2,BigDecimal.ROUND_DOWN);
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);//保留两位上数
				
				carrierFreightAmount=carrierPriceNum.multiply(applyNum);//行项目运费=一口价
				carrierFreightAmount=carrierFreightAmount.divide(totalActualTonNum,2,BigDecimal.ROUND_DOWN);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);//保留两位上数
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
				freightAmount=freightAmount.setScale(2,BigDecimal.ROUND_DOWN);//保留两位上数
				
				carrierFreightAmount=carrierApplyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);//保留两位上数
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
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			if(totalFreight.compareTo(totalFreightNum)!=0&&feightList.isEmpty()==false){//不相等，而需要进行抹尾处理
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
			if(totalCarrierFreight.compareTo(carrirTotalFreightNum)!=0&&feightList.isEmpty()==false){//不相等，而需要进行抹尾处理
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
				freightBean.setPlanTotalFreight(totalFreight+"");
	
				freightBean.setTotalCarrierFreight(totalCarrierFreight+"");
				freightBean.setPlanTotalCarrierFreight(totalCarrierFreight+"");
			}
		}
		if(allModel.equals(model)){//一口价抹尾处理
			priceNum=new BigDecimal(priceBean.getCustomerOnePrice());
			carrierPriceNum=new BigDecimal(priceBean.getCarrierOnePrice());	
			priceNum=priceNum.setScale(2,BigDecimal.ROUND_DOWN);
			carrierPriceNum=carrierPriceNum.setScale(2,BigDecimal.ROUND_DOWN);
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
				
				totalFreightNum=totalFreightNum.add(freightAmount);System.out.println("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				System.out.println("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
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
				//System.out.println("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				//System.out.println("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
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
			//priceNum=new BigDecimal(transPriceBean.getCustomerPrice());
			BigDecimal totalFreight =totalTonNum.multiply(priceNum);//总运费=总重量*单价；
			totalFreight=totalFreight.setScale(2,BigDecimal.ROUND_DOWN);
			totalFreightNum=totalFreightNum.setScale(2,BigDecimal.ROUND_DOWN);
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
				freightBean.setFreightAmount(freightAmount+"");
			}
			

			//carrierPriceNum=new BigDecimal(transPriceBean.getCarrierPrice());
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
				
				totalFreightNum=totalFreightNum.add(freightAmount);System.out.println("总价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrirTotalFreightNum=carrirTotalFreightNum.add(carrierFreightAmount);
				System.out.println("总价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
				
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
				//System.out.println("单价:applyNum="+applyNum+",priceNum="+priceNum+",totalFreightNum="+totalFreightNum);
				carrierFreightAmount=applyNum.multiply(carrierPriceNum);
				carrierFreightAmount=carrierFreightAmount.setScale(2,BigDecimal.ROUND_DOWN);
				//System.out.println("单价:applyNum="+applyNum+",carrierPriceNum="+carrierPriceNum+",carrierFreightAmount="+carrierFreightAmount);
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
			if(totalFreightNum.compareTo(totalFreight)!=0){//不相等，而需要进行抹尾处理
				BigDecimal spanFreight=totalFreight.subtract(totalFreightNum);
				freightAmount=new BigDecimal(freightBean.getFreightAmount());
				freightAmount=freightAmount.add(spanFreight);
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
	
	/*
	*//**
	 * 按正常方式预估当前调用单的运费
	 * @param sapTransList
	 * @return
	 *//*
	private String getEstimateFreight(String pxml){
		if(this.validateUser(pxml)==false){
			 getResult("E","E000","访问凭证不合法，请和管理员联系。",true);
		}
		解析SAP传过来的参数
		List<SapTransferBean> sapTransList =PxmlParser.getSapTransferBean(pxml);
		if(sapTransList==null||sapTransList.isEmpty()){
			return getResult("E","E001","调用参数中没有调拨单及行项的有效数据，请与SAP管理员联系。",true);
		}
		
		从数据库加载计算运费所需要的信息
		SapTransferBean sapTransBean = sapTransList.get(0);
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("getCalculateFreightInfo");
		String sapTransCode = sapTransBean.getTransferCode();
		Map parameters =  new HashMap();
		parameters.put("sapTransferCode", new String[]{sapTransCode});

		ResultBean resultBean = this.dbOperator(operationBean,parameters, false);
		if(resultBean==null||resultBean.isSuccess()==false){
			return getResult("E","E002","数据库查询异常，请检查日志。sapTransCode="+sapTransCode,true);
		}
		CustOrderBean orderBean =(CustOrderBean)resultBean.getListFirstResult("orderBean");
		TransferPriceBean transPriceBean =(TransferPriceBean)resultBean.getListFirstResult("transPriceBean");
		TransferBean transferBean=(TransferBean)resultBean.getListFirstResult("transferBean");
		List<TransferBean> transDetailList=(List<TransferBean>)resultBean.getListResult("transDetailList");
		ShipBean shipBean=(ShipBean)resultBean.getListFirstResult("shipBean");
		List<ShipDetailBean> shipDetailList=(List<ShipDetailBean>)resultBean.getListResult("shipDetailList");
		if(orderBean==null||transferBean==null||shipBean==null||transDetailList==null||transDetailList.isEmpty()||shipDetailList==null||shipDetailList.isEmpty()){
			return getResult("E","E003","数据库中没有找到计算运费所需要的合适数据。请各管理员联系。sapTransCode="+sapTransCode,true);
		}
		
		*//**
		 * 按正常方式进行运费计算
		 *//*
		List<FreightBean> freightList =this.calculateNormalFreight(sapTransList, transferBean, shipBean, shipDetailList);
		if(freightList==null||freightList.isEmpty()){
			System.out.println("无法按正常方式进行运费计算，请查检线路及运价。freightList==null||freightList.isEmpty()");
		}
		ShipDetailBean shipDetailBean=shipDetailList.get(0);
		//正常运费计算，freightType=1
		CustomerPriceBean customerPriceBean=PriceUtil.getCustomerPrice(shipDetailBean.getProductId()+"", shipDetailBean.getFactoryId(), transferBean.getAreaId(), orderBean.getCustomerId()+"", shipBean.getCreateTime());
		
		特殊客户运价计算，会对上一步的计算结果进行覆盖,优先第二，freightType=2
		if(customerPriceBean!=null){
			this.specialCustomerFreight(customerPriceBean, freightList);
		}
		
		按物流指定运价计算，会对上一步的计算结果进行覆盖,优先最高，freightType=3
		System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++transPriceBean:"+transPriceBean);
		if(transPriceBean!=null){
			this.specifyTransferFreight(transPriceBean, freightList);
		}
		
		将运算结果保存到数据中，并且组装返回 结果，或写回到SAP中去。
		 * 
		 
		this.saveFreight(freightList);
		
		return null;
	}*/
	
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
			System.out.println("保存运费结果不成功,resultBean==null|resultBean.isSuccess()==false");
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		CopyOfHtmsFreightBusiness freightBusiness = new CopyOfHtmsFreightBusiness();
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
		System.out.println("-------------------- pxml -----------------------");
		System.out.println(stockBuffer);
		System.out.println("-------------------- pxml -----------------------");*/
		
		List<SapTransferBean> sapTransList=new ArrayList<SapTransferBean>();
		SapTransferBean transBean = new SapTransferBean();
		/*
		 * productId=2,factoryId=1,areaId=341,tonAmount=212.00,applyTime=2017-09-25 09:49:33
priceBean==null,行项没有找到合适运价 001,sapTransferCode=0080001574,itemCode=000010
无法按正常方式进行运费计算，请查检线路及运价。freightList==null||freightList.isEmpty()
productId=2,factoryId=1,areaId=341,customerId=3203,applyTime=2017-09-25 09:49:33
		 */
		transBean.setTransferCode("0080001574");
		transBean.setItemCode("000010");
		transBean.setApplyTonNum("212.00");
		transBean.setEstimate("true");
		sapTransList.add(transBean);
		
		transBean = new SapTransferBean();
		transBean.setTransferCode("0080001574");
		transBean.setItemCode("000020");
		transBean.setApplyTonNum("100.00");
		transBean.setEstimate("true");
		sapTransList.add(transBean);
		freightBusiness.getFreight(sapTransList);
		//stockBusiness.getTransferHoldStock(stockBuffer.toString());
		//freightBusiness.getFreight(stockBuffer.toString());
	}
	
	

}
