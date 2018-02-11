/**
 * HtmsServerServicesServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.htms85;

public class HtmsServerServicesServiceLocator extends org.apache.axis.client.Service implements com.htms85.HtmsServerServicesService {

    public HtmsServerServicesServiceLocator() {
    }


    public HtmsServerServicesServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public HtmsServerServicesServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for HtmsServerServices
    private java.lang.String HtmsServerServices_address = "http://localhost:8080/htms/services/HtmsServerServices";

    public java.lang.String getHtmsServerServicesAddress() {
        return HtmsServerServices_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String HtmsServerServicesWSDDServiceName = "HtmsServerServices";

    public java.lang.String getHtmsServerServicesWSDDServiceName() {
        return HtmsServerServicesWSDDServiceName;
    }

    public void setHtmsServerServicesWSDDServiceName(java.lang.String name) {
        HtmsServerServicesWSDDServiceName = name;
    }

    public com.htms85.HtmsServerServices_PortType getHtmsServerServices() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(HtmsServerServices_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getHtmsServerServices(endpoint);
    }

    public com.htms85.HtmsServerServices_PortType getHtmsServerServices(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.htms85.HtmsServerServicesSoapBindingStub _stub = new com.htms85.HtmsServerServicesSoapBindingStub(portAddress, this);
            _stub.setPortName(getHtmsServerServicesWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setHtmsServerServicesEndpointAddress(java.lang.String address) {
        HtmsServerServices_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.htms85.HtmsServerServices_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.htms85.HtmsServerServicesSoapBindingStub _stub = new com.htms85.HtmsServerServicesSoapBindingStub(new java.net.URL(HtmsServerServices_address), this);
                _stub.setPortName(getHtmsServerServicesWSDDServiceName());
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
        if ("HtmsServerServices".equals(inputPortName)) {
            return getHtmsServerServices();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://localhost:8080/htms/services/HtmsServerServices", "HtmsServerServicesService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://localhost:8080/htms/services/HtmsServerServices", "HtmsServerServices"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("HtmsServerServices".equals(portName)) {
            setHtmsServerServicesEndpointAddress(address);
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
