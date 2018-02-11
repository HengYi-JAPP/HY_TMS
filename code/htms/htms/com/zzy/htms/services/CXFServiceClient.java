package com.zzy.htms.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.apache.cxf.transport.http.HTTPConduit;
import org.apache.cxf.transports.http.configuration.HTTPClientPolicy;

public class CXFServiceClient extends AbstractServiceClient{
	
	private static Map<String,List<Client>> servicsClientMap = new HashMap<String,List<Client>> ();
	
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
		
		Client client = null;
		try {				
			
			client = getClient(address);
			if(client==null){
				JaxWsDynamicClientFactory clientFactory = JaxWsDynamicClientFactory.newInstance();
				client = clientFactory.createClient(address);
				HTTPConduit http = (HTTPConduit) client.getConduit(); 
				HTTPClientPolicy httpClientPolicy = http.getClient(); 
				httpClientPolicy.setAllowChunking(false);
			}
			
			Object[] result = client.invoke(serviceMethod, pxml);
			if(result==null||result.length<1){
				return null;
			}
			
			return (String)result[0];
		} catch (Exception e) {
			if(client!=null){
				
			}
			return null;
		}finally{
			if(client!=null)
			releaseClient(address, client);
		}
	}
	
	
	private synchronized Client getClient(String address){
		List<Client> list =servicsClientMap.get(address);
		if(list==null){
			list = new ArrayList<Client>();
			servicsClientMap.put(address, list);
		}
		
		if(list.isEmpty()){
			JaxWsDynamicClientFactory clientFactory = JaxWsDynamicClientFactory.newInstance();			
			Client client = clientFactory.createClient(address);
			HTTPConduit http = (HTTPConduit) client.getConduit(); 
			HTTPClientPolicy httpClientPolicy = http.getClient(); 
			httpClientPolicy.setAllowChunking(false);
			list.add(client);
		}
		return list.remove(0);
	}
	
	private synchronized void releaseClient(String address,Client client){
		List<Client> list =servicsClientMap.get(address);
		if(list==null){
			list = new ArrayList<Client>();
			servicsClientMap.put(address, list);
		}
		list.add(client);
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
