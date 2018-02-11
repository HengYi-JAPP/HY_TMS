package com.zzy.htms.location;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;

/**
 * 微信用户信息对象
 * @author zm
 *
 */
public class User  extends AbstractBean  implements Serializable{

	private String openId	 ;    //用户的唯一标识
	private String nickName ;    //	用户昵称
	private String sex	 ;       //用户的性别，值为1时是男性，值为2时是女性，值为0时是未知
	private String province ;    //	用户个人资料填写的省份
	private String city	 ;        //普通用户个人资料填写的城市
	private String country	 ;    //国家，如中国为CN
	private String headImgurl	 ;    //用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。
	private String privilege	 ;    //用户特权信息，json 数组，如微信沃卡用户为（chinaunicom）
	private String unionId	 ;    //只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。
	
	
	
	private String driverMobile;  //司机电话号码
	private String vehicleNo;    //车牌号
	private String driverId;     //关联司机ID
	private String logistics;    //承运商，车队信息
	private String identity;     //身份证号码
	private String driverName;
	private String carrierName;
	
	
	private String vehicleId;
	private String vehicleCount;
	private String driverIdNum;
	private String associateDriverName;
	private String associateVehicleNo;
	private String associateDriverMobile;
	private String associateDriverIdNum;
	
	public String getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}

	public String getDriverIdNum() {
		return driverIdNum;
	}
	public void setDriverIdNum(String driverIdNum) {
		this.driverIdNum = driverIdNum;
	}
	public String getVehicleCount() {
		return vehicleCount;
	}
	public void setVehicleCount(String vehicleCount) {
		this.vehicleCount = vehicleCount;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
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
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getHeadImgurl() {
		return headImgurl;
	}
	public void setHeadImgurl(String headImgurl) {
		this.headImgurl = headImgurl;
	}
	public String getPrivilege() {
		return privilege;
	}
	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
	public String getUnionId() {
		return unionId;
	}
	public void setUnionId(String unionId) {
		this.unionId = unionId;
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
	public String getDriverId() {
		return driverId;
	}
	public void setDriverId(String driverId) {
		this.driverId = driverId;
	}
	public String getLogistics() {
		return logistics;
	}
	public void setLogistics(String logistics) {
		this.logistics = logistics;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}

	public String getAssociateDriverName() {
		return associateDriverName;
	}
	public void setAssociateDriverName(String associateDriverName) {
		this.associateDriverName = associateDriverName;
	}
	public String getAssociateVehicleNo() {
		return associateVehicleNo;
	}
	public void setAssociateVehicleNo(String associateVehicleNo) {
		this.associateVehicleNo = associateVehicleNo;
	}

	public String getCarrierName() {
		return carrierName;
	}
	public void setCarrierName(String carrierName) {
		this.carrierName = carrierName;
	}
	public String getAssociateDriverMobile() {
		return associateDriverMobile;
	}
	public void setAssociateDriverMobile(String associateDriverMobile) {
		this.associateDriverMobile = associateDriverMobile;
	}
	public String getAssociateDriverIdNum() {
		return associateDriverIdNum;
	}
	public void setAssociateDriverIdNum(String associateDriverIdNum) {
		this.associateDriverIdNum = associateDriverIdNum;
	}

	
	
}
