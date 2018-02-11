package com.zzy.htms.location;



/**
 * Ajax交互服务端返回结果封装对象
 * 
 * @author Admin
 * 
 */
public class WXConfigAjaxResult implements AjaxModel {
	
	private boolean success = true;
	
	private String appId = "";
	private String timestamp = "";
	private String noncestr = "";
	private String signature="";
	private int interval = -1;
	
	private String msg="";
	
	public WXConfigAjaxResult() {
		super();
	}

	public WXConfigAjaxResult(boolean success) {
		super();
		this.success = success;
	}

	public WXConfigAjaxResult(boolean success, String appId,String timestamp,String noncestr,String signature,int interval,String msg) {
		super();
		this.success = success;
		
		this.appId = appId;
		this.timestamp = timestamp;
		this.noncestr = noncestr;
		this.signature = signature;
		this.interval=interval;
		this.msg=msg;
	}

	public String getString(){
//		return "{'isSuccess':'"+this.success+"','appId':'"+this.appId+"','timestamp':'"+this.timestamp+"'," +
//		"'noncestr':'"+this.noncestr+"','signature':'"+this.signature+"','interval':'"+this.interval+"','msg':'"+this.msg+"'}";
		
		return "{\"isSuccess\":\""+this.success+"\",\"appId\":\""+this.appId+"\",\"timestamp\":\""+this.timestamp+"\"," +
				"\"noncestr\":\""+this.noncestr+"\",\"signature\":\""+this.signature+"\",\"interval\":\""+this.interval+"\",\"msg\":\""+this.msg+"\"}";
	}
	
	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getNoncestr() {
		return noncestr;
	}

	public void setNoncestr(String noncestr) {
		this.noncestr = noncestr;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public int getInterval() {
		return interval;
	}

	public void setInterval(int interval) {
		this.interval = interval;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
