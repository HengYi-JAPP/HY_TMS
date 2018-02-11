package com.zzy.htms.sales.customeraddr;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.zzy.htms.dictionary.area.AreaBean;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.log.HtmsLogger;

/**
 * 客户地址库业务实现类
 * @author zzy
 *
 */
public class CustomerAddrBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	public String add(){
		getAreaCode();
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERADDRESS001", "增加客户地址成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERADDRESS002", "增加客户地址失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERADDRESS011", "删除客户地址成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERADDRESS012", "删除客户地址失败", "0", this.getRequest());
		}
		return forward;
	}
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERADDRESS031", "查看客户地址成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERADDRESS032", "查看客户地址失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		getAreaCode();
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERADDRESS041", "修改客户地址成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERADDRESS042", "修改客户地址失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1869, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1870, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1868, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1867, MethodName:默认删除, MethodCode:delete
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	public String list(){
		String forward=super.list();
		loadCustomerAddrList();
		if (this.isSuccess()) {
			//HtmsLogger.log("CUSTOMERADDRESS021", "查看客户地址列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("CUSTOMERADDRESS022", "查看客户地址列表失败", "0", this.getRequest());
		}
		return forward;
	}
	//DefautMethod,MethodId:1865, MethodName:默认新增, MethodCode:add
	//Self Define Method End.
	
	public String getAreaCode(){
		String areaId = this.getRequest().getParameter("areaId");
		AreaRepository rep = new AreaRepository();
		AreaBean areaBean =  rep.getArea(areaId);
		this.getRequest().setAttribute("areaCode", areaBean.getAreaCode());
		return null;
	}
	
	public String modifyDefault(){
		String forward=super.modify();
		return forward;
	}
	
	public String loadCustomerAddrList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		 if(list==null){
			 return null;
		 }
		//log.info("list====================="+list);
		 AreaRepository rep = new AreaRepository();
		  List<CustomerAddrBean> customerLists = new ArrayList<CustomerAddrBean>();
		  List<CustomerAddrBean> customerRouteLists = new ArrayList<CustomerAddrBean>();

		 Map<String, CustomerAddrBean> customerMap=new HashMap<String, CustomerAddrBean>();
		 Map<String, List<CustomerAddrBean>> customerListMap=new HashMap<String, List<CustomerAddrBean>>();
		 CustomerAddrBean customerAddrBean=null;
		 String mapId = null;
		 for(int i=0,size=list.size();i<size;i++){
			 customerAddrBean=(CustomerAddrBean)list.get(i);
			 mapId=""+customerAddrBean.getCustomerId();
			 customerAddrBean.setMapId(mapId);
			// log.info("mapId==============="+mapId);
			 
			 customerAddrBean.setAreaName(rep.getFullAreaName(customerAddrBean.getAreaId()+"", "", true));
			 customerLists=customerListMap.get(mapId);
			 if(customerLists==null){
				 customerLists = new ArrayList<CustomerAddrBean>();
				 customerListMap.put(mapId,customerLists);
			 }
			 customerLists.add(customerAddrBean);

			 if(customerMap.get(mapId)==null){
				 customerRouteLists.add(customerAddrBean);
				 customerMap.put(mapId,customerAddrBean);
			 }
			 //log.info("customerAddrBean==============="+customerAddrBean);
		 }
		 tools.tool.clear(customerMap);
		 this.setCache("customerRouteLists", customerRouteLists, "request");
		 this.setCache("customerListMap", customerListMap, "request");
		 return null;
	}
}

