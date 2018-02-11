package com.zzy.htms.logistic.driver;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 司机实体类
 * @author zzy
 *
 */
public class DriverBean  extends AbstractBean  implements Serializable {
	private int driverId;
	private int carrierId;
	private String driverCode;
	private String driverName;
	private int driverSex;
	private int isValidate;
	private String driverIdNum;
	private String driverAddress;
	private String driverMobile;
	private String driverWeiXin;
	private String driverNotice;
	private int driverYear;

	public void setDriverId(int driverId){
		this.driverId=driverId;
	}

	public int getDriverId(){
		return this.driverId;
	}

	public void setCarrierId(int carrierId){
		this.carrierId=carrierId;
	}

	public int getCarrierId(){
		return this.carrierId;
	}

	public void setDriverCode(String driverCode){
		this.driverCode=driverCode;
	}

	public String getDriverCode(){
		return this.driverCode;
	}

	public void setDriverName(String driverName){
		this.driverName=driverName;
	}

	public String getDriverName(){
		return this.driverName;
	}

	public void setDriverSex(int driverSex){
		this.driverSex=driverSex;
	}

	public int getDriverSex(){
		return this.driverSex;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setDriverIdNum(String driverIdNum){
		this.driverIdNum=driverIdNum;
	}

	public String getDriverIdNum(){
		return this.driverIdNum;
	}

	public void setDriverAddress(String driverAddress){
		this.driverAddress=driverAddress;
	}

	public String getDriverAddress(){
		return this.driverAddress;
	}

	public void setDriverMobile(String driverMobile){
		this.driverMobile=driverMobile;
	}

	public String getDriverMobile(){
		return this.driverMobile;
	}

	public void setDriverWeiXin(String driverWeiXin){
		this.driverWeiXin=driverWeiXin;
	}

	public String getDriverWeiXin(){
		return this.driverWeiXin;
	}

	public void setDriverNotice(String driverNotice){
		this.driverNotice=driverNotice;
	}

	public String getDriverNotice(){
		return this.driverNotice;
	}

	public void setDriverYear(int driverYear){
		this.driverYear=driverYear;
	}

	public int getDriverYear(){
		return this.driverYear;
	}


}

