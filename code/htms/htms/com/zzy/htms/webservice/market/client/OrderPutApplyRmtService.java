/**
 * OrderPutApplyRmtService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.zzy.htms.webservice.market.client;

public interface OrderPutApplyRmtService extends java.rmi.Remote {
    public com.zzy.htms.webservice.market.client.WebServiceResponse updateApply(java.lang.String applyId) throws java.rmi.RemoteException;
    public com.zzy.htms.webservice.market.client.WebServiceResponse queryStatusByApplyId(java.lang.Integer applyId) throws java.rmi.RemoteException;
    public com.zzy.htms.webservice.market.client.WebServiceResponse getGoodsCount(java.lang.String orderGoodsCountJson) throws java.rmi.RemoteException;
    public com.zzy.htms.webservice.market.client.WebServiceResponse insertOrderPutApply(com.zzy.htms.webservice.market.client.OrderPutApplyBean orderPutApply) throws java.rmi.RemoteException;
}
