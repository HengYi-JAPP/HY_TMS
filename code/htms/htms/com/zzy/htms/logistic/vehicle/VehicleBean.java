package com.zzy.htms.logistic.vehicle;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 车辆实体类
 * @author zzy
 *
 */
public class VehicleBean  extends AbstractBean  implements Serializable {
	private int vehicleId;
	private int carrierId;
	private String vehicleCode;
	private String vehicleNo;
	private String vehicleMaxTon;
	private int isValidate;
	private String vehicleWidth;
	private String vehicleHeight;
	private int vehiclePersonNum;
	private String vehicleDesc;
	private String vehicleLength;

	public void setVehicleId(int vehicleId){
		this.vehicleId=vehicleId;
	}

	public int getVehicleId(){
		return this.vehicleId;
	}

	public void setCarrierId(int carrierId){
		this.carrierId=carrierId;
	}

	public int getCarrierId(){
		return this.carrierId;
	}

	public void setVehicleCode(String vehicleCode){
		this.vehicleCode=vehicleCode;
	}

	public String getVehicleCode(){
		return this.vehicleCode;
	}

	public void setVehicleNo(String vehicleNo){
		this.vehicleNo=vehicleNo;
	}

	public String getVehicleNo(){
		return this.vehicleNo;
	}

	public void setVehicleMaxTon(String vehicleMaxTon){
		this.vehicleMaxTon=vehicleMaxTon;
	}

	public String getVehicleMaxTon(){
		return this.vehicleMaxTon;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setVehicleWidth(String vehicleWidth){
		this.vehicleWidth=vehicleWidth;
	}

	public String getVehicleWidth(){
		return this.vehicleWidth;
	}

	public void setVehicleHeight(String vehicleHeight){
		this.vehicleHeight=vehicleHeight;
	}

	public String getVehicleHeight(){
		return this.vehicleHeight;
	}

	public void setVehiclePersonNum(int vehiclePersonNum){
		this.vehiclePersonNum=vehiclePersonNum;
	}

	public int getVehiclePersonNum(){
		return this.vehiclePersonNum;
	}

	public void setVehicleDesc(String vehicleDesc){
		this.vehicleDesc=vehicleDesc;
	}

	public String getVehicleDesc(){
		return this.vehicleDesc;
	}

	public void setVehicleLength(String vehicleLength){
		this.vehicleLength=vehicleLength;
	}

	public String getVehicleLength(){
		return this.vehicleLength;
	}


}

