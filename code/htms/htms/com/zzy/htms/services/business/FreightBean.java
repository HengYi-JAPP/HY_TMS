package com.zzy.htms.services.business;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;


/**
 * 正式运费实体类
 * @author zzy
 *
 */
public class FreightBean  extends AbstractBean  implements Serializable {
	private String freightId         ;
	private String shipId            ;
	private String transferId        ;
	private String sapCode           ;
	private String itemCode          ;
	private String subItemCode       ;
	//1:按照正常运价计算  2:按照客户特殊运价计算 3:按照调拨单指定运价计算
	private String freightType       ;
	private String freightStyle      ;
	private String freightModel      ;
	private String validateDate      ;
	private String applyTonNum       ;
	private String freightPrice      ;
	private String freightAmount     ;
	private String priceId           ;
	private String carrierPrice      ;
	private String carrierFreight    ;
	private String totalFreight;
	private String planFreightStyle  ;
	private String planFreightModel  ;
	private String planValidateDate  ;
	private String planFreightPrice  ;
	private String planPriceId       ;
	private String planFreight       ;
	private String favourFreight     ;
	private String planCarrierPrice  ;
	private String planCarrierFreight;
	private String freightBalance    ;
	private String freightTime       ;
	private String planTotalFreight;
	private String isValidate        ;
	private String planTotalCarrierFreight;
	private String totalCarrierFreight;
	
	private String orderId;
	private String orderCode;
	private String itemId;
	/*
	 *预估环节：1)申请环节 ，2）审批环节；3）物流环节
	 */
	private String estimateStep;
	private String userId;
	private String customerId;
	private String areaId;
	
	/*用来标识是否预估运费，默认为1为预估；0为真实运费*/
	private String isEstimate;
	private String routeId;
	
	/*发票运费*/
	private String invoiceFreight;
	public String getFreightId() {
		return freightId;
	}
	public void setFreightId(String freightId) {
		this.freightId = freightId;
	}
	public String getShipId() {
		return shipId;
	}
	public void setShipId(String shipId) {
		this.shipId = shipId;
	}
	public String getTransferId() {
		return transferId;
	}
	public void setTransferId(String transferId) {
		this.transferId = transferId;
	}
	public String getSapCode() {
		return sapCode;
	}
	public void setSapCode(String sapCode) {
		this.sapCode = sapCode;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getFreightType() {
		return freightType;
	}
	public void setFreightType(String freightType) {
		this.freightType = freightType;
	}
	public String getFreightStyle() {
		return freightStyle;
	}
	public void setFreightStyle(String freightStyle) {
		this.freightStyle = freightStyle;
	}
	public String getFreightModel() {
		return freightModel;
	}
	public void setFreightModel(String freightModel) {
		this.freightModel = freightModel;
	}
	public String getValidateDate() {
		return validateDate;
	}
	public void setValidateDate(String validateDate) {
		this.validateDate = validateDate;
	}
	public String getApplyTonNum() {
		return applyTonNum;
	}
	public void setApplyTonNum(String applyTonNum) {
		this.applyTonNum = applyTonNum;
	}
	public String getFreightPrice() {
		return freightPrice;
	}
	public void setFreightPrice(String freightPrice) {
		this.freightPrice = freightPrice;
	}
	public String getFreightAmount() {
		return freightAmount;
	}
	public void setFreightAmount(String freightAmount) {
		this.freightAmount = freightAmount;
	}
	public String getPriceId() {
		return priceId;
	}
	public void setPriceId(String priceId) {
		this.priceId = priceId;
	}
	public String getCarrierPrice() {
		return carrierPrice;
	}
	public void setCarrierPrice(String carrierPrice) {
		this.carrierPrice = carrierPrice;
	}
	public String getCarrierFreight() {
		return carrierFreight;
	}
	public void setCarrierFreight(String carrierFreight) {
		this.carrierFreight = carrierFreight;
	}
	public String getPlanFreightStyle() {
		return planFreightStyle;
	}
	public void setPlanFreightStyle(String planFreightStyle) {
		this.planFreightStyle = planFreightStyle;
	}
	public String getPlanFreightModel() {
		return planFreightModel;
	}
	public void setPlanFreightModel(String planFreightModel) {
		this.planFreightModel = planFreightModel;
	}
	public String getPlanValidateDate() {
		return planValidateDate;
	}
	public void setPlanValidateDate(String planValidateDate) {
		this.planValidateDate = planValidateDate;
	}
	public String getPlanFreightPrice() {
		return planFreightPrice;
	}
	public void setPlanFreightPrice(String planFreightPrice) {
		this.planFreightPrice = planFreightPrice;
	}
	public String getPlanPriceId() {
		return planPriceId;
	}
	public void setPlanPriceId(String planPriceId) {
		this.planPriceId = planPriceId;
	}
	public String getPlanFreight() {
		return planFreight;
	}
	public void setPlanFreight(String planFreight) {
		this.planFreight = planFreight;
	}
	public String getFavourFreight() {
		return favourFreight;
	}
	public void setFavourFreight(String favourFreight) {
		this.favourFreight = favourFreight;
	}
	public String getPlanCarrierPrice() {
		return planCarrierPrice;
	}
	public void setPlanCarrierPrice(String planCarrierPrice) {
		this.planCarrierPrice = planCarrierPrice;
	}
	public String getPlanCarrierFreight() {
		return planCarrierFreight;
	}
	public void setPlanCarrierFreight(String planCarrierFreight) {
		this.planCarrierFreight = planCarrierFreight;
	}
	public String getFreightBalance() {
		return freightBalance;
	}
	public void setFreightBalance(String freightBalance) {
		this.freightBalance = freightBalance;
	}
	public String getFreightTime() {
		return freightTime;
	}
	public void setFreightTime(String freightTime) {
		this.freightTime = freightTime;
	}
	public String getIsValidate() {
		return isValidate;
	}
	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}
	public String getTotalFreight() {
		return totalFreight;
	}
	public void setTotalFreight(String totalFreight) {
		this.totalFreight = totalFreight;
	}
	public String getPlanTotalFreight() {
		return planTotalFreight;
	}
	public void setPlanTotalFreight(String planTotalFreight) {
		this.planTotalFreight = planTotalFreight;
	}
	public String getPlanTotalCarrierFreight() {
		return planTotalCarrierFreight;
	}
	public void setPlanTotalCarrierFreight(String planTotalCarrierFreight) {
		this.planTotalCarrierFreight = planTotalCarrierFreight;
	}
	public String getTotalCarrierFreight() {
		return totalCarrierFreight;
	}
	public void setTotalCarrierFreight(String totalCarrierFreight) {
		this.totalCarrierFreight = totalCarrierFreight;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getEstimateStep() {
		return estimateStep;
	}
	public void setEstimateStep(String estimateStep) {
		this.estimateStep = estimateStep;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getIsEstimate() {
		return isEstimate;
	}
	public void setIsEstimate(String isEstimate) {
		this.isEstimate = isEstimate;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getAreaId() {
		return areaId;
	}
	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}
	public String getRouteId() {
		return routeId;
	}
	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}
	public String getSubItemCode() {
		return subItemCode;
	}
	public void setSubItemCode(String subItemCode) {
		this.subItemCode = subItemCode;
	}
	
	public String getInvoiceFreight() {
		return invoiceFreight;
	}
	public void setInvoiceFreight(String invoiceFreight) {
		this.invoiceFreight = invoiceFreight;
	}
	public static void main(String[] args){
		//System.out.println((new FreightBean()).toBeanMap());
	}
	
}
