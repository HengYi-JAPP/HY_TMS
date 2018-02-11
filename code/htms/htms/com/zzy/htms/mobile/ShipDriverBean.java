package com.zzy.htms.mobile;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;


/**
 * 发货订单司机处理实体类
 * @author zzy
 *
 */
public class ShipDriverBean extends AbstractBean  implements Serializable{
	private String driverName;
	private String driverMobile;
	private String vehicleNo;
	private int shipId;
	private int transId;
	private int sendStatus;
	private String applyTonNum;
	private String applyPackNum;
	
	private String totalFreight;
	
	public String getApplyTonNum() {
		return applyTonNum;
	}
	public void setApplyTonNum(String applyTonNum) {
		this.applyTonNum = applyTonNum;
	}
	public String getApplyPackNum() {
		return applyPackNum;
	}
	public void setApplyPackNum(String applyPackNum) {
		this.applyPackNum = applyPackNum;
	}
	public int getSendStatus() {
		return sendStatus;
	}
	public void setSendStatus(int sendStatus) {
		this.sendStatus = sendStatus;
	}
	public int getShipId() {
		return shipId;
	}
	public void setShipId(int shipId) {
		this.shipId = shipId;
	}
	
	public int getTransId() {
		return transId;
	}
	public void setTransId(int transId) {
		this.transId = transId;
	}
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
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
	
	public String getTotalFreight() {
		return totalFreight;
	}
	public void setTotalFreight(String totalFreight) {
		this.totalFreight = totalFreight;
	}	
}
