package com.zzy.htms.dictionary.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.abcer.log.Logger;
import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;

/**
 * 产品缓存类
 * @author zzy
 *
 */
public class ProductRepository  extends AbstractBusinessExecutor{
	private static Logger log= Logger.getLogger();
	private static Map<String,ProductBean>  productMaps = new HashMap<String,ProductBean>();
	private static Map<String,ProductBean>  productCodeMaps = new HashMap<String,ProductBean>();
	private static List<ProductBean>  productList = new ArrayList<ProductBean>();
	private static boolean isLoad = false;
	
	/**
	 * 加载缓存
	 */
	public synchronized void load(){
		if(isLoad){
			return;
		}
		OperationBean operationBean = OperationConfigRepository.getOperationConfig("loadAllProduct");
		ResultBean resultBean = this.dbOperator(operationBean, new HashMap(), false);
		List list =resultBean.getListResult("loadAllProduct");
		if(list==null){
			log.info("没用产品信息");
		//	System.out.println("没用产品信息");
		}else{				
			ProductBean productBean = null;
			Map<String,String>  tempMaps = new HashMap<String,String>();
			String productId = null;
			for(int i =0,size=list.size();i<size;i++){
				productBean = (ProductBean)list.get(i);
				productId=productBean.getProductId()+"";
				if(tempMaps.get(productId)!=null){
					continue;
				}
				tempMaps.put(productId, productId);
				//System.out.println("ProductBean="+productBean);
				 productMaps.put(productId, productBean);
				 productCodeMaps.put(productBean.getProductCode().trim(), productBean);
				 productList.add(productBean);
				 isLoad=true;
			}
			tools.tool.clear(tempMaps);
		}
	}

	/*是否同步其他远程主机*/
	/*private static boolean syncRemove = true;
	
	public static boolean isSyncRemove() {
		return syncRemove;
	}
	public static void setSyncRemove(boolean syncRemove) {
		ProductRepository.syncRemove = syncRemove;
	}*/
	/**
	 * 清空缓存数据
	 */
	public static void reload(){
		tools.tool.clear(productMaps);
		tools.tool.clear(productCodeMaps);
		tools.tool.clear(productList);
		isLoad=false;
		productMaps = new HashMap<String,ProductBean>();
		productCodeMaps = new HashMap<String,ProductBean>();
		productList = new ArrayList<ProductBean>();
		/*if(isSyncRemove()){
			CacheSynker.syncRemoveHost(CacheSynker.PRODUCT);
		}*/
	}
	
	/**
	 * 通过产品ID获取产品实体信息
	 * @param productId
	 * @return
	 */
	public static ProductBean getProduct(String productId){
		if(productMaps==null||productMaps.isEmpty()){
			ProductRepository rep = new ProductRepository();
			rep.reload();
			rep.load();
		}
		//System.out.println("----------------------------->productId=="+productId);
		return  productMaps.get( productId);
	}
	
	public static String getProductName(String productId){
		if(productMaps==null||productMaps.isEmpty()){
			ProductRepository rep = new ProductRepository();
			rep.reload();
			rep.load();
		}
		
		ProductBean product= productMaps.get( productId);
		if(product!=null&&product.getProductName()!=null){
			return product.getProductName();
		}
		return  null;
	}
	
	/**
	 * 获取所有产品信息
	 * @return
	 */
	public static List<ProductBean>  getProductList(){
		if(productList==null||productList.isEmpty()){
			ProductRepository rep = new ProductRepository();
			rep.reload();
			rep.load();
		}
		
		return  productList;
	}
	
	/**
	 * 通过产品编码,获取产品id
	 * @param productCode
	 * @return
	 */
	public static String getProductId(String productCode){
		if(productCodeMaps==null||productCodeMaps.isEmpty()){
			ProductRepository rep = new ProductRepository();
			rep.reload();
			rep.load();
		}
		ProductBean productBean =  productCodeMaps.get( productCode);
		return  productBean==null?"":productBean.getProductId()+"";
	}
	
	
	
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		 ProductRepository rep = new ProductRepository();
		System.out.println("productId:"+rep.getProduct("2"));
	}
	
}
