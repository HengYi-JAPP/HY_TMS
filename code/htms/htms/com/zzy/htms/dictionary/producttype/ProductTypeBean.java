package com.zzy.htms.dictionary.producttype;
import java.io.Serializable;
import com.mobilecn.beans.AbstractBean;

/**
 * 产品类型实体类
 * @author zzy
 *
 */
public class ProductTypeBean  extends AbstractBean  implements Serializable {
	private int typeId;
	private String typeName;
	private int isValidate;
	private String typeDesc;
	private String typeCode;

	public void setTypeId(int typeId){
		this.typeId=typeId;
	}

	public int getTypeId(){
		return this.typeId;
	}

	public void setTypeName(String typeName){
		this.typeName=typeName;
	}

	public String getTypeName(){
		return this.typeName;
	}

	public void setIsValidate(int isValidate){
		this.isValidate=isValidate;
	}

	public int getIsValidate(){
		return this.isValidate;
	}

	public void setTypeDesc(String typeDesc){
		this.typeDesc=typeDesc;
	}

	public String getTypeDesc(){
		return this.typeDesc;
	}

	public void setTypeCode(String typeCode){
		this.typeCode=typeCode;
	}

	public String getTypeCode(){
		return this.typeCode;
	}


}

