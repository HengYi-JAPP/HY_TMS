/**
 * QueryStatusByApplyId.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.zzy.htms.webservice.market.client;

public class QueryStatusByApplyId  implements java.io.Serializable {
    private java.lang.Integer applyId;

    public QueryStatusByApplyId() {
    }

    public QueryStatusByApplyId(
           java.lang.Integer applyId) {
           this.applyId = applyId;
    }


    /**
     * Gets the applyId value for this QueryStatusByApplyId.
     * 
     * @return applyId
     */
    public java.lang.Integer getApplyId() {
        return applyId;
    }


    /**
     * Sets the applyId value for this QueryStatusByApplyId.
     * 
     * @param applyId
     */
    public void setApplyId(java.lang.Integer applyId) {
        this.applyId = applyId;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof QueryStatusByApplyId)) return false;
        QueryStatusByApplyId other = (QueryStatusByApplyId) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.applyId==null && other.getApplyId()==null) || 
             (this.applyId!=null &&
              this.applyId.equals(other.getApplyId())));
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
        if (getApplyId() != null) {
            _hashCode += getApplyId().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(QueryStatusByApplyId.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://order.webservice.hengyi.com/", "queryStatusByApplyId"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("applyId");
        elemField.setXmlName(new javax.xml.namespace.QName("", "applyId"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
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