package com.zzy.htms.sap.rfc;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import com.mobilecn.utils.PorpertiesFile;
import com.sap.conn.jco.AbapException;
import com.sap.conn.jco.JCoDestination;
import com.sap.conn.jco.JCoDestinationManager;
import com.sap.conn.jco.JCoException;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoRepository;
import com.sap.conn.jco.JCoTable;
import com.sap.conn.jco.ext.DestinationDataProvider;


/**
 * sap rfc接口实现共有类
 * @author zzy
 *
 */
public class Jco3Utils {
	// private JCoParameterList tableParameterList=null;
	private JCoFunction function = null;
	private JCoParameterList tableParameterList=null;
	private JCoParameterList exportParameterList=null;
	
	public JCoFunction getFunction() {
		return function;
	}
	public void setFunction(JCoFunction function) {
		this.function = function;
	}
	public JCoParameterList getTableParameterList() {
		return tableParameterList;
	}
	public void setTableParameterList(JCoParameterList tableParameterList) {
		this.tableParameterList = tableParameterList;
	}
	public JCoParameterList getExportParameterList() {
		return exportParameterList;
	}
	public void setExportParameterList(JCoParameterList exportParameterList) {
		this.exportParameterList = exportParameterList;
	}
	public  JCoFunction getFunctions(JCoDestination destination,String functionCode){
		if (functionCode == null || "".equals(functionCode.trim())) {
			System.out.println("functionCode==null");
			return null;
		}
		
		JCoFunction function = null;
		try {
			JCoRepository jcoRepository = destination.getRepository();
			if (jcoRepository == null) {
				System.out.println("jcoRepository==null");
				return null;
			}
			function = jcoRepository.getFunction(functionCode);
			if (function == null) {
				System.out.println("function==null,functionCode="+functionCode);
				return null;
			}
			this.setFunction(function);
			return function;
		} catch (JCoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 设置调用参数
	 * @param function
	 * @param parameters
	 */
	public  void setFunctionImportParameters(JCoFunction function,Map parameters){
		if(function==null){
			 System.out.println("setFunctionImportParameters:function==null");
			return;
		}
		if(parameters==null||parameters.isEmpty()){
			 System.out.println("setFunctionImportParameters:parameters==null||parameters.isEmpty()");
			return;
		}
		if(function==null||parameters==null||parameters.isEmpty()){
			 System.out.println("function==null||parameters==null||parameters.isEmpty()");
			return;
		}
		JCoParameterList parameterList=function.getImportParameterList();
		
		if(parameterList==null){
		  System.out.println("parameterList==null");
		  return;
		}
		Set set = parameters.keySet();
		Iterator it = set.iterator();
		Object key=null,value=null;
		JCoParameterList tableParameterList=function.getTableParameterList();
		while(it.hasNext()){
			key = it.next();
			value = parameters.get(key);
			if(key==null||value==null){
				continue;
			}
			//System.out.println("key="+key+",value="+value);
			parameterList.setValue(key.toString(), value);
		}
	}
	public  void setFunctionTableParameters(JCoFunction function,Map parameters){
		List<String> tablesList=(List<String>)parameters.get("SAP_TABLES_LIST");
		if(tablesList==null||tablesList.isEmpty()){
			System.out.println("tablesList==null||tablesList.isEmpty()");
			return;
		}
		System.out.println("tablesList size="+tablesList.size());
		String tableName = null;
		Map tableValuesMap =null;
		JCoTable jcoTable =null;
		for(int i=0,size=tablesList.size();i<size;i++){
			tableName=tablesList.get(i);
			tableValuesMap=(Map)parameters.get(tableName);
			if(tableValuesMap==null||tableValuesMap.isEmpty()){
				System.out.println("setFunctionTableParameters tableValuesMap==null,"+tableName);
				continue;
			}
			
			jcoTable=function.getTableParameterList().getTable(tableName);
			if(jcoTable==null){
				System.out.println("setFunctionTableParameters jcoTable==null,tableName="+tableName);
				continue;
			}
			this.setJCoTableValues(jcoTable, tableValuesMap);
		}
	}
	public void setJCoTableValues(JCoTable jcoTable,Map tableValuesMap){
		int index=0,isize=0;
		Set set = tableValuesMap.keySet();
		Iterator it = set.iterator();
		String colName=null;List valueList=null;
		boolean isAppendRow= false;
		while(true){
			set = tableValuesMap.keySet();
			it = set.iterator();
			
			isAppendRow= true;
			while(it.hasNext()){
				colName=(String)it.next();
				valueList=(List)tableValuesMap.get(colName);
				if(colName==null){
					continue;
				}
				if(valueList==null||valueList.isEmpty()){
					return;
				}
				isize = valueList.size();
				if(isAppendRow==true){
					jcoTable.appendRow();
					isAppendRow=false;
				}
				SyncLogger.log("Jco3Utils->setJCoTableValues  "," colName=="+colName+",value="+ valueList.get(index)+",isize="+isize+",index="+index);
				jcoTable.setValue(colName, valueList.get(index));
			}
			//System.out.println("setJCoTableValues isize="+isize+",index="+index);
			index++;
			if(index>=isize){
				break;
			}
			if(isAppendRow==true){
				break;
			}
		}
		
	}
	public  void callFunctions(String functionCode,Map parameters){
		JCoDestination destination = Jco3Destination.getJCoDestinationAsPool();
		if (destination == null) {
			System.out.println("destination==null");
			return ;
		}
		
		JCoFunction function = getFunctions(destination,functionCode);
		if(function==null){
		  System.out.println("function==null");
		  return ;
		}
		
		/* 设置参数 */
		setFunctionImportParameters(function, parameters);
		setFunctionTableParameters(function, parameters);
		try{
            function.execute(destination);
        }catch(Exception e){
            System.out.println(e.toString());
            return ;
        }
        
        this.setExportParameterList(function.getExportParameterList());
        this.setTableParameterList(function.getTableParameterList());
        //JCoParameterList parameterList=isExport?function.getExportParameterList():function.getTableParameterList();
        return ;
	}
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
