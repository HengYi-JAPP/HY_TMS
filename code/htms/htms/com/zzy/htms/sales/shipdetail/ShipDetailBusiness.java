package com.zzy.htms.sales.shipdetail;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.bean.ResultV2Bean;
import com.zzy.htms.log.HtmsLogger;

/**
 * 发货申请详情业务实现类
 * @author zzy
 *
 */
public class ShipDetailBusiness  extends AbstractV2BusinessExecutor {
	/**
	 * @param args
	 */
	
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIPDETAIL001", "增加申请明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SHIPDETAIL002", "增加申请明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIPDETAIL011", "删除申请明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SHIPDETAIL012", "删除申请明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIPDETAIL041", "修改申请明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SHIPDETAIL042", "修改申请明细失败", "0", this.getRequest());
		}
		return forward;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1943, MethodName:默认新增, MethodCode:add
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	
	public String list(){
		String forward=super.list();
		LoadShipDetailList();
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIPDETAIL021", "查看申请明细列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SHIPDETAIL022", "查看申请明细列表失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String view(){
		String forward=super.view();
		//getAddress();
		if (this.isSuccess()) {
			//HtmsLogger.log("SHIPDETAIL031", "查看申请明细成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("SHIPDETAIL032", "查看申请明细失败", "0", this.getRequest());
		}
		return forward;
	}
	
	public String LoadShipDetailList(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("SELECT");
		 if(list==null){
			 return null;
		 }
		//System.out.println("list====================="+list);
		  List<ShipDetailBean> shipDetailLists = new ArrayList<ShipDetailBean>();
		  List<ShipDetailBean> shipDetailRouteLists = new ArrayList<ShipDetailBean>();

		 Map<String, ShipDetailBean> shipDetailMap=new HashMap<String, ShipDetailBean>();
		 Map<String, List<ShipDetailBean>> shipDetailListMap=new HashMap<String, List<ShipDetailBean>>();
		 ShipDetailBean shipDetailBean=null;
		 String mapId = null;
		 for(int i=0,size=list.size();i<size;i++){
			 shipDetailBean=(ShipDetailBean)list.get(i);
			 mapId=""+shipDetailBean.getCustomerName();
			 shipDetailBean.setMapId(mapId);
			 //System.out.println("mapId==============="+mapId);
			
			 shipDetailLists=shipDetailListMap.get(mapId);
			 if(shipDetailLists==null){
				 shipDetailLists = new ArrayList<ShipDetailBean>();
				 shipDetailListMap.put(mapId,shipDetailLists);
			 }
			 shipDetailLists.add(shipDetailBean);

			 if(shipDetailMap.get(mapId)==null){
				 shipDetailRouteLists.add(shipDetailBean);
				 shipDetailMap.put(mapId,shipDetailBean);
			 }
			//System.out.println("shipBean==============="+shipDetailBean);
		 }
		 tools.tool.clear(shipDetailMap);
		 this.setCache("shipDetailRouteLists", shipDetailRouteLists, "request");
		 this.setCache("shipDetailListMap", shipDetailListMap, "request");
		 return null;
	}
	//DefautMethod,MethodId:1948, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1946, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1947, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1945, MethodName:默认删除, MethodCode:delete
	//Self Define Method End.
	
	/*public String getAddress(){
		ResultV2Bean rsBean =this.getResultV2Bean();
		ResultBean resultBean = this.getResultBean();
		List list =(List) resultBean.getListResult("CUSTOMER_ADDRESS");
		 if(list==null){
			 return null;
		 }
		 List<CustomerAddrBean> addrLists = new ArrayList<CustomerAddrBean>();
		 CustomerAddrBean addrBean = null;
		 AreaBean areaBean = null;
		 List addressList = null;
		 String areaId = null;
		 String areaName = null;
		 String addrDetail = null;
		 StringBuilder sb = new StringBuilder();
		 AreaRepository rep = new AreaRepository();
		 for(int i=0,size=list.size();i<size;i++){
			 addrBean=(CustomerAddrBean) list.get(i);
			 areaId = addrBean.getAreaId()+"";
			 addrDetail=addrBean.getCaddrDetail();
			 addressList =  rep.getAllPraentArea(areaId);
			 sb = new StringBuilder();
			 for(int j=0;j<addressList.size();j++){
				 areaBean = (AreaBean) addressList.get(j);
				 areaName = addrBean.getAreaName();
				 areaName= sb.append(areaBean.getAreaName()).toString();
			 }
			 areaName=sb.append(addrDetail).toString();
			 addrBean.setAreaName(areaName);
			 addrLists.add(addrBean);
		 }
		 this.getRequest().setAttribute("addrLists", addrLists);
		return null;
		
	}*/
}

