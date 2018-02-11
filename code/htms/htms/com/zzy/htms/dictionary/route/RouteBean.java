package com.zzy.htms.dictionary.route;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 线路实体类
 * @author zzy
 *
 */
public class RouteBean  extends AbstractBean  implements Serializable {
	private int routeId;
	private int factoryId;
	private int areaId;
	private int productId;
	private int isValidate;
	private String createTime;
	private int modifier;
	private String modifyTime;
	private int creator;
	
	private String areaName;
	private String factoryName;
	private String productName;
	
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

	

	public void setRouteId(int routeId){
		this.routeId=routeId;
	}

	public int getRouteId(){
		return this.routeId;
	}

	public void setFactoryId(int factoryId){
		this.factoryId=factoryId;
	}

	public int getFactoryId(){
		return this.factoryId;
	}

	public void setAreaId(int areaId){
		this.areaId=areaId;
	}

	public int getAreaId(){
		return this.areaId;
	}

	public void setProductId(int productId){
		this.productId=productId;
	}

	public int getProductId(){
		return this.productId;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setCreateTime(String createTime){
		this.createTime=createTime;
	}

	public String getCreateTime(){
		return this.createTime;
	}

	public void setModifier(int modifier){
		this.modifier=modifier;
	}

	public int getModifier(){
		return this.modifier;
	}

	public void setModifyTime(String modifyTime){
		this.modifyTime=modifyTime;
	}

	public String getModifyTime(){
		return this.modifyTime;
	}

	public void setCreator(int creator){
		this.creator=creator;
	}

	public int getCreator(){
		return this.creator;
	}


}

