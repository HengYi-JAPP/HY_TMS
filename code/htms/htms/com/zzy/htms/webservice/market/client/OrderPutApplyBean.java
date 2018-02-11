/**
 * OrderPutApplyBean.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.zzy.htms.webservice.market.client;

public class OrderPutApplyBean  implements java.io.Serializable {
    private java.lang.Integer applyId;

    private java.lang.Integer applyPackNum;

    private java.math.BigDecimal applyTonNum;

    private java.util.Calendar createTime;

    private java.lang.Integer delFlag;

    private com.zzy.htms.webservice.market.client.OrderPutApplyDetailBean[] detailBeanList;

    private java.lang.Integer id;

    private java.lang.String orderNo;

    private java.lang.String remark;

    private java.lang.String status;

    public OrderPutApplyBean() {
    }

    public OrderPutApplyBean(
           java.lang.Integer applyId,
           java.lang.Integer applyPackNum,
           java.math.BigDecimal applyTonNum,
           java.util.Calendar createTime,
           java.lang.Integer delFlag,
           com.zzy.htms.webservice.market.client.OrderPutApplyDetailBean[] detailBeanList,
           java.lang.Integer id,
           java.lang.String orderNo,
           java.lang.String remark,
           java.lang.String status) {
           this.applyId = applyId;
           this.applyPackNum = applyPackNum;
           this.applyTonNum = applyTonNum;
           this.createTime = createTime;
           this.delFlag = delFlag;
           this.detailBeanList = detailBeanList;
           this.id = id;
           this.orderNo = orderNo;
           this.remark = remark;
           this.status = status;
    }


    /**
     * Gets the applyId value for this OrderPutApplyBean.
     * 
     * @return applyId
     */
    public java.lang.Integer getApplyId() {
        return applyId;
    }


    /**
     * Sets the applyId value for this OrderPutApplyBean.
     * 
     * @param applyId
     */
    public void setApplyId(java.lang.Integer applyId) {
        this.applyId = applyId;
    }


    /**
     * Gets the applyPackNum value for this OrderPutApplyBean.
     * 
     * @return applyPackNum
     */
    public java.lang.Integer getApplyPackNum() {
        return applyPackNum;
    }


    /**
     * Sets the applyPackNum value for this OrderPutApplyBean.
     * 
     * @param applyPackNum
     */
    public void setApplyPackNum(java.lang.Integer applyPackNum) {
        this.applyPackNum = applyPackNum;
    }


    /**
     * Gets the applyTonNum value for this OrderPutApplyBean.
     * 
     * @return applyTonNum
     */
    public java.math.BigDecimal getApplyTonNum() {
        return applyTonNum;
    }


    /**
     * Sets the applyTonNum value for this OrderPutApplyBean.
     * 
     * @param applyTonNum
     */
    public void setApplyTonNum(java.math.BigDecimal applyTonNum) {
        this.applyTonNum = applyTonNum;
    }


    /**
     * Gets the createTime value for this OrderPutApplyBean.
     * 
     * @return createTime
     */
    public java.util.Calendar getCreateTime() {
        return createTime;
    }


    /**
     * Sets the createTime value for this OrderPutApplyBean.
     * 
     * @param createTime
     */
    public void setCreateTime(java.util.Calendar createTime) {
        this.createTime = createTime;
    }


    /**
     * Gets the delFlag value for this OrderPutApplyBean.
     * 
     * @return delFlag
     */
    public java.lang.Integer getDelFlag() {
        return delFlag;
    }


    /**
     * Sets the delFlag value for this OrderPutApplyBean.
     * 
     * @param delFlag
     */
    public void setDelFlag(java.lang.Integer delFlag) {
        this.delFlag = delFlag;
    }


    /**
     * Gets the detailBeanList value for this OrderPutApplyBean.
     * 
     * @return detailBeanList
     */
    public com.zzy.htms.webservice.market.client.OrderPutApplyDetailBean[] getDetailBeanList() {
        return detailBeanList;
    }


    /**
     * Sets the detailBeanList value for this OrderPutApplyBean.
     * 
     * @param detailBeanList
     */
    public void setDetailBeanList(com.zzy.htms.webservice.market.client.OrderPutApplyDetailBean[] detailBeanList) {
        this.detailBeanList = detailBeanList;
    }

    public com.zzy.htms.webservice.market.client.OrderPutApplyDetailBean getDetailBeanList(int i) {
        return this.detailBeanList[i];
    }

    public void setDetailBeanList(int i, com.zzy.htms.webservice.market.client.OrderPutApplyDetailBean _value) {
        this.detailBeanList[i] = _value;
    }


    /**
     * Gets the id value for this OrderPutApplyBean.
     * 
     * @return id
     */
    public java.lang.Integer getId() {
        return id;
    }


    /**
     * Sets the id value for this OrderPutApplyBean.
     * 
     * @param id
     */
    public void setId(java.lang.Integer id) {
        this.id = id;
    }


    /**
     * Gets the orderNo value for this OrderPutApplyBean.
     * 
     * @return orderNo
     */
    public java.lang.String getOrderNo() {
        return orderNo;
    }


    /**
     * Sets the orderNo value for this OrderPutApplyBean.
     * 
     * @param orderNo
     */
    public void setOrderNo(java.lang.String orderNo) {
        this.orderNo = orderNo;
    }


    /**
     * Gets the remark value for this OrderPutApplyBean.
     * 
     * @return remark
     */
    public java.lang.String getRemark() {
        return remark;
    }


    /**
     * Sets the remark value for this OrderPutApplyBean.
     * 
     * @param remark
     */
    public void setRemark(java.lang.String remark) {
        this.remark = remark;
    }


    /**
     * Gets the status value for this OrderPutApplyBean.
     * 
     * @return status
     */
    public java.lang.String getStatus() {
        return status;
    }


    /**
     * Sets the status value for this OrderPutApplyBean.
     * 
     * @param status
     */
    public void setStatus(java.lang.String status) {
        this.status = status;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof OrderPutApplyBean)) return false;
        OrderPutApplyBean other = (OrderPutApplyBean) obj;
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
              this.applyId.equals(other.getApplyId()))) &&
            ((this.applyPackNum==null && other.getApplyPackNum()==null) || 
             (this.applyPackNum!=null &&
              this.applyPackNum.equals(other.getApplyPackNum()))) &&
            ((this.applyTonNum==null && other.getApplyTonNum()==null) || 
             (this.applyTonNum!=null &&
              this.applyTonNum.equals(other.getApplyTonNum()))) &&
            ((this.createTime==null && other.getCreateTime()==null) || 
             (this.createTime!=null &&
              this.createTime.equals(other.getCreateTime()))) &&
            ((this.delFlag==null && other.getDelFlag()==null) || 
             (this.delFlag!=null &&
              this.delFlag.equals(other.getDelFlag()))) &&
            ((this.detailBeanList==null && other.getDetailBeanList()==null) || 
             (this.detailBeanList!=null &&
              java.util.Arrays.equals(this.detailBeanList, other.getDetailBeanList()))) &&
            ((this.id==null && other.getId()==null) || 
             (this.id!=null &&
              this.id.equals(other.getId()))) &&
            ((this.orderNo==null && other.getOrderNo()==null) || 
             (this.orderNo!=null &&
              this.orderNo.equals(other.getOrderNo()))) &&
            ((this.remark==null && other.getRemark()==null) || 
             (this.remark!=null &&
              this.remark.equals(other.getRemark()))) &&
            ((this.status==null && other.getStatus()==null) || 
             (this.status!=null &&
              this.status.equals(other.getStatus())));
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
        if (getApplyPackNum() != null) {
            _hashCode += getApplyPackNum().hashCode();
        }
        if (getApplyTonNum() != null) {
            _hashCode += getApplyTonNum().hashCode();
        }
        if (getCreateTime() != null) {
            _hashCode += getCreateTime().hashCode();
        }
        if (getDelFlag() != null) {
            _hashCode += getDelFlag().hashCode();
        }
        if (getDetailBeanList() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getDetailBeanList());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getDetailBeanList(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getId() != null) {
            _hashCode += getId().hashCode();
        }
        if (getOrderNo() != null) {
            _hashCode += getOrderNo().hashCode();
        }
        if (getRemark() != null) {
            _hashCode += getRemark().hashCode();
        }
        if (getStatus() != null) {
            _hashCode += getStatus().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(OrderPutApplyBean.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://order.webservice.hengyi.com/", "orderPutApplyBean"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("applyId");
        elemField.setXmlName(new javax.xml.namespace.QName("", "applyId"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("applyPackNum");
        elemField.setXmlName(new javax.xml.namespace.QName("", "applyPackNum"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("applyTonNum");
        elemField.setXmlName(new javax.xml.namespace.QName("", "applyTonNum"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "decimal"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("createTime");
        elemField.setXmlName(new javax.xml.namespace.QName("", "createTime"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "dateTime"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("delFlag");
        elemField.setXmlName(new javax.xml.namespace.QName("", "delFlag"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("detailBeanList");
        elemField.setXmlName(new javax.xml.namespace.QName("", "detailBeanList"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://order.webservice.hengyi.com/", "orderPutApplyDetailBean"));
        elemField.setMinOccurs(0);
        elemField.setNillable(true);
        elemField.setMaxOccursUnbounded(true);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("id");
        elemField.setXmlName(new javax.xml.namespace.QName("", "id"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
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
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("remark");
        elemField.setXmlName(new javax.xml.namespace.QName("", "remark"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("status");
        elemField.setXmlName(new javax.xml.namespace.QName("", "status"));
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
