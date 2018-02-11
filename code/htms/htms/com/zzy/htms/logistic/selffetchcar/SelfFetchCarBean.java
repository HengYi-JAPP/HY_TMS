package com.zzy.htms.logistic.selffetchcar;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 自备车自提车辆实体类
 * @author zzy
 *
 */
public class SelfFetchCarBean  extends AbstractBean  implements Serializable {
	private int carId;
	
	private String customerCode;
	
	private String vehicleNo;
	
	private String remark;
	
	private String createTime;
	
	private String isValidate;
	
	private String customerName;

	
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public int getCarId() {
		return carId;
	}

	public void setCarId(int carId) {
		this.carId = carId;
	}

	public String getCustomerCode() {
		return customerCode;
	}

	public void setCustomerCode(String customerCode) {
		this.customerCode = customerCode;
	}

	public String getVehicleNo() {
		return vehicleNo;
	}

	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
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

