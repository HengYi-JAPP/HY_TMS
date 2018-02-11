package com.zzy.htms.sales.customerprice;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;

import com.mobilecn.beans.AbstractBean;

/**
 * 特授客户运价实体类
 * @author zzy
 *
 */
public class CustomerPriceBean extends AbstractBean  implements Serializable{
	private int priceId;
	private int customerId;
	private int routeId;
	private int priceType;
	private String customerPrice;
	private String companyPrice;
	private String carrierPrice;
	private String priceStart;
	private String priceEnd;
	private String priceUnit;
	private String validateDate;
	private int creator;
	private String createTime;
	private int modifier;
	private String modifyTime;
	private int isValidate;
	private String customerOnePrice;
	private String carrierOnePrice;
	
	private String customerName;
	private String mapId;
	
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
	
	private String targetRouteId;
	private String freightModel;
	
	private BigDecimal startValue=null;
	private BigDecimal endValue=null;
	private long longValidateDate = -1;
	
	
	public String getFreightModel() {
		return freightModel;
	}
	public void setFreightModel(String freightModel) {
		this.freightModel = freightModel;
	}
	public BigDecimal getStartValue() {
		if(this.startValue==null){
			this.startValue=new BigDecimal(this.getPriceStart());
		}
		return startValue;
	}
	public void setStartValue(BigDecimal startValue) {
		this.startValue = startValue;
	}
	public BigDecimal getEndValue() {
		if(this.endValue==null){
			this.endValue=new BigDecimal(this.getPriceEnd());
		}
		return endValue;
	}
	public void setEndValue(BigDecimal endValue) {
		this.endValue = endValue;
	}
	/*public long getLongValidateDate() {
		return longValidateDate;
	}*/
	public void setLongValidateDate(long longValidateDate) {
		this.longValidateDate = longValidateDate;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getTargetRouteId() {
		return targetRouteId;
	}
	public void setTargetRouteId(String targetRouteId) {
		this.targetRouteId = targetRouteId;
	}
	public String getMapId() {
		return mapId;
	}
	public void setMapId(String mapId) {
		this.mapId = mapId;
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
	public int getPriceId() {
		return priceId;
	}
	public void setPriceId(int priceId) {
		this.priceId = priceId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getRouteId() {
		return routeId;
	}
	public void setRouteId(int routeId) {
		this.routeId = routeId;
	}
	public int getPriceType() {
		return priceType;
	}
	public void setPriceType(int priceType) {
		this.priceType = priceType;
	}
	public String getCustomerPrice() {
		return customerPrice;
	}
	public void setCustomerPrice(String customerPrice) {
		this.customerPrice = customerPrice;
	}
	public String getCompanyPrice() {
		return companyPrice;
	}
	public void setCompanyPrice(String companyPrice) {
		this.companyPrice = companyPrice;
	}
	public String getCarrierPrice() {
		return carrierPrice;
	}
	public void setCarrierPrice(String carrierPrice) {
		this.carrierPrice = carrierPrice;
	}
	public String getPriceStart() {
		return priceStart;
	}
	public void setPriceStart(String priceStart) {
		this.priceStart = priceStart;
	}
	public String getPriceEnd() {
		return priceEnd;
	}
	public void setPriceEnd(String priceEnd) {
		this.priceEnd = priceEnd;
	}
	public String getPriceUnit() {
		return priceUnit;
	}
	public void setPriceUnit(String priceUnit) {
		this.priceUnit = priceUnit;
	}
	public String getValidateDate() {
		return validateDate;
	}
	public void setValidateDate(String validateDate) {
		this.validateDate = validateDate;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public int getModifier() {
		return modifier;
	}
	public void setModifier(int modifier) {
		this.modifier = modifier;
	}
	public String getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}
	public int getIsValidate() {
		return isValidate;
	}
	public void setIsValidate(int isValidate) {
		this.isValidate = isValidate;
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
	public static void main(String[] args) {
		System.out.println(new CustomerPriceBean().toBeanMap());
		System.out.println(new CustomerPriceBean().toOperation("TB_HTMS_CUSTOMER_PRICE"));
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
}
