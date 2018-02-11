package com.zzy.htms.sales.custorder;
import java.io.Serializable;
import java.math.BigDecimal;

import com.mobilecn.beans.AbstractBean;

/**
 * 订单实体类
 * @author zzy
 *
 */
public class CustOrderBean  extends AbstractBean  implements Serializable {
	/*private int corderId;
	private int isValidate;
	private String corderName;
	private String corderCode;
	private String customerCode;
	private String saleNum;
	private String saleChannel;
	private String productGroup;
	private String saleGroup;
	private String saleDepartment;
	private String saleType;
	private String exchangeTitle;
	private String fetchFactory;
	private int deliveryStatus;
	private String createDate;
	private String crecateTime;
	private String creator;
	private String inputTime;
	private int customerId;*/

	private int corderId      ;
	private int customerId    ;
	private String corderName    ;
	private String corderCode    ;
	private String customerCode  ;
	private String customerName  ;
	private String saleType      ;
	private String saleNum       ;
	
	private String exchangeTitle ;
	private String saleOrg       ;
	private String saleChannel   ;
	private String productGroup  ;
	private String saleGroup     ;
	private String saleDepartment;
	private String fetchFactory  ;
	private String saleMan       ;
	private String deliveryStatus;
	private String createDate    ;
	private String createTime   ;
	private String creator       ;
	private String inputTime     ;
	private int isValidate    ;
	private String mapId;
	private String orderAmount;
	private String shipId;
	private String applyStatus;
	private String meterialNo;
	private String codetailCertificate;
	private String codetailCertificateDesc;
	private String appliableAmount;
	private String appliedAmount;
	private int codetailId;
	private String unitPrice;
	private String freight;
	private String customerAmount;
	
	private String marketAvailableNum; //建议可发货数量
	/*
	 * 包数
	 */
	private String projectVolume;
	
	private String shipPoint;
	
	public String getMarketAvailableNum() {
		return marketAvailableNum;
	}

	public void setMarketAvailableNum(String marketAvailableNum) {
		this.marketAvailableNum = marketAvailableNum;
	}

	public String getShipPoint() {
		return shipPoint;
	}

	public void setShipPoint(String shipPoint) {
		this.shipPoint = shipPoint;
	}

	public String getProjectVolume() {
		return projectVolume;
	}

	public void setProjectVolume(String projectVolume) {
		this.projectVolume = projectVolume;
	}

	private String factoryId;
	private String productId;
	private String factoryName;
	private String productName;
	
	public String getFactoryId() {
		return factoryId;
	}

	public void setFactoryId(String factoryId) {
		this.factoryId = factoryId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getCustomerAmount() {
		return customerAmount;
	}

	public void setCustomerAmount(String customerAmount) {
		this.customerAmount = customerAmount;
	}

	public String getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getCodetailCertificateDesc() {
		return codetailCertificateDesc;
	}

	public void setCodetailCertificateDesc(String codetailCertificateDesc) {
		this.codetailCertificateDesc = codetailCertificateDesc;
	}

	public String getMeterialNo() {
		return meterialNo;
	}

	public void setMeterialNo(String meterialNo) {
		this.meterialNo = meterialNo;
	}

	public String getCodetailCertificate() {
		return codetailCertificate;
	}

	public void setCodetailCertificate(String codetailCertificate) {
		this.codetailCertificate = codetailCertificate;
	}

	public String getShipId() {
		return shipId;
	}

	public void setShipId(String shipId) {
		this.shipId = shipId;
	}

	public String getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}

	public String getOrderAmount() {
		return orderAmount;
	}
	

	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}

	public String getMapId() {
		return mapId;
	}

	public void setMapId(String mapId) {
		this.mapId = mapId;
	}

	public void setCorderId(int corderId){
		this.corderId=corderId;
	}

	public int getCorderId(){
		return this.corderId;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setCorderName(String corderName){
		this.corderName=corderName;
	}

	public String getCorderName(){
		return this.corderName;
	}

	public void setCorderCode(String corderCode){
		this.corderCode=corderCode;
	}

	public String getCorderCode(){
		return this.corderCode;
	}

	public void setCustomerCode(String customerCode){
		this.customerCode=customerCode;
	}

	public String getCustomerCode(){
		return this.customerCode;
	}

	public void setSaleNum(String saleNum){
		this.saleNum=saleNum;
	}

	public String getSaleNum(){
		return this.saleNum;
	}

	public void setSaleChannel(String saleChannel){
		this.saleChannel=saleChannel;
	}

	public String getSaleChannel(){
		return this.saleChannel;
	}

	public void setProductGroup(String productGroup){
		this.productGroup=productGroup;
	}

	public String getProductGroup(){
		return this.productGroup;
	}

	public void setSaleGroup(String saleGroup){
		this.saleGroup=saleGroup;
	}

	public String getSaleGroup(){
		return this.saleGroup;
	}

	public void setSaleDepartment(String saleDepartment){
		this.saleDepartment=saleDepartment;
	}

	public String getSaleDepartment(){
		return this.saleDepartment;
	}

	public void setSaleType(String saleType){
		this.saleType=saleType;
	}

	public String getSaleType(){
		return this.saleType;
	}

	public void setExchangeTitle(String exchangeTitle){
		this.exchangeTitle=exchangeTitle;
	}

	public String getExchangeTitle(){
		return this.exchangeTitle;
	}

	public void setFetchFactory(String fetchFactory){
		this.fetchFactory=fetchFactory;
	}

	public String getFetchFactory(){
		return this.fetchFactory;
	}

	public void setDeliveryStatus(String deliveryStatus){
		this.deliveryStatus=deliveryStatus;
	}

	public String getDeliveryStatus(){
		return this.deliveryStatus;
	}

	public void setCreateDate(String createDate){
		this.createDate=createDate;
	}

	public String getCreateDate(){
		return this.createDate;
	}


	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public void setCreator(String creator){
		this.creator=creator;
	}

	public String getCreator(){
		return this.creator;
	}

	public void setInputTime(String inputTime){
		this.inputTime=inputTime;
	}

	public String getInputTime(){
		return this.inputTime;
	}

	public void setCustomerId(int customerId){
		this.customerId=customerId;
	}

	public int getCustomerId(){
		return this.customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getSaleOrg() {
		return saleOrg;
	}

	public void setSaleOrg(String saleOrg) {
		this.saleOrg = saleOrg;
	}

	public String getSaleMan() {
		return saleMan;
	}

	public void setSaleMan(String saleMan) {
		this.saleMan = saleMan;
	}

	private int customerSize=0;
	
	
	public int getCustomerSize() {
		return customerSize;
	}
	public void addCustomerSize(int size) {
		this.customerSize =this.customerSize+ size;
	}
	public void setCustomerSize(int customerSize) {
		this.customerSize = customerSize;
	}

	public boolean isAppliable(){
		if(this.getAppliableAmount()==null&this.getOrderAmount()!=null){
			return true;
		}
		BigDecimal appliable = new BigDecimal(this.getAppliableAmount());
		BigDecimal zero = new BigDecimal("0");
		int result = appliable.compareTo(zero);
		if (result <1){ // 为0
			return false;
		}else{
			return true;
		}
	}
	public String getAppliableAmount() {
		return appliableAmount==null||"".equals(appliableAmount.trim())?"0":appliableAmount;
	}

	public void setAppliableAmount(String appliableAmount) {
		this.appliableAmount = appliableAmount;
	}

	public String getAppliedAmount() {
		return appliedAmount;
	}

	public void setAppliedAmount(String appliedAmount) {
		this.appliedAmount = appliedAmount;
	}

	public int getCodetailId() {
		return codetailId;
	}

	public void setCodetailId(int codetailId) {
		this.codetailId = codetailId;
	}

	public String getFreight() {
		return freight;
	}

	public void setFreight(String freight) {
		this.freight = freight;
	}

	public static void main(String[] args) {
		System.out.println((new CustOrderBean()).toBeanMap());
	}
}

