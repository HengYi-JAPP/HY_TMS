package com.zzy.htms.vstore;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;


/**
 * 签收功能实体类
 * @author zzy
 *
 */
public class SignBean extends AbstractBean  implements Serializable{

	private String transportId;
	private String picList;
	private String[] picListArray; 
	private String signTime;
	
	
	
	public String[] getPicListArray() {
		return picListArray;
	}
	public void setPicListArray(String[] picListArray) {
		this.picListArray = picListArray;
	}
	
	public String getTransportId() {
		return transportId;
	}
	public void setTransportId(String transportId) {
		this.transportId = transportId;
	}
	public String getPicList() {
		return picList;
	}
	public void setPicList(String picList) {
		this.picList = picList;
	}
	public String getSignTime() {
		return signTime;
	}
	public void setSignTime(String signTime) {
		this.signTime = signTime;
	}
	
	
}
