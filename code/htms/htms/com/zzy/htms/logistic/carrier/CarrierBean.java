package com.zzy.htms.logistic.carrier;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 贸易商实体类
 * @author zzy
 *
 */
public class CarrierBean  extends AbstractBean  implements Serializable {
	private int carrierId;
	private String carrierName;
	private String carrierCode;
	private int isValidate;
	private String carrierContactor;
	private String carrierTelephone;
	private String carrierArea;

	public void setCarrierId(int carrierId){
		this.carrierId=carrierId;
	}

	public int getCarrierId(){
		return this.carrierId;
	}

	public void setCarrierName(String carrierName){
		this.carrierName=carrierName;
	}

	public String getCarrierName(){
		return this.carrierName;
	}

	public void setCarrierCode(String carrierCode){
		this.carrierCode=carrierCode;
	}

	public String getCarrierCode(){
		return this.carrierCode;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setCarrierContactor(String carrierContactor){
		this.carrierContactor=carrierContactor;
	}

	public String getCarrierContactor(){
		return this.carrierContactor;
	}

	public void setCarrierTelephone(String carrierTelephone){
		this.carrierTelephone=carrierTelephone;
	}

	public String getCarrierTelephone(){
		return this.carrierTelephone;
	}

	public void setCarrierArea(String carrierArea){
		this.carrierArea=carrierArea;
	}

	public String getCarrierArea(){
		return this.carrierArea;
	}


}

