package com.zzy.htms.role;


/**
 * 角色实体类
 * @author zzy
 *
 */
public class RoleBean {
	private String roleType;
	private String dicName;
	private String dicId;

	public String getDicName() {
		return dicName;
	}

	public void setDicName(String dicName) {
		this.dicName = dicName;
	}

	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	public String getDicId() {
		return dicId;
	}

	public void setDicId(String dicId) {
		this.dicId = dicId;
	}
	
	
}
