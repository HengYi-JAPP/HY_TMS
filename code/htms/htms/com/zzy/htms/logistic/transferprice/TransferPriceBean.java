package com.zzy.htms.logistic.transferprice;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;


/**
 * 指定运价实体类
 * @author zzy
 *
 */
public class TransferPriceBean  extends AbstractBean  implements Serializable {

	
	private String priceId         ;
	private String transId         ;
	private String priceType       ;
	private String freightModel    ;
	private String customerPrice   ;
	private String carrierPrice    ;
	private String customerOnePrice;
	private String carrierOnePrice ;
	private String priceUnit       ;
	private String validateDate    ;
	private String priceNotice     ;
	private String creator         ;
	private String createTime      ;
	private String modifier        ;
	private String modifyTime      ;
	private String isValidate      ;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println((new TransferPriceBean()).toBeanMap());

	}
	public String getPriceId() {
		return priceId;
	}
	public void setPriceId(String priceId) {
		this.priceId = priceId;
	}
	public String getTransId() {
		return transId;
	}
	public void setTransId(String transId) {
		this.transId = transId;
	}
	public String getPriceType() {
		return priceType;
	}
	public void setPriceType(String priceType) {
		this.priceType = priceType;
	}
	public String getFreightModel() {
		return freightModel;
	}
	public void setFreightModel(String freightModel) {
		this.freightModel = freightModel;
	}
	public String getCustomerPrice() {
		return customerPrice;
	}
	public void setCustomerPrice(String customerPrice) {
		this.customerPrice = customerPrice;
	}
	public String getCarrierPrice() {
		return carrierPrice;
	}
	public void setCarrierPrice(String carrierPrice) {
		this.carrierPrice = carrierPrice;
	}
	public String getCustomerOnePrice() {
		return customerOnePrice;
	}
	public void setCustomerOnePrice(String customerOnePrice) {
		this.customerOnePrice = customerOnePrice;
	}
	public String getCarrierOnePrice() {
		return carrierOnePrice;
	}
	public void setCarrierOnePrice(String carrierOnePrice) {
		this.carrierOnePrice = carrierOnePrice;
	}
	public String getPriceUnit() {
		return priceUnit;
	}
	public void setPriceUnit(String priceUnit) {
		this.priceUnit = priceUnit;
	}
	public String getValidateDate() {
		return validateDate;
	}
	public void setValidateDate(String validateDate) {
		this.validateDate = validateDate;
	}
	public String getPriceNotice() {
		return priceNotice;
	}
	public void setPriceNotice(String priceNotice) {
		this.priceNotice = priceNotice;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	public String getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}
	public String getIsValidate() {
		return isValidate;
	}
	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}

}
