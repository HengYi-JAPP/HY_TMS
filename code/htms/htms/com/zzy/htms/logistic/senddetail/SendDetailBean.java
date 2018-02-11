package com.zzy.htms.logistic.senddetail;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 派车表实体信息
 * @author zzy
 *
 */
public class SendDetailBean  extends AbstractBean  implements Serializable {
	private int sendDetailId;
	private int isValidate;
	private int transDetailId;
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
	private String useFreight;
	private String transDetailNotice;
	private String transDetailStatus;
	private String creator;
	private String createTime;
	private String modifier;
	private String modifyTime;
	private int sendId;
	private String driverName;
	private String driverMobile;
	private String vehicleNo;

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

	public void setSendDetailId(int sendDetailId){
		this.sendDetailId=sendDetailId;
	}

	public int getSendDetailId(){
		return this.sendDetailId;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setTransDetailId(int transDetailId){
		this.transDetailId=transDetailId;
	}

	public int getTransDetailId(){
		return this.transDetailId;
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

	public void setUseFreight(String useFreight){
		this.useFreight=useFreight;
	}

	public String getUseFreight(){
		return this.useFreight;
	}

	public void setTransDetailNotice(String transDetailNotice){
		this.transDetailNotice=transDetailNotice;
	}

	public String getTransDetailNotice(){
		return this.transDetailNotice;
	}

	public void setTransDetailStatus(String transDetailStatus){
		this.transDetailStatus=transDetailStatus;
	}

	public String getTransDetailStatus(){
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

	public void setSendId(int sendId){
		this.sendId=sendId;
	}

	public int getSendId(){
		return this.sendId;
	}


}

