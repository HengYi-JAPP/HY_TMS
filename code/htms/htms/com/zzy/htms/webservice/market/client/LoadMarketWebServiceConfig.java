package com.zzy.htms.webservice.market.client;

public class LoadMarketWebServiceConfig {
	private static final String MARKET_WEBSERVICE_CONFIG = "market-webservice.properties";
	/*
	 * /101.132.94.230:9092/
	 */
	public static final String MARKET_WEBSERVICE_IP_ADDRESS=tools.tool.getProperty(MARKET_WEBSERVICE_CONFIG,"market.webservice.ipaddress")+":"+tools.tool.getProperty(MARKET_WEBSERVICE_CONFIG,"market.webservice.port");
	
}
