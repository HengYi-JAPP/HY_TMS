/**
 * OrderPutApplyRmtServiceImplServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.zzy.htms.webservice.market.client;

public class OrderPutApplyRmtServiceImplServiceLocator extends org.apache.axis.client.Service implements com.zzy.htms.webservice.market.client.OrderPutApplyRmtServiceImplService {

    public OrderPutApplyRmtServiceImplServiceLocator() {
    }


    public OrderPutApplyRmtServiceImplServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public OrderPutApplyRmtServiceImplServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for OrderPutApplyRmtServiceImplPort
    private java.lang.String OrderPutApplyRmtServiceImplPort_address = "http://"+LoadMarketWebServiceConfig.MARKET_WEBSERVICE_IP_ADDRESS+"/webservice/orderPutApply";

    public java.lang.String getOrderPutApplyRmtServiceImplPortAddress() {
        return OrderPutApplyRmtServiceImplPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String OrderPutApplyRmtServiceImplPortWSDDServiceName = "OrderPutApplyRmtServiceImplPort";

    public java.lang.String getOrderPutApplyRmtServiceImplPortWSDDServiceName() {
        return OrderPutApplyRmtServiceImplPortWSDDServiceName;
    }

    public void setOrderPutApplyRmtServiceImplPortWSDDServiceName(java.lang.String name) {
        OrderPutApplyRmtServiceImplPortWSDDServiceName = name;
    }

    public com.zzy.htms.webservice.market.client.OrderPutApplyRmtService getOrderPutApplyRmtServiceImplPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(OrderPutApplyRmtServiceImplPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getOrderPutApplyRmtServiceImplPort(endpoint);
    }

    public com.zzy.htms.webservice.market.client.OrderPutApplyRmtService getOrderPutApplyRmtServiceImplPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.zzy.htms.webservice.market.client.OrderPutApplyRmtServiceImplServiceSoapBindingStub _stub = new com.zzy.htms.webservice.market.client.OrderPutApplyRmtServiceImplServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getOrderPutApplyRmtServiceImplPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setOrderPutApplyRmtServiceImplPortEndpointAddress(java.lang.String address) {
        OrderPutApplyRmtServiceImplPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.zzy.htms.webservice.market.client.OrderPutApplyRmtService.class.isAssignableFrom(serviceEndpointInterface)) {
                com.zzy.htms.webservice.market.client.OrderPutApplyRmtServiceImplServiceSoapBindingStub _stub = new com.zzy.htms.webservice.market.client.OrderPutApplyRmtServiceImplServiceSoapBindingStub(new java.net.URL(OrderPutApplyRmtServiceImplPort_address), this);
                _stub.setPortName(getOrderPutApplyRmtServiceImplPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("OrderPutApplyRmtServiceImplPort".equals(inputPortName)) {
            return getOrderPutApplyRmtServiceImplPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://order.service.hengyi.com/", "OrderPutApplyRmtServiceImplService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://order.service.hengyi.com/", "OrderPutApplyRmtServiceImplPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("OrderPutApplyRmtServiceImplPort".equals(portName)) {
            setOrderPutApplyRmtServiceImplPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
