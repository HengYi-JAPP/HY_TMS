package com.zzy.htms.services;

import java.net.MalformedURLException;
import java.rmi.RemoteException;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;

public class DonetServiceClient extends AbstractServiceClient{
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
	
		Object obj=null;
		try {

			nameSpace= nameSpace==null||"".equals(nameSpace.trim())?"http://tempuri.org/":nameSpace;
			Service service = new Service();
			Call call = (Call) service.createCall();
			call.setTimeout(getServiceTimeout());
			call.setTargetEndpointAddress(new java.net.URL(address));

			QName p1 = new QName(nameSpace, "pxml");
			call.addParameter(p1, org.apache.axis.encoding.XMLType.XSD_STRING,
					ParameterMode.IN);
			call.setReturnType(new QName("http://www.w3.org/2001/XMLSchema", "string"));
			call.setUseSOAPAction(true);
			call.setSOAPActionURI(nameSpace+ serviceMethod);
			call.setEncodingStyle(null);
			call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS,Boolean.FALSE);
			call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR,Boolean.FALSE);
			call.setOperationStyle("wrapped");
			call.setOperationName(new QName(nameSpace,serviceMethod));
			obj = call.invoke(new Object[] { pxml });
		 } catch (ServiceException e) {  
	            e.printStackTrace();  
	            return "";
	        } catch (RemoteException e) {  
	            e.printStackTrace(); 
	            return "";
	        } catch (MalformedURLException e) { 
	            e.printStackTrace(); 
	            return "";
	        }  
		return obj == null ? "" : obj.toString();			
}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
