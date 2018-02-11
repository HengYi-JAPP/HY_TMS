package com.zzy.htms.sap.rfc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoStructure;
import com.sap.conn.jco.JCoTable;


/**
 * sap接口调用公共类
 * @author zzy
 *
 */
public class SapSynker extends AbstractBusinessExecutor {

	private String functionCode;
	private Jco3Utils jco3Utils = new Jco3Utils();
	
	Map parameters=new HashMap();
	public void setParameter(Object key,Object value){
		this.parameters.put(key, value);
	}

	public String getFunctionCode() {
		return functionCode;
	}
	
	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}
	
	public void setTableValue(String table,String column,Object value){
		List<String> tablesList=(List<String>)parameters.get("SAP_TABLES_LIST");
		if(tablesList==null){
			tablesList=new ArrayList<String>();
			parameters.put("SAP_TABLES_LIST", tablesList);
		}
		
		
		//tablesList.get(table);
		Map tableValuesMap =(Map)parameters.get(table);
		if(tableValuesMap==null){
			tablesList.add(table);
		}
		if(tableValuesMap==null){
			tableValuesMap=new HashMap();
			parameters.put(table, tableValuesMap);
		}
		List valueList=(List)tableValuesMap.get(column);
		if(valueList==null){
			valueList= new ArrayList();
			tableValuesMap.put(column,valueList);
		}
		
		valueList.add(value);
	}


	public Jco3Utils getJco3Utils() {
		return jco3Utils=(jco3Utils==null?jco3Utils: new Jco3Utils());
	}

	public void setJco3Utils(Jco3Utils jco3Utils) {
		this.jco3Utils = jco3Utils;
	}

	/*public void sync(){
		jco3Utils.callFunctions(this.getFunctionCode(), this.parameters);
		JCoParameterList parameterList=jco3Utils.get
		if(parameterList==null){
			log.info("parameterList==null");
			return ;
		}
		this.setParameterList(parameterList);
	}*/
	public JCoStructure getJCoStructure(String stuctName){
		if(stuctName==null||"".equals(stuctName.trim())){
			return null;
		}
		Jco3Utils jco3Utils = this.getJco3Utils();
		JCoParameterList parameterList=jco3Utils.getExportParameterList();
		if(parameterList==null){
			jco3Utils.callFunctions(this.getFunctionCode(), this.parameters);
			parameterList=jco3Utils.getExportParameterList();
			if(parameterList==null){
				log.info("getJCoStructure parameterList==null");
				return null;
			}
		}
		JCoStructure jcoStructure = parameterList.getStructure(stuctName);
		return jcoStructure;
	}
	public Object getValue(String name){
		if(name==null||"".equals(name.trim())){
			return null;
		}
		Jco3Utils jco3Utils = this.getJco3Utils();
		JCoParameterList parameterList=jco3Utils.getExportParameterList();
		if(parameterList==null){
			jco3Utils.callFunctions(this.getFunctionCode(), this.parameters);
			parameterList=jco3Utils.getExportParameterList();
			if(parameterList==null){
				log.info("getJCoStructure parameterList==null");
				return null;
			}
		}
		return parameterList.getValue(name);
	}
	public JCoTable getJCoTable(String tableName){
		if(tableName==null||"".equals(tableName.trim())){
			return null;
		}
		Jco3Utils jco3Utils = this.getJco3Utils();
		JCoParameterList parameterList=jco3Utils.getTableParameterList();
		if(parameterList==null){
			jco3Utils.callFunctions(this.getFunctionCode(), this.parameters);
			parameterList=jco3Utils.getTableParameterList();
			if(parameterList==null){
				log.info("getJCoTable parameterList==null");
				return null;
			}
		}
		JCoTable jcoTable = parameterList.getTable(tableName);
		return jcoTable;
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
