package com.zzy.htms.location;

import java.util.Properties;
import java.util.UUID;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 
 * @author zzy
 *
 */
public class WXConfigUtils {

	private static Properties props = null;
	
	private static final Log LOG = LogFactory.getLog(WXConfigUtils.class);
	
	public static String getUUID(){
		 UUID uuid = UUID.randomUUID();      
		 return uuid.toString();
	}
	
//	public static String getConfigProperty(String key){
//		if (props == null) {
//			props = new Properties();
//		}
//		
//		InputStream in = null;
//		try {
//			in = WXConfigUtils.class.getClassLoader().getResourceAsStream("wx.properties");
//			props.load(in);
//		} catch (FileNotFoundException e1) {
//			e1.printStackTrace();
//		} catch (IOException e1) {
//			e1.printStackTrace();
//		}
//		return props.getProperty(key);
//	}
	
}
