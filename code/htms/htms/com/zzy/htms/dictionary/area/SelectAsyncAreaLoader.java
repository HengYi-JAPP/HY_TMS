package com.zzy.htms.dictionary.area;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mobilecn.taglibs.html.formelements.tags.SelectAsyncDatasLoader;

public class SelectAsyncAreaLoader  implements SelectAsyncDatasLoader{
	private String selectId;
	private HttpServletRequest request;
	private HttpServletResponse response;
	

	public HttpServletRequest getRequest() {
		return this.request;
	}

	public HttpServletResponse getResponse() {
		return this.response;
	}

	
	public List load() {
		if(this.getSelectId()==null){
			return null;
		}
		
		// TODO Auto-generated method stub
		return AreaRepository.getNextLevelChild(this.getSelectId());
	}



	public void setRequest(HttpServletRequest request) {
		this.request=request;
		
	}

	public void setResponse(HttpServletResponse response) {
		this.response=response;
		
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	public String getSelectId() {
		// TODO Auto-generated method stub
		return this.selectId;
	}

	public void setSelectId(String selectId) {
		this.selectId=selectId;
	}

	public List load(String selectId, HttpServletRequest request,
			HttpServletResponse response) {
		this.setRequest(request);
		this.setResponse(response);
		this.setSelectId(selectId);
		
		return AreaRepository.getNextLevelChild(this.getSelectId());
	}

}
