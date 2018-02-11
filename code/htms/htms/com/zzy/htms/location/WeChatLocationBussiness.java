package com.zzy.htms.location;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.codec.digest.DigestUtils;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.mobilecn.mydbc.bean.OperationBean;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.repository.OperationConfigRepository;
import com.mobilecn.utils.RequestHelper;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.dictionary.factory.FactoryRepository;
import com.zzy.htms.dictionary.product.ProductRepository;
import com.zzy.htms.logistic.transfer.TransferBean;
import com.zzy.htms.logistic.transferdetail.TransferDetailBean;
import com.zzy.htms.sales.customer.CustomerBean;
import com.zzy.htms.sales.customeraddr.CustomerAddrBean;
import com.zzy.htms.sales.ship.ShipBean;

/**
 * 微信，控制层实现类
 * @author zm
 */
public class WeChatLocationBussiness extends AbstractV2BusinessExecutor {
	
	private static final String WECHAT_CONFIG = "wx.properties";
	
	public static final String SESSION_WXUSER="wxuser";
    
	public static String CONFIG_APP_ID= tools.tool.getProperty(WECHAT_CONFIG,"appId");
	public static String CONFIG_APP_SECRET= tools.tool.getProperty(WECHAT_CONFIG,"appsecret");
	public static String CONFIG_INTERVAL= tools.tool.getProperty(WECHAT_CONFIG,"interval");
	public static boolean CONFIG_DEBUG = "true".equals(tools.tool.getProperty(WECHAT_CONFIG,"debug"))?true:false;
	private static String CONFIG_TOKEN= tools.tool.getProperty(WECHAT_CONFIG,"token");
	  
	private static String CONFIG_BAIDUKEY= tools.tool.getProperty(WECHAT_CONFIG,"baiduKey");
	
	/**
	 * 注册用户实现类
	 * @return
	 */
	public String registerUser(){
		User user = new User();
		user=(User) this.getRequest().getSession().getAttribute(SESSION_WXUSER);
		
		if(user==null||user.getOpenId()==null){
			System.out.println(" 无法获取微信用户信息！");
		}else{
		    System.out.println("Bussiness Userinfor :   "+ user.getOpenId() +"    nickname:  "+user.getNickName());
		    
			this.setCache("openId",user.getOpenId(),"request");
			this.setCache("nickName",user.getNickName(),"request");
			this.setCache("sex",user.getSex(),"request");
			this.setCache("province",user.getProvince(),"request");
			this.setCache("city",user.getCity(),"request");
			this.setCache("country",user.getCountry(),"request");
			this.setCache("headImgurl",user.getHeadImgurl(),"request");
			this.setCache("unionId",user.getUnionId(),"request");
			String forward=super.add();
			
			if (this.isSuccess()) {
				this.setCache("wxOpenId", user.getOpenId(), "request");
				System.out.println(" 保存微信用户信息成功！");
			}else{
				System.out.println(" 保存微信用户信息失败！");
			}
		}
		return "";
	}
	
    /**
     * 保存地址微信获取的微信地址位置和用户id信息
     * @param latitude
     * @param longitude
     * @param openId
     */
    public void  saveLocation(){
    	RequestHelper helper = new RequestHelper(this.getRequest());
		String latitude = (String)helper.getValueFromAllScopes("latitude");
		String longitude = (String)helper.getValueFromAllScopes("longitude");
		
		String openId = (String) helper.getValueFromAllScopes("wxOpenId");;
		
		
		String transferIdChange = (String)helper.getValueFromAllScopes("transferIdChange");
		
		//String transId = this.getParameterValues("transId");
		
		String transIds =  (String)helper.getValueFromAllScopes("transId");
		
		String isSign = (String) helper.getValueFromAllScopes("isSign");;
		
		
    	boolean b=true; 
    	
    	Map parameters =  new HashMap();
    	parameters.put("latitude",latitude);
    	parameters.put("longitude",longitude);
		parameters.put("openId",openId);
		parameters.put("transIds",transIds);
		parameters.put("isSign",isSign);
		
		Map<String,String> transIdsMap=new HashMap<String,String>();
		if(transIds!=null&&transIds!=""&&transIds.contains(",")){
			String[] transId = transIds.split(",");
			parameters.put("transId",transId);	
			for(String  s:transId){
				transIdsMap.put(s, s);//处理多条记录
			}
		}else{
			parameters.put("transId",transIds);
			transIdsMap.put(transIds, transIds);//处理单个transid的值,加入map,做后续的值传递
		}
    	
		System.out.println("openId:"+openId+"  latitude:"+latitude+"  longitude:"+longitude+"   transIds:"+transIds+"    isSign:"+isSign);
		
    	if(openId!=null&&!openId.equals("")&&latitude!=null&&!latitude.equals("")&&longitude!=null&&!longitude.equals("")&&transIds!=null&&!transIds.equals("")){
			OperationBean operationBean = OperationConfigRepository.getOperationConfig("saveSubmitLocation");			
			ResultBean saveBean = this.dbOperator(operationBean,parameters, false);
			if(saveBean==null|saveBean.isSuccess()==false){
				System.out.print("保存坐标信息失败,resultBean==null|resultBean.isSuccess()==false");
			}
			
			
			addressAnalysis(latitude,longitude, parameters,transIdsMap);
		}
    	
    	this.out("{\"isSuccess\":true}", this.getResponse());
    }
    
    /**
     * 给关注的微信号发送调拨单信息
     */
    public void sendLocationTextMessage(){
    	String forward= super.add();
    	ResultBean resultBean = this.getResultBean();
    	
    	List<TransferBean>  transferList = resultBean.getListResult("transferList");
     	TransferBean transferBean=transferList.get(0);
    	ShipBean  shipBean=(ShipBean) resultBean.getListFirstResult("shipList");
    	List<LocationBean>  locationList= resultBean.getListResult("locationList");
    	CustomerAddrBean  customerAddrBean= (CustomerAddrBean) resultBean.getListFirstResult("customerAddrList");
        CustomerBean  customerBean=(CustomerBean) resultBean.getListFirstResult("customerList");
        List<TransferDetailBean>  transDetailList = resultBean.getListResult("transDetailList");
    	
        TransferDetailBean transDetailBean= transDetailList.get(0);
        
    	RequestHelper helper= new RequestHelper(this.getRequest());
    	String wxOpenId= (String) helper.getValueFromAllScopes("wxOpenId");
    	
    	AreaRepository areaRep=new AreaRepository();
    	
    	String addressInfo = areaRep.getFullAreaName(customerAddrBean.getAreaId()+"", "", false);
    	
    	BigDecimal applyTotalTonNum=new BigDecimal(0);
    	BigDecimal applyTotalPackNum=new BigDecimal(0);
    	for(TransferDetailBean detailBean:transDetailList){
    		String applyTonNum=detailBean.getApplyTonNum()==null||detailBean.getApplyTonNum()==""?"0":detailBean.getApplyTonNum();
    		String applyPackNum=detailBean.getApplyPackNum()==null||detailBean.getApplyPackNum()==""?"0":detailBean.getApplyPackNum();
    		applyTotalTonNum=applyTotalTonNum.add(new BigDecimal(applyTonNum));
    		applyTotalPackNum=applyTotalPackNum.add(new BigDecimal(applyPackNum));
    	}
    	
    	
    	String customMsg=" 客户名称:"+customerBean.getCustomerName()+
    	        "  工厂:"+FactoryRepository.getFactoryName(transDetailBean.getFactoryId()+"")+
    	        "  产品:"+ProductRepository.getProductName(transDetailBean.getProductId()+"")+
    	        "  配送量:"+applyTotalTonNum+
    	        "  配送包数:"+applyTotalPackNum+
    	        "  配送地址:"+addressInfo+customerAddrBean.getCaddrDetail();
    	String locationUrl="";
    	if(locationList!=null&&locationList.size()>0){
    		LocationBean locationBean = locationList.get(0);
    		locationUrl=" 配送地址链接(上一次签收地址):"+ "http://apis.map.qq.com/uri/v1/geocoder?coord="+locationBean.getLatitude()+","+locationBean.getLongitude()+"&coord_type=1&refere=myapp";
    	}else{
    		String location=addressAnalysis(addressInfo+customerAddrBean.getCaddrDetail());
    		locationUrl=" 配送地址链接(配送地址):"+ "http://apis.map.qq.com/uri/v1/geocoder?coord="+location+"&coord_type=1&refere=myapp";
    	}
        //wxOpenId="oYiyA0_12pi5ytvlFO19s2Du6YpI";
    	this.sendCustomMsg(wxOpenId, customMsg+locationUrl);
    	
    	this.out("{\"isSuccess\":true}", this.getResponse());
    }
    
    /**
     * 修改运单状态为正在配送
     * @param transId
     */
    public void changeSendStatus(){
    	RequestHelper helper = new RequestHelper(this.getRequest());
    	Map parameters = new HashMap();
    	String transferId =  (String) helper.getValueFromAllScopes("transferId");
    	parameters.put("transferId",transferId);
    	
    	if(transferId!=null&&transferId!=""&&transferId!="0"){
    		//更新所有运单的坐标信息
    		OperationBean updateOperationBean = OperationConfigRepository.getOperationConfig("StartTransportChangeSendStatus");		
    		ResultBean updateBean = this.dbOperator(updateOperationBean,parameters, false);
    		if(updateBean==null|updateBean.isSuccess()==false){
    			System.out.print("跟新运单坐标信息失败,resultBean==null|resultBean.isSuccess()==false");
    		}	
    	}else{
    		System.out.print("传入的transferId为空,未执行任何操作!");
    	}
    	
		this.out("{\"isSuccess\":true}", this.getResponse());
    }
    
    public void pauseCurrentRequest(){
    	RequestHelper helper = new RequestHelper(this.getRequest());
    	Map parameters = new HashMap();
    	String pauseTimes =  (String) helper.getValueFromAllScopes("pauseTimes");
        long millis=Long.valueOf(pauseTimes);
    	try {
    		System.out.println("Thread.sleep   1111111111");
			Thread.sleep(millis);
			System.out.println("Thread.sleep   2222222222");
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		this.out("{\"isSuccess\":true}", this.getResponse());
    }
    
    
    /**
     * 通过地址获取对应的坐标
     * @param addressInfo
     */
    private String addressAnalysis(String addressInfo){
        String baiduKey=CONFIG_BAIDUKEY;
    	if(addressInfo==null||addressInfo.equals("")){
    		System.out.println("传入地址为空，通过地址获取坐标错误");
    		return "";
    	}
    	
    	String coordtype="";
    	if(CONFIG_DEBUG){
    		coordtype="wgs84ll";
    	}else{
    		coordtype="wgs84ll";
    	}
    	//String baiduAddressAnilyse="http://api.map.baidu.com/geocoder/v2/?address="+addressInfo+"&output=json&ak="+baiduKey;
    	String getAddress=HttpRequestUtils.sendGet("http://api.map.baidu.com/geocoder/v2/","address="+addressInfo+"&output=json&ak="+baiduKey);
	    System.out.println("address   "+addressInfo+"         getAddress:"+getAddress);
	    JsonParser parser=new JsonParser();  //创建JSON解析器
	 	JsonObject json=(JsonObject) parser.parse(getAddress);
	 	String  lng=json.get("result").getAsJsonObject().get("location").getAsJsonObject().get("lng").getAsString();
	 	String  lat=json.get("result").getAsJsonObject().get("location").getAsJsonObject().get("lat").getAsString();
	 	System.out.println(lat+","+lng); 
	 	return lat+","+lng;
    }
    
    public static void main(String[] args) {
		
    	String s="{\"status\":0,\"result\":{\"location\":{\"lng\":120.16741717349744,\"lat\":30.24411536769367},\"precise\":0,\"confidence\":25,\"level\":\"\"}}";
    	 JsonParser parser=new JsonParser();  //创建JSON解析器
 	 	JsonObject json=(JsonObject) parser.parse(s);
 	 	
 	 	 String  lng=json.get("result").getAsJsonObject().get("location").getAsJsonObject().get("lng").getAsString();
 	 	 String  lat=json.get("result").getAsJsonObject().get("location").getAsJsonObject().get("lat").getAsString();
 	 	 System.out.println(lat+","+lng); 
	}
    
    /*
    public static void main(String[] args) {
    	String getAddress="{\"status\":0,\"result\":{\"location\":{\"lng\":116.41059299999994,\"lat\":39.92290407640802},\"formatted_address\":\"北京市东城区智德西巷4号\",\"business\":\"天安门,前门,大栅栏\",\"addressComponent\":{\"country\":\"中国\",\"country_code\":0,\"province\":\"北京市\",\"city\":\"北京市\",\"district\":\"东城区\",\"town\":\"\",\"adcode\":\"110101\",\"street\":\"智德西巷\",\"street_number\":\"4号\",\"direction\":\"附近\",\"distance\":\"7\"},\"pois\":[{\"addr\":\"北池子大街98号\",\"cp\":\" \",\"direction\":\"东北\",\"distance\":\"144\",\"name\":\"温州市人民政府驻北京联络处\",\"poiType\":\"政府机构\",\"point\":{\"x\":116.40949762748693,\"y\":39.922368540085049},\"tag\":\"政府机构;各级政府\",\"tel\":\"\",\"uid\":\"c5ddcc08dd6feec6d81318d1\",\"zip\":\"\",\"parent_poi\":{\"name\":\"\",\"tag\":\"\",\"addr\":\"\",\"point\":{\"x\":0.0,\"y\":0.0},\"direction\":\"\",\"distance\":\"\",\"uid\":\"\"}},{\"addr\":\"北京市东华门大街智德前巷11号\",\"cp\":\" \",\"direction\":\"西北\",\"distance\":\"167\",\"name\":\"北京市二十七中\",\"poiType\":\"教育培训\",\"point\":{\"x\":116.41191406930878,\"y\":39.922347789532178},\"tag\":\"教育培训;中学\",\"tel\":\"\",\"uid\":\"3ed91fdb9716054e2afc485e\",\"zip\":\"\",\"parent_poi\":{\"name\":\"\",\"tag\":\"\",\"addr\":\"\",\"point\":{\"x\":0.0,\"y\":0.0},\"direction\":\"\",\"distance\":\"\",\"uid\":\"\"}},{\"addr\":\"北京市东城区北河沿大街147号\",\"cp\":\" \",\"direction\":\"西南\",\"distance\":\"250\",\"name\":\"民政部\",\"poiType\":\"政府机构\",\"point\":{\"x\":116.41261474760656,\"y\":39.92366197870226},\"tag\":\"政府机构;行政单位\",\"tel\":\"\",\"uid\":\"1b55b30e332a8fcb2ce67b4f\",\"zip\":\"\",\"parent_poi\":{\"name\":\"\",\"tag\":\"\",\"addr\":\"\",\"point\":{\"x\":0.0,\"y\":0.0},\"direction\":\"\",\"distance\":\"\",\"uid\":\"\"}},{\"addr\":\"东华门大街智德前巷11号\",\"cp\":\" \",\"direction\":\"西北\",\"distance\":\"129\",\"name\":\"北京市第二十七中学\",\"poiType\":\"教育培训\",\"point\":{\"x\":116.41150084877418,\"y\":39.92234087267982},\"tag\":\"教育培训;中学\",\"tel\":\"\",\"uid\":\"065d61328a3e8f239de321df\",\"zip\":\"\",\"parent_poi\":{\"name\":\"\",\"tag\":\"\",\"addr\":\"\",\"point\":{\"x\":0.0,\"y\":0.0},\"direction\":\"\",\"distance\":\"\",\"uid\":\"\"}},{\"addr\":\"北池子大街104号(近故宫东门)\",\"cp\":\" \",\"direction\":\"东北\",\"distance\":\"164\",\"name\":\"威亮琴行\",\"poiType\":\"购物\",\"point\":{\"x\":116.40951559359714,\"y\":39.92212644990706},\"tag\":\"购物;商铺\",\"tel\":\"\",\"uid\":\"9fbfeef265b4025cede4a51c\",\"zip\":\"\",\"parent_poi\":{\"name\":\"\",\"tag\":\"\",\"addr\":\"\",\"point\":{\"x\":0.0,\"y\":0.0},\"direction\":\"\",\"distance\":\"\",\"uid\":\"\"}},{\"addr\":\"北京市东城区北池子头条1号\",\"cp\":\" \",\"direction\":\"南\",\"distance\":\"109\",\"name\":\"北池子头条1号\",\"poiType\":\"房地产\",\"point\":{\"x\":116.4103959329969,\"y\":39.923648145264468},\"tag\":\"房地产;住宅区\",\"tel\":\"\",\"uid\":\"5a6dae47784333eb46e27497\",\"zip\":\"\",\"parent_poi\":{\"name\":\"\",\"tag\":\"\",\"addr\":\"\",\"point\":{\"x\":0.0,\"y\":0.0},\"direction\":\"\",\"distance\":\"\",\"uid\":\"\"}},{\"addr\":\"东华门大街20号\",\"cp\":\" \",\"direction\":\"北\",\"distance\":\"239\",\"name\":\"中国工商银行(东华门支行)\",\"poiType\":\"金融\",\"point\":{\"x\":116.41140203516808,\"y\":39.921372506396739},\"tag\":\"金融;银行\",\"tel\":\"\",\"uid\":\"dbf4d6eee23caa546ea3cc87\",\"zip\":\"\",\"parent_poi\":{\"name\":\"\",\"tag\":\"\",\"addr\":\"\",\"point\":{\"x\":0.0,\"y\":0.0},\"direction\":\"\",\"distance\":\"\",\"uid\":\"\"}},{\"addr\":\"北京市东城区东华门大街20号楼底商\",\"cp\":\" \",\"direction\":\"北\",\"distance\":\"252\",\"name\":\"华润万家(东华门店)\",\"poiType\":\"购物\",\"point\":{\"x\":116.41122237406609,\"y\":39.92122725026364},\"tag\":\"购物;超市\",\"tel\":\"\",\"uid\":\"c5ddcc08788b0db8d91318b0\",\"zip\":\"\",\"parent_poi\":{\"name\":\"\",\"tag\":\"\",\"addr\":\"\",\"point\":{\"x\":0.0,\"y\":0.0},\"direction\":\"\",\"distance\":\"\",\"uid\":\"\"}},{\"addr\":\"东城区东华门大街16号（金钱豹东华门餐厅西南角）\",\"cp\":\" \",\"direction\":\"西北\",\"distance\":\"284\",\"name\":\"木棉花酒店\",\"poiType\":\"酒店\",\"point\":{\"x\":116.41205779819038,\"y\":39.92128950293015},\"tag\":\"酒店;星级酒店\",\"tel\":\"\",\"uid\":\"fd007c5e7cbe1775a8f72907\",\"zip\":\"\",\"parent_poi\":{\"name\":\"\",\"tag\":\"\",\"addr\":\"\",\"point\":{\"x\":0.0,\"y\":0.0},\"direction\":\"\",\"distance\":\"\",\"uid\":\"\"}},{\"addr\":\"东城区东华门大街11号\",\"cp\":\" \",\"direction\":\"西北\",\"distance\":\"258\",\"name\":\"大碗居(东华门总店)\",\"poiType\":\"美食\",\"point\":{\"x\":116.41237220511886,\"y\":39.92175985456651},\"tag\":\"美食;中餐厅\",\"tel\":\"\",\"uid\":\"f3c2373c9776d44bd32dd69b\",\"zip\":\"\",\"parent_poi\":{\"name\":\"\",\"tag\":\"\",\"addr\":\"\",\"point\":{\"x\":0.0,\"y\":0.0},\"direction\":\"\",\"distance\":\"\",\"uid\":\"\"}}],\"roads\":[],\"poiRegions\":[],\"sematic_description\":\"温州市人民政府驻北京联络处东北144米\",\"cityCode\":131}}";
    	
    	JsonParser parser=new JsonParser();  //创建JSON解析器
	 	JsonObject json=(JsonObject) parser.parse(getAddress);
	 	
	    String status=	json.get("status").getAsString();
	 	System.out.println(status);
	 	
	 	if("0".equals(status)){
	 		String country  = json.get("result").getAsJsonObject().get("addressComponent").getAsJsonObject().get("country").getAsString();
	 		String province = json.get("result").getAsJsonObject().get("addressComponent").getAsJsonObject().get("province").getAsString();
	 		String city     = json.get("result").getAsJsonObject().get("addressComponent").getAsJsonObject().get("city").getAsString();
	 		String district = json.get("result").getAsJsonObject().get("addressComponent").getAsJsonObject().get("district").getAsString();
	 		System.out.println(country+"  province:"+province+" "+city + "  "+district);
	 	}
	}*/
    
    /**
     * 将坐标解析为省市区县，并存入sendlocation表
     * @param latitude
     * @param longitude
     */
    private void addressAnalysis(String latitude,String longitude,Map parameters,Map<String,String> transIdsMap){
    	String baiduKey=CONFIG_BAIDUKEY;
    	
    	if(latitude==null||longitude==null||latitude.equals("")||longitude.equals("")){
    		System.out.println("传入坐标为空，通过坐标获取地址错误");
    		return ;
    	}
    	
    	String coordtype="";
    	if(CONFIG_DEBUG){
    		coordtype="wgs84ll";
    	}else{
    		coordtype="wgs84ll";
    	}
    	String getAddress=HttpRequestUtils.sendPost("http://api.map.baidu.com/geocoder/v2/","callback=renderReverse&location="+latitude+","+longitude+"&output=json&pois=0&coordtype="+coordtype+"&ak="+baiduKey);
	    System.out.println("     getAddress:"+getAddress);
	    
	    //{"status":0,"result":{"location":{"lng":116.41059299999994,"lat":39.92290407640802},"formatted_address":"北京市东城区智德西巷4号","business":"天安门,前门,大栅栏","addressComponent":{"country":"中国","country_code":0,"province":"北京市","city":"北京市","district":"东城区","town":"","adcode":"110101","street":"智德西巷","street_number":"4号","direction":"附近","distance":"7"},"pois":[{"addr":"北池子大街98号","cp":" ","direction":"东北","distance":"144","name":"温州市人民政府驻北京联络处","poiType":"政府机构","point":{"x":116.40949762748693,"y":39.922368540085049},"tag":"政府机构;各级政府","tel":"","uid":"c5ddcc08dd6feec6d81318d1","zip":"","parent_poi":{"name":"","tag":"","addr":"","point":{"x":0.0,"y":0.0},"direction":"","distance":"","uid":""}},{"addr":"北京市东华门大街智德前巷11号","cp":" ","direction":"西北","distance":"167","name":"北京市二十七中","poiType":"教育培训","point":{"x":116.41191406930878,"y":39.922347789532178},"tag":"教育培训;中学","tel":"","uid":"3ed91fdb9716054e2afc485e","zip":"","parent_poi":{"name":"","tag":"","addr":"","point":{"x":0.0,"y":0.0},"direction":"","distance":"","uid":""}},{"addr":"北京市东城区北河沿大街147号","cp":" ","direction":"西南","distance":"250","name":"民政部","poiType":"政府机构","point":{"x":116.41261474760656,"y":39.92366197870226},"tag":"政府机构;行政单位","tel":"","uid":"1b55b30e332a8fcb2ce67b4f","zip":"","parent_poi":{"name":"","tag":"","addr":"","point":{"x":0.0,"y":0.0},"direction":"","distance":"","uid":""}},{"addr":"东华门大街智德前巷11号","cp":" ","direction":"西北","distance":"129","name":"北京市第二十七中学","poiType":"教育培训","point":{"x":116.41150084877418,"y":39.92234087267982},"tag":"教育培训;中学","tel":"","uid":"065d61328a3e8f239de321df","zip":"","parent_poi":{"name":"","tag":"","addr":"","point":{"x":0.0,"y":0.0},"direction":"","distance":"","uid":""}},{"addr":"北池子大街104号(近故宫东门)","cp":" ","direction":"东北","distance":"164","name":"威亮琴行","poiType":"购物","point":{"x":116.40951559359714,"y":39.92212644990706},"tag":"购物;商铺","tel":"","uid":"9fbfeef265b4025cede4a51c","zip":"","parent_poi":{"name":"","tag":"","addr":"","point":{"x":0.0,"y":0.0},"direction":"","distance":"","uid":""}},{"addr":"北京市东城区北池子头条1号","cp":" ","direction":"南","distance":"109","name":"北池子头条1号","poiType":"房地产","point":{"x":116.4103959329969,"y":39.923648145264468},"tag":"房地产;住宅区","tel":"","uid":"5a6dae47784333eb46e27497","zip":"","parent_poi":{"name":"","tag":"","addr":"","point":{"x":0.0,"y":0.0},"direction":"","distance":"","uid":""}},{"addr":"东华门大街20号","cp":" ","direction":"北","distance":"239","name":"中国工商银行(东华门支行)","poiType":"金融","point":{"x":116.41140203516808,"y":39.921372506396739},"tag":"金融;银行","tel":"","uid":"dbf4d6eee23caa546ea3cc87","zip":"","parent_poi":{"name":"","tag":"","addr":"","point":{"x":0.0,"y":0.0},"direction":"","distance":"","uid":""}},{"addr":"北京市东城区东华门大街20号楼底商","cp":" ","direction":"北","distance":"252","name":"华润万家(东华门店)","poiType":"购物","point":{"x":116.41122237406609,"y":39.92122725026364},"tag":"购物;超市","tel":"","uid":"c5ddcc08788b0db8d91318b0","zip":"","parent_poi":{"name":"","tag":"","addr":"","point":{"x":0.0,"y":0.0},"direction":"","distance":"","uid":""}},{"addr":"东城区东华门大街16号（金钱豹东华门餐厅西南角）","cp":" ","direction":"西北","distance":"284","name":"木棉花酒店","poiType":"酒店","point":{"x":116.41205779819038,"y":39.92128950293015},"tag":"酒店;星级酒店","tel":"","uid":"fd007c5e7cbe1775a8f72907","zip":"","parent_poi":{"name":"","tag":"","addr":"","point":{"x":0.0,"y":0.0},"direction":"","distance":"","uid":""}},{"addr":"东城区东华门大街11号","cp":" ","direction":"西北","distance":"258","name":"大碗居(东华门总店)","poiType":"美食","point":{"x":116.41237220511886,"y":39.92175985456651},"tag":"美食;中餐厅","tel":"","uid":"f3c2373c9776d44bd32dd69b","zip":"","parent_poi":{"name":"","tag":"","addr":"","point":{"x":0.0,"y":0.0},"direction":"","distance":"","uid":""}}],"roads":[],"poiRegions":[],"sematic_description":"温州市人民政府驻北京联络处东北144米","cityCode":131}}
	    JsonParser parser=new JsonParser();  //创建JSON解析器
	 	JsonObject json=(JsonObject) parser.parse(getAddress);
	 	
	    String status=	json.get("status").getAsString();
	 	System.out.println(status);
	 	
	 	if("0".equals(status)){
	 		String country  = json.get("result").getAsJsonObject().get("addressComponent").getAsJsonObject().get("country").getAsString();
	 		String province = json.get("result").getAsJsonObject().get("addressComponent").getAsJsonObject().get("province").getAsString();
	 		String city     = json.get("result").getAsJsonObject().get("addressComponent").getAsJsonObject().get("city").getAsString();
	 		String district = json.get("result").getAsJsonObject().get("addressComponent").getAsJsonObject().get("district").getAsString();
	 		System.out.println(" country:"+country+"     province:"+province+"    city:"+city + "    district:"+district);
	 		
	 		parameters.put("country",country);   //国家
	    	parameters.put("province",province); //省
			parameters.put("city",city);         //市
			parameters.put("district",district); //区
	 		
			
			//根据transId获取所有运单坐标信息
			OperationBean getLocationBean = OperationConfigRepository.getOperationConfig("getSendLocationByTransId");			
			ResultBean getLocationResult = this.dbOperator(getLocationBean,parameters, false);
			List<SendLocation> list= new ArrayList<SendLocation>();
			list=(List<SendLocation>) getLocationResult.getListResult("getSendLocationByTransId");
			
			if(getLocationResult==null|getLocationResult.isSuccess()==false){
				System.out.print("保存运单坐标信息失败,resultBean==null|resultBean.isSuccess()==false");
			}
			
			//更新所有运单的坐标信息
			OperationBean updateOperationBean = OperationConfigRepository.getOperationConfig("updateSendLocation");		
			ResultBean updateBean = this.dbOperator(updateOperationBean,parameters, false);
			if(updateBean==null|updateBean.isSuccess()==false){
				System.out.print("跟新运单坐标信息失败,resultBean==null|resultBean.isSuccess()==false");
			}
			
			
			//过滤已存在数据库的transid,对其他transId不存在的记录做插入动作
			Map<String,String> transIdsCopy=new HashMap<String,String>();
			transIdsCopy.putAll(transIdsMap);
			if(list!=null&&list.size()>0){
				for(SendLocation sendLocation:list){
					for(String key:transIdsCopy.keySet()){
						if(sendLocation.getTransId().equals(key)){
							transIdsMap.remove(key);
						}
					}
				}
			}
			
			//如果过滤后不为空,则插入数据
			if(!transIdsMap.isEmpty()){
				String[] transIds=new String[transIdsMap.size()];
				int i=0;
				for(String key:transIdsMap.keySet()){
					transIds[i]=key;
					i++;
				}
				if(transIds!=null&&transIds.length>0){
					parameters.put("transId",transIds);
					//province ,city,district
					OperationBean saveOperationBean = OperationConfigRepository.getOperationConfig("saveSendLocation");			
					ResultBean saveBean = this.dbOperator(saveOperationBean,parameters, false);
					if(saveBean==null|saveBean.isSuccess()==false){
						System.out.print("保存运单坐标信息失败,resultBean==null|resultBean.isSuccess()==false");
					}
				}
			}
	 	}else{
	 		System.out.println("获取坐标异常:"+getAddress);
	 	}
    }
 
    
    private void out(String message, HttpServletResponse response) {
		if (message==null||"".equals(message.trim())) {
			return;
		}
		PrintWriter out = null;
		try {
			response.setContentType("application/x-www-form-urlencoded; charset=utf-8");
			response.setCharacterEncoding("utf-8");
			out = response.getWriter();
			out.write(message);
			out.flush();
			out.close();
			out = null;
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}
	}
    
   /**
    * 前台调用jssdk，获取调用jssdk的所有参数
    * @param url
    * @return
    */    
    public void getConfig() {
    	RequestHelper helper = new RequestHelper(this.getRequest());
		String url = (String)helper.getValueFromAllScopes("url");
		
    	  String appId=CONFIG_APP_ID;
    	  String appsecret=CONFIG_APP_SECRET;
    	  
    	  //3、时间戳和随机字符串  
    	  String noncestr = UUID.randomUUID().toString().replace("-", "").substring(0, 16);//随机字符串  
    	  String timestamp = String.valueOf(System.currentTimeMillis() / 1000);//时间戳 
    	  
    	  String interval=CONFIG_INTERVAL;
      	
    	    Config c=new Config();
    	    c.setInterval(Integer.valueOf(interval));
    	    c.setDebug(CONFIG_DEBUG);
    	    
    	    
    	  System.out.println("<br><br>"+" url ---  "+ url);
    	  
    	  String signature=getSignature( appId, appsecret,  timestamp,   noncestr,  url);
    	
    	   System.out.println("WeChatLocationBussiness:getConfig appId: "+ appId+"  appsecret: "+ appsecret+  "  timestamp: "+ timestamp+  "  noncestr: "+  noncestr +" url: "+ url );

    	   if(c.getDebug()){    			
    			WXConfigAjaxResult result =new WXConfigAjaxResult(true,"wxd9e6eb7cf2b4518a","1508726948","e84abd7168ba479e",
    					   "a3187097135ad5257b95297620a2ea80116fb974",Integer.valueOf(interval),"");
    		    System.out.println("测试模式 返回参数: "+ result.getString() );
    		    this.out(result.getString(), this.getResponse());
     	    }else{
     	    	WXConfigAjaxResult result= new WXConfigAjaxResult(true,appId,timestamp,noncestr,signature,Integer.valueOf(interval),"");
     	    	System.out.println(" 返回参数: "+ result.getString() );
     	    	this.out(result.getString(), this.getResponse());
     	    }
    }
    
    
    /**
     * 通过微信id,从数据库微信用户表中获取数据
     * @param openId
     * @return
     */
    public User getUserFromDB(String openId){
    	 Map parameters = new HashMap();
 		parameters.put("openId", openId);
 		OperationBean operationBean = OperationConfigRepository.getOperationConfig("getWXUserInfoByOpenId");
 		ResultBean resultBean = this.dbOperator(operationBean, parameters, false);
 		List<User> userList = new ArrayList<User>();
 		userList =resultBean.getListResult("getWXUserInfoByOpenId");
 		if(userList!=null&&userList.size()>0){
 			return userList.get(0);
 		}else{
 			return null;
 		}
 		
    }
   
    /**
     * 通过微信获取用户信息，跳转到获取地址位置信息页面
     * @return
     */
    public String  getUserInforLocation() {
    	RequestHelper helper = new RequestHelper(this.getRequest());
		String code = (String)helper.getValueFromAllScopes("code");
		String state = (String)helper.getValueFromAllScopes("state");
		
		System.out.println("WeChatLocationBussiness:getUserInforLocation! ---------  code:    "+ code +"    state:  "+state);
    	
    	String appId  =  CONFIG_APP_ID;
  	    String appsecret=CONFIG_APP_SECRET;
  	    
  	    String interval=CONFIG_INTERVAL;
    	
  	    Config c=new Config();
  	    c.setInterval(Integer.valueOf(interval));
  	    c.setDebug(CONFIG_DEBUG);
  	    
  	    User  user =null;
  	    if(c.getDebug()){
  	    	if(user==null){
  	    		user = new User();
  	    	}
  	    	user.setOpenId("test11123");
  	    	user.setNickName("我的微信名称");
  	    	user.setCity("深圳市");
  	    	user.setCountry("CN");
  	    	user.setProvince("广东省");
  	    	user.setSex("1");
  	    	user.setHeadImgurl(" head image url .");
  	    	user.setPrivilege("privilege");
  	    }else{
  	    	Token token = getWebAccessToken(appId, appsecret, code);
  	    	user  = getWebUserInfo(token.getAccessToken(), token.getOpenId());
  	    }
  	    
  	    this.getRequest().setAttribute(user.getOpenId(), user);
  	    this.getRequest().getSession().setAttribute(SESSION_WXUSER, user);
  	    
    	user=this.getUserFromDB(user.getOpenId());
  	   
  	    
		//如果本地数据库未发现此用户，则跳转到注册页面
		if(user==null||user.getOpenId()==null){
			this.setCache("isModify", "1","request");	
		}else{
			this.setCache("wxOpenId", user.getOpenId(),"request");
			this.setCache("isModify", "3","request");	
		}
		
    	this.setCache("user", user,"request");		
    	this.setCache("config", c,"request");		
    		
		return "";
    }
    
    
    /**
     * 给司机发送消息
     * @param openId
     */
    public void sendMsgToDriver(String openId){
    	
    	sendCustomMsg(openId,"test");
    }
    
    
    /**
     * 给指定的用户发送一条指定的信息
     * @param openId
     * @param customMsg
     * @return
     */
    public  JSONObject  sendCustomMsg(String openId,String customMsg){
    	String    messageAccessToken=getMessageToken(WeChatLocationBussiness.CONFIG_APP_ID, WeChatLocationBussiness.CONFIG_APP_SECRET);    
        String requestUrl = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";
       
        requestUrl=requestUrl.replace("ACCESS_TOKEN", messageAccessToken);  
        
        System.out.println(" 发送的url:    "+requestUrl);
        
	     //首先确定是发送文字消息，还是图文消息，这里是手写的json数据.
	     //发送文字消息，无连接
	     String json = "{\"touser\":\""+openId+"\",\"msgtype\":\"text\",\"text\":{\"content\":\""+customMsg+"\"}}";     
	      
	     System.out.println(" 发送的消息内容:  "+json);
	     //请求方法，然后放回OK 成功，否则错误。这里这个请求方法在下边
	     String xmlStr = HttpRequestUtils.sendPost(requestUrl,json);
	      
	     System.out.println("返回的结果内容  :  "+xmlStr);
       
       
        return (new JSONObject());
   } 
    
    /**
	  * 获取微信接口发送消息接口access token
	  * @param appId
	  * @param appsecret
	  * @return
	  */
  public String getMessageToken(String appId,String appsecret){
	  /**
	   https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential$appId=[]&secret
	   */
	  String getAccessTokenResult=HttpRequestUtils.sendPost("https://api.weixin.qq.com/cgi-bin/token","grant_type=client_credential&appid="+appId+"&secret="+appsecret);
	                                                       //https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code 
	  System.out.println("<br>  getMessageToken  "+getAccessTokenResult);
	  JSONObject obj= JSONObject.fromObject(getAccessTokenResult);
	  String accessToken="";
	  if(obj.containsKey("access_token")){
		  accessToken = obj.getString("access_token");
	  }else{
		  return "";
	  }
	  return accessToken;
}
    
	 /**
	  * 获取用户信息第一步，通过授权后，或得code，并通过code获取accessToken,code不可重复使用
	  * 模板文件为
	  * {"access_token":"Ee9cxUtcP54Dqy_axE0fWaVV0Tt2gwFya9ed7vBkE5HSjbySEqsb-mdtnZsG9ltmr_d2xVIJdDjuYXY0v-E-KMi8_cfnKpiLo0-SH210Xac","expires_in":7200,"refresh_token":"Is-1lJ_zX0NDLZKWk_cqPRFsDrc4OlR--C2hMjgoUEjtA0A1ahUUpjtATHRtVU3S4FeEvfaGuI-Dx32ZzdWwKhem1Bl175XxXMJinsq81oo","openid":"oX8FV1SJIeOI3Yr6CiHFuNCSeLGM","scope":"snsapi_base"}
	  * @param appId
	  * @param appsecret
	  * @param code
	  * @return
	  */
   public Token getWebAccessToken(String appId,String appsecret,String code){
 	  String getAccessTokenResult=HttpRequestUtils.sendPost("https://api.weixin.qq.com/sns/oauth2/access_token","appid="+appId+"&secret="+appsecret+"&code="+code+"&grant_type=authorization_code");
 	                                                       //https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code 
 	  System.out.println("<br>  getWebAccessToken  "+getAccessTokenResult);
 	  
 	  Token t=new Token();
 	  JsonParser parser=new JsonParser();  //创建JSON解析器
 	  JsonObject json=(JsonObject) parser.parse(getAccessTokenResult);
 	  
 	  JsonElement o= json.get("access_token");
 	  if(!StringUtils.isNull(o)){
 		  t.setAccessToken(o.getAsString());
 		  t.setExpiresIn(json.get("expires_in").getAsString());
 		  t.setOpenId(json.get("openid").getAsString());
 		  t.setRefreshToken(json.get("refresh_token").getAsString());
 		  t.setScope(json.get("scope").getAsString());
 	  }else{
 		  String errorCode= json.get("errcode").getAsString();
 		  String  errmsg  = json.get("errmsg").getAsString();
 		  //throw new TokenException()
 	  }
 	  return t;
 }
 

   /**
    * 获取用户信息第二步，通过accessToken，openId获取,
    * {"openid":"oX8FV1SJIeOI3Yr6CiHFuNCSeLGM","nickname":"鏃犱緧","sex":1,"language":"zh_CN","city":"娣卞湷","province":"骞夸笢","country":"涓浗","headimgurl":"http:\/\/wx.qlogo.cn\/mmopen\/dBJCMIcUJnsAJQib1Gdu5sfycGeMnGMre399CXncD9DQy6k5fSf3yB4GDJmsyFibsh3D4icbqibtWZXuLkoedo9dGJjC5qmpQxnc\/0","privilege":[]}
    * @param accessToken
    * @param openId
    * @return
    */
   public User getWebUserInfo(String accessToken,String openId){
   	 String getUserInfor=HttpRequestUtils.sendPost("https://api.weixin.qq.com/sns/userinfo","access_token="+accessToken+"&openid="+openId+"&lang=zh_CN");
   	  System.out.println("<br>"+"getWebUserInfo:  "+getUserInfor);
   	 User user=new User();
   	 JsonParser parser=new JsonParser();  //创建JSON解析器
	   	 JsonObject json=(JsonObject) parser.parse(getUserInfor);
	   	  
	   	  JsonElement o= json.get("openid");
	   	  if(!StringUtils.isNull(o)){
	   		  user.setOpenId(json.get("openid").getAsString());
	   		  user.setNickName(json.get("nickname").getAsString());
	   		  user.setSex(json.get("sex").getAsString());
	   		  user.setProvince(json.get("province").getAsString());
	   		  user.setCity(json.get("city").getAsString());
	   		  user.setCountry(json.get("country").getAsString());
	   		  user.setHeadImgurl(json.get("headimgurl").getAsString());
	   
	   		  //privilege获取对应的操作符号为[],此时会报错
	   	      // u.setPrivilege(json.get("privilege").getAsString());
	   		  if(!StringUtils.isNull(json.get("unionid"))){
	   			  user.setUnionId(json.get("unionid").getAsString());
	   		  }
	   	  }else{
	   		  String  errorCode= json.get("errcode").getAsString();
	   		  String  errmsg  = json.get("errmsg").getAsString();
	   		  //throw new TokenException()
	   	  }
  	     return user;
   }
   
   /**
    * 刷新微信认证授权token
    * @param appId
    * @param appsecret
    * @param refreshToken
    * @return
    */
 private  Token refreshWebAccessToken(String appId,String appsecret,String refreshToken){
 	  String refreshTokenResult=HttpRequestUtils.sendPost("https://api.weixin.qq.com/sns/oauth2/refresh_token","appid="+appId+"&grant_type=refresh_token&refresh_token="+refreshToken);
 	  
 	  System.out.println("<br>"+"refreshWebAccessToken:  "+refreshTokenResult);
 	  
 	  Token t=new Token();
 	  JsonParser parser=new JsonParser();  //创建JSON解析器
 	  JsonObject json=(JsonObject) parser.parse(refreshTokenResult);
 	  
 	  JsonElement o= json.get("access_token");
 	  if(!StringUtils.isNull(o)){
 		  t.setAccessToken(o.getAsString());
 		  t.setExpiresIn(json.get("expires_in").getAsString());
 		  t.setOpenId(json.get("openid").getAsString());
 		  t.setRefreshToken(json.get("refresh_token").getAsString());
 		  t.setScope(json.get("scope").getAsString());
 	  }else{
 		  String errorCode= json.get("errcode").getAsString();
 		  String  errmsg  = json.get("errmsg").getAsString();
 		  //throw new TokenException()
 	  }
 	  return t;
 }
    
 
 /**
  * jsjdk调用第一步，根据accessToken获取jsTicket
  * @param appId
  * @param appsecret
  * @return
  */
 private  String  getJsAccessToken(String appId,String appsecret){
	  String getAccessToken=HttpRequestUtils.sendPost("https://api.weixin.qq.com/cgi-bin/token", "grant_type=client_credential&appid="+appId+"&secret="+appsecret);
	  
	   System.out.println("   <br><br>   getJsAccessToken result "+getAccessToken);
      
	  String[] splitToken=getAccessToken.split("\"");
      String accessToken=splitToken[3];
    
      // System.out.println("<br>"+accessToken);
      
  	   JsonParser parser=new JsonParser();  //创建JSON解析器
  	   JsonObject json=(JsonObject) parser.parse(getAccessToken);
  	   
  	   JsonElement errcode= json.get("errcode");
      if(StringUtils.isNull(errcode)){
   	   // String errorCode= json.get("errcode").getAsString();
   	   accessToken =json.get("access_token").getAsString();
   	   // System.out.println("<br>"+"error msg: "+getAccessToken);
  	   }else{
  		   String  errorCode= json.get("errcode").getAsString();
  		   String  errmsg  = json.get("errmsg").getAsString();
  		 //   System.out.println("<br>"+"error msg: "+getAccessToken);
  	   }       
      return accessToken;
}
   
   /**
    * jsjdk调用第二步，根据accessToken获取jsTicket
    * 返回结果示例 {"errcode":0,"errmsg":"ok","ticket":"HoagFKDcsGMVCIY2vOjf9gkRvNvWkhCNm4ytyXtanqmO_prmBa11gGix5QZi-mDovRYi5lAa3XKwaJ2rlhhVpw","expires_in":7200}
    * @param accessToken
    * @return
    */
   private String getJsTicket(String accessToken){
	       String getJsapiTicket=HttpRequestUtils.sendPost("https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+accessToken+"&type=jsapi","");
	     
	       String jsTicket="";
	       JsonParser parser=new JsonParser();  //创建JSON解析器
	   	   JsonObject json=(JsonObject) parser.parse(getJsapiTicket);
	   	   
	   	    System.out.println("  <br><br>  getJsapiTicket resutlt    "+getJsapiTicket);
	   	   
	   	   JsonElement errcode= json.get("ticket");
	       if(!StringUtils.isNull(errcode)){
	    	  // String errorCode= json.get("errcode").getAsString();
	    	   jsTicket =json.get("ticket").getAsString();
	    	 //   System.out.println("<br>"+"request successful : "+getJsapiTicket);
	   	   }else{
	   		   String  errorCode= json.get("errcode").getAsString();
	   		   String  errmsg  = json.get("errmsg").getAsString();
	   		//    System.out.println("<br>"+"error msg: "+getJsapiTicket);
	   	   }       
	       return jsTicket;
   }
   
   
   /**
    * jsjdk调用第三步 获取jssdk的数据签名，供配置及调用jssdk做准备
    * @param noncestr
    * @param jsapi_ticket
    * @param timestamp
    * @param url
    * @return
    */   
   private  String getSignature(String appId,String appsecret, String timestamp,String   noncestr, String url ){
	   String accessToken=getJsAccessToken(appId, appsecret);
	   
	    System.out.println("    getSignature  accessToken:  "+accessToken);
	   
	   String jsTicket=getJsTicket(accessToken);	   
	   
	    System.out.println("    getSignature  jsTicket      "+ jsTicket);
	   
	   
	   /*
	    http://java9961.goip8.dlbcw.com/weixin/location.jsp
	    jsapi_ticket=sM4AOVdWfPE4DxkXGEs8VMCPGGVi4C3VM0P37wVUCFvkVAy_90u5h9nbSlYy3-Sl-HhTdfl2fzFy1AOcHKP7qg
	    &noncestr=Wm3WZYTPz0wzccnW&timestamp=1414587457&url=http://mp.weixin.qq.com?params=value
	    */
	   
	   //url="http://java9961.goip8.dlbcw.com";
	   String codeUrl="jsapi_ticket="+jsTicket+"&noncestr="+noncestr+"&timestamp="+timestamp+"&url="+url;
	   
	    System.out.println("     <br>  getSignature  jiamiurl      "+ codeUrl);
	   
	   String signature=DigestUtils.shaHex(codeUrl);
	   
	    System.out.println("     <br>  signature:   "+signature);
	   
	   return signature;
   }
   
 
   /**
    * 微信指引服务接口实现
    * @param signature
    * @param timestamp
    * @param nonce
    * @param echostr
    * @return
    */
   public String tokenAuthentication(String signature,String timestamp,String nonce,String echostr) {
   	  boolean b = false;
   	  String token=CONFIG_TOKEN;
   	 
   	  String signatureGenerate = getAuthenticationSignature(timestamp,nonce,token);
   	  
     	 System.out.println("<br>"+"tokenAuthentication:  token "+ token+"   timestamp  " +timestamp+"  nonce  "+nonce+"  echostr: " +echostr +"  signature  "+signature+"     ----    "+signatureGenerate);
   	  
   	  if(!StringUtils.isNull(signatureGenerate)&&signatureGenerate.equals(signature)){
   		   System.out.println("<br>"+"tokenAuthentication result: " + true);
   		  return echostr;   		  
   	  }else{
   		  b=true;
   		   System.out.println("<br>"+"tokenAuthentication result: " + false);
   		  return "";
   	  }
   }  
  
   
   /**
    * 获取认证签名
    * @param timestamp
    * @param nonce
    * @param token
    * @return
    */
   private String getAuthenticationSignature(String timestamp,String nonce, String token){
	   	if(StringUtils.isNull(timestamp)||StringUtils.isNull(nonce)||StringUtils.isNull(token)){
	   		return null;
	   	}
	   	ArrayList<String> list=new ArrayList<String>();
		list.add(nonce);
		list.add(timestamp);
		list.add(token);
		Collections.sort(list);
		
		return DigestUtils.shaHex(list.get(0)+list.get(1)+list.get(2));
   }
    
    
    
    
}
