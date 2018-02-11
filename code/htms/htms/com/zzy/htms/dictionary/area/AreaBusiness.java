package com.zzy.htms.dictionary.area;
import com.mobilecn.console.v2.business.AbstractV2BusinessExecutor;
import com.zzy.htms.log.HtmsLogger;
/**
 * 地址库业务实现类
 * @author zzy
 *
 */
public class AreaBusiness  extends AbstractV2BusinessExecutor {
	
	/**
	 * 加载地址库缓存
	 * @return
	 */
	public String toLoadArea(){
		AreaRepository.reload();
		return null;
	}
	/**
	 * 增加地址库调用的方法
	 */
	public String add(){
		String forward=super.add();
		if (this.isSuccess()) {
			//HtmsLogger.log("AREA001", "增加地址库成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("AREA002", "增加地址库失败", "0", this.getRequest());
		}
		//AreaRepository.reload();
		return forward;
	}
	
	/**
	 * 增加地址库之前的判断
	 */
	public String beforeAdd(){
		String areaId = this.getRequest().getParameter("parentAreaId");
		String areaLevel=null;
		
		AreaRepository rep = new AreaRepository();
		AreaBean areaBean =rep.getArea(areaId);
		//List<AreaBean> areaLevelList = rep.getAreaLevel(areaId);
		int level =areaBean==null?1:areaBean.getAreaLevel();
		String areaParentCode =areaBean==null?"0":areaBean.getAreaCode();
		level=level+1;
		/*if(areaLevelList!=null){
			for(int i=0;i<areaLevelList.size();i++){
				AreaBean areaBean = areaLevelList.get(i);
				areaLevel= areaBean.getAreaLevel()+"1";
				areaParentCode = areaBean.getAreaCode();
			}
		}else{
			areaLevel="1";
			areaParentCode="0";
		}*/
		this.getRequest().setAttribute("areaLevel", level+"");
		this.getRequest().setAttribute("areaParentCode", areaParentCode);
		return null;
	}
	
	/**
	 * 删除地址库方法
	 */
	public String delete(){
		String forward=super.delete();
		if (this.isSuccess()) {
			//HtmsLogger.log("AREA011", "删除地址库成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("AREA012", "删除地址库失败", "0", this.getRequest());
		}
		//AreaRepository.reload();
		return forward;
	}
	/**
	 * 加载地址库列表方法
	 */
	public String list(){
		String forward=super.list();
		if (this.isSuccess()) {
			//HtmsLogger.log("AREA021", "查看地址库列表成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("AREA022", "查看地址库列表失败", "0", this.getRequest());
		}
		return forward;
	}
	/**
	 * 查看地址库方法
	 */
	public String view(){
		String forward=super.view();
		if (this.isSuccess()) {
			//HtmsLogger.log("AREA031", "查看地址库成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("AREA032", "查看地址库失败", "0", this.getRequest());
		}
		return forward;
	}
	/**
	 * 修改地址库之前使用的方法
	 */
	public String beforeModify(){
		String areaId = this.getRequest().getParameter("parentAreaId");
		String areaLevel=null;
		
		AreaRepository rep = new AreaRepository();
		AreaBean areaBean =rep.getArea(areaId);
		//List<AreaBean> areaLevelList = rep.getAreaLevel(areaId);
		int level =areaBean==null?1:areaBean.getAreaLevel();
		String areaParentCode =areaBean==null?"0":areaBean.getAreaCode();
		level=level+1;
		/*if(areaLevelList!=null){
			for(int i=0;i<areaLevelList.size();i++){
				AreaBean areaBean = areaLevelList.get(i);
				areaLevel= areaBean.getAreaLevel()+"1";
				areaParentCode = areaBean.getAreaCode();
			}
		}else{
			areaLevel="1";
			areaParentCode="0";
		}*/
		this.getRequest().setAttribute("areaLevel", level+"");
		this.getRequest().setAttribute("areaParentCode", areaParentCode);
		return null;
		/*String areaId = this.getRequest().getParameter("parentAreaId");
		String areaLevel=null;
		String areaParentCode = null;
		AreaRepository rep = new AreaRepository();
		List<AreaBean> areaLevelList = rep.getAreaLevel(areaId);
		if(areaLevelList!=null){
			for(int i=0;i<areaLevelList.size();i++){
				AreaBean areaBean = areaLevelList.get(i);
				areaLevel= areaBean.getAreaLevel()+"1";
				areaParentCode = areaBean.getAreaCode();
			}
		}else{
			areaLevel="1";
			areaParentCode="0";
		}
		this.getRequest().setAttribute("areaLevel", areaLevel);
		this.getRequest().setAttribute("areaParentCode", areaParentCode);
		return null;*/
	}
	/**
	 * 修改地址库方法
	 */
	public String modify(){
		String forward=super.modify();
		if (this.isSuccess()) {
		//	HtmsLogger.log("AREA041", "修改地址库成功", "1", this.getRequest());
		}else{
			HtmsLogger.log("AREA042", "修改地址库失败", "0", this.getRequest());
		}
		//AreaRepository.reload();
		return forward;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	}
	//Self Define Method Start...
	//DefautMethod,MethodId:1859, MethodName:默认新增, MethodCode:add
	//DefautMethod,MethodId:1864, MethodName:默认查询, MethodCode:list
	//DefautMethod,MethodId:1863, MethodName:默认修改, MethodCode:view
	//DefautMethod,MethodId:1862, MethodName:默认修改, MethodCode:modify
	//DefautMethod,MethodId:1861, MethodName:默认删除, MethodCode:delete
	/**默认新增:默认新增*/
	public void toAdd(){
		super.add();
	}
	//Self Define Method End.
}

