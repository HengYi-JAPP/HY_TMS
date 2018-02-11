package com.zzy.htms.location;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;


/**
 * 定位最新地址实体类,仅存放当前transid的最新的地址解析后的记录
 * @author zzy
 *
 */
public class SendLocation  extends AbstractBean  implements Serializable{

	private String latitude;
	private String longitude;

	private String openId;

	private String transId;

	private String createTime;

	// String country ;
	private String province;
	private String city;
	private String district;
	
	private String modifyTime;
	
	public String getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getTransId() {
		return transId;
	}
	public void setTransId(String transId) {
		this.transId = transId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
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
	
}
