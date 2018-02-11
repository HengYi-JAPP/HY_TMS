package com.zzy.htms.dictionary.area;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 地址库实体bean
 * @author zzy
 *
 */
public class AreaBean  extends AbstractBean  implements Serializable {
	private int areaId;
	private int parentAreaId;
	private String areaCode;
	private int isValidate;
	private int areaLevel;
	private String areaRoute;
	private String areaName;
	private String areaLongTitue;
	private String areaLaTitue;
	private String areaParentCode;
	private int isLeaf;
	
	private int intAreaId;
	
	
	
	public int getIntAreaId() {
		return intAreaId;
	}

	public void setIntAreaId(int intAreaId) {
		this.intAreaId = intAreaId;
	}

	public void setAreaId(int areaId){
		this.areaId=areaId;
	}

	public int getAreaId(){
		return this.areaId;
	}

	public void setParentAreaId(int parentAreaId){
		this.parentAreaId=parentAreaId;
	}

	public int getParentAreaId(){
		return this.parentAreaId;
	}

	public void setAreaCode(String areaCode){
		this.areaCode=areaCode;
	}

	public String getAreaCode(){
		return this.areaCode;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setAreaLevel(int areaLevel){
		this.areaLevel=areaLevel;
	}

	public int getAreaLevel(){
		return this.areaLevel;
	}

	public void setAreaRoute(String areaRoute){
		this.areaRoute=areaRoute;
	}

	public String getAreaRoute(){
		return this.areaRoute;
	}

	public void setAreaName(String areaName){
		this.areaName=areaName;
	}

	public String getAreaName(){
		return this.areaName;
	}

	public String getAreaLongTitue() {
		return areaLongTitue;
	}

	public void setAreaLongTitue(String areaLongTitue) {
		this.areaLongTitue = areaLongTitue;
	}

	public String getAreaLaTitue() {
		return areaLaTitue;
	}

	public void setAreaLaTitue(String areaLaTitue) {
		this.areaLaTitue = areaLaTitue;
	}

	public String getAreaParentCode() {
		return areaParentCode;
	}

	public void setAreaParentCode(String areaParentCode) {
		this.areaParentCode = areaParentCode;
	}

	public int getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(int isLeaf) {
		this.isLeaf = isLeaf;
	}

	private int provinceId;
	private int cityId;
	private int countyId;
	private int countryId;



	public int getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public int getCountyId() {
		return countyId;
	}

	public void setCountyId(int countyId) {
		this.countyId = countyId;
	}

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
	}
	
}

