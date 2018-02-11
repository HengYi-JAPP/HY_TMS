package com.zzy.htms.dictionary.area;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mobilecn.taglibs.webcomps.tree.AsyncDatasLoader;

public class AsyncAreaLoader  implements AsyncDatasLoader{
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
		
		// TODO Auto-generated method stub
		return AreaRepository.getNextLevelChild(this.getTreeNodeId());
	}

	public List load(String treeId, HttpServletRequest request,
			HttpServletResponse response) {
		this.setTreeNodeId(treeId);
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
