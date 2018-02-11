package com.zzy.htms.parklogistics;


/**
 * 园区物流接口实现类
 * @author zzy
 *
 */
public class ParkLogisticsBean {
	
	private String exitTime              ;
	private String bindingTime           ;
	
    private String id                    ;       
	private String companyId             ;
	private String licenseNo             ;
	private String idNumber              ;
	private String driver                ;
	private String tel                   ;
	private String entryTime             ;
	private String startShipmentTime     ;
	private String endShipmentTime       ;
	private String createUser            ;
	private String createTime            ;
	private String updateUser            ;
	private String updateTime            ;
	private String companyCode           ;
	private String companyName           ;
	private String vehicleId             ;
	private String sapCode         ;   //sap中的调拨单号
	private String parkStatus            ;   //车辆在园区的状态     0,未到园区,1:已到园区,2:装载完毕,驶离园区
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCompanyId() {
		return companyId;
	}
	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}
	public String getLicenseNo() {
		return licenseNo;
	}
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEntryTime() {
		return entryTime;
	}
	public void setEntryTime(String entryTime) {
		this.entryTime = entryTime;
	}
	public String getExitTime() {
		return exitTime;
	}
	public void setExitTime(String exitTime) {
		this.exitTime = exitTime;
	}
	public String getBindingTime() {
		return bindingTime;
	}
	public void setBindingTime(String bindingTime) {
		this.bindingTime = bindingTime;
	}
	public String getStartShipmentTime() {
		return startShipmentTime;
	}
	public void setStartShipmentTime(String startShipmentTime) {
		this.startShipmentTime = startShipmentTime;
	}
	public String getEndShipmentTime() {
		return endShipmentTime;
	}
	public void setEndShipmentTime(String endShipmentTime) {
		this.endShipmentTime = endShipmentTime;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}
	public String getSapCode() {
		return sapCode;
	}
	public void setSapCode(String sapCode) {
		this.sapCode = sapCode;
	}
	public String getParkStatus() {
		return parkStatus;
	}
	public void setParkStatus(String parkStatus) {
		this.parkStatus = parkStatus;
	}
	

}
