package com.zzy.htms.synclog;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;


/**
 * 同步日志实体类
 * @author zzy
 *
 */
public class HtmsSyncLogBean  extends AbstractBean  implements Serializable {
		
	private String synId; 
	private String startDate;
	private String endDate;
	private String salesNo; 
	private String creator; 
	private String createTime; 
	private String modifier;
	private String modifyTime; 
	private String isValidate; 
	private String synIp;
	private String startTime; 
	private String endTime;
	private String useTime;
	
	public String getSynId() {
		return synId;
	}
	public void setSynId(String synId) {
		this.synId = synId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSalesNo() {
		return salesNo;
	}
	public void setSalesNo(String salesNo) {
		this.salesNo = salesNo;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	public String getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}
	public String getIsValidate() {
		return isValidate;
	}
	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}
	public String getSynIp() {
		return synIp;
	}
	public void setSynIp(String synIp) {
		this.synIp = synIp;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getUseTime() {
		return useTime;
	}
	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}

}
