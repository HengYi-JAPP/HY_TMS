package com.zzy.htms.services;

import javax.xml.namespace.QName;

import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.rpc.client.RPCServiceClient;
import org.apache.axis2.transport.http.HTTPConstants;

public class Axis2ServiceClient extends AbstractServiceClient{
	
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
		try {			
			nameSpace = nameSpace==null||"".equals(nameSpace.trim())?"http://webservice.cms.hikvision.com":nameSpace;
			RPCServiceClient serviceClient = new RPCServiceClient();
	       
	        EndpointReference targetEPR = new EndpointReference(address);
	        
	        Options options = serviceClient.getOptions();
	        options.setTo(targetEPR);
	        options.setProperty(HTTPConstants.CHUNKED, false);
	        Object[] opAddEntryArgs = new Object[] {pxml};
	        Class[] classes = new Class[] {String.class};
	        QName opAddEntry = new QName(nameSpace, serviceMethod);
			
	        Object value = (Object)serviceClient.invokeBlocking(opAddEntry, opAddEntryArgs, classes)[0];
			return (String)value;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		ClientInvokeParamsBean paramsBean =new ClientInvokeParamsBean();
		paramsBean.setAddress("http://localhost:8080/htms/services/HtmsServices?wsdl");
		paramsBean.setPxml("test param");
		paramsBean.setNameSpace("http://services.htms.zzy.com");
		paramsBean.setServiceMethod("getHoldStock");
		paramsBean.setServiceTimeout(5000);
		
		Axis2ServiceClient client = new Axis2ServiceClient();
		client.invoke(paramsBean);
	}

}
