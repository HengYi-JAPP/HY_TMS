package com.zzy.htms.services.business;

public class SapTransferBean {
	/*sap中的调拨单号*/
	private String transferCode;
	/*sap中的调拨单行项目号*/
	private String itemCode;
	/*分拆后的*/
	private String subItemCode;

	/*sap中的物料号*/
	private String meterialCode;

	/*sap中的出库数量*/
	private String applyTonNum;
	
	/*sap中的出库数量*/
	private String meretialUnit;
	
	/*是否预估,默认为true，出库为了真实运费时要设置为false*/
	private String estimate;
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}


	public String getTransferCode() {
		return transferCode;
	}


	public void setTransferCode(String transferCode) {
		this.transferCode = transferCode;
	}


	public String getItemCode() {
		return itemCode;
	}


	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}


	public String getMeterialCode() {
		return meterialCode;
	}


	public void setMeterialCode(String meterialCode) {
		this.meterialCode = meterialCode;
	}


	public String getApplyTonNum() {
		return applyTonNum;
	}


	public void setApplyTonNum(String applyTonNum) {
		this.applyTonNum = applyTonNum;
	}


	public String getMeretialUnit() {
		return meretialUnit;
	}


	public void setMeretialUnit(String meretialUnit) {
		this.meretialUnit = meretialUnit;
	}


	public String getEstimate() {
		return estimate;
	}


	public void setEstimate(String estimate) {
		this.estimate = estimate;
	}

	public boolean isEstimate(){
		return this.estimate!=null&&"false".equalsIgnoreCase(this.estimate.trim())?false:true;
	}


	public String getSubItemCode() {
		return subItemCode;
	}


	public void setSubItemCode(String subItemCode) {
		this.subItemCode = subItemCode;
	}
	
}
