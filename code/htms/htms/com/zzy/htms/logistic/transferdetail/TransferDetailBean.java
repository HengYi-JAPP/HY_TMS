package com.zzy.htms.logistic.transferdetail;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 调拨单详细信息实体类
 * @author zzy
 *
 */
public class TransferDetailBean  extends AbstractBean  implements Serializable {
	private int transDetailId;
	private int isValidate;
	private int transId;
	private int shipId;
	private int caddrId;
	private int productId;
	private String applyTonNum;
	private String applyPackNum;
	private String fetchTonNum;
	private String fetchPackNum;
	private String planFreight;
	private String actulFreight;
	private String freightUnit;
	private String transDetailNotice;
	private int transDetailStatus;
	private String creator;
	private String createTime;
	private String modifier;
	private String modifyTime;
	private int shipDetailId;
	private int carrierId;
	private String codetailId ;
	
	private String customerName;
	private String corderCode;
	private String mapId;
	private String mapCustomerId;
	
	private String itemCode;
	private String codetailCertificateDesc;
	private String codetailCertificate;
	private String meterialFactory;
	

	private String meterialNo;
	
	private String factoryId;
	private String factoryName;
	private String productName;
	private String stockNum;
	private String appliableAmount;
	private String appliedAmount;
	
	
	//运费单价
	private String freight ;
	//物料单价
	private String unitPrice ;
	
	//运费
    private String transportTotalPrice ;
    
    //装运点
    private String shipPointDesc;
    
    
	public String getShipPointDesc() {
		return shipPointDesc;
	}

	public void setShipPointDesc(String shipPointDesc) {
		this.shipPointDesc = shipPointDesc;
	}

	public String getTransportTotalPrice() {
		return transportTotalPrice;
	}

	public void setTransportTotalPrice(String transportTotalPrice) {
		this.transportTotalPrice = transportTotalPrice;
	}

	public String getCodetailId() {
		return codetailId;
	}

	public void setCodetailId(String codetailId) {
		this.codetailId = codetailId;
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

	public String getAppliedAmount() {
		return appliedAmount;
	}

	public void setAppliedAmount(String appliedAmount) {
		this.appliedAmount = appliedAmount;
	}

	public String getAppliableAmount() {
		return appliableAmount;
	}

	public void setAppliableAmount(String appliableAmount) {
		this.appliableAmount = appliableAmount;
	}

	public String getStockNum() {
		return stockNum;
	}

	public void setStockNum(String stockNum) {
		this.stockNum = stockNum;
	}

	public String getCodetailCertificate() {
		return codetailCertificate;
	}

	public void setCodetailCertificate(String codetailCertificate) {
		this.codetailCertificate = codetailCertificate;
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getMeterialNo() {
		return meterialNo;
	}

	public void setMeterialNo(String meterialNo) {
		this.meterialNo = meterialNo;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getCodetailCertificateDesc() {
		return codetailCertificateDesc;
	}

	public void setCodetailCertificateDesc(String codetailCertificateDesc) {
		this.codetailCertificateDesc = codetailCertificateDesc;
	}

	public String getMeterialFactory() {
		return meterialFactory;
	}

	public void setMeterialFactory(String meterialFactory) {
		this.meterialFactory = meterialFactory;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCorderCode() {
		return corderCode;
	}

	public void setCorderCode(String corderCode) {
		this.corderCode = corderCode;
	}

	public String getMapId() {
		return mapId;
	}

	public void setMapId(String mapId) {
		this.mapId = mapId;
	}

	public void setTransDetailId(int transDetailId){
		this.transDetailId=transDetailId;
	}

	public int getTransDetailId(){
		return this.transDetailId;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setTransId(int transId){
		this.transId=transId;
	}

	public int getTransId(){
		return this.transId;
	}

	public void setShipId(int shipId){
		this.shipId=shipId;
	}

	public int getShipId(){
		return this.shipId;
	}

	public void setCaddrId(int caddrId){
		this.caddrId=caddrId;
	}

	public int getCaddrId(){
		return this.caddrId;
	}

	public void setProductId(int productId){
		this.productId=productId;
	}

	public int getProductId(){
		return this.productId;
	}

	public void setApplyTonNum(String applyTonNum){
		this.applyTonNum=applyTonNum;
	}

	public String getApplyTonNum(){
		applyTonNum=applyTonNum==null?"0.0":applyTonNum.indexOf(".")==-1?applyTonNum+".00":applyTonNum;
		return this.applyTonNum;
	}

	public void setApplyPackNum(String applyPackNum){
		this.applyPackNum=applyPackNum;
	}

	public String getApplyPackNum(){
		return this.applyPackNum;
	}

	public void setFetchTonNum(String fetchTonNum){
		this.fetchTonNum=fetchTonNum;
	}

	public String getFetchTonNum(){
		return this.fetchTonNum;
	}

	public void setFetchPackNum(String fetchPackNum){
		this.fetchPackNum=fetchPackNum;
	}

	public String getFetchPackNum(){
		return this.fetchPackNum;
	}

	public void setPlanFreight(String planFreight){
		this.planFreight=planFreight;
	}

	public String getPlanFreight(){
		return this.planFreight;
	}

	public void setActulFreight(String actulFreight){
		this.actulFreight=actulFreight;
	}

	public String getActulFreight(){
		return this.actulFreight;
	}

	public void setFreightUnit(String freightUnit){
		this.freightUnit=freightUnit;
	}

	public String getFreightUnit(){
		return this.freightUnit;
	}

	public void setTransDetailNotice(String transDetailNotice){
		this.transDetailNotice=transDetailNotice;
	}

	public String getTransDetailNotice(){
		return this.transDetailNotice;
	}

	public void setTransDetailStatus(int transDetailStatus){
		this.transDetailStatus=transDetailStatus;
	}

	public int getTransDetailStatus(){
		return this.transDetailStatus;
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

	public void setShipDetailId(int shipDetailId){
		this.shipDetailId=shipDetailId;
	}

	public int getShipDetailId(){
		return this.shipDetailId;
	}

	public int getCarrierId() {
		return carrierId;
	}

	public void setCarrierId(int carrierId) {
		this.carrierId = carrierId;
	}

	public String getMapCustomerId() {
		return mapCustomerId;
	}

	public void setMapCustomerId(String mapCustomerId) {
		this.mapCustomerId = mapCustomerId;
	}
	

}

