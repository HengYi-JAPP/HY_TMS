package com.zzy.htms.dictionary.transprice;

import com.mobilecn.taglibs.html.BaseHtmlBean;


/**
 * 正常运价字典加载实体类
 * @author zzy
 */
public class DicBean  extends BaseHtmlBean{	
	/**
	 * 使用场景：
	 * 1）在列表中通过bean.property显示字典名称；；
	 * 2）在新增、修改页面，获取指定类型的字典列表，并设置为对应的对象名和指定的范围
	 */
	/**
	 * id
	 */


	public String getDicName() {
		return dicName;
	}

	public void setDicName(String dicName) {
		this.dicName = dicName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}
	/**
	 * name
	 */
	private String dicName;
	/**
	 * type
	 */
	private String typeName;
	/**
	 * scope,默认为request
	 */
	private String scope;
	private String dicCode;
	private String typeId;
	private String dicType;
	private String dicDesc;
	private String isValidate;
	private String showOrder;
	private String targetDicId;
	public String getDicCode() {
		return dicCode;
	}

	public void setDicCode(String dicCode) {
		this.dicCode = dicCode;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getDicType() {
		return dicType;
	}

	public void setDicType(String dicType) {
		this.dicType = dicType;
	}

	public String getDicDesc() {
		return dicDesc;
	}

	public void setDicDesc(String dicDesc) {
		this.dicDesc = dicDesc;
	}

	public String getIsValidate() {
		return isValidate;
	}

	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}

	public String getShowOrder() {
		return showOrder;
	}

	public void setShowOrder(String showOrder) {
		this.showOrder = showOrder;
	}

	public String getTargetDicId() {
		return targetDicId;
	}

	public void setTargetDicId(String targetDicId) {
		this.targetDicId = targetDicId;
	}

	
	
}
