package com.zzy.htms.logistic.transportdetail;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 运单详情实体类
 * @author zzy
 *
 */
public class TransportDetailBean  extends AbstractBean  implements Serializable {
	private int sportDetailId;
	private int isValidate;
	private int transportId;
	private int transferId;
	private int shipDetailId;
	private int codetailId;
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
	private int transDetailId;
	

	private String meterialNo;
	private String meterialFactory;
	private String codetailCertificate;
	private String codetailCertificateDesc;
	

	private String areaId;
	private String areaName;
	private String caddrDetail;
	private String customerCode;
	private String shipCode;
	
	private int transId;
	private int corderId;
	private String transportCode;
	private int transportStatus;
	private String transferCode;
	private String corderCode;

	private String factoryId;
	private String factoryName;
	private String productName;
	private String itemCode;
	
	private String shipPointDesc;
	

	public String getShipPointDesc() {
		return shipPointDesc;
	}

	public void setShipPointDesc(String shipPointDesc) {
		this.shipPointDesc = shipPointDesc;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
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

	/*public void setSendDetailId(int sendDetailId){
		this.sendDetailId=sendDetailId;
	}

	public int getSendDetailId(){
		return this.sendDetailId;
	}*/

	public String getTransferCode() {
		return transferCode;
	}

	public void setTransferCode(String transferCode) {
		this.transferCode = transferCode;
	}

	public String getCorderCode() {
		return corderCode;
	}

	public void setCorderCode(String corderCode) {
		this.corderCode = corderCode;
	}

	public int getTransportStatus() {
		return transportStatus;
	}

	public void setTransportStatus(int transportStatus) {
		this.transportStatus = transportStatus;
	}

	public int getTransId() {
		return transId;
	}

	public void setTransId(int transId) {
		this.transId = transId;
	}

	public int getCorderId() {
		return corderId;
	}

	public void setCorderId(int corderId) {
		this.corderId = corderId;
	}

	public String getTransportCode() {
		return transportCode;
	}

	public void setTransportCode(String transportCode) {
		this.transportCode = transportCode;
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

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getSportDetailId() {
		return sportDetailId;
	}

	public void setSportDetailId(int sportDetailId) {
		this.sportDetailId = sportDetailId;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setTransportId(int transportId){
		this.transportId=transportId;
	}

	public int getTransportId(){
		return this.transportId;
	}

	public void setTransferId(int transferId){
		this.transferId=transferId;
	}

	public int getTransferId(){
		return this.transferId;
	}

	public void setShipDetailId(int shipDetailId){
		this.shipDetailId=shipDetailId;
	}

	public int getShipDetailId(){
		return this.shipDetailId;
	}

	public void setCodetailId(int codetailId){
		this.codetailId=codetailId;
	}

	public int getCodetailId(){
		return this.codetailId;
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

	public void setTransDetailId(int transDetailId){
		this.transDetailId=transDetailId;
	}

	public int getTransDetailId(){
		return this.transDetailId;
	}


}

