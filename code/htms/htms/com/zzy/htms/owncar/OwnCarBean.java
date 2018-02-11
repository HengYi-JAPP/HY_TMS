package com.zzy.htms.owncar;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;


/**
 * 自备车自提车辆管理实体类
 * @author zzy
 *
 */
public class OwnCarBean extends AbstractBean  implements Serializable{
	private String feeId;
	private String managementFee;
	private String createTime;
	private String isValidate;
	public String getFeeId() {
		return feeId;
	}
	public void setFeeId(String feeId) {
		this.feeId = feeId;
	}
	public String getManagementFee() {
		return managementFee;
	}
	public void setManagementFee(String managementFee) {
		this.managementFee = managementFee;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getIsValidate() {
		return isValidate;
	}
	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}
	
	
}
