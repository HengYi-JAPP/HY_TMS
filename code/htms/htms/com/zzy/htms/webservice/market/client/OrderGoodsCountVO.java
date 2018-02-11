/**
 * OrderGoodsCountVO.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.zzy.htms.webservice.market.client;

public class OrderGoodsCountVO  implements java.io.Serializable {
    private java.lang.String materialCode;

    private java.math.BigDecimal number;

    private java.lang.String orderNo;

    public OrderGoodsCountVO() {
    }

    public OrderGoodsCountVO(
           java.lang.String materialCode,
           java.math.BigDecimal number,
           java.lang.String orderNo) {
           this.materialCode = materialCode;
           this.number = number;
           this.orderNo = orderNo;
    }


    /**
     * Gets the materialCode value for this OrderGoodsCountVO.
     * 
     * @return materialCode
     */
    public java.lang.String getMaterialCode() {
        return materialCode;
    }


    /**
     * Sets the materialCode value for this OrderGoodsCountVO.
     * 
     * @param materialCode
     */
    public void setMaterialCode(java.lang.String materialCode) {
        this.materialCode = materialCode;
    }


    /**
     * Gets the number value for this OrderGoodsCountVO.
     * 
     * @return number
     */
    public java.math.BigDecimal getNumber() {
        return number;
    }


    /**
     * Sets the number value for this OrderGoodsCountVO.
     * 
     * @param number
     */
    public void setNumber(java.math.BigDecimal number) {
        this.number = number;
    }


    /**
     * Gets the orderNo value for this OrderGoodsCountVO.
     * 
     * @return orderNo
     */
    public java.lang.String getOrderNo() {
        return orderNo;
    }


    /**
     * Sets the orderNo value for this OrderGoodsCountVO.
     * 
     * @param orderNo
     */
    public void setOrderNo(java.lang.String orderNo) {
        this.orderNo = orderNo;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof OrderGoodsCountVO)) return false;
        OrderGoodsCountVO other = (OrderGoodsCountVO) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.materialCode==null && other.getMaterialCode()==null) || 
             (this.materialCode!=null &&
              this.materialCode.equals(other.getMaterialCode()))) &&
            ((this.number==null && other.getNumber()==null) || 
             (this.number!=null &&
              this.number.equals(other.getNumber()))) &&
            ((this.orderNo==null && other.getOrderNo()==null) || 
             (this.orderNo!=null &&
              this.orderNo.equals(other.getOrderNo())));
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
        if (getMaterialCode() != null) {
            _hashCode += getMaterialCode().hashCode();
        }
        if (getNumber() != null) {
            _hashCode += getNumber().hashCode();
        }
        if (getOrderNo() != null) {
            _hashCode += getOrderNo().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(OrderGoodsCountVO.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://order.webservice.hengyi.com/", "orderGoodsCountVO"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("materialCode");
        elemField.setXmlName(new javax.xml.namespace.QName("", "materialCode"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("number");
        elemField.setXmlName(new javax.xml.namespace.QName("", "number"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "decimal"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("orderNo");
        elemField.setXmlName(new javax.xml.namespace.QName("", "orderNo"));
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
