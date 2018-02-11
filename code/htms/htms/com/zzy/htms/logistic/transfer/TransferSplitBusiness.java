package com.zzy.htms.logistic.transfer;

import java.util.List;
import java.util.Map;

import com.mobilecn.business.AbstractBusinessExecutor;
import com.mobilecn.mydbc.bean.ResultBean;
import com.mobilecn.mydbc.database.DBTool;
import com.mobilecn.utils.RequestHelper;
import com.mobilecn.utils.random.IntRandom;
import com.zzy.htms.dictionary.area.AreaRepository;
import com.zzy.htms.log.HtmsLogger;
import com.zzy.htms.logistic.transferdetail.TransferDetailBean;
import com.zzy.htms.sap.rfc.TransferSynker;


/**
 * 调拨单分拆业务实现类
 * @author zzy
 *
 */
public class TransferSplitBusiness extends AbstractBusinessExecutor{
	/*public void cancelTransferTransport(){
		this.setCache("modifyTime", tools.tool.getDateTime(), "request");
	}*/
	public String checkUpdate(){
		String[] splitTonNum=this.getRequest().getParameterValues("splitTonNum");
		String currentCarrierId=(String)this.getParameter("currentCarrierId");
		if((splitTonNum==null||splitTonNum.length==0)&&this.isNull(currentCarrierId)){
			/*没有分拆且没有分配承商，直接跳回列表页面*/
			log.info("(splitTonNum==null||splitTonNum.length==0)&&this.isNull(currentCarrierId)当前调拨单没有被分拆，也没有绑定承运商");
			return "listAction";
		}
		if(!this.isNull(currentCarrierId)){
			this.setCache("transStatus", "1", "request");//绑定承运商
		}else{
			this.setCache("transStatus", "0", "request");//未绑定承运商
		}
		return null;
	}
	public String beforeOriginalAddTransport(){
		String currentCarrierId=(String)this.getParameter("currentCarrierId");
		if(this.isNull(currentCarrierId)){
			/*没有分拆且没有分配承商，直接跳回列表页面*/
			log.info("当前调拨单没有绑定承运商(this.isNull(currentCarrierId)");
			return "listAction";
		}
		String transportCode = tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(10,99);
		this.setCache("transportCode", transportCode, "request");
		return null;
	}
	
	public String beforeSplit(){
		String[] splitTonNum=this.getRequest().getParameterValues("splitTonNum");
		String[] splitCarrierId=this.getRequest().getParameterValues("splitCarrierId");
		if((splitTonNum==null||splitTonNum.length==0)||(splitCarrierId==null||splitCarrierId.length==0)){
			/*没有分拆且没有分配承商，直接跳回列表页面*/
			log.info("(splitTonNum==null||splitTonNum.length==0)当前调拨单没有被分拆，也没有绑定承运商");
			return "listPage";
		}
		String[] splitTransId = new String[splitTonNum.length];//调拨单ID
		String[] splitTransCode = new String[splitTonNum.length];//调拨单ID
		String[] splitTransDetailId = new String[splitTonNum.length];//调拨单明细ID
		String[] splitTransportsId = new String[splitTonNum.length];//运单ID
		String[] splitTransportCode = new String[splitTonNum.length];
		String[] splitTransStatus =  new String[splitTonNum.length];
		DBTool dbTool= new DBTool();
		for(int i=0;i<splitTonNum.length;i++){
			splitTransId[i] =dbTool.getCaiid("insertNewTransferTransport", "INSERT_SPLIT_TRANSID", "transId");
			splitTransDetailId[i]=dbTool.getCaiid("insertNewTransferTransport", "INSERT_TRANSFERDETAIL", "transDetailId");
			splitTransportsId[i] =dbTool.getCaiid("insertNewTransferTransport", "INSERT_SPLIT_TRANSPORT", "transportId");
			if(i<10){
				splitTransCode[i]=  tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(0,9)+i;
				splitTransportCode[i] =  tools.tool.DateUtil.getFormatDate("MMddHHmmss")+IntRandom.getRandom(0,9)+i;
			}else{
				splitTransCode[i]=  tools.tool.DateUtil.getFormatDate("MMddHHmmss")+i;
				splitTransportCode[i] =  tools.tool.DateUtil.getFormatDate("MMddHHmmss")+i;
			}
			
			/*
			    0、未分配给承商；
				1、已分配给承运商，未排车；
				2、已经分配给承运商，已排车。
			 */
			splitTransStatus[i]=this.isNull(splitCarrierId[i])?"0":"1";
		}
		
		this.getRequest().setAttribute("splitTransId", splitTransId);
		this.getRequest().setAttribute("splitTransDetailId", splitTransDetailId);
		this.getRequest().setAttribute("splitTransportsId", splitTransportsId);
		this.getRequest().setAttribute("splitTransCode", splitTransCode);
		this.getRequest().setAttribute("splitTransportCode", splitTransportCode);
		this.getRequest().setAttribute("splitTransStatus", splitTransStatus);
		
		return null;
	}
	
	
	
	
	
	/*public void getTransId(){
		String[] splitCounts=this.getRequest().getParameterValues("splitTonNum");
		if(splitCounts==null||splitCounts.length==0){
			log.info("splitCounts==null||splitCounts.length");
			return;
		}
		DBTool dbTool= new DBTool();
		String[] splitTransId = new String[splitCounts.length];//调拨单ID
		String[] splitTransDetailId = new String[splitCounts.length];//调拨单明细ID
		String[] splitTransportsId = new String[splitCounts.length];//运单ID
		//String[] splitDetailsId = new String[splitCounts.length];//运单明细ID
		Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Random random = new Random();
        int x = random.nextInt(1000);
        String transportCode=sdf.format(d)+x;
        this.getRequest().setAttribute("transportCode", transportCode);
        int y;
        String[] splitTransportCode = new String[splitCounts.length];
		for(int i=0;i<splitCounts.length;i++){
			splitTransId[i] =dbTool.getCaiid("addTransfer", "INSERT_SPLIT_TRANSID", "splitTransId");
			splitTransDetailId[i]=dbTool.getCaiid("addTransfer", "INSERT_TRANSPORTDETAIL", "transDetailId");
			splitTransportsId[i] =dbTool.getCaiid("addTransfer", "INSERT_SPLIT_TRANSPORT", "splitTransportsId");
			//splitDetailsId[i] =dbTool.getCaiid("addTransfer", "INSERT_SPLIT_TRANSPORTDIATLE", "splitDetailsId");
			y=random.nextInt(1000);
			splitTransportCode[i] = sdf.format(d)+y+i;
			
		}
		this.getRequest().setAttribute("newsplitTransId", splitTransId);
		this.getRequest().setAttribute("newsplitTransDetaulId", splitTransDetailId);
		this.getRequest().setAttribute("newsplitTransportsId", splitTransportsId);
		//this.getRequest().setAttribute("splitDetailsId", splitDetailsId);
		this.getRequest().setAttribute("splitTransportCode", splitTransportCode);
		
        
	}*/
	/**
	 * 创建sap中的调拨单
	 */
	public String createSapTransfer(){
		ResultBean resultBean=this.getResultBean();
		String SAP_INVOKE_MESSAGE="";
		if(resultBean==null||resultBean.isSuccess()==false){
			SAP_INVOKE_MESSAGE="数据库没有获取查询结果，不能创建SAP中的调拨单";
			return null;
		}
		
		TransferBean transferBean=(TransferBean)resultBean.getListFirstResult("transferBean");
		if(transferBean==null){
			SAP_INVOKE_MESSAGE="没有获取调拨单，不能创建SAP中的调拨单";
			this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
			return null;
		}
		/**
		 * 已经生成了，不需要再生成了。
		 */
		if(this.isNull(transferBean.getSapTransCode())==false){
			SAP_INVOKE_MESSAGE="SAP中的调拨单已创建,分配成功。";
			this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
			this.setCache("sapTransferCode","","request");
			return null;
		}
		//if(this.isNull(transferBean.getSapTransCode())==false){
		//	SAP_INVOKE_MESSAGE="该调拨单在SAP中已经创建调拨单，无须再创建。";
		//	this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
		//	return null;
		//}
		AreaRepository rep = new AreaRepository();
		transferBean.setAreaName(rep.getFullAreaName(transferBean.getAreaId(), "", true));
		//" beanClass="com.zzy.htms.logistic.transferdetail.TransferDetailBean
		List<TransferDetailBean> detailList=(List<TransferDetailBean>)resultBean.getListResult("detailList");
		if(detailList==null||detailList.isEmpty()){
			SAP_INVOKE_MESSAGE="没有获取调拨单，不能创建SAP中的调拨单";
			this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
			return null;
		}
		TransferSynker transSynker= new TransferSynker();
		Map<String,Map<String,String>> resutlMap=transSynker.createTransfer(transferBean, detailList);
		
		if(resutlMap==null){
			SAP_INVOKE_MESSAGE="SAP调用出错，调拨单分配不成功。";
			this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
		}
		Map<String,String> map=resutlMap.get(transferBean.getTransferCode());
		if(map==null){
			SAP_INVOKE_MESSAGE="SAP调用出错，没有返回信息，调拨单分配不成功。";
		}
		String result=map.get("result");
		String sapTransferCode= map.get(transferBean.getTransferCode());
		if("E".equals(result)){
			SAP_INVOKE_MESSAGE="SAP调用出错，返回信息:"+map.get("message");
		}else{		
			if(this.isNull(sapTransferCode)){
				SAP_INVOKE_MESSAGE="SAP调用出错，返回的调拨单号为空。";
			}
		}
		//log.info("===================================>sapTransferCode="+sapTransferCode);
		//log.info("===================================>map="+map);
		//log.info("===================================>SAP_INVOKE_MESSAGE="+SAP_INVOKE_MESSAGE);
		this.setCache("SAP_INVOKE_MESSAGE",SAP_INVOKE_MESSAGE,"request");
		this.setCache("sapTransferCode",sapTransferCode,"request");
		return this.isNull(SAP_INVOKE_MESSAGE)?"updateSapTransferCode":null;
	}

	
	public String deleteSapTransfer(){
		//String forward=super.modify();
		this.setCache("SAP_INVOKE_MESSAGE","取消调拨单失败。","request");
		if (this.isSuccess()) {
			//HtmsLogger.log("TRANSFER081", "删除调拨单成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("TRANSFER082", "删除调拨单失败", "0", this.getRequest());
		}
		ResultBean resultBean=this.getResultBean();
		if(resultBean==null||resultBean.isSuccess()==false){
			log.info("数据库没有获取查询结果，不能删除SAP中的自提货调拨单");
			return "listPage";
		}
		
		TransferBean transferBean=(TransferBean)resultBean.getListFirstResult("transferBean");
		if(transferBean==null){
			log.info("没有获取调拨单，不能删除SAP中的自提货调拨单");
			return null;
		}
		if(this.isNull(transferBean.getSapTransCode())){
			this.setCache("SAP_INVOKE_MESSAGE","","request");
			log.info("SAP中没有生成对应调拨单，无需删除。");
			return "listAction";
		}else{
			TransferSynker transSynker= new TransferSynker();
			String message =transSynker.dropTransfer(transferBean.getSapTransCode(),transferBean.getShipId()+"");
			if ("S".equalsIgnoreCase(message)) {
				this.setCache("modifyTime", tools.tool.getDateTime(), "request");
				HtmsLogger.log("TRANSFER085", "删除SAP中调拨单成功", "1", this.getRequest());
				this.setCache("SAP_INVOKE_MESSAGE","","request");
				return "listAction";
			}else{
				HtmsLogger.log("TRANSFER086", "删除SAP中调拨单失败", "0", this.getRequest());
				this.setCache("SAP_INVOKE_MESSAGE","取消调拨单失败。"+message,"request");
				return "listPage";
			}
		}
	}
	
	public void checkAssign(){
		ResultBean resultBean=this.getResultBean();
		String SAP_INVOKE_MESSAGE="";
		/*数据库操作失败，需要检测从SAP删除已经生成的调拨单*/
		if(resultBean==null||resultBean.isSuccess()==false){
			RequestHelper helper = new RequestHelper(this.getRequest());
			String sapTransferCode = (String)helper.getValueFromAllScopes("sapTransferCode");
			String currentShipId = (String)helper.getValueFromAllScopes("currentShipId");
			if(this.isNull(sapTransferCode)==false){
				TransferSynker transSynker= new TransferSynker();
				String message =transSynker.dropTransfer(sapTransferCode,currentShipId);
				if ("S".equalsIgnoreCase(message)) {
					this.setCache("modifyTime", tools.tool.getDateTime(), "request");
					HtmsLogger.log("TRANSFER901", "数据库操作失败，从SAP删除已经生成的调拨单成功", "1", this.getRequest());
					SAP_INVOKE_MESSAGE="分配时，数据库操作失败。SAP生成了调拨单后又删除了。请重试再分配";
				}else{
					HtmsLogger.log("TRANSFER901", "数据库操作失败，从SAP删除已经生成的调拨单失败", "0", this.getRequest());
					SAP_INVOKE_MESSAGE="分配时，数据库操作失败。SAP生成了调拨单。请和SAP管理员联系删除调拨单后，再重试分配";
				}
			}
			
		}
		
	}
}
