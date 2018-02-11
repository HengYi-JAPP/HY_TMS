package com.zzy.htms.services;

public abstract class AbstractServiceClient {
	private Integer SERVICE_TIMEOUT=3000;
	private String SERVICE_METHOD = "getPortletData";
	private String serviceMethod = null;
	private Integer serviceTimeout = 0; 
	
	public Integer getServiceTimeout() {
		return serviceTimeout =serviceTimeout==null||serviceTimeout==0?SERVICE_TIMEOUT:serviceTimeout;
	}
	public void setServiceTimeout(Integer serviceTimeout) {
		this.serviceTimeout = serviceTimeout;
	}
	public void setServiceMethod(String serviceMethod) {
		this.serviceMethod = serviceMethod;
	}
	public String getServiceMethod() {
		return serviceMethod =serviceMethod==null||"".equals(serviceMethod.trim())?SERVICE_METHOD:serviceMethod.trim();
	}
	
	public abstract String invoke(ClientInvokeParamsBean paramsBean);
}
