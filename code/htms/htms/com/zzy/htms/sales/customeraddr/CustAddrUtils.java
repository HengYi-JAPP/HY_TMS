package com.zzy.htms.sales.customeraddr;

import java.util.ArrayList;
import java.util.List;

import com.zzy.htms.dictionary.area.AreaRepository;


/**
 * 客户地址库维护公用类
 * @author zzy
 *
 */
public class CustAddrUtils {

	/**
	 * 对客户地址进转换，将区域名称转换成完整的地址名称
	 * @param customerAddrList
	 * @return
	 */
	public static List<CustomerAddrBean> exchangeCustomerAddress(List<CustomerAddrBean> customerAddrList){
		if(customerAddrList==null||customerAddrList.isEmpty()){
			return null;
		}
		 List<CustomerAddrBean> addrLists = new ArrayList<CustomerAddrBean>();
		 CustomerAddrBean addrBean = null;
		String areaId = null;
		String areaName = null;
		 AreaRepository rep = new AreaRepository();
		 for(int i=0,size=customerAddrList.size();i<size;i++){
			 addrBean=(CustomerAddrBean) customerAddrList.get(i);
			 areaId = addrBean.getAreaId()+"";
			 StringBuffer buffer = new StringBuffer();
			 areaName = rep.getFullAreaName(areaId, "", true);
			 areaName = buffer.append(areaName).append(addrBean.getCaddrDetail()+" "+addrBean.getCaddrContactor()+" "+addrBean.getCaddrTelephone()).toString();
			 addrBean.setAreaName(areaName);
			 addrLists.add(addrBean);
		 }
		 
		return addrLists;
		
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
