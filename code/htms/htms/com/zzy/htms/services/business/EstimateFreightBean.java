package com.zzy.htms.services.business;


/**
 * 预估运费实体类
 * @author zzy
 *
 */
public class EstimateFreightBean {
	private String orderId;
	private String itemId;
	private String orderCode;
	private String itemCode;
	private String productId;
	//private String productCode;
	private String factoryId;
	//private String factoryCode;
	private String areaId;
	private String areaCode;
	private String customerId;
	//private String customerCode;
	private String applyTonNum;
	private String applyTime;
	private String shipId;
	private String tranferId;
	
	private boolean selfFetch;  //是否自提
	private String  selfFetchType;  //自提类型,1为贸易商自提,2为客户自备车自提
	private String customerCode ;
	/*
	 *预估环节：1)申请环节 ，2）审批环节；3）物流环节
	 */
	private String estimateStep;
	private String userId;

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getSelfFetchType() {
		return selfFetchType;
	}

	public void setSelfFetchType(String selfFetchType) {
		this.selfFetchType = selfFetchType;
	}

	public boolean isSelfFetch() {
		return selfFetch;
	}

	public void setSelfFetch(boolean selfFetch) {
		this.selfFetch = selfFetch;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getFactoryId() {
		return factoryId;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getApplyTonNum() {
		return applyTonNum;
	}

	public void setApplyTonNum(String applyTonNum) {
		this.applyTonNum = applyTonNum;
	}

	public String getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
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

	public String getShipId() {
		return shipId;
	}

	public void setShipId(String shipId) {
		this.shipId = shipId;
	}

	public String getTranferId() {
		return tranferId;
	}

	public void setTranferId(String tranferId) {
		this.tranferId = tranferId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
