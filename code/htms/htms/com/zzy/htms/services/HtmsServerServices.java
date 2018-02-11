package com.zzy.htms.services;

import com.zzy.htms.services.business.HtmsHoldStockBusiness;
import com.zzy.htms.services.business.HtmsTransferTraceBusiness;
import com.zzy.htms.webservice.market.order.HtmsArrangeGoodsBussiness;
import com.zzy.htms.webservice.market.order.HtmsCustomerAddressBussiness;
import com.zzy.htms.webservice.market.order.HtmsEstimateTransferFreightBussiness;
import com.zzy.htms.webservice.market.order.HtmsTransferQueryBussiness;

public class HtmsServerServices {
	
	public String getHoldStock(String pxml){
		HtmsHoldStockBusiness stockBusiness = new HtmsHoldStockBusiness();
		System.out.println("pxml="+pxml);
		//String pxml="";
		return stockBusiness.getTransferHoldStock(pxml);
	}
	
	
	public String getTransferTraceInfor(String orderInfo){
		HtmsTransferTraceBusiness transferBusiness = new HtmsTransferTraceBusiness();
		return transferBusiness.getTransferTraceInfor(orderInfo);
	}
	
	
	public String  agreeArrangeGoods(String shipInfo){
		HtmsArrangeGoodsBussiness arrangeGoods = new HtmsArrangeGoodsBussiness();
		return arrangeGoods.agreeArrangeGoods(shipInfo);
	}
	
	public String  rejectArrangeGoods(String rejectShipInfo){
		HtmsArrangeGoodsBussiness arrangeGoods = new HtmsArrangeGoodsBussiness();
		return arrangeGoods.rejectArrangeGoods(rejectShipInfo);
	}
	
	public String  getShipInfo(String shipStatusInfo){
		HtmsTransferQueryBussiness bussiness = new HtmsTransferQueryBussiness();
		return bussiness.queryShipInfo(shipStatusInfo);
	}
	
	public String getEstimateShipFreight(String estimateShipInfor){
		HtmsEstimateTransferFreightBussiness bussiness = new HtmsEstimateTransferFreightBussiness();
		return bussiness.getEstimateTransferFreight(estimateShipInfor);
	}
	
	public String getCustomerAddress(String customerInfor){
		HtmsCustomerAddressBussiness bussiness = new HtmsCustomerAddressBussiness();
		return bussiness.getCustomerAddress(customerInfor);
	}
	
	public String freightCharge(String freightChargeXml){
		return null;
	}
	
	public String estimateFreightCharge(String estimateFreightChargeXml){
		return null;
	}

	/**
	 * @param args
	 */
	/*public static void main(String[] args) {
		// TODO Auto-generated method stub

	}*/

}
