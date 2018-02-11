package com.zzy.htms.dictionary.product;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 产品实体类
 * @author zzy
 *
 */
public class ProductBean  extends AbstractBean  implements Serializable {
	private int productId;
	private int typeId;
	private String productName;
	private int isValidate;
	private String productDesc;
	private String sapNo;
	private String productCode;

	public void setProductId(int productId){
		this.productId=productId;
	}

	public int getProductId(){
		return this.productId;
	}

	public void setTypeId(int typeId){
		this.typeId=typeId;
	}

	public int getTypeId(){
		return this.typeId;
	}

	public void setProductName(String productName){
		this.productName=productName;
	}

	public String getProductName(){
		return this.productName;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setProductDesc(String productDesc){
		this.productDesc=productDesc;
	}

	public String getProductDesc(){
		return this.productDesc;
	}

	public void setSapNo(String sapNo){
		this.sapNo=sapNo;
	}

	public String getSapNo(){
		return this.sapNo;
	}

	public void setProductCode(String productCode){
		this.productCode=productCode;
	}

	public String getProductCode(){
		return this.productCode;
	}


}

