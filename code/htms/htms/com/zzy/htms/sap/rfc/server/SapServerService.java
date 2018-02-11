package com.zzy.htms.sap.rfc.server;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Properties;

import com.sap.conn.jco.JCoException;
import com.sap.conn.jco.ext.DestinationDataProvider;
import com.sap.conn.jco.ext.ServerDataProvider;
import com.sap.conn.jco.server.DefaultServerHandlerFactory;
import com.sap.conn.jco.server.JCoServer;
import com.sap.conn.jco.server.JCoServerFactory;
import com.sap.conn.jco.server.JCoServerFunctionHandler;


/**
 * RFC接口服务端实现类
 * @author zzy
 *
 */
public class SapServerService
{private static final String JCO_SAP_CONFIG = "jco-sap-config.properties";
    static String SERVER_NAME1 = "SERVER";
    static String ABAP_AS = "ABAP_AS_WITHOUT_POOL";
    static String ABAP_AS_POOLED = "ABAP_AS_WITH_POOL";
    static String ABAP_MS = "ABAP_MS_WITHOUT_POOL";
  // public static MyTIDHandler myTIDHandler = null;
   
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
       createDataFile(ABAP_MS, "jcoDestination", connectProperties);
       
       
       
       Properties servertProperties = new Properties();
       value =tools.tool.getProperty(JCO_SAP_CONFIG, ServerDataProvider.JCO_GWHOST);
       if(value!=null&&!"".equals(value.trim())){
    	   servertProperties.setProperty(ServerDataProvider.JCO_GWHOST, value);
       }
       value =tools.tool.getProperty(JCO_SAP_CONFIG, ServerDataProvider.JCO_GWSERV);
       if(value!=null&&!"".equals(value.trim())){
    	   servertProperties.setProperty(ServerDataProvider.JCO_GWSERV, value);
       }
       value =tools.tool.getProperty(JCO_SAP_CONFIG, ServerDataProvider.JCO_PROGID);
       if(value!=null&&!"".equals(value.trim())){
    	   servertProperties.setProperty(ServerDataProvider.JCO_PROGID, value);
       }
       value =tools.tool.getProperty(JCO_SAP_CONFIG, ServerDataProvider.JCO_REP_DEST);
       if(value!=null&&!"".equals(value.trim())){
    	   servertProperties.setProperty(ServerDataProvider.JCO_REP_DEST, value);
       }
       value =tools.tool.getProperty(JCO_SAP_CONFIG, ServerDataProvider.JCO_CONNECTION_COUNT);
       if(value!=null&&!"".equals(value.trim())){
    	   servertProperties.setProperty(ServerDataProvider.JCO_CONNECTION_COUNT, value);
       }
       createDataFile(SERVER_NAME1, "jcoServer", servertProperties);
   }
   static void createDataFile(String name, String suffix, Properties properties)
   {
       File cfg = new File(name+"."+suffix);
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
    /**
     * First server example. 
     * At first we get an instance of the JCoServer through JCoServerFactory. The requested instance
     * will be created, or an existing one will be returned if the instance was created before. It is not possible to
     * run more then one instance with a particular configuration. Then we register the implementation for the
     * function STFC_CONNECTION provided by class StfcConnectionHandler through FunctionHandlerFactory 
     * provided by JCo. You are free to write your own implementation JCoServerFunctionHandlerFactory, if you need more
     * than simple mapping between function name and java class implementing the function. 
     * Now we can start the server instance. After a while the JCo runtime opens the server connections. You may
     * check the server connections via sm59 or invoke STFC_CONNECTION via se37. 
     */
    private static JCoServer server=null;
    public static void startServer()
    {
        //JCoServer server=null;
    	if(server==null){
	        try
	        {
	            server = JCoServerFactory.getServer(SERVER_NAME1);
	        }
	        catch(JCoException ex)
	        {
	        	ex.printStackTrace();
	            throw new RuntimeException("Unable to create the server " + SERVER_NAME1 + " because of " + ex.getMessage(), ex);
	        }
	        
	        JCoServerFunctionHandler sapServerFunctionHandler = new SapServerFunctionHandler();
	        DefaultServerHandlerFactory.FunctionHandlerFactory factory = new DefaultServerHandlerFactory.FunctionHandlerFactory();
	        factory.registerHandler("ZRFC_HTMS_009", sapServerFunctionHandler);
	        
	        sapServerFunctionHandler = new SapServerFunctionHandler();
	        factory.registerHandler("ZRFC_HTMS_011", sapServerFunctionHandler);
	        server.setCallHandlerFactory(factory);
    	}
        if(server!=null){
	        server.start();
    	}
        
        System.out.println("The program ZRFC_HTMS_009 can be stoped using <ctrl>+<c>");
    }
    
    
    public static void stopServer(){
    	if(server!=null){    		
    		server.release();
    		server.stop();
    		//server=null;
    	}
    }

    public static void main(String[] a)
    {
    	startServer();
    }
}
