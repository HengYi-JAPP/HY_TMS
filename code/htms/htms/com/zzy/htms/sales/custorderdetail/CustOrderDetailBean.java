package com.zzy.htms.sales.custorderdetail;
import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;

/**
 * 订单详情实体类
 * @author zzy
 *
 */
public class CustOrderDetailBean  extends AbstractBean  implements Serializable {
	/*private int codetailId;
	private int isValidate;
	private String codetailCertificate;
	private String meterialNo;
	private int meterialId;
	private String codetailCertificateDesc;
	private String orderAmount;
	private String orderUnit;
	private String projectVolume;
	private String volumeUnit;
	private String conditionSutotal;
	private String freight;
	private String unitPrice;
	private String docCondCount;
	private String alreadyGetNum;
	private String creator;
	private String createTime;
	private String modifier;
	private String modifyTiime;
	private int corderId;*/
	

	public static void main(String[] args) {
		System.out.println((new CustOrderDetailBean()).toBeanMap());
	}
	private String codetailId         ;
	private String corderId           ;
	private String saleNum            ;
	private String codetailCertificate;
	private String meterialFactory    ;
	private String meterialNo         ;
	private String meterialGroup;
	private String meterialId         ;
	private String codetailCertificateDesc;
	private String orderAmount     ;
	private String orderUnit       ;
	private String projectVolume   ;
	private String volumeUnit      ;
	private String conditionSutotal;
	private String freight         ;
	private String unitPrice       ;
	private String docCondCount    ;
	private String notLimitStorage ;
	private String postedStock     ;
	private String unpostedStock   ;
	private String deliveryStatus  ;
	private String partialDelivery ;
	private String dbPrice         ;
	private String alreadyGetNum   ;
	private String creator         ;
	private String createTime      ;
	private String modifier        ;
	private String modifyTiime     ;
	private String isValidate      ;
	

	private String appliableAmount;
	private String appliedAmount;
	private String productId;
	private String factoryId;
	private String factoryName;
	private String productName;
	private String factoryGroup;
	
	private String shipPoint;
	private String shipPointDesc;
	
	private String marketAvailableNum;
	
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

	public String getShipPointDesc() {
		return shipPointDesc;
	}

	public void setShipPointDesc(String shipPointDesc) {
		this.shipPointDesc = shipPointDesc;
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

	public String getFactoryGroup() {
		return factoryGroup;
	}

	public void setFactoryGroup(String factoryGroup) {
		this.factoryGroup = factoryGroup;
	}

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

	public String getAppliableAmount() {
		return appliableAmount;
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

	public String getCodetailId() {
		return codetailId;
	}
	
	public String getMeterialGroup() {
		return meterialGroup;
	}

	public void setMeterialGroup(String meterialGroup) {
		this.meterialGroup = meterialGroup;
	}

	public void setCodetailId(String codetailId) {
		this.codetailId = codetailId;
	}
	public String getCorderId() {
		return corderId;
	}
	public void setCorderId(String corderId) {
		this.corderId = corderId;
	}
	public String getSaleNum() {
		return saleNum;
	}
	public void setSaleNum(String saleNum) {
		this.saleNum = saleNum;
	}
	public String getCodetailCertificate() {
		return codetailCertificate;
	}
	public void setCodetailCertificate(String codetailCertificate) {
		this.codetailCertificate = codetailCertificate;
	}
	public String getMeterialFactory() {
		return meterialFactory;
	}
	public void setMeterialFactory(String meterialFactory) {
		this.meterialFactory = meterialFactory;
	}
	public String getMeterialNo() {
		return meterialNo;
	}
	public void setMeterialNo(String meterialNo) {
		this.meterialNo = meterialNo;
	}
	public String getMeterialId() {
		return meterialId;
	}
	public void setMeterialId(String meterialId) {
		this.meterialId = meterialId;
	}
	public String getCodetailCertificateDesc() {
		return codetailCertificateDesc;
	}
	public void setCodetailCertificateDesc(String codetailCertificateDesc) {
		this.codetailCertificateDesc = codetailCertificateDesc;
	}
	public String getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
	}
	public String getOrderUnit() {
		return orderUnit;
	}
	public void setOrderUnit(String orderUnit) {
		this.orderUnit = orderUnit;
	}
	public String getProjectVolume() {
		return projectVolume;
	}
	public void setProjectVolume(String projectVolume) {
		this.projectVolume = projectVolume;
	}
	public String getVolumeUnit() {
		return volumeUnit;
	}
	public void setVolumeUnit(String volumeUnit) {
		this.volumeUnit = volumeUnit;
	}
	public String getConditionSutotal() {
		return conditionSutotal;
	}
	public void setConditionSutotal(String conditionSutotal) {
		this.conditionSutotal = conditionSutotal;
	}
	public String getFreight() {
		return freight;
	}
	public void setFreight(String freight) {
		this.freight = freight;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getDocCondCount() {
		return docCondCount;
	}
	public void setDocCondCount(String docCondCount) {
		this.docCondCount = docCondCount;
	}
	public String getNotLimitStorage() {
		return notLimitStorage;
	}
	public void setNotLimitStorage(String notLimitStorage) {
		this.notLimitStorage = notLimitStorage;
	}
	public String getPostedStock() {
		return postedStock;
	}
	public void setPostedStock(String postedStock) {
		this.postedStock = postedStock;
	}
	public String getUnpostedStock() {
		return unpostedStock;
	}
	public void setUnpostedStock(String unpostedStock) {
		this.unpostedStock = unpostedStock;
	}
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}
	public String getPartialDelivery() {
		return partialDelivery;
	}
	public void setPartialDelivery(String partialDelivery) {
		this.partialDelivery = partialDelivery;
	}
	public String getDbPrice() {
		return dbPrice;
	}
	public void setDbPrice(String dbPrice) {
		this.dbPrice = dbPrice;
	}
	public String getAlreadyGetNum() {
		return alreadyGetNum;
	}
	public void setAlreadyGetNum(String alreadyGetNum) {
		this.alreadyGetNum = alreadyGetNum;
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
	public String getModifyTiime() {
		return modifyTiime;
	}
	public void setModifyTiime(String modifyTiime) {
		this.modifyTiime = modifyTiime;
	}
	public String getIsValidate() {
		return isValidate;
	}
	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}

/*	public void setCodetailId(int codetailId){
		this.codetailId=codetailId;
	}

	public int getCodetailId(){
		return this.codetailId;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setCodetailCertificate(String codetailCertificate){
		this.codetailCertificate=codetailCertificate;
	}

	public String getCodetailCertificate(){
		return this.codetailCertificate;
	}

	public void setMeterialNo(String meterialNo){
		this.meterialNo=meterialNo;
	}

	public String getMeterialNo(){
		return this.meterialNo;
	}

	public void setMeterialId(int meterialId){
		this.meterialId=meterialId;
	}

	public int getMeterialId(){
		return this.meterialId;
	}

	public void setCodetailCertificateDesc(String codetailCertificateDesc){
		this.codetailCertificateDesc=codetailCertificateDesc;
	}

	public String getCodetailCertificateDesc(){
		return this.codetailCertificateDesc;
	}

	public void setOrderAmount(String orderAmount){
		this.orderAmount=orderAmount;
	}

	public String getOrderAmount(){
		return this.orderAmount;
	}

	public void setOrderUnit(String orderUnit){
		this.orderUnit=orderUnit;
	}

	public String getOrderUnit(){
		return this.orderUnit;
	}

	public void setProjectVolume(String projectVolume){
		this.projectVolume=projectVolume;
	}

	public String getProjectVolume(){
		return this.projectVolume;
	}

	public void setVolumeUnit(String volumeUnit){
		this.volumeUnit=volumeUnit;
	}

	public String getVolumeUnit(){
		return this.volumeUnit;
	}

	public void setConditionSutotal(String conditionSutotal){
		this.conditionSutotal=conditionSutotal;
	}

	public String getConditionSutotal(){
		return this.conditionSutotal;
	}

	public void setFreight(String freight){
		this.freight=freight;
	}

	public String getFreight(){
		return this.freight;
	}

	public void setUnitPrice(String unitPrice){
		this.unitPrice=unitPrice;
	}

	public String getUnitPrice(){
		return this.unitPrice;
	}

	public void setDocCondCount(String docCondCount){
		this.docCondCount=docCondCount;
	}

	public String getDocCondCount(){
		return this.docCondCount;
	}

	public void setAlreadyGetNum(String alreadyGetNum){
		this.alreadyGetNum=alreadyGetNum;
	}

	public String getAlreadyGetNum(){
		return this.alreadyGetNum;
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

	public void setModifyTiime(String modifyTiime){
		this.modifyTiime=modifyTiime;
	}

	public String getModifyTiime(){
		return this.modifyTiime;
	}

	public void setCorderId(int corderId){
		this.corderId=corderId;
	}

	public int getCorderId(){
		return this.corderId;
	}*/


}

