package com.zzy.htms.sales.customer;
import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;

/**
 * 客户实体类
 * @author zzy
 *
 */
public class CustomerBean  extends AbstractBean  implements Serializable {
	private int customerId;
	private String customerCode;
	private String customerName;
	private int isValidate;
	private String customerAmount;
	private String creator;
	private String createTime;
	private String customerNotice;
	private String customerType;
	
	private String replaceCustomerCode;

	private String feeId;
	private String managementFee;
	private String isFee;
	
	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public void setCustomerId(int customerId){
		this.customerId=customerId;
	}

	public int getCustomerId(){
		return this.customerId;
	}

	public void setCustomerCode(String customerCode){
		this.customerCode=customerCode;
	}

	public String getCustomerCode(){
		return this.customerCode;
	}

	public void setCustomerName(String customerName){
		this.customerName=customerName;
	}

	public String getCustomerName(){
		return this.customerName;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setCustomerAmount(String customerAmount){
		this.customerAmount=customerAmount;
	}

	public String getCustomerAmount(){
		return this.customerAmount;
	}

	public void setCreator(String creator){
		this.creator=creator;
	}

	public String getCreator(){
		return this.creator;
	}

	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}

	public String getCreateTime(){
		return this.createTime;
	}

	public void setCustomerNotice(String customerNotice){
		this.customerNotice=customerNotice;
	}

	public String getCustomerNotice(){
		return this.customerNotice;
	}

	public String getReplaceCustomerCode() {
		return replaceCustomerCode;
	}

	public void setReplaceCustomerCode(String replaceCustomerCode) {
		this.replaceCustomerCode = replaceCustomerCode;
	}

	public String getFeeId() {
		return feeId;
	}

	public void setFeeId(String feeId) {
		this.feeId = feeId;
	}

	public String getManagementFee() {
		return managementFee;
	}

	public void setManagementFee(String managementFee) {
		this.managementFee = managementFee;
	}

	public String getIsFee() {
		return isFee;
	}

	public void setIsFee(String isFee) {
		this.isFee = isFee;
	}


}

