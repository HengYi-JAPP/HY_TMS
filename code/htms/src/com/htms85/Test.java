package com.htms85;

import net.sf.json.JSONObject;

public class Test {

	public static void main(String[] args) throws Exception {
		getTransferTranceInfo();
	}
	
	
	public static void getTransferTranceInfo() throws Exception{
		JSONObject jsonObject = new JSONObject();   
        jsonObject.put("code","test");   
        jsonObject.put("account", "test");   
        jsonObject.put("passwd", "test");
        jsonObject.put("orderCode", "0010000545");
        jsonObject.put("sapCode", "0080001943");
        
        String s =  jsonObject.toString();
        HtmsServerServicesServiceLocator  services=  new  HtmsServerServicesServiceLocator();
		HtmsServerServices_PortType  portType=services.getHtmsServerServices();
        
	    System.out.println(s);
        String result  = portType.getTransferTraceInfor(s);
        System.out.println(result);
	}
	
	
	public static void agreeGoods() throws Exception{
		JSONObject jsonObject = new JSONObject();   
        jsonObject.put("code","arrangegoods");   
        jsonObject.put("account", "test");   
        jsonObject.put("passwd", "test");   
        jsonObject.put("shipId", "320");
        jsonObject.put("userId", "1");   
        jsonObject.put("shipDetailId", new String[]{"382"});
        jsonObject.put("applyTonNum", new String[]{"12"});
        
        String s =  jsonObject.toString();
        HtmsServerServicesServiceLocator  services=  new  HtmsServerServicesServiceLocator();
		HtmsServerServices_PortType  portType=services.getHtmsServerServices();
        
	    //System.out.println(s);
        String result  = portType.agreeArrangeGoods("{\"code\":\"test\",\"account\":\"test\",\"passwd\":\"test\",\"shipId\":23,\"userId\":\"1\",\"shipDetailId\":[\"26\"],\"applyTonNum\":[\"20.00\"]}");
	    System.out.println(result);
	}
	
	
	public static void testGetFreight() throws Exception{
		JSONObject jsonObject = new JSONObject();   
        jsonObject.put("code","test");   
        jsonObject.put("account", "test");   
        jsonObject.put("passwd", "test");   
        jsonObject.put("shipId", "320");
        jsonObject.put("userId", "1");   
        jsonObject.put("shipDetailId", new String[]{"382"});
        jsonObject.put("applyTonNum", new String[]{"12"});
        
        String s =  jsonObject.toString();
        HtmsServerServicesServiceLocator  services=  new  HtmsServerServicesServiceLocator();
		HtmsServerServices_PortType  portType=services.getHtmsServerServices();
        
	    System.out.println(s);
	    
	    String test="{\"code\":\"test\",\"account\":\"test\",\"passwd\":\"test\",\"shipId\":323,\"userId\":\"1\",\"shipDetailId\":[\"387\",\"388\"],\"applyTonNum\":[\"80.000\",\"198.000\"]}";
        String result  = portType.getEstimateShipFreight(s);
	    System.out.println(result);
	}
	
	
	public static void testGetAddress() throws Exception{
		JSONObject jsonObject = new JSONObject();   
        jsonObject.put("code","arrangegoods");   
        jsonObject.put("account", "test");   
        jsonObject.put("passwd", "test");   
        jsonObject.put("customerSapNo", "0000300029");   
        jsonObject.put("userId", "1");
        
        
        String s =  jsonObject.toString();
        HtmsServerServicesServiceLocator  services=  new  HtmsServerServicesServiceLocator();
		HtmsServerServices_PortType  portType=services.getHtmsServerServices();
        
	    System.out.println(s);
        String result  = portType.getCustomerAddress(s);
	    System.out.println(result);
	}
	
	public static void testTransferQuery() throws Exception{
		JSONObject jsonObject = new JSONObject();   
        jsonObject.put("code","test");   
        jsonObject.put("account", "test");   
        jsonObject.put("passwd", "test");   
        jsonObject.put("orderNo", "0010000652");   
        jsonObject.put("userId", "1");
        String s =  jsonObject.toString();
        
        HtmsServerServicesServiceLocator  services=  new  HtmsServerServicesServiceLocator();
		HtmsServerServices_PortType  portType=services.getHtmsServerServices();
        
	    System.out.println(s);
        String result  = portType.getShipInfo(s);
	    System.out.println(result);
	}
	
}
