/**
 * HtmsServerServices_PortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.hengyi;

public interface HtmsServerServices_PortType extends java.rmi.Remote {
    public java.lang.String getShipInfo(java.lang.String shipStatusInfo) throws java.rmi.RemoteException;
    public java.lang.String getHoldStock(java.lang.String pxml) throws java.rmi.RemoteException;
    public java.lang.String getTransferTraceInfor(java.lang.String pxml) throws java.rmi.RemoteException;
    public java.lang.String agreeArrangeGoods(java.lang.String shipInfo) throws java.rmi.RemoteException;
    public java.lang.String rejectArrangeGoods(java.lang.String rejectShipInfo) throws java.rmi.RemoteException;
    public java.lang.String getEstimateShipFreight(java.lang.String estimateShipInfor) throws java.rmi.RemoteException;
    public java.lang.String getCustomerAddress(java.lang.String customerInfor) throws java.rmi.RemoteException;
    public java.lang.String freightCharge(java.lang.String pxml) throws java.rmi.RemoteException;
    public java.lang.String estimateFreightCharge(java.lang.String pxml) throws java.rmi.RemoteException;
}
