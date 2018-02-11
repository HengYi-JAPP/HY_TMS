package com.zzy.htms.user;


/**
 * 用户实体类
 * @author zzy
 *
 */
public class HtmsUserBean extends com.mobilecn.privilege.user.UserBean{
	public HtmsUserBean(){
		super();
	}
	public String userId;
	public String account;
	public String userName;
	public String sex;
	public String photo;
	public String tel;
	public String mobile;
	public String email;
	public String qq;
	public String isValidate;
	public String department;
	public String subDepartment;
	public String password;
	//public String userType;
	public String orderId;
	public String isAuth;
	
	//private int userId;
	public String userType;
	public String dicName;
	public String salesNo;
	public String dicId;
	public String carrierId;
	private int customerType=0;
	
	private String employNo;
	
	private String syncEmployNo;

	private String factoryId;
	private String factoryName;

	private String customerCode;
	private String isFee;
	private String managementFee;
	private String createTime;
	private String feeId;
	
	
	public String getSyncEmployNo() {
		return syncEmployNo;
	}
	public void setSyncEmployNo(String syncEmployNo) {
		this.syncEmployNo = syncEmployNo;
	}
	public String getFactoryId() {
		return factoryId;
	}
	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}
	public String getFactoryName() {
		return factoryName;
	}
	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}
	public String getEmployNo() {
		return employNo;
	}
	public void setEmployNo(String employNo) {
		this.employNo = employNo;
	}
	public int getCustomerType() {
		return customerType;
	}
	public void setCustomerType(int customerType) {
		this.customerType = customerType;
	}
	public String getCarrierId() {
		return carrierId;
	}
	public void setCarrierId(String carrierId) {
		this.carrierId = carrierId;
	}
	public String getDicId() {
		return dicId;
	}
	public void setDicId(String dicId) {
		this.dicId = dicId;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getFeeId() {
		return feeId;
	}
	public void setFeeId(String feeId) {
		this.feeId = feeId;
	}
	/*public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}*/
	public String getSalesNo() {
		return salesNo;
	}
	public void setSalesNo(String salesNo) {
		this.salesNo = salesNo;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getDicName() {
		return dicName;
	}
	public void setDicName(String dicName) {
		this.dicName = dicName;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getIsValidate() {
		return isValidate;
	}
	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getSubDepartment() {
		return subDepartment;
	}
	public void setSubDepartment(String subDepartment) {
		this.subDepartment = subDepartment;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getIsAuth() {
		return isAuth;
	}
	public void setIsAuth(String isAuth) {
		this.isAuth = isAuth;
	}
	public static void main(String[] args){
		System.out.println((new HtmsUserBean()).toBeanMap());
	}
	public String getCustomerCode() {
		return customerCode;
	}
	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}
	public String getIsFee() {
		return isFee;
	}
	public void setIsFee(String isFee) {
		this.isFee = isFee;
	}
	public String getManagementFee() {
		return managementFee;
	}
	public void setManagementFee(String managementFee) {
		this.managementFee = managementFee;
	}

}
