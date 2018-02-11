package com.zzy.htms.sap.rfc;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;


/**
 * 接口日志实现类
 * @author zzy
 *
 */
public class SyncLogger {
	private static final String JCO_SAP_CONFIG = "jco-sap-config.properties";
	private static String SYNC_LOGGER_DIR=tools.tool.getProperty(JCO_SAP_CONFIG,"SYNC_LOGGER_DIR");
	static{
		SYNC_LOGGER_DIR=SYNC_LOGGER_DIR.replaceAll("\\\\", "/");
	}
	private static String logDate=tools.tool.getDate();
	private static long logCacheSize=0;
	private static long maxCacheSize=1;
	private static List<SyncLogBean> syncLogsList = new ArrayList<SyncLogBean>();
	public static void log(String code,String info){	
		syncLogsList.add(new SyncLogBean(code,info));
		logCacheSize++;
		if(logCacheSize>=maxCacheSize){
			writeLog();
		}
	}
	private static void writeLog(){
		try{
			String currentDate=tools.tool.getDate();
			if(logDate.equals(currentDate)==false){
				logDate=currentDate;
				if(tools.tool.isExist(SYNC_LOGGER_DIR)==false){
					tools.tool.newFolder(SYNC_LOGGER_DIR);
				}
				tools.tool.FileUtil.newFile(SYNC_LOGGER_DIR+"/sync-log-"+logDate+".log", logDate+"Start");
			}
			StringBuffer buffer =new  StringBuffer();
			SyncLogBean logBean = null;
			for(int i=0,size=syncLogsList.size();i<size;i++){
				logBean=syncLogsList.get(i);
				buffer.append(logBean.toString());
			}
			
			appendLog(SYNC_LOGGER_DIR+"/sync-log-"+logDate+".log",buffer.toString());
			if(syncLogsList!=null){
				syncLogsList.clear();
			}		
			syncLogsList=null;
			syncLogsList = new ArrayList<SyncLogBean>();
			logCacheSize=0;
		}catch(Exception e){
			System.out.println("SyncLogger->writeLog  写日志时发生异常!");
			e.printStackTrace();
		}
		
	}
	
	public static void appendLog(String file, String conent) {
		if(tools.tool.isExist(SYNC_LOGGER_DIR)==false){
			tools.tool.newFolder(SYNC_LOGGER_DIR);
		}
		if(tools.tool.isExist(file)==false){
			tools.tool.FileUtil.newFile(SYNC_LOGGER_DIR+"/sync-log-"+logDate+".log", logDate+"Start");
		}
        BufferedWriter out = null;     
        try {     
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file, true)));     
            out.write(conent);     
        } catch (Exception e) {     
            e.printStackTrace();     
        } finally {     
            try {     
                if(out != null){  
                    out.close();     
                }  
            } catch (IOException e) {     
                e.printStackTrace();     
            }     
        }     
    }     
    

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
