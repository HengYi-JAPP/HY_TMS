package com.zzy.htms.services.business;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.zzy.htms.services.user.ServiceUserBean;
import com.zzy.htms.services.user.ServiceUserRepository;

/**
 * webservices实现类
 * @author zzy
 *
 */
public class HtmsServiceBusiness  extends AbstractBusinessExecutor {

	public boolean validateUser(String pxml){
		if(this.isNull(pxml)){
			log.info("validateUser  pxml==null");
			return false;
		}
		ServiceUserBean clientUserBean =PxmlParser.getServiceUserInfo(pxml);
		if(clientUserBean==null){
			log.info("validateUser  clientUserBean==null");
			return false;
		}
		ServiceUserBean serverUserBean =ServiceUserRepository.getServiceUser(clientUserBean.getSyscode(), clientUserBean.getAccount());
		if(serverUserBean==null){
			log.info("validateUser  serverUserBean==null");
			return false;
		}
		if(serverUserBean.getPasswd()!=null&&serverUserBean.getPasswd().equals(clientUserBean.getPasswd())){
			log.info("validateUser  serverUserBean.getPasswd().equals(clientUserBean.getPasswd())==true");
			return true;
		}
		log.info("validateUser  serverUserBean.getPasswd().equals(clientUserBean.getPasswd())==false");
		return false;
	}
	/**
	 * 
	 * @param resultType 状态,E=失败,状态,S=成功
	 * @param code 编码
	 * @param message 消息
	 * @return
	 */
	public String getResult(String resultType,String code, String message,boolean isRoot){
		XmlBuffer stockBuffer = new XmlBuffer();
		if(isRoot)
		stockBuffer.rootStart();
		 stockBuffer.start("result");
		 stockBuffer.element("type", resultType);//状态,E=失败
		 stockBuffer.element("code", code);//编码
		 stockBuffer.element("message", message);//消息
		 stockBuffer.end("result");
		 if(isRoot)
		stockBuffer.rootEnd();
		 
		return stockBuffer.toString();
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//HtmsServiceBusiness stockBusiness = new HtmsServiceBusiness();
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
		//stockBusiness.getTransferHoldStock(stockBuffer.toString());
	}

}
