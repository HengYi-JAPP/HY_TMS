package com.zzy.htms.services;

import java.net.URL;
import java.util.Vector;

import javax.xml.namespace.QName;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.rpc.ParameterMode;

import org.apache.axiom.om.OMAbstractFactory;
import org.apache.axiom.om.OMElement;
import org.apache.axiom.om.OMFactory;
import org.apache.axiom.om.OMNamespace;
import org.apache.axiom.soap.impl.llom.SOAPElement;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.constants.Style;
import org.apache.axis.message.SOAPBodyElement;
import org.apache.axis.message.SOAPHeaderElement;
import org.apache.axis.utils.XMLUtils;
import org.apache.axis2.AxisFault;
import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.sun.org.apache.xml.internal.serialize.DOMSerializerImpl;
import com.sun.org.apache.xml.internal.serialize.OutputFormat;
import com.zzy.htms.services.business.XmlBuffer;

public class AxisServiceClient extends AbstractServiceClient{

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
			Service service = new Service();
			Call call = (Call) service.createCall();
			if(paramsBean.isDocumentStyle()){
				call.setOperationStyle(org.apache.axis.constants.Style.DOCUMENT);
				call.setOperationUse(org.apache.axis.constants.Use.LITERAL);
			}
			call.setTimeout(this.getServiceTimeout());
			call.setTargetEndpointAddress(new java.net.URL(address));			
			QName qname=new QName(address, serviceMethod);	
			call.setOperationName(qname);
			if(paramsBean.isDocumentStyle()){
				call.setOperationStyle(org.apache.axis.constants.Style.DOCUMENT);
				call.setOperationUse(org.apache.axis.constants.Use.LITERAL);
				call.addParameter(qname,org.apache.axis.encoding.XMLType.XSD_STRING,ParameterMode.IN); 	
				call.setReturnType(org.apache.axis.encoding.XMLType.XSD_STRING);   
			}
			
			Object value = (Object) call.invoke(new Object[]{pxml});
			return (String)value;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}
	/*public  String invoke(ClientInvokeParamsBean paramsBean){
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
			Service service = new Service();
			Call call = (Call) service.createCall();
			
			call.setTimeout(this.getServiceTimeout());
			call.setTargetEndpointAddress(new java.net.URL(address));			
				
			call.setOperationName(new QName(address, serviceMethod));
			Object value = (Object) call.invoke(new Object[]{pxml});
			return (String)value;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}		
	}*/
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		XmlBuffer stockBuffer = new XmlBuffer();
		stockBuffer.rootStart();
		 stockBuffer.tab().start("system").newLine();
		 stockBuffer.tab(2).element("code", "SAP").newLine();//状态,S=成功
		 stockBuffer.tab(2).element("account", "sap").newLine();//编码
		 stockBuffer.tab(2).element("passwd", "123456").newLine();//消息
		 stockBuffer.tab().end("system").newLine();
		stockBuffer.rootEnd();
		System.out.println("==============================params ====================");
		System.out.println(stockBuffer);
		ClientInvokeParamsBean paramsBean =new ClientInvokeParamsBean();
		//paramsBean.setAddress("http://localhost:8080/htms/services/HtmsServerServices?wsdl");
		paramsBean.setAddress("http://192.168.0.85:8080/services/HtmsServerServices?wsdl");
		paramsBean.setPxml(stockBuffer.toString());
		//paramsBean.setPxml("1233456");
		//paramsBean.setNameSpace("http://localhost:8080/htms/services/HtmsServerServices");
		paramsBean.setNameSpace("http://192.168.0.85:8080/services/HtmsServerServices");
		paramsBean.setServiceMethod("getHoldStock");
		paramsBean.setDocumentStyle(true);
		paramsBean.setServiceTimeout(50000);
		System.out.println("\n\n\n\n");
		System.out.println("==============================result ====================");
		AxisServiceClient client = new AxisServiceClient();
		String result=client.invoke(paramsBean);
		System.out.println(result);
		System.out.println("\n\n\n\n");
		
		

	}
	
	
}
