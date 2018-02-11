package com.zzy.htms.services.business;

import java.util.HashMap;
import java.util.List;

import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.logistic.transfer.TransferBean;


/**
 * 保留库存webservice接口,供sap做查询使用
 * @author zzy
 *
 */
public class HtmsHoldStockBusiness  extends HtmsServiceBusiness {
	public String getTransferHoldStock(String pxml){
		if(this.validateUser(pxml)==false){
			return getResult("E","E000","访问凭证不合法，请和管理员联系。",true);
		}
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadTransferHoldStock");
		ResultBean resultBean = this.dbOperator(operationBean, new HashMap(), false);
		if(resultBean==null|resultBean.isSuccess()==false){
			return getResult("E","E001","数据库查询异常，请检查日志。",true);
		}
		
		List list =resultBean.getListResult("loadTransferHoldStock");
		log.info("loadTransferHoldStock="+(list==null?0:list.size()));
		if(list==null){
			return getResult("S","S000","没有查找到合适数据。",true);
		}else{				
			TransferBean transferBean = null;
			XmlBuffer stockBuffer = new XmlBuffer();
			stockBuffer.rootStart();
			String address = null;
			AreaRepository rep = new AreaRepository();
			String value = null;
			for(int i =0,size=list.size();i<size;i++){
				 transferBean = (TransferBean)list.get(i);
				 address =rep.getFullAreaName(transferBean.getAreaId(), "", true);
				 stockBuffer.start("transfer");//.newLine();				 
				
				 stockBuffer.element("code", transferBean.getTransferCode());//.newLine();//交货单号（虚拟调拨单号）
				 stockBuffer.element("orderCode", transferBean.getCorderCode());//.newLine();//销售订单号
				 stockBuffer.element("itemCode", transferBean.getCodetailCertificate());//.newLine();//行项目号
				 value=transferBean.getApplyTonNum();
				 value=value==null?"":value;
				 stockBuffer.element("applyTonNum", value);//.newLine();//数量
				 value=transferBean.getActualTonNum();
				 value=value==null?"":value;
				 stockBuffer.element("applyPackNum",value);//.newLine();//包数
				 value=transferBean.getCaddrContactor();
				 value=value==null?"":value;
				 stockBuffer.element("contactor",value);//.newLine();//收货人
				 value=transferBean.getCaddrTelephone();
				 value=value==null?"":value;
				 stockBuffer.element("telephone",value);//.newLine();//收货电话
				 stockBuffer.element("address", address+transferBean.getCaddrDetail());//.newLine();//收件人地址
				 value=transferBean.getCreateTime();
				 value=value==null?"":value;
				 stockBuffer.element("createTime", value);//.newLine();//创建日期（内勤审批通过的时间日期）
				 stockBuffer.end("transfer");//.newLine();
			}
			stockBuffer.append(getResult("S","S001","查找到合适数据。",false));
			
			stockBuffer.rootEnd();
			log.info("stockBuffer="+stockBuffer);
			return stockBuffer.toString();
		}
		
		//return "NULL";
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		HtmsHoldStockBusiness stockBusiness = new HtmsHoldStockBusiness();
		XmlBuffer stockBuffer = new XmlBuffer();
		stockBuffer.rootStart();
		 stockBuffer.start("system").newLine();
		 stockBuffer.element("code", "SAP").newLine();//状态,S=成功
		 stockBuffer.element("account", "sap").newLine();//编码
		 stockBuffer.element("passwd", "123456").newLine();//消息
		 stockBuffer.end("system").newLine();
		stockBuffer.rootEnd();
		log.info("-------------------- pxml -----------------------");
		log.info(stockBuffer.toString());
		log.info("-------------------- pxml -----------------------");
		stockBusiness.getTransferHoldStock(stockBuffer.toString());
	}

}
