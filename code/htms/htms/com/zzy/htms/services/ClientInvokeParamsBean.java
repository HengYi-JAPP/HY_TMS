package com.zzy.htms.services;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;

public class ClientInvokeParamsBean extends AbstractBean  implements Serializable { 
	
	
	private boolean documentStyle=false;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNameSpace() {
		return nameSpace;
	}

	public void setNameSpace(String nameSpace) {
		this.nameSpace = nameSpace;
	}

	public Object getPxml() {
		return pxml;
	}

	public void setPxml(Object pxml) {
		this.pxml = pxml;
	}

	public String getServiceMethod() {
		return serviceMethod;
	}

	public void setServiceMethod(String serviceMethod) {
		this.serviceMethod = serviceMethod;
	}

	public Integer getServiceTimeout() {
		return serviceTimeout;
	}

	public void setServiceTimeout(Integer serviceTimeout) {
		this.serviceTimeout = serviceTimeout;
	}
	/*
	 * 服务调用 地址
	 */
	private String address;
	/*
	 * 地址命名空间
	 */
	private String nameSpace;
	/*
	 * 调用的字符串参数，格式需要按标准规范
	 */
	private Object pxml;
	
	/*
	 * 调用方法名
	 */
	private String serviceMethod;
	
	/*
	 * 服务调用时限 
	 */
	private Integer serviceTimeout = 0; 
	/*
	 * 调用的服务平台，默认axis
	 */
	private String platform;

	public String getPlatform() {
		platform=platform==null||"".equals(platform.trim())?"axis":platform;
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public boolean isDocumentStyle() {
		return documentStyle;
	}

	public void setDocumentStyle(boolean documentStyle) {
		this.documentStyle = documentStyle;
	}
	
	/*
	 * 如调用或扩展过程中还需要其他参数，可以在下面扩展
	 */
	
	
}
