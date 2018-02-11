package com.zzy.htms.sales.shipdetail;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 发货申请详情实体类
 * @author zzy
 *
 */
public class ShipDetailBean  extends AbstractBean  implements Serializable {
	private int shipDetailId;
	private int isValidate;
	private int caddrId;
	private int codetailId;
	private int productId;
	private String appliableAmount;
	private String appliedAmount;
	private String applyTonNum;
	private String applyPackNum;
	private String fetchTonNum;
	private String fetchPackNum;
	private String planFreight;
	private String actulFreight;
	private String freightUnit;
	private String shipDetailNotice;
	private int shipDetailStatus;
	private String createTime;
	private String creator;
	private String modifier;
	private String modifyTime;
	private int shipId;
	private String corderCode;
	private String customerName;
	private String mapId;
	private String itemCode;
	private String codetailCertificateDesc;
	private String meterialFactory;
	private String factoryId;
	private String factoryName;
	private String productName;
	private String orderAmount;
	private String codetailCertificate;
	

	private String meterialNo;
	private String stockNum;
	
	private String areaId;
	private String areaName;
	private String caddrDetail;
	
	
	private String customerCode;
	private String caddrContactor;	
	/*贸易商自提信息*/
	private int isUrgent;
	
	private String orderCode;
	private String saleOrg;
	
	private String caddrTelephone="";
	private String saleMan="";	
	private int transStatus;
	private int applyStatus;

	private String shipCode;
	
	public String getShipCode() {
		return shipCode;
	}

	public void setShipCode(String shipCode) {
		this.shipCode = shipCode;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getCaddrContactor() {
		return caddrContactor;
	}

	public void setCaddrContactor(String caddrContactor) {
		this.caddrContactor = caddrContactor;
	}

	public int getIsUrgent() {
		return isUrgent;
	}

	public void setIsUrgent(int isUrgent) {
		this.isUrgent = isUrgent;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getSaleOrg() {
		return saleOrg;
	}

	public void setSaleOrg(String saleOrg) {
		this.saleOrg = saleOrg;
	}

	public String getCaddrTelephone() {
		return caddrTelephone;
	}

	public void setCaddrTelephone(String caddrTelephone) {
		this.caddrTelephone = caddrTelephone;
	}

	public String getSaleMan() {
		return saleMan;
	}

	public void setSaleMan(String saleMan) {
		this.saleMan = saleMan;
	}

	public int getTransStatus() {
		return transStatus;
	}

	public void setTransStatus(int transStatus) {
		this.transStatus = transStatus;
	}

	public int getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(int applyStatus) {
		this.applyStatus = applyStatus;
	}

	public String getCaddrDetail() {
		return caddrDetail;
	}

	public void setCaddrDetail(String caddrDetail) {
		this.caddrDetail = caddrDetail;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	/**
	 * <map property="freight" javaType="java.lang.String" column="FREIGHT" colType=""/>
		<map property="unitPrice" javaType="java.lang.String" column="UNITPRICE" colType=""/>
	 * @return
	 */
	private String freight;
	private String unitPrice;
	private String itemFreight="0.00";


	public String getItemFreight() {
		return itemFreight;
	}

	public void setItemFreight(String itemFreight) {
		this.itemFreight = itemFreight;
	}

	public String getFreight() {
		return freight==null||"".equals(freight.trim())?"0":freight;
	}

	public void setFreight(String freight) {
		this.freight = freight;
	}

	public String getUnitPrice() {
		return  unitPrice==null||"".equals(unitPrice.trim())?"0":unitPrice;
	}

	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getCodetailCertificate() {
		return codetailCertificate;
	}

	public void setCodetailCertificate(String codetailCertificate) {
		this.codetailCertificate = codetailCertificate;
	}

	public String getMeterialNo() {
		return meterialNo;
	}

	public void setMeterialNo(String meterialNo) {
		this.meterialNo = meterialNo;
	}

	public String getStockNum() {
		return stockNum==null||"".equals(stockNum.trim())?"0":stockNum;
	}

	public void setStockNum(String stockNum) {
		this.stockNum = stockNum;
	}

	public String getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(String orderAmount) {
		this.orderAmount = orderAmount;
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
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
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

	public void setShipDetailId(int shipDetailId){
		this.shipDetailId=shipDetailId;
	}

	public int getShipDetailId(){
		return this.shipDetailId;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setCaddrId(int caddrId){
		this.caddrId=caddrId;
	}

	public int getCaddrId(){
		return this.caddrId;
	}

	public void setCodetailId(int codetailId){
		this.codetailId=codetailId;
	}

	public int getCodetailId(){
		return this.codetailId;
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

	public void setShipDetailNotice(String shipDetailNotice){
		this.shipDetailNotice=shipDetailNotice;
	}

	public String getShipDetailNotice(){
		return this.shipDetailNotice;
	}

	public void setShipDetailStatus(int shipDetailStatus){
		this.shipDetailStatus=shipDetailStatus;
	}

	public int getShipDetailStatus(){
		return this.shipDetailStatus;
	}

	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}

	public String getCreateTime(){
		return this.createTime;
	}

	public void setCreator(String creator){
		this.creator=creator;
	}

	public String getCreator(){
		return this.creator;
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

	public void setShipId(int shipId){
		this.shipId=shipId;
	}

	public int getShipId(){
		return this.shipId;
	}


}

