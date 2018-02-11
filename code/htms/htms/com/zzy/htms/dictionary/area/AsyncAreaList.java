package com.zzy.htms.dictionary.area;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.taglibs.webcomps.tree.AsyncDatasLoader;

public class AsyncAreaList extends AbstractBusinessExecutor implements AsyncDatasLoader{
	private String treeNodeId;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public HttpServletRequest getRequest() {
		// TODO Auto-generated method stub
		return this.request;
	}

	public HttpServletResponse getResponse() {
		// TODO Auto-generated method stub
		return this.response;
	}

	public String getTreeNodeId() {
		// TODO Auto-generated method stub
		return this.treeNodeId;
	}

	public List load() {
		if(this.getTreeNodeId()==null){
			return null;
		}
		
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("listCurrentNodeChildArea");
		Map parameters = new HashMap();
		parameters.put("parentNodeId", new String[]{this.getTreeNodeId()});
		//DBTool dbtool = new DBTool();
		ResultBean resultBean = this.dbOperator(operationBean,parameters , false);
		if(resultBean==null||resultBean.isSuccess()==false){
			return null;
		}
		List areaList =resultBean.getListResult("areaList");
		// TODO Auto-generated method stub
		//System.out.println("areaList============="+areaList);
		return areaList;
	}

	public List load(String treeId, HttpServletRequest request,
			HttpServletResponse response) {
		this.setTreeNodeId(treeId);
		this.setRequest(request);
		this.setResponse(response);
		return this.load();
		//return null;
	}

	public void setRequest(HttpServletRequest request) {
		this.request=request;
		
	}

	public void setResponse(HttpServletResponse response) {
		this.response=response;
		
	}

	public void setTreeNodeId(String treeId) {
		this.treeNodeId=treeId;
		
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
