package com.zzy.htms.services;

public class XFireServiceClient extends AbstractServiceClient{
	
	public  String invoke(ClientInvokeParamsBean paramsBean){
		if(paramsBean==null){
			return null;
		}
		String address =paramsBean.getAddress();
		String nameSpace = paramsBean.getNameSpace();
		Object pxml = paramsBean.getPxml();
		if(address==null||"".equals(address.trim())){
			return null;
		}
		String serviceMethod = paramsBean.getServiceMethod();
		serviceMethod=serviceMethod==null||"".equals(serviceMethod.trim())?this.getServiceMethod():serviceMethod;
		
		
		/*下面实现xfire的客户端调用*/
		
		/*
		 * ............
		 */
		
		return null;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
