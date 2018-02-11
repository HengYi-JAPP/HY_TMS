package com.zzy.htms.sales.customeraddr;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 客户地址库实体类
 * @author zzy
 *
 */
public class CustomerAddrBean  extends AbstractBean  implements Serializable {
	private int caddrId;
	private int customerId;
	private int areaId;
	private int isValidate;
	private String creator;
	private String createTime;
	private String caddrDetail;
	private String caddrContactor;
	private String caddrTelephone;
	private int isDefault;
	private String carNo;
	private String caddrNotice;
	private String customerName;
	private String areaName;
	private String mapId;
	private String areaCode;
	private String Address;
	
	private int targetCustomerId;
	
	public int getTargetCustomerId() {
		return targetCustomerId;
	}

	public void setTargetCustomerId(int targetCustomerId) {
		this.targetCustomerId = targetCustomerId;
	}

	public String getMapId() {
		return mapId;
	}

	public void setMapId(String mapId) {
		this.mapId = mapId;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public void setCaddrId(int caddrId){
		this.caddrId=caddrId;
	}

	public int getCaddrId(){
		return this.caddrId;
	}

	public void setCustomerId(int customerId){
		this.customerId=customerId;
	}

	public int getCustomerId(){
		return this.customerId;
	}

	public int getAreaId() {
		return areaId;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
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

	public void setCaddrDetail(String caddrDetail){
		this.caddrDetail=caddrDetail;
	}

	public String getCaddrDetail(){
		return this.caddrDetail;
	}

	public String getCaddrContactor() {
		return caddrContactor;
	}

	public void setCaddrContactor(String caddrContactor) {
		this.caddrContactor = caddrContactor;
	}

	public String getCaddrTelephone() {
		return caddrTelephone;
	}

	public void setCaddrTelephone(String caddrTelephone) {
		this.caddrTelephone = caddrTelephone;
	}

	public int getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
	}

	public String getCaddrNotice() {
		return caddrNotice;
	}

	public void setCaddrNotice(String caddrNotice) {
		this.caddrNotice = caddrNotice;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public String getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}


}

