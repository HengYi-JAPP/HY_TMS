package com.zzy.htms.log;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;


/**
 * 日志记录实体类
 * @author zzy
 *
 */
public class HtmsLogBean  extends AbstractBean  implements Serializable {
	private String logId     ;
	private String logCode   ;
	private String logAddress;
	private String logDesc   ;
	private String logUser   ;
	private String logTime   ;
	private String logResult ;
	private String logIp     ;
	//private String logMac    ;
	private String isValidate;
	
	

	public String getLogId() {
		return logId;
	}



	public void setLogId(String logId) {
		this.logId = logId;
	}



	public String getLogCode() {
		return logCode;
	}



	public void setLogCode(String logCode) {
		this.logCode = logCode;
	}



	public String getLogAddress() {
		return logAddress;
	}



	public void setLogAddress(String logAddress) {
		this.logAddress = logAddress;
	}



	public String getLogDesc() {
		return logDesc;
	}



	public void setLogDesc(String logDesc) {
		this.logDesc = logDesc;
	}



	public String getLogUser() {
		return logUser;
	}



	public void setLogUser(String logUser) {
		this.logUser = logUser;
	}



	public String getLogTime() {
		return logTime;
	}



	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}



	public String getLogResult() {
		return logResult;
	}



	public void setLogResult(String logResult) {
		this.logResult = logResult;
	}



	public String getLogIp() {
		return logIp;
	}



	public void setLogIp(String logIp) {
		this.logIp = logIp;
	}



	/*public String getLogMac() {
		return logMac;
	}



	public void setLogMac(String logMac) {
		this.logMac = logMac;
	}
*/


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
		// TODO Auto-generated method stub

	}

}
