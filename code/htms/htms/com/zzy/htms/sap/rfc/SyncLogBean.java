package com.zzy.htms.sap.rfc;


/**
 * 订单同步日志实体类
 * @author zzy
 *
 */
public class SyncLogBean {
	public SyncLogBean(String code,String info){
		this.setCode(code);
		this.setInfo(info);
		this.setDateTime(tools.tool.getDateTime());
	}
	private String dateTime=null;
	private String info=null;
	private String code=null;
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String toString(){
		StringBuffer buffer = new StringBuffer();
		buffer.append(this.getDateTime()).append("[").append(this.getCode()).append("]:").append(this.getInfo()).append("\n");
		return buffer.toString();
	}
}
