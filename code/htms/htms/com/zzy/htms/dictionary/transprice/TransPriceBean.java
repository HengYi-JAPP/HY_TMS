package com.zzy.htms.dictionary.transprice;
import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;

import com.mobilecn.beans.AbstractBean;

/**
 * 正常运价实体类
 * @author zzy
 *
 */
public class TransPriceBean  extends AbstractBean  implements Serializable {
	private String mapId;
	private int priceId;
	private int routeId;
	private int priceType;
	private String customerPrice;
	private String carrierPrice;
	private int isValidate;
	private String priceEnd;
	private String priceUnit;
	private String creator;
	private String createTime;
	private String modifier;
	private String modifyTime;
	private String priceStart;
	private String customerOnePrice;
	private String carrierOnePrice;

	private int factoryId;
	private int areaId;
	private int productId;
	
	private String areaName;
	private String factoryName;
	private String productName;

	private String typeId;
	private String typeName;
	private String dicId;
	private String dicName;
	
	
	private String priceNotice;
	
	private String targeRoutetId;
	private String freightModel;
	private String validateDate;
	
	private BigDecimal startValue=null;
	private BigDecimal endValue=null;
	private long longValidateDate = -1;
	public BigDecimal getStartValue(){
		if(this.startValue==null){
			this.startValue=new BigDecimal(this.getPriceStart());
		}
		return this.startValue;
	}
	

	public BigDecimal getEndValue(){
		if(this.endValue==null){
			this.endValue=new BigDecimal(this.getPriceEnd());
		}
		return this.endValue;
	}
	public long getLongValidateDate(){
		if(this.longValidateDate>0){
			return this.longValidateDate;
		}
		this.longValidateDate=pasreDateTimeToLong(this.getValidateDate(), null);
		return this.longValidateDate;
	}
	
	
	public static long pasreDateTimeToLong(String dattime,String format){
		if(dattime==null||dattime.length()<8){
			return -1;
		}
		format =format==null||"".equals(format.trim())?"yyyyMMdd hh:mm:ss":format;
		
//		System.out.println(format);
		
		String temTime =dattime.replaceAll("\\D", "");
//		System.out.println("temTime1----->"+temTime);
		if(temTime.length()==8){
			dattime=temTime+" 00:00:00";
		}
//		System.out.println("dattime2----->"+dattime);
		if(temTime.length()==10){
			dattime=temTime.substring(0,8)+" "+temTime.substring(8,10)+"00:00";
		}
//		System.out.println("dattime3----->"+dattime);
		if(temTime.length()==12){
			dattime=temTime.substring(0,8)+" "+temTime.substring(8,10)+"00:00";
		}
//		System.out.println("dattime4----->"+dattime);
		if(temTime.length()==10){
			dattime=temTime.substring(0,8)+" "+temTime.substring(8,10)+":"+temTime.substring(10,12)+":00";
		}
//		System.out.println("dattime5----->"+dattime);
		if(temTime.length()==14){
			dattime=temTime.substring(0,8)+" "+temTime.substring(8,10)+":"+temTime.substring(10,12)+":"+temTime.substring(12,14);
		}
//		System.out.println("dattime6----->"+dattime);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		
		long millionSeconds;
		try {
			millionSeconds = simpleDateFormat.parse(dattime).getTime();
			return millionSeconds;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	
	public String getValidateDate() {
		return validateDate;
	}

	public void setValidateDate(String validateDate) {
		this.validateDate = validateDate;
	}

	public String getFreightModel() {
		return freightModel;
	}

	public void setFreightModel(String freightModel) {
		this.freightModel = freightModel;
	}

	public String getTargeRoutetId() {
		return targeRoutetId;
	}

	public String getPriceNotice() {
		return priceNotice;
	}


	public void setPriceNotice(String priceNotice) {
		this.priceNotice = priceNotice;
	}


	public void setTargeRoutetId(String targeRoutetId) {
		this.targeRoutetId = targeRoutetId;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getDicId() {
		return dicId;
	}

	public void setDicId(String dicId) {
		this.dicId = dicId;
	}

	public String getDicName() {
		return dicName;
	}

	public void setDicName(String dicName) {
		this.dicName = dicName;
	}

	public String getMapId() {
		return mapId;
	}

	public void setMapId(String mapId) {
		this.mapId = mapId;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
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

	
	
	public int getFactoryId() {
		return factoryId;
	}

	public void setFactoryId(int factoryId) {
		this.factoryId = factoryId;
	}

	public int getAreaId() {
		return areaId;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	
	
	public void setPriceId(int priceId){
		this.priceId=priceId;
	}

	public int getPriceId(){
		return this.priceId;
	}

	public void setRouteId(int routeId){
		this.routeId=routeId;
	}

	public int getRouteId(){
		return this.routeId;
	}

	public void setPriceType(int priceType){
		this.priceType=priceType;
	}

	public int getPriceType(){
		return this.priceType;
	}

	public void setCustomerPrice(String customerPrice){
		this.customerPrice=customerPrice;
	}

	public String getCustomerPrice(){
		return this.customerPrice;
	}

	public String getCustomerOnePrice() {
		return customerOnePrice;
	}

	public void setCustomerOnePrice(String customerOnePrice) {
		this.customerOnePrice = customerOnePrice;
	}

	public String getCarrierOnePrice() {
		return carrierOnePrice;
	}

	public void setCarrierOnePrice(String carrierOnePrice) {
		this.carrierOnePrice = carrierOnePrice;
	}

	public void setCarrierPrice(String carrierPrice){
		this.carrierPrice=carrierPrice;
	}

	public String getCarrierPrice(){
		return this.carrierPrice;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setPriceEnd(String priceEnd){
		this.priceEnd=priceEnd;
	}

	public String getPriceEnd(){
		return this.priceEnd;
	}

	public void setPriceUnit(String priceUnit){
		this.priceUnit=priceUnit;
	}

	public String getPriceUnit(){
		return this.priceUnit;
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

	public void setPriceStart(String priceStart){
		this.priceStart=priceStart;
	}

	public String getPriceStart(){
		return this.priceStart;
	}


}

