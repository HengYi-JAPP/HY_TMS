package com.zzy.htms.logistic.transport;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 运单实体类
 * @author zzy
 *
 */
public class TransportBean  extends AbstractBean  implements Serializable {
	private int transportId;
	private int isValidate;
	private int transId;

	private int corderId;
	private String transportCode;
	private String planTime;
	private String applyTonNum;
	private String applyPackNum;
	private String actaulTonNum;
	private String actaulPackNum;
	private String planFreight;
	private String actaulFreight;
	private String freightUnit;
	
	//分配的备注
	private String transportNotice;
	
	private int transportStatus;
	private String creator;
	private String createTime;
	private String modifier;
	private String modifyTime;
	private int carrierId;
	private String carrierName;
	private String driverName="";
	private String driverMobile;
	private String vehicleNo;
	private int  sendId;
	private int sendDetailId;

	private String customerName;
	private String corderCode;
	private String mapId;
	private String mapCustomerId;
	private String transferCode;

	

	private String meterialNo;
	private String meterialFactory;
	private String codetailCertificate;
	private String codetailCertificateDesc;
	

	private String areaId;
	private String areaName;
	private String caddrDetail;
	private String customerCode;
	private String shipCode;
	private String codetailId;
	private int sendStatus=0;
	private String sportDetailNotice;
	
	
	

	private String sapTransCode="";
	
	
	private String factoryName="";
	private String productName="";
	private String carNo="";
	private String caddrContactor="";
	private String caddrTelephone="";
	private int isUrgent;
	
	//业务员备注
	private String shipNotice;
	
	private String shipPointDesc;  //装运点
	
	
	
	 //是否合并，1代表合并，-1 代表取消合并，0代表默认没有合并，从调拨单表获取
    private String isMerger;
    
    //合并的group组，同一个组对应的值相同，从调拨单表获取
    private String mergerGroup;
	
  //物流分配时间
	private String assignTime;
	
	public String getShipPointDesc() {
		return shipPointDesc;
	}

	public void setShipPointDesc(String shipPointDesc) {
		this.shipPointDesc = shipPointDesc;
	}

	public String getAssignTime() {
		return assignTime;
	}

	public void setAssignTime(String assignTime) {
		this.assignTime = assignTime;
	}

	public int getIsUrgent() {
		return isUrgent;
	}

	public void setIsUrgent(int isUrgent) {
		this.isUrgent = isUrgent;
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

	public String getCarNo() {
		return carNo;
	}

	public void setCarNo(String carNo) {
		this.carNo = carNo;
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

	public String getSapTransCode() {
		return sapTransCode;
	}

	public void setSapTransCode(String sapTransCode) {
		this.sapTransCode = sapTransCode;
	}
	
	

	public String getSportDetailNotice() {
		return sportDetailNotice;
	}

	public void setSportDetailNotice(String sportDetailNotice) {
		this.sportDetailNotice = sportDetailNotice;
	}

	public int getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(int sendStatus) {
		this.sendStatus = sendStatus;
	}

	public String getTransferCode() {
		return transferCode;
	}

	public void setTransferCode(String transferCode) {
		this.transferCode = transferCode;
	}

	public int getCorderId() {
		return corderId;
	}

	public void setCorderId(int corderId) {
		this.corderId = corderId;
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

	public String getMapCustomerId() {
		return mapCustomerId;
	}

	public void setMapCustomerId(String mapCustomerId) {
		this.mapCustomerId = mapCustomerId;
	}

	public String getMeterialNo() {
		return meterialNo;
	}

	public void setMeterialNo(String meterialNo) {
		this.meterialNo = meterialNo;
	}

	public String getMeterialFactory() {
		return meterialFactory;
	}

	public void setMeterialFactory(String meterialFactory) {
		this.meterialFactory = meterialFactory;
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

	public String getShipCode() {
		return shipCode;
	}

	public void setShipCode(String shipCode) {
		this.shipCode = shipCode;
	}

	public String getCodetailId() {
		return codetailId;
	}

	public void setCodetailId(String codetailId) {
		this.codetailId = codetailId;
	}

	public int getSendId() {
		return sendId;
	}

	public void setSendId(int sendId) {
		this.sendId = sendId;
	}

	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getDriverMobile() {
		return driverMobile;
	}

	public void setDriverMobile(String driverMobile) {
		this.driverMobile = driverMobile;
	}

	public String getVehicleNo() {
		return vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public String getCarrierName() {
		return carrierName;
	}

	public void setCarrierName(String carrierName) {
		this.carrierName = carrierName;
	}

	public void setTransportId(int transportId){
		this.transportId=transportId;
	}

	public int getTransportId(){
		return this.transportId;
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

	public void setTransportCode(String transportCode){
		this.transportCode=transportCode;
	}

	public String getTransportCode(){
		return this.transportCode;
	}

	public void setPlanTime(String planTime){
		this.planTime=planTime;
	}

	public String getPlanTime(){
		return this.planTime;
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

	public void setActaulTonNum(String actaulTonNum){
		this.actaulTonNum=actaulTonNum;
	}

	public String getActaulTonNum(){
		return this.actaulTonNum;
	}

	public void setActaulPackNum(String actaulPackNum){
		this.actaulPackNum=actaulPackNum;
	}

	public String getActaulPackNum(){
		return this.actaulPackNum;
	}

	public void setPlanFreight(String planFreight){
		this.planFreight=planFreight;
	}

	public String getPlanFreight(){
		return this.planFreight;
	}

	public void setActaulFreight(String actaulFreight){
		this.actaulFreight=actaulFreight;
	}

	public String getActaulFreight(){
		return this.actaulFreight;
	}

	public void setFreightUnit(String freightUnit){
		this.freightUnit=freightUnit;
	}

	public String getFreightUnit(){
		return this.freightUnit;
	}

	public void setTransportStatus(int transportStatus){
		this.transportStatus=transportStatus;
	}

	public int getTransportStatus(){
		return this.transportStatus;
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

	public void setCarrierId(int carrierId){
		this.carrierId=carrierId;
	}

	public int getCarrierId(){
		return this.carrierId;
	}

	public int getSendDetailId() {
		return sendDetailId;
	}

	public void setSendDetailId(int sendDetailId) {
		this.sendDetailId = sendDetailId;
	}

	public String getTransportNotice() {
		return transportNotice;
	}

	public void setTransportNotice(String transportNotice) {
		this.transportNotice = transportNotice;
	}

	public String getShipNotice() {
		return shipNotice;
	}

	public void setShipNotice(String shipNotice) {
		this.shipNotice = shipNotice;
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

}

