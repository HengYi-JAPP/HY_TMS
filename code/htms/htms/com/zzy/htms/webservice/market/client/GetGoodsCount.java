/**
 * GetGoodsCount.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.zzy.htms.webservice.market.client;

public class GetGoodsCount  implements java.io.Serializable {
    private java.lang.String orderGoodsCountJson;

    public GetGoodsCount() {
    }

    public GetGoodsCount(
           java.lang.String orderGoodsCountJson) {
           this.orderGoodsCountJson = orderGoodsCountJson;
    }


    /**
     * Gets the orderGoodsCountJson value for this GetGoodsCount.
     * 
     * @return orderGoodsCountJson
     */
    public java.lang.String getOrderGoodsCountJson() {
        return orderGoodsCountJson;
    }


    /**
     * Sets the orderGoodsCountJson value for this GetGoodsCount.
     * 
     * @param orderGoodsCountJson
     */
    public void setOrderGoodsCountJson(java.lang.String orderGoodsCountJson) {
        this.orderGoodsCountJson = orderGoodsCountJson;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof GetGoodsCount)) return false;
        GetGoodsCount other = (GetGoodsCount) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.orderGoodsCountJson==null && other.getOrderGoodsCountJson()==null) || 
             (this.orderGoodsCountJson!=null &&
              this.orderGoodsCountJson.equals(other.getOrderGoodsCountJson())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getOrderGoodsCountJson() != null) {
            _hashCode += getOrderGoodsCountJson().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(GetGoodsCount.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://order.webservice.hengyi.com/", "getGoodsCount"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("orderGoodsCountJson");
        elemField.setXmlName(new javax.xml.namespace.QName("", "orderGoodsCountJson"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
