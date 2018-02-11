package com.zzy.htms.services;

public class ServiceClientInvoker {
	//private String platform;
	private String serviceMethod = null;
	public String getServiceMethod() {
		return serviceMethod;
	}

	public void setServiceMethod(String serviceMethod) {
		this.serviceMethod = serviceMethod;
	}

	public  String invoke(ClientInvokeParamsBean paramsBean){
		if(paramsBean==null){
			return null;
		}
		String platform = paramsBean.getPlatform();
		AbstractServiceClient invoker = new AxisServiceClient();
		if(platform!=null&&"dotnet".equalsIgnoreCase(platform.trim())){
			invoker = new DonetServiceClient();
		}else if(platform!=null&&"cxf".equalsIgnoreCase(platform.trim())){
			invoker = new CXFServiceClient();
		}else if(platform!=null&&"axis2".equalsIgnoreCase(platform.trim())){
			invoker = new Axis2ServiceClient();
		}else if(platform!=null&&"xfire".equalsIgnoreCase(platform.trim())){
			invoker = new XFireServiceClient();
		}
		invoker.setServiceMethod(serviceMethod);
		String value = invoker.invoke(paramsBean);
		return value;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
