package com.zzy.htms.logistic.transfer;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 调拨单实体类
 * @author zzy
 *
 */
public class TransferBean  extends AbstractBean  implements Serializable {
	private int transId;
	private int isValidate;
	private int logisticsId;
	private int corderId;
	private int customerId;
	private String customerAccount;  //获取客户余额
	
	private String transferCode;
	private String applyTonNum;
	private String applyPackNum;
	private String actualTonNum;
	private String actualPackNum;
	private String planFreight;
	private String actualFreight;
	private String freightUnit;
	private String shipNotice;
	private int transStatus;
	private String creator;
	private String createTime;
	private String modifier;
	private String modifyTime;
	private int shipId;
	private int isDefault;
	private int carrierId;
	private String  carrierName;
	private int caddrId;
	private int transDetailId;
	
	private String customerName;
	private String corderCode;
	private String mapId;
	private String mapCustomerId;
	
	private String custOrderCreateTime;

	

	private String meterialNo;
	private String meterialFactory;
	private String codetailCertificate;
	private String codetailCertificateDesc;
	

	private String areaId;
	private String areaName;
	private String caddrDetail;
	
	//联系人
	//CADDRCONTACTOR,CADDRTELEPHONE
	
	
	private String customerCode;
	private String shipCode;
	private String codetailId;
	

	/*贸易商自提信息*/
	private int selfFetch   ;
	private String fetchDriver;
	private String fetchMobile ;
	private String fetchCar    ;
	private int isUrgent;
	
	private boolean selfFetchPriceExist   ;  //是否存在自备车自提运价
	
	
	private String caddrContactor;
	private String caddrTelephone;
	private String sapTransCode;
	
	private String saleOrg;
	
	//申请时间
	private String shipApplyTime;
	
	//审批通过时间
	private String approveAgreeTime;
	
	//物流分配时间
	private String assignTime;
	
	private String province; //省
	private String city;	//市
	private String district;	//区
	
	//配送状态
	private String sendStatus;
	private String transportStatus;
	
	//业务员，销售人员
	private String saleMan;
	
	//运费单价
	private String freight ;
	//物料单价
	private String unitPrice ;
	
	//运费
    private String transportTotalPrice ;
    
    //数量
    private String detailApplyTonNum;
	
    //包数
    private String detailApplyPackNum;
    
    //工厂ID
    private String factoryId;
    
    //产品ID
    private String productId;
    
    //工厂名称
    private String factoryName;
    
    //产品名称
    private String productName;
    
    //装运点
    private String shipPointDesc;
    
    //是否自定义运费
    private int shipPriceMark;
    
    //是否合并，1代表合并，-1 代表取消合并，0代表默认没有合并
    private String isMerger;
    
    //合并的group组，同一个组对应的值相同
    private String mergerGroup;
    
    private String mergerTime;
    
    //运单创建时间
    private String transportCreateTime;
    //排车创建时间
    private String sendCreateTime;
    //派车时间
    private String sendTime;
    
    
    private String carrierCheck;
    
    
	public String getCarrierCheck() {
		return carrierCheck;
	}

	public void setCarrierCheck(String carrierCheck) {
		this.carrierCheck = carrierCheck;
	}

	public String getTransportCreateTime() {
		return transportCreateTime;
	}

	public void setTransportCreateTime(String transportCreateTime) {
		this.transportCreateTime = transportCreateTime;
	}

	public String getCarrierName() {
		return carrierName;
	}

	public void setCarrierName(String carrierName) {
		this.carrierName = carrierName;
	}

	public String getSendCreateTime() {
		return sendCreateTime;
	}

	public void setSendCreateTime(String sendCreateTime) {
		this.sendCreateTime = sendCreateTime;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public boolean isSelfFetchPriceExist() {
		return selfFetchPriceExist;
	}

	public void setSelfFetchPriceExist(boolean selfFetchPriceExist) {
		this.selfFetchPriceExist = selfFetchPriceExist;
	}

	public String getMergerTime() {
		return mergerTime;
	}

	public void setMergerTime(String mergerTime) {
		this.mergerTime = mergerTime;
	}

	public int getShipPriceMark() {
		return shipPriceMark;
	}

	public void setShipPriceMark(int shipPriceMark) {
		this.shipPriceMark = shipPriceMark;
	}

	public String getShipPointDesc() {
		return shipPointDesc;
	}

	public void setShipPointDesc(String shipPointDesc) {
		this.shipPointDesc = shipPointDesc;
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

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getDetailApplyTonNum() {
		return detailApplyTonNum;
	}

	public void setDetailApplyTonNum(String detailApplyTonNum) {
		this.detailApplyTonNum = detailApplyTonNum;
	}

	public String getDetailApplyPackNum() {
		return detailApplyPackNum;
	}

	public void setDetailApplyPackNum(String detailApplyPackNum) {
		this.detailApplyPackNum = detailApplyPackNum;
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

	public String getTransportTotalPrice() {
		return transportTotalPrice;
	}

	public void setTransportTotalPrice(String transportTotalPrice) {
		this.transportTotalPrice = transportTotalPrice;
	}

	public String getCustOrderCreateTime() {
		return custOrderCreateTime;
	}

	public void setCustOrderCreateTime(String custOrderCreateTime) {
		this.custOrderCreateTime = custOrderCreateTime;
	}

	public String getSaleMan() {
		return saleMan;
	}

	public void setSaleMan(String saleMan) {
		this.saleMan = saleMan;
	}

	public String getSaleOrg() {
		return saleOrg;
	}

	public void setSaleOrg(String saleOrg) {
		this.saleOrg = saleOrg;
	}

	public String getSapTransCode() {
		return sapTransCode;
	}

	public void setSapTransCode(String sapTransCode) {
		this.sapTransCode = sapTransCode;
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
		return fetchCar==null?"":fetchCar;
	}

	public void setFetchCar(String fetchCar) {
		this.fetchCar = fetchCar;
	}

	public int getIsUrgent() {
		return isUrgent;
	}

	public void setIsUrgent(int isUrgent) {
		this.isUrgent = isUrgent;
	}

	public String getCodetailId() {
		return codetailId;
	}

	public void setCodetailId(String codetailId) {
		this.codetailId = codetailId;
	}

	public String getShipCode() {
		return shipCode;
	}

	public void setShipCode(String shipCode) {
		this.shipCode = shipCode;
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

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getCaddrDetail() {
		return caddrDetail;
	}

	public void setCaddrDetail(String caddrDetail) {
		this.caddrDetail = caddrDetail;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getMapCustomerId() {
		return mapCustomerId;
	}

	public void setMapCustomerId(String mapCustomerId) {
		this.mapCustomerId = mapCustomerId;
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

	public void setTransId(int transId){
		this.transId=transId;
	}

	public int getTransId(){
		return this.transId;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setLogisticsId(int logisticsId){
		this.logisticsId=logisticsId;
	}

	public int getLogisticsId(){
		return this.logisticsId;
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

	/*public void setShipCode(String shipCode){
		this.shipCode=shipCode;
	}

	public String getShipCode(){
		return this.shipCode;
	}*/

	public String getTransferCode() {
		return transferCode;
	}

	public void setTransferCode(String transferCode) {
		this.transferCode = transferCode;
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

	public void setTransStatus(int transStatus){
		this.transStatus=transStatus;
	}

	public int getTransStatus(){
		return this.transStatus;
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

	public void setShipId(int shipId){
		this.shipId=shipId;
	}

	public int getShipId(){
		return this.shipId;
	}

	public int getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(int isDefault) {
		this.isDefault = isDefault;
	}

	public int getCarrierId() {
		return carrierId;
	}

	public void setCarrierId(int carrierId) {
		this.carrierId = carrierId;
	}

	public int getCaddrId() {
		return caddrId;
	}

	public void setCaddrId(int caddrId) {
		this.caddrId = caddrId;
	}

	public String getCustomerAccount() {
		return customerAccount;
	}

	public void setCustomerAccount(String customerAccount) {
		this.customerAccount = customerAccount;
	}

	public int getTransDetailId() {
		return transDetailId;
	}

	public void setTransDetailId(int transDetailId) {
		this.transDetailId = transDetailId;
	}

	public String getShipApplyTime() {
		return shipApplyTime;
	}

	public void setShipApplyTime(String shipApplyTime) {
		this.shipApplyTime = shipApplyTime;
	}

	public String getApproveAgreeTime() {
		return approveAgreeTime;
	}

	public void setApproveAgreeTime(String approveAgreeTime) {
		this.approveAgreeTime = approveAgreeTime;
	}

	public String getIsMerger() {
		return isMerger;
	}

	public void setIsMerger(String isMerger) {
		this.isMerger = isMerger;
	}

	public String getMergerGroup() {
		return mergerGroup;
	}

	public void setMergerGroup(String mergerGroup) {
		this.mergerGroup = mergerGroup;
	}

	public String getAssignTime() {
		return assignTime;
	}

	public void setAssignTime(String assignTime) {
		this.assignTime = assignTime;
	}

	public String getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(String sendStatus) {
		this.sendStatus = sendStatus;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getTransportStatus() {
		return transportStatus;
	}

	public void setTransportStatus(String transportStatus) {
		this.transportStatus = transportStatus;
	}

}

