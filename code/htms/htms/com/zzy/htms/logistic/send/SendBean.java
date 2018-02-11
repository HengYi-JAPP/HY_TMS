package com.zzy.htms.logistic.send;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 派车表实体类
 * @author zzy
 *
 */
public class SendBean  extends AbstractBean  implements Serializable {
	private int sendId;
	private int isValidate;
	private int vehicleId;
	private int driverId;
	private int carrierId;
	private int transId;
	private String sendCode;
	private String planTime;
	private String applyTonNum;
	private String applyPackNum;
	private String actaulTonNum;
	private String actaulPackNum;
	private String planFreight;
	private String actaulFreight;
	private String freightUnit;
	private int sendStatus;
	private String signProof;
	private String creator;
	private String createTime;
	private String modifier;
	private String modifyTime;
	private int transportId;
	private String driverName;
	private String driverMobile;
	private String driverIdNum;
	private String vehicleNo;
	private String detailTime;
	
	private String sapTransCode;
	private String transferCreateTime;
	private String shipId;
	
	
	//派车时间
	private String sendTime;

	private String sendNotice;
	private String transportCode;
	private String transportStatus;
	
	//收货人、联系方式、地址
	private String caddrContactor;
	private String caddrTelephone;
	private String areaId;
	private String areaName;
	
	private String customerName;
	
	
	
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getTransferCreateTime() {
		return transferCreateTime;
	}

	public void setTransferCreateTime(String transferCreateTime) {
		this.transferCreateTime = transferCreateTime;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getTransportCode() {
		return transportCode;
	}

	public void setTransportCode(String transportCode) {
		this.transportCode = transportCode;
	}

	public String getTransportStatus() {
		return transportStatus;
	}

	public void setTransportStatus(String transportStatus) {
		this.transportStatus = transportStatus;
	}

	public String getDriverIdNum() {
		return driverIdNum;
	}

	public void setDriverIdNum(String driverIdNum) {
		this.driverIdNum = driverIdNum;
	}

	public String getDetailTime() {
		return detailTime;
	}

	public void setDetailTime(String detailTime) {
		this.detailTime = detailTime;
	}

	public String getSendNotice() {
		return sendNotice;
	}

	public void setSendNotice(String sendNotice) {
		this.sendNotice = sendNotice;
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

	public void setSendId(int sendId){
		this.sendId=sendId;
	}

	public int getSendId(){
		return this.sendId;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setVehicleId(int vehicleId){
		this.vehicleId=vehicleId;
	}

	public int getVehicleId(){
		return this.vehicleId;
	}

	public void setDriverId(int driverId){
		this.driverId=driverId;
	}

	public int getDriverId(){
		return this.driverId;
	}

	public void setCarrierId(int carrierId){
		this.carrierId=carrierId;
	}

	public int getCarrierId(){
		return this.carrierId;
	}

	public void setTransId(int transId){
		this.transId=transId;
	}

	public int getTransId(){
		return this.transId;
	}

	public void setSendCode(String sendCode){
		this.sendCode=sendCode;
	}

	public String getSendCode(){
		return this.sendCode;
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

	public void setSendStatus(int sendStatus){
		this.sendStatus=sendStatus;
	}

	public int getSendStatus(){
		return this.sendStatus;
	}

	public void setSignProof(String signProof){
		this.signProof=signProof;
	}

	public String getSignProof(){
		return this.signProof;
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

	public void setTransportId(int transportId){
		this.transportId=transportId;
	}

	public int getTransportId(){
		return this.transportId;
	}

	public String getSapTransCode() {
		return sapTransCode;
	}

	public void setSapTransCode(String sapTransCode) {
		this.sapTransCode = sapTransCode;
	}

	public String getShipId() {
		return shipId;
	}

	public void setShipId(String shipId) {
		this.shipId = shipId;
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


}

