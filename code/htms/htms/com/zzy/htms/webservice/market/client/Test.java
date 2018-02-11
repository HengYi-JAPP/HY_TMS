package com.zzy.htms.webservice.market.client;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class Test {
	
	public static void main(String[] args) throws Exception {
		getGoodsCount();
	}
	public static void  getGoodsCount()throws Exception {
		OrderPutApplyRmtServiceImplServiceLocator  service=new OrderPutApplyRmtServiceImplServiceLocator();
		OrderPutApplyRmtService orderApplyService= service.getOrderPutApplyRmtServiceImplPort();
		
		OrderGoodsCountVO[]  orderGoodsCountVO = new OrderGoodsCountVO[1];
		
		OrderGoodsCountVO  countVo1= new OrderGoodsCountVO();
		countVo1.setOrderNo("0010000652");
		countVo1.setMaterialCode("000000001000311850");
		
		OrderGoodsCountVO  countVo2= new OrderGoodsCountVO();
		countVo2.setOrderNo("0010000652");
		countVo2.setMaterialCode("000000001000311850");
		
		orderGoodsCountVO[0]=countVo1;
		//orderGoodsCountVO[1]=countVo2;
		
		JSONObject obj1=new JSONObject();
		obj1.put("orderNo", "0010000652");
		obj1.put("materialCode", "000000001000311850");
       
		JSONArray array=new JSONArray();
		array.add(0, obj1);
		
		JSONObject orderGoodsCountJson=new JSONObject();
		
		System.out.println(array.toString());
		WebServiceResponse responseBean= orderApplyService.getGoodsCount(array.toString());
		
		System.out.println(responseBean.getMessageType());	
		System.out.println(responseBean.getMessage());
		
		System.out.println(responseBean.getData());
		
		
	}
	
	public static void  testQueryStatusByApplyId()throws Exception {
		OrderPutApplyRmtServiceImplServiceLocator  service=new OrderPutApplyRmtServiceImplServiceLocator();
		OrderPutApplyRmtService orderApplyService= service.getOrderPutApplyRmtServiceImplPort();
		WebServiceResponse responseBean= orderApplyService.queryStatusByApplyId(7554);
		
		System.out.println(responseBean.getMessageType());
		System.out.println(responseBean.getMessage());
		
		System.out.println(responseBean.getData());
		
		
	}
	
	
}
