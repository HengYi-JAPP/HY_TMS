package com.hengyi;

import net.sf.json.JSONObject;


public class Test {

	public static void main(String[] args) {
		try {
			Test.testGetFreight();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void testGetFreight() throws Exception{
		JSONObject jsonObject = new JSONObject();   
        jsonObject.put("code","arrangegoods");   
        jsonObject.put("account", "test");   
        jsonObject.put("passwd", "test");
        jsonObject.put("shipId", "80569");
        jsonObject.put("userId", "1");   
        jsonObject.put("shipDetailId", new String[]{"87053"});
        jsonObject.put("applyTonNum", new String[]{"12000"});
        
        String s =  jsonObject.toString();
        HtmsServerServicesServiceLocator  services=  new  HtmsServerServicesServiceLocator();
		HtmsServerServices_PortType  portType=services.getHtmsServerServices();
        
	    System.out.println(s);
        String result  = portType.getEstimateShipFreight(s);
	    System.out.println(result);
	}
}
