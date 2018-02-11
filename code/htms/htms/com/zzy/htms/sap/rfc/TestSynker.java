package com.zzy.htms.sap.rfc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.database.DBTool;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.privilege.group.GroupBean;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import com.zzy.htms.sales.custorder.CustOrderBean;
import com.zzy.htms.sales.custorderdetail.CustOrderDetailBean;

import consts.PropKey;
import consts.SysLogInfo;

public class TestSynker extends SapSynker {
	/*private Map parameters=new HashMap();
	public void setParameter(Object key,Object value){
		this.parameters.put(key, value);
	}
	private String functionCode;
	

	public String getFunctionCode() {
		return functionCode;
	}
	public void setFunctionCode(String functionCode) {
		this.functionCode = functionCode;
	}
	*/
	
	
	public void ZRFC_CL_INTERFACE007(){
		/*JCoParameterList parameterList=Jco3Utils.callFunctions(this.getFunctionCode(), this.parameters,false);
		if(parameterList==null){
			System.out.println("parameterList==null");
			return ;
		}*/
		this.setFunctionCode("ZRFC_CL_INTERFACE007");
		
		this.setParameter("CUSTOMERID", "0000300017");
		
		/*订单抬头*/
		JCoTable jcoTable =this.getJCoTable("COMPANY_TAB_TAB");// parameterList.getTable("COMPANY_TAB_TAB");
		String value=null;
		
		StringBuffer buffer = new StringBuffer();
		System.out.println("=============================COMPANY_TAB_TAB===============================");
		
		 for (int i = 0; i < jcoTable.getNumRows(); i++){
			 jcoTable.setRow(i);
			 buffer = new StringBuffer();
			 buffer.append(jcoTable.getString("COMPANYID")).append('\t');
			 buffer.append(jcoTable.getString("COMPANYNAME")).append('\t');
			 buffer.append(jcoTable.getString("COMPANYDEBT")).append('\t');

	         System.out.println(buffer);
        }
	}
	
	public void ZRFC_CL_INTERFACE013(){
		/*JCoParameterList parameterList=Jco3Utils.callFunctions(this.getFunctionCode(), this.parameters,false);
		if(parameterList==null){
			System.out.println("parameterList==null");
			return ;
		}*/
		/*订单抬头*/
		this.setFunctionCode("ZRFC_TMS_INTERFACE013");
	
		this.setTableValue("IT_TAB", "VBELN", "0010000276");
		this.setTableValue("IT_TAB", "POSNR", "000010");
		
		this.setTableValue("IT_TAB", "VBELN", "0010000276");
		this.setTableValue("IT_TAB", "POSNR", "000020");
		//this.setParameter("CUSTOMERID", "0000300017");
		JCoTable jcoTable =this.getJCoTable("IT_TAB");// parameterList.getTable("COMPANY_TAB_TAB");
		
		if(jcoTable==null){
			System.out.println("ZRFC_CL_INTERFACE013 jcoTable==null");
			return;
		}
		String value=null;
		 jcoTable.setRow(0);
		// jcoTable.appendRow();
		
		StringBuffer buffer = new StringBuffer();
		System.out.println("=============================COMPANY_TAB_TAB===============================");
		
		 for (int i = 0; i < jcoTable.getNumRows(); i++){
			 jcoTable.setRow(i);
			// jcoTable.appendRow();
			 buffer = new StringBuffer();
			 buffer.append(jcoTable.getString("VBELN")).append('\t');
			 buffer.append(jcoTable.getString("POSNR")).append('\t');
			 buffer.append(jcoTable.getString("KWMENG")).append('\t');
			 buffer.append(jcoTable.getString("LABST")).append('\t');

	         System.out.println(buffer);
        }
	}
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		TestSynker synker= new TestSynker();
		DBTool dbtool = new DBTool();
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllFactory");
		Map parameters = new HashMap();
		ResultBean resultBean = dbtool.execute(operationBean, parameters, false);
		if(resultBean==null||resultBean.isSuccess()==false){
			return;
		}
		List list=(List)resultBean.getListResult("sqlName");
		synker.ZRFC_CL_INTERFACE013();

	}

}
