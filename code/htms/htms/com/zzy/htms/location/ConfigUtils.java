package com.zzy.htms.location;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.UUID;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**    
 * 加载配置参数公用类
 * @author zzy
 *
 */

public class ConfigUtils {

	private static Properties props = null;
	
	private static final Log LOG = LogFactory.getLog(ConfigUtils.class);
	
	public static String getUUID(){
		 UUID uuid = UUID.randomUUID();      
		 return uuid.toString();
	}
	
	public static String getConfigProperty(String key){
		if (props == null) {
			props = new Properties();
		}
//		String url = DataUtils.class.getClassLoader().getResource("configure.properties").toString();
//		LOG.error("getConfigProperty:"+url);
//		if (System.getProperty("os.name").toLowerCase().indexOf("window") > -1) {
//		    url = url.replace("file:/","").replace("%20", " ");
//		}else{
//		    url = url.replace("file:","").replace("%20", " ");
//		}
		
		InputStream in = null;
		try {
//			in = new BufferedInputStream(new FileInputStream(url));
			in = ConfigUtils.class.getClassLoader().getResourceAsStream("configure.properties");
			props.load(in);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return props.getProperty(key);
	}
	
	public static String getResourcesProperty(String key){
		if (props == null) {
			props = new Properties();
		}
		String url = ConfigUtils.class.getClassLoader().getResource("Resource.properties").toString();
		if (System.getProperty("os.name").toLowerCase().indexOf("window") > -1) {
		  url = url.replace("file:/","").replace("%20", " ");
		}else{
		  //linux直接从PORTAL项目读取已接入单点的项目及项目名称
		  url = "/oracle/project/CRCPortal.war/Resource.properties";
		  url = url.replace("file:","").replace("%20", " ");
		}
		InputStream in = null;
		try {
			in = new BufferedInputStream(new FileInputStream(url));
			props.load(in);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		return props.getProperty(key);
	}
	
}
