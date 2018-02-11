package com.zzy.htms.services.user;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;


/**
 * webservice服务调用凭证实体类
 * @author zzy
 *
 */
public class ServiceUserBean extends AbstractBean  implements Serializable {
	private String suserId   ;
	private String syscode   ;
	private String account   ;
	private String passwd    ;
	private String isValidate;


	public String getSuserId() {
		return suserId;
	}


	public void setSuserId(String suserId) {
		this.suserId = suserId;
	}


	public String getSyscode() {
		return syscode;
	}


	public void setSyscode(String syscode) {
		this.syscode = syscode;
	}


	public String getAccount() {
		return account;
	}


	public void setAccount(String account) {
		this.account = account;
	}


	public String getPasswd() {
		return passwd;
	}


	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}


	public String getIsValidate() {
		return isValidate;
	}


	public void setIsValidate(String isValidate) {
		this.isValidate = isValidate;
	}


	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//System.out.println((new ServiceUserBean()).toBeanMap());
		System.out.println((new ServiceUserBean()).toOperation("TB_HTMS_SERVICEUSER"));

	}

}
