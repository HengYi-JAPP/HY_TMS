package com.zzy.htms.dictionary.factory;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 厂区实体bean
 * @author zzy
 *
 */
public class FactoryBean  extends AbstractBean  implements Serializable {
	private int factoryId;
	private String factoryName;
	private String factoryCode;
	private int isVlidate;
	private String factoryAddress;
	private String factoryContactor;
	private String factoryTelphone;
	private String factoryDesc;
	
	
	public void setFactoryId(int factoryId){
		this.factoryId=factoryId;
	}

	public int getFactoryId(){
		return this.factoryId;
	}

	public void setFactoryName(String factoryName){
		this.factoryName=factoryName;
	}

	public String getFactoryName(){
		return this.factoryName;
	}

	public void setFactoryCode(String factoryCode){
		this.factoryCode=factoryCode;
	}

	public String getFactoryCode(){
		return this.factoryCode;
	}

	public void setIsVlidate(int isVlidate){
		this.isVlidate=isVlidate;
	}

	public int getIsVlidate(){
		return this.isVlidate;
	}

	public void setFactoryAddress(String factoryAddress){
		this.factoryAddress=factoryAddress;
	}

	public String getFactoryAddress(){
		return this.factoryAddress;
	}

	public void setFactoryContactor(String factoryContactor){
		this.factoryContactor=factoryContactor;
	}

	public String getFactoryContactor(){
		return this.factoryContactor;
	}

	public void setFactoryTelphone(String factoryTelphone){
		this.factoryTelphone=factoryTelphone;
	}

	public String getFactoryTelphone(){
		return this.factoryTelphone;
	}

	public void setFactoryDesc(String factoryDesc){
		this.factoryDesc=factoryDesc;
	}

	public String getFactoryDesc(){
		return this.factoryDesc;
	}


}

