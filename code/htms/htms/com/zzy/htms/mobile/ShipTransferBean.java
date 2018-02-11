package com.zzy.htms.mobile;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.mobilecn.beans.AbstractBean;
import com.zzy.htms.sales.ship.ShipBean;
import com.zzy.htms.sales.shipdetail.ShipDetailBean;


/**
 * 调拨单处理实体类
 * @author zzy
 *
 */
public class ShipTransferBean extends AbstractBean  implements Serializable {
	private int shipId;
	private String shipDetailId;
	private String transId;
	private int transStatus;
	private int applyStatus;
	private String createTime;

	private String customerName;
	private String corderCode;
	
	private String areaName;
	private String caddrDetail;
	
	private String unitPrice;
	private String caddrContactor;
	private String caddrTelephone="";
	private String factoryName="";
	private int sendStatus;
		
	/*贸易商自提信息*/
	private int selfFetch;
	private String fetchDriver;
	private String fetchMobile ;
	private String fetchCar;
	private int isUrgent;
	
	private String shipNotice;
	
	private String totalFreight;
	private String freightPrice;//单价
	private String freight;//预估运价
	private String freightModel;//计价方式
	
	private List<ShipDetailBean> detailList = new ArrayList<ShipDetailBean>();
	private List<String> transIdList = new ArrayList<String>();
	
	private List<ShipTransferBean> transportList = new ArrayList<ShipTransferBean>();
	
	public ShipTransferBean(ShipBean shipBean) {
		if (shipBean == null) {
			return;
		}
		
		this.setShipId(shipBean.getShipId());
		this.setTransStatus(shipBean.getTransStatus());
		this.setCreateTime(shipBean.getCreateTime());
		this.setApplyStatus(shipBean.getApplyStatus());
		this.setCustomerName(shipBean.getCustomerName());
		this.setCorderCode(shipBean.getCorderCode());
		this.setAreaName(shipBean.getAreaName());
		this.setCaddrDetail(shipBean.getCaddrDetail());
		this.setUnitPrice(shipBean.getUnitPrice());
		this.setCaddrContactor(shipBean.getCaddrContactor());
		this.setCaddrTelephone(shipBean.getCaddrTelephone());
		this.setFactoryName(shipBean.getFactoryName());
		this.setSelfFetch(shipBean.getSelfFetch());
		this.setFetchDriver(shipBean.getFetchDriver());
		this.setFetchMobile(shipBean.getFetchMobile());
		this.setFetchCar(shipBean.getFetchCar());
		this.setIsUrgent(shipBean.getIsUrgent());
		this.setShipNotice(shipBean.getShipNotice());
		this.setTransId(shipBean.getTransId());
		this.setTotalFreight(shipBean.getTotalFreight());
		this.setFreight(shipBean.getFreight());
		this.setFreightPrice(shipBean.getFreightPrice());
		this.setFreightModel(shipBean.getFreightModel());
	}
	
	public ShipTransferBean(ShipTransferBean transferBean) {
		if (transferBean == null) {
			return;
		}
		
		this.setShipId(transferBean.getShipId());
		this.setTransStatus(transferBean.getTransStatus());
		this.setCreateTime(transferBean.getCreateTime());
		this.setApplyStatus(transferBean.getApplyStatus());
		this.setCustomerName(transferBean.getCustomerName());
		this.setCorderCode(transferBean.getCorderCode());
		this.setAreaName(transferBean.getAreaName());
		this.setCaddrDetail(transferBean.getCaddrDetail());
		this.setUnitPrice(transferBean.getUnitPrice());
		this.setCaddrContactor(transferBean.getCaddrContactor());
		this.setCaddrTelephone(transferBean.getCaddrTelephone());
		this.setFactoryName(transferBean.getFactoryName());
		this.setSelfFetch(transferBean.getSelfFetch());
		this.setFetchDriver(transferBean.getFetchDriver());
		this.setFetchMobile(transferBean.getFetchMobile());
		this.setFetchCar(transferBean.getFetchCar());
		this.setIsUrgent(transferBean.getIsUrgent());
		this.setShipNotice(transferBean.getShipNotice());
		this.setTransId(transferBean.getTransId());
		this.setTotalFreight(transferBean.getTotalFreight());
		this.setFreight(transferBean.getFreight());
		this.setFreightPrice(transferBean.getFreightPrice());
		this.setFreightModel(transferBean.getFreightModel());
		
		this.detailList.addAll(transferBean.getDetailList());
	}
	
	public int getApplyStatus() {
		return applyStatus;
	}

	public void setApplyStatus(int applyStatus) {
		this.applyStatus = applyStatus;
	}

	public int getSendStatus() {
		return sendStatus;
	}

	public void setSendStatus(int sendStatus) {
		this.sendStatus = sendStatus;
	}

	public int getShipId() {
		return shipId;
	}
	public void setShipId(int shipId) {
		this.shipId = shipId;
	}
	
	public String getTransId() {
		return transId;
	}

	public void setTransId(String transId) {
		this.transId = transId;
	}

	public String getShipDetailId() {
		return shipDetailId;
	}

	public void setShipDetailId(String shipDetailId) {
		this.shipDetailId = shipDetailId;
	}

	public int getTransStatus() {
		return transStatus;
	}
	public void setTransStatus(int transStatus) {
		this.transStatus = transStatus;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCorderCode() {
		return corderCode;
	}
	public void setCorderCode(String corderCode) {
		this.corderCode = corderCode;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getCaddrDetail() {
		return caddrDetail;
	}
	public void setCaddrDetail(String caddrDetail) {
		this.caddrDetail = caddrDetail;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getCaddrContactor() {
		return caddrContactor;
	}
	public void setCaddrContactor(String caddrContactor) {
		this.caddrContactor = caddrContactor;
	}
	public String getCaddrTelephone() {
		return caddrTelephone;
	}
	public void setCaddrTelephone(String caddrTelephone) {
		this.caddrTelephone = caddrTelephone;
	}
	public String getFactoryName() {
		return factoryName;
	}
	public void setFactoryName(String factoryName) {
		this.factoryName = factoryName;
	}
	public int getSelfFetch() {
		return selfFetch;
	}
	public void setSelfFetch(int selfFetch) {
		this.selfFetch = selfFetch;
	}
	public String getFetchDriver() {
		return fetchDriver;
	}
	public void setFetchDriver(String fetchDriver) {
		this.fetchDriver = fetchDriver;
	}
	public String getFetchMobile() {
		return fetchMobile;
	}
	public void setFetchMobile(String fetchMobile) {
		this.fetchMobile = fetchMobile;
	}
	public String getFetchCar() {
		return fetchCar;
	}
	public void setFetchCar(String fetchCar) {
		this.fetchCar = fetchCar;
	}
	public int getIsUrgent() {
		return isUrgent;
	}
	public void setIsUrgent(int isUrgent) {
		this.isUrgent = isUrgent;
	}
	
	public String getShipNotice() {
		return shipNotice;
	}

	public String getTotalFreight() {
		return totalFreight;
	}

	public void setTotalFreight(String totalFreight) {
		this.totalFreight = totalFreight;
	}

	
	
	public String getFreightPrice() {
		return freightPrice;
	}

	public void setFreightPrice(String freightPrice) {
		this.freightPrice = freightPrice;
	}

	public String getFreight() {
		return freight;
	}

	public void setFreight(String freight) {
		this.freight = freight;
	}

	public String getFreightModel() {
		return freightModel;
	}

	public void setFreightModel(String freightModel) {
		this.freightModel = freightModel;
	}

	public void setShipNotice(String shipNotice) {
		this.shipNotice = shipNotice;
	}

	public List<ShipDetailBean> getDetailList() {
		return this.detailList;
	}
	public int getDetailCount() {
		return this.detailList.size();
	}
	public ShipDetailBean getDetail(int index) {
		if (index >= this.detailList.size()) {
			return null;
		}
		
		return this.detailList.get(index);
	}
	public void addDetail(ShipBean shipBean) {
		if (shipBean == null) {
			return;
		}
		
		String shipDetailId = shipBean.getShipDetailId();
		if (shipDetailId == null) {
			return;
		}
		int iDetailId = Integer.parseInt(shipDetailId);
		
		boolean exsit = false;
		
		for (int i = 0; i < this.detailList.size(); i++) {
			ShipDetailBean detailBean = this.detailList.get(i);
			int detailId = detailBean.getShipDetailId();
			
			if (iDetailId == detailId) {
				exsit = true;
			}
		}
		
		if (!exsit) {
			ShipDetailBean detailBean = new ShipDetailBean();
			
			detailBean.setShipId(shipBean.getShipId());
			detailBean.setShipDetailId(iDetailId);
			detailBean.setCodetailCertificateDesc(shipBean.getCodetailCertificateDesc());
			detailBean.setUnitPrice(shipBean.getUnitPrice());
			detailBean.setApplyTonNum(shipBean.getApplyTonNum());
			detailBean.setApplyPackNum(shipBean.getApplyPackNum());
			
			this.detailList.add(detailBean);
		}
		
	}
	
	public int getTransCount() {
		return this.transIdList.size();
	}
	public String getTransId(int index) {
		if (index >= this.transIdList.size()) {
			return null;
		}
		
		return this.transIdList.get(index);
	}
	public void addTransId(String transId) {
		if (transId == null) {
			return;
		}
		
		boolean exsit = false;
		
		for (int i = 0; i < this.transIdList.size(); i++) {
			String lTransId = this.transIdList.get(i);
			if (lTransId == null) {
				continue;
			}
			
			if (lTransId.equals(transId)) {
				exsit = true;
			}
		}
		
		if (!exsit) {
			this.transIdList.add(transId);
		}		
		
//		System.out.println("transIdList============" + transIdList);
	}
	public List<String> getTransIdList() {
		return transIdList;
	}

	public List<ShipTransferBean> getTransportList() {
		return this.transportList;
	}
	public int getTransportCount() {
		return this.transportList.size();
	}
	public ShipTransferBean getTransBean(String transId) {
		if (transId == null) {
			return null;
		}
		
		ShipTransferBean transBean = null;
		
		for (int i = 0; i < this.transportList.size(); i++) {
			ShipTransferBean detailBean = this.transportList.get(i);
			
			String iTransId = detailBean.getTransId();
			if (iTransId == null) {
				continue;
			}
			
			if (transId.equals(iTransId)) {
				transBean = detailBean;
			}
		}
		
		return transBean;
	}
	public void addTransport(ShipTransferBean driverBean) {
		if (driverBean == null) {
			return;
		}
		
		String iTransId = driverBean.getTransId();
		if (iTransId == null) {
			return;
		}
		
		boolean exsit = false;
		
		for (int i = 0; i < this.transportList.size(); i++) {
			ShipTransferBean detailBean = this.transportList.get(i);
			
			String transId = detailBean.getTransId();
			if (transId == null) {
				continue;
			}
			
			if (transId.equals(iTransId)) {
				exsit = true;
			}
		}
		
		if (!exsit) {
			this.transportList.add(driverBean);	
		}
		
			
	}
}
