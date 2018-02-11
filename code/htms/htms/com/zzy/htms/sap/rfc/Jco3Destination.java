package com.zzy.htms.sap.rfc;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

import com.mobilecn.utils.PorpertiesFile;
import com.sap.conn.jco.JCoDestination;
import com.sap.conn.jco.JCoDestinationManager;
import com.sap.conn.jco.ext.DestinationDataProvider;


/**
 * SAP  RFC接口客户端实现类
 * @author zzy
 *
 */
public class Jco3Destination {
	
	private static final String JCO_SAP_CONFIG = "jco-sap-config.properties";
	  static String ABAP_AS = "ABAP_AS_WITHOUT_POOL";
	    static String ABAP_AS_POOLED = "ABAP_AS_WITH_POOL";
	    static String ABAP_MS = "ABAP_MS_WITHOUT_POOL";
	    private static String IS_CONNET_TO_SAP=tools.tool.getProperty(JCO_SAP_CONFIG, "IS_CONNET_TO_SAP");
	    private static boolean isConnect2Sap = IS_CONNET_TO_SAP!=null&&"true".equalsIgnoreCase(IS_CONNET_TO_SAP.trim());
    static
    {
    	 /*Properties connectProperties = new Properties();
         connectProperties.setProperty(DestinationDataProvider.JCO_ASHOST, "192.168.0.225");
         connectProperties.setProperty(DestinationDataProvider.JCO_SYSNR,  "00");
         connectProperties.setProperty("jco.client.client", "222");
         connectProperties.setProperty(DestinationDataProvider.JCO_USER,   "EOS_RFC");
         connectProperties.setProperty(DestinationDataProvider.JCO_PASSWD, "EOS_RFC");
         connectProperties.setProperty(DestinationDataProvider.JCO_LANG,   "en");
         createDataFile(ABAP_AS, "jcoDestination", connectProperties);

         connectProperties.setProperty(DestinationDataProvider.JCO_POOL_CAPACITY, "3");
         connectProperties.setProperty(DestinationDataProvider.JCO_PEAK_LIMIT,    "10");
         createDataFile(ABAP_AS_POOLED, "jcoDestination", connectProperties);*/
      Properties connectProperties = new Properties();
        String value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_ASHOST);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_ASHOST, value);
        }
        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_SYSNR);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_SYSNR, value);
        }
        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_CLIENT);
        System.out.println(DestinationDataProvider.JCO_CLIENT+":"+value);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_CLIENT, value);
        }
        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_USER);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_USER, value);
        }
        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_PASSWD);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_PASSWD, value);
        }
        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_LANG);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_LANG, value);
        }
        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_EXPIRATION_TIME);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_EXPIRATION_TIME, value);
        }
       /* connectProperties.setProperty(DestinationDataProvider.JCO_SYSNR,  tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_SYSNR));
        connectProperties.setProperty(DestinationDataProvider.JCO_CLIENT, tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_CLIENT));
        connectProperties.setProperty(DestinationDataProvider.JCO_USER,   tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_USER));
        connectProperties.setProperty(DestinationDataProvider.JCO_PASSWD, tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_PASSWD));
        connectProperties.setProperty(DestinationDataProvider.JCO_LANG,   tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_LANG));
*/        
        createDataFile(ABAP_AS, "jcoDestination", connectProperties);

        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_POOL_CAPACITY);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_POOL_CAPACITY, value);
        }

        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_PEAK_LIMIT);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_PEAK_LIMIT, value);
        }
        /*connectProperties.setProperty(DestinationDataProvider.JCO_POOL_CAPACITY, tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_POOL_CAPACITY));
        connectProperties.setProperty(DestinationDataProvider.JCO_PEAK_LIMIT,    tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_PEAK_LIMIT));
*/        createDataFile(ABAP_AS_POOLED, "jcoDestination", connectProperties);

        connectProperties.clear();

        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_MSHOST);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_MSHOST, value);
        }

        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_R3NAME);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_R3NAME, value);
        }

        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_CLIENT);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_CLIENT, value);
        }

        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_USER);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_USER, value);
        }

        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_PASSWD);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_PASSWD, value);
        }

        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_GROUP);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_GROUP, value);
        }

        value =tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_LANG);
        if(value!=null&&!"".equals(value.trim())){
        	connectProperties.setProperty(DestinationDataProvider.JCO_LANG, value);
        }
        /*connectProperties.setProperty(DestinationDataProvider.JCO_MSHOST, tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_MSHOST));
        connectProperties.setProperty(DestinationDataProvider.JCO_R3NAME,  tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_R3NAME));
        connectProperties.setProperty(DestinationDataProvider.JCO_CLIENT, tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_CLIENT));
        connectProperties.setProperty(DestinationDataProvider.JCO_USER,   tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_USER));
        connectProperties.setProperty(DestinationDataProvider.JCO_PASSWD, tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_PASSWD));
        connectProperties.setProperty(DestinationDataProvider.JCO_GROUP, tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_GROUP));
        connectProperties.setProperty(DestinationDataProvider.JCO_LANG,  tools.tool.getProperty(JCO_SAP_CONFIG, DestinationDataProvider.JCO_LANG));
        */createDataFile(ABAP_MS, "jcoDestination", connectProperties);
    }
	    
	    static void createDataFile(String name, String suffix, Properties properties)
	    {
	        File cfg = new File(name+"."+suffix);
	       if(cfg.exists()){
	    	   cfg.delete();
	    	   cfg=null;
	       }
	       cfg = new File(name+"."+suffix);
	        if(!cfg.exists())
	        {
	            try
	            {
	                FileOutputStream fos = new FileOutputStream(cfg, false);
	                properties.store(fos, "for tests only !");
	                fos.close();
	            }
	            catch (Exception e)
	            {
	                throw new RuntimeException("Unable to create the destination file " + cfg.getName(), e);
	            }
	        }
	    }
	
	
	
	
	public static JCoDestination getJCoDestinationAsPool(){
		try {
			if(isConnect2Sap){
				JCoDestination destinationAsPool= JCoDestinationManager.getDestination(ABAP_AS_POOLED);
				return destinationAsPool;
			}else{
				return null;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	public static JCoDestination getJCoDestinationWithoutPool(){
		 try {
			 if(isConnect2Sap){
				 JCoDestination destinationWithoutPool= JCoDestinationManager.getDestination(ABAP_AS);
			     return destinationWithoutPool;
			}else{
				return null;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	public static JCoDestination getJCoDestinationMsAsPool(){
		 try {
			 if(isConnect2Sap){
				JCoDestination destinationMsAsPool= JCoDestinationManager.getDestination(ABAP_MS);
			    return destinationMsAsPool;
			}else{
				return null;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	private static Properties sapConfigProperties = null;
	private static String getJcoProperties(String name) {
		//Properties prop = null;
		if (sapConfigProperties == null) {
			sapConfigProperties = new Properties();
			try {
				sapConfigProperties.load(PorpertiesFile.class.getClassLoader()	.getResourceAsStream(JCO_SAP_CONFIG));
				//return sapConfigProperties;
			} catch (IOException ex) {
				ex.printStackTrace();
				return null;
			}
		}
		if (sapConfigProperties == null) {
			return null;
		}
		
		return sapConfigProperties.getProperty(name);

	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(getJCoDestinationAsPool());

	}

}
