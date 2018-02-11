package com.zzy.htms.services.business;

import java.util.ArrayList;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;

import com.mobilecn.utils.XMLUtil;
import com.zzy.htms.services.user.ServiceUserBean;

public class PxmlParser {
	public static Element getRootElement(String pxml){
		Document doc = XMLUtil.changeXmlString2Document(pxml);
		if(doc==null){
			System.out.println("doc==null");
			return null;// paramsMap;
		}
		
		Element root = XMLUtil.getRootElement(doc);//getRootElement(params);
		if(root==null){
			System.out.println("root==null");
			return null;// paramsMap;
		}
		return root;
	}
	
	public static ServiceUserBean getServiceUserInfo(String pxml){
		Document doc = XMLUtil.changeXmlString2Document(pxml);
		if(doc==null){
			System.out.println("getServiceUserInfo doc==null");
			return null;// paramsMap;
		}
		
		Element root = XMLUtil.getRootElement(doc);//getRootElement(params);
		if(root==null){
			System.out.println("getServiceUserInfo root==null");
			return null;// paramsMap;
		}
	
		
	//	Element root = XMLUtil.getRootElement(doc);//getRootElement(params);
		Element element=tools.tool.XMLUtil.getElement(root, XmlConsts.SYSTEM);
		if(element==null){
			System.out.println("getServiceUserInfo SYSTEM element==null");
			return null;// paramsMap;
		}
		String code=tools.tool.XMLUtil.getElementValue(element, XmlConsts.CODE);
		if(code==null||"".equals(code.trim())){
			System.out.println("getServiceUserInfo CODE element==null");
			return null;
		}
		String account=tools.tool.XMLUtil.getElementValue(element, XmlConsts.ACCOUNT);
		if(account==null||"".equals(account.trim())){
			System.out.println("getServiceUserInfo ACCOUNT element==null");
			return null;
		}
		String pwd=tools.tool.XMLUtil.getElementValue(element, XmlConsts.PWD);
		if(pwd==null||"".equals(pwd.trim())){
			System.out.println("getServiceUserInfo PWD element==null");
			return null;
		}
		ServiceUserBean userBean = new ServiceUserBean();
		userBean.setAccount(account);
		userBean.setSyscode(code);
		userBean.setPasswd(pwd);
		return userBean;
	}
	
	
	/**
	 * 把SAP的调用参数量解析转换对象组
	 * @param pxml
	 * @return
	 */
	public static  List<SapTransferBean> getSapTransferBean(String pxml){
		Document doc = XMLUtil.changeXmlString2Document(pxml);
		if(doc==null){
			System.out.println("getServiceUserInfo doc==null");
			return null;// paramsMap;
		}
		
		Element root = XMLUtil.getRootElement(doc);//getRootElement(params);
		if(root==null){
			System.out.println("getServiceUserInfo root==null");
			return null;// paramsMap;
		}
	
		List<Element> elmentsList=tools.tool.XMLUtil.getElements(root, XmlConsts.DELIVERY_INFO);
		if(elmentsList==null||elmentsList.isEmpty()==true){
			System.out.println("elmentsList==null||elmentsList.isEmpty()==true");
			return null;// paramsMap;
		}
		Element element=null;
		SapTransferBean transBean = null;
		String value=null;
		List<SapTransferBean> transList = new ArrayList<SapTransferBean>();
		for(int i=0,size=elmentsList.size();i<size;i++){
			element=elmentsList.get(i);
			
			transBean=new SapTransferBean();
			value=tools.tool.XMLUtil.getElementValue(element, XmlConsts.VBELN);
			value=value==null||"".equals(value.trim())?"":value.trim();
			transBean.setTransferCode(value);//交货单号
			
			value=tools.tool.XMLUtil.getElementValue(element, XmlConsts.POSNR);
			value=value==null||"".equals(value.trim())?"":value.trim();
			transBean.setItemCode(value);//行项目号
			
			value=tools.tool.XMLUtil.getElementValue(element, XmlConsts.MATNR);
			value=value==null||"".equals(value.trim())?"":value.trim();
			transBean.setMeterialCode(value);//物料号
			
			value=tools.tool.XMLUtil.getElementValue(element, XmlConsts.LFIMG);
			value=value==null||"".equals(value.trim())?"":value.trim();
			transBean.setApplyTonNum(value);//数量
			
			value=tools.tool.XMLUtil.getElementValue(element, XmlConsts.MEINS);
			value=value==null||"".equals(value.trim())?"":value.trim();
			transBean.setMeretialUnit(value);//单位
			
			/*用来标识是否预估运费，默认为true为预估；false为真实运费*/
			value=tools.tool.XMLUtil.getElementValue(element, XmlConsts.ESIMT);
			value=value==null||"".equals(value.trim())?"true":value.trim();
			transBean.setEstimate(value);//单位
			transList.add(transBean);
		}
		
		return transList;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		XmlBuffer stockBuffer = new XmlBuffer();
		stockBuffer.rootStart();
		 stockBuffer.start("system").newLine();
		 stockBuffer.element("code", "SAP").newLine();//状态,S=成功
		 stockBuffer.element("account", "sap").newLine();//编码
		 stockBuffer.element("passwd", "123456").newLine();//消息
		 stockBuffer.end("system").newLine();


		 stockBuffer.start("DELIVERY_INFO").newLine();
		 stockBuffer.element("VBELN", "0081384911").newLine();//交货单号
		 stockBuffer.element("POSNR", "000010").newLine();//行项目号
		 stockBuffer.element("MATNR", "DTY").newLine();//物料号
		 stockBuffer.element("LFIMG", "12648").newLine();//数量
		 stockBuffer.element("MEINS", "KG").newLine();//单位
		 stockBuffer.end("DELIVERY_INFO").newLine();
		 
		 stockBuffer.start("DELIVERY_INFO").newLine();
		 stockBuffer.element("VBELN", "SAP").newLine();//交货单号
		 stockBuffer.element("POSNR", "sap").newLine();//行项目号
		 stockBuffer.element("MATNR", "123456").newLine();//物料号
		 stockBuffer.element("LFIMG", "123456").newLine();//数量
		 stockBuffer.element("MEINS", "123456").newLine();//单位
		 stockBuffer.end("DELIVERY_INFO").newLine();
		 
		stockBuffer.rootEnd();
		System.out.println("-------------------- pxml -----------------------");
		System.out.println(stockBuffer);
		System.out.println("-------------------- pxml -----------------------");
		System.out.println(getSapTransferBean(stockBuffer.toString()));

	}

}
