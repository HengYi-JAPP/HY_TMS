package com.zzy.htms.sales.ship;
import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;


/**
 * 发货申请实体类
 * @author zzy
 *
 */
public class ShipBean  extends AbstractBean  implements Serializable {
	private int shipId;
	private int corderId;
	private int customerId;
	private String shipCode;
	private String applyTonNum;
	private String applyPackNum;
	private String actualTonNum;
	private String actualPackNum;
	private String planFreight;
	private String actualFreight;
	private String freightUnit;
	private String shipNotice;
	private int applier;
	private String applyTime;
	private int applyStatus;
	private String approver;
	private String approveTime;
	private String approveNotice;
	private String creator;
	private String createTime;
	private String modifier;
	private String modifyTime;
	private int isValidate;
	private String customerName;
	private String corderCode;
	private String mapId;
	private int caddrId;
	
	private String codetailId;
	private String shipDetailId;
	private String shipDetailStatus;
	private int targetCorderId;
	

	private String meterialNo;
	private String codetailCertificate;
	private String codetailCertificateDesc;
	

	private String areaId;
	private String areaName;
	private String caddrDetail;
	private String customerCode;
	private String caddrContactor;
	
	/*贸易商自提信息*/
	private int selfFetch   ;
	private String fetchDriver;
	private String fetchMobile ;
	private String fetchCar    ;
	private int isUrgent;
	
	
	private String orderCode;
	private String saleOrg;
	
	private String unitPrice;
	private String caddrTelephone="";
	private String factoryName="";
	private String saleMan="";
	private String productName="";
	
	private int transStatus;
	private String transId;
	
	
	private String productId;
	private String factoryId;
	private String itemCode;
	
	private String shortStock;
	private String shortNotice;
	private String shortTime;
	
	private String totalFreight;
	private String freightPrice;//单价
	private String freight;//预估运价
	private String freightModel;//计价方式
	

	public String getFreightModel() {
		return freightModel;
	}

	public void setFreightModel(String freightModel) {
		this.freightModel = freightModel;
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

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getShortStock() {
		return shortStock;
	}

	public void setShortStock(String shortStock) {
		this.shortStock = shortStock;
	}

	public String getShortNotice() {
		return shortNotice;
	}

	public void setShortNotice(String shortNotice) {
		this.shortNotice = shortNotice;
	}

	public String getShortTime() {
		return shortTime;
	}

	public void setShortTime(String shortTime) {
		this.shortTime = shortTime;
	}

	public String getTransId() {
		return transId;
	}

	public void setTransId(String transId) {
		this.transId = transId;
	}

	public int getTransStatus() {
		return transStatus;
	}

	public void setTransStatus(int transStatus) {
		this.transStatus = transStatus;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getSaleMan() {
		return saleMan;
	}

	public void setSaleMan(String saleMan) {
		this.saleMan = saleMan;
	}

	public String getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getCaddrTelephone() {
		return caddrTelephone;
	}

	public void setCaddrTelephone(String caddrTelephone) {
		this.caddrTelephone = caddrTelephone;
	}

	public String getFactoryName() {
		return factoryName;
	}

	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}

	public String getSaleOrg() {
		return saleOrg;
	}

	public void setSaleOrg(String saleOrg) {
		this.saleOrg = saleOrg;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public int getIsUrgent() {
		return isUrgent;
	}

	public void setIsUrgent(int isUrgent) {
		this.isUrgent = isUrgent;
	}

	public int getSelfFetch() {
		return selfFetch;
	}

	public void setSelfFetch(int selfFetch) {
		this.selfFetch = selfFetch;
	}

	public String getFetchDriver() {
		return fetchDriver;
	}

	public void setFetchDriver(String fetchDriver) {
		this.fetchDriver = fetchDriver;
	}

	public String getFetchMobile() {
		return fetchMobile;
	}

	public void setFetchMobile(String fetchMobile) {
		this.fetchMobile = fetchMobile;
	}

	public String getFetchCar() {
		return fetchCar;
	}

	public void setFetchCar(String fetchCar) {
		this.fetchCar = fetchCar;
	}

	public String getCodetailId() {
		return codetailId;
	}

	public void setCodetailId(String codetailId) {
		this.codetailId = codetailId;
	}

	public String getShipDetailId() {
		return shipDetailId;
	}

	public void setShipDetailId(String shipDetailId) {
		this.shipDetailId = shipDetailId;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getCaddrDetail() {
		return caddrDetail;
	}

	public void setCaddrDetail(String caddrDetail) {
		this.caddrDetail = caddrDetail;
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

	public String getCodetailCertificateDesc() {
		return codetailCertificateDesc;
	}

	public void setCodetailCertificateDesc(String codetailCertificateDesc) {
		this.codetailCertificateDesc = codetailCertificateDesc;
	}

	public int getTargetCorderId() {
		return targetCorderId;
	}

	public void setTargetCorderId(int targetCorderId) {
		this.targetCorderId = targetCorderId;
	}

	public String getShipDetailStatus() {
		return shipDetailStatus;
	}

	public void setShipDetailStatus(String shipDetailStatus) {
		this.shipDetailStatus = shipDetailStatus;
	}

	public String getMapId() {
		return mapId;
	}

	public void setMapId(String mapId) {
		this.mapId = mapId;
	}

	public String getCorderCode() {
		return corderCode;
	}

	public void setCorderCode(String corderCode) {
		this.corderCode = corderCode;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public void setShipId(int shipId){
		this.shipId=shipId;
	}

	public int getShipId(){
		return this.shipId;
	}

	public void setCorderId(int corderId){
		this.corderId=corderId;
	}

	public int getCorderId(){
		return this.corderId;
	}

	public void setCustomerId(int customerId){
		this.customerId=customerId;
	}

	public int getCustomerId(){
		return this.customerId;
	}

	public void setShipCode(String shipCode){
		this.shipCode=shipCode;
	}

	public String getShipCode(){
		return this.shipCode;
	}

	public void setApplyTonNum(String applyTonNum){
		this.applyTonNum=applyTonNum;
	}

	public String getApplyTonNum(){
		return this.applyTonNum;
	}

	public void setApplyPackNum(String applyPackNum){
		this.applyPackNum=applyPackNum;
	}

	public String getApplyPackNum(){
		return this.applyPackNum;
	}

	public void setActualTonNum(String actualTonNum){
		this.actualTonNum=actualTonNum;
	}

	public String getActualTonNum(){
		return this.actualTonNum;
	}

	public void setActualPackNum(String actualPackNum){
		this.actualPackNum=actualPackNum;
	}

	public String getActualPackNum(){
		return this.actualPackNum;
	}

	public void setPlanFreight(String planFreight){
		this.planFreight=planFreight;
	}

	public String getPlanFreight(){
		return this.planFreight;
	}

	public void setActualFreight(String actualFreight){
		this.actualFreight=actualFreight;
	}

	public String getActualFreight(){
		return this.actualFreight;
	}

	public void setFreightUnit(String freightUnit){
		this.freightUnit=freightUnit;
	}

	public String getFreightUnit(){
		return this.freightUnit;
	}

	public void setShipNotice(String shipNotice){
		this.shipNotice=shipNotice;
	}

	public String getShipNotice(){
		return this.shipNotice;
	}

	public void setApplier(int applier){
		this.applier=applier;
	}

	public int getApplier(){
		return this.applier;
	}

	public void setApplyTime(String applyTime){
		this.applyTime=applyTime;
	}

	public String getApplyTime(){
		return this.applyTime;
	}

	public void setApplyStatus(int applyStatus){
		this.applyStatus=applyStatus;
	}

	public int getApplyStatus(){
		return this.applyStatus;
	}

	public void setApprover(String approver){
		this.approver=approver;
	}

	public String getApprover(){
		return this.approver;
	}

	public void setApproveTime(String approveTime){
		this.approveTime=approveTime;
	}

	public String getApproveTime(){
		return this.approveTime;
	}

	public void setApproveNotice(String approveNotice){
		this.approveNotice=approveNotice;
	}

	public String getApproveNotice(){
		return this.approveNotice;
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

	public void setModifier(String modifier){
		this.modifier=modifier;
	}

	public String getModifier(){
		return this.modifier;
	}

	public void setModifyTime(String modifyTime){
		this.modifyTime=modifyTime;
	}

	public String getModifyTime(){
		return this.modifyTime;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public int getCaddrId() {
		return caddrId;
	}

	public void setCaddrId(int caddrId) {
		this.caddrId = caddrId;
	}

	public String getCaddrContactor() {
		return caddrContactor;
	}

	public void setCaddrContactor(String caddrContactor) {
		this.caddrContactor = caddrContactor;
	}

	public String getTotalFreight() {
		return totalFreight;
	}

	public void setTotalFreight(String totalFreight) {
		this.totalFreight = totalFreight;
	}

	public String getFreightPrice() {
		return freightPrice;
	}

	public void setFreightPrice(String freightPrice) {
		this.freightPrice = freightPrice;
	}

	public String getFreight() {
		return freight;
	}

	public void setFreight(String freight) {
		this.freight = freight;
	}

}

