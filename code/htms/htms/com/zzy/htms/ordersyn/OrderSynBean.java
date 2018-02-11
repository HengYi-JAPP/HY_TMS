package com.zzy.htms.ordersyn;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;


/**
 * 订单同步实体类
 * @author zzy
 *
 */
public class OrderSynBean extends AbstractBean  implements Serializable{
	private int synId;
	private String  startDate;
	private String endDate;
	private String salesNo;
	private int creator;
	private String createTime;
	private int modifier;
	private String modifyTime;
	private int isValidate;
	private String synIp;
	public String getSynIp() {
		return synIp;
	}
	public void setSynIp(String synIp) {
		this.synIp = synIp;
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
	public String getEndDate() {
		return endDate;
	}
	public int getSynId() {
		return synId;
	}
	public void setSynId(int synId) {
		this.synId = synId;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndTime() {
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
}
