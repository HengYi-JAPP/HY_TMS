package com.zzy.htms.logistic.logistics;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 物流公司实体类
 * @author zzy
 *
 */
public class LogisticsBean  extends AbstractBean  implements Serializable {
	private int logisticsId;
	private String logisticsName;
	private String logisticsCode;
	private int isValidate;
	private String logisticsContactor;
	private String logisticsTelephone;
	private String logisticsAddress;

	public void setLogisticsId(int logisticsId){
		this.logisticsId=logisticsId;
	}

	public int getLogisticsId(){
		return this.logisticsId;
	}

	public void setLogisticsName(String logisticsName){
		this.logisticsName=logisticsName;
	}

	public String getLogisticsName(){
		return this.logisticsName;
	}

	public void setLogisticsCode(String logisticsCode){
		this.logisticsCode=logisticsCode;
	}

	public String getLogisticsCode(){
		return this.logisticsCode;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setLogisticsContactor(String logisticsContactor){
		this.logisticsContactor=logisticsContactor;
	}

	public String getLogisticsContactor(){
		return this.logisticsContactor;
	}

	public void setLogisticsTelephone(String logisticsTelephone){
		this.logisticsTelephone=logisticsTelephone;
	}

	public String getLogisticsTelephone(){
		return this.logisticsTelephone;
	}

	public void setLogisticsAddress(String logisticsAddress){
		this.logisticsAddress=logisticsAddress;
	}

	public String getLogisticsAddress(){
		return this.logisticsAddress;
	}


}

