package com.zzy.htms.services.business;

public class FreightTester {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	/**
	 * 测试001：测试按正常情况计算运费
	 * 1）把特殊客户及调拨单运费计算在程序中注释掉；
	 * 2）在运价表中修改运价为单价计算模式；
	 * 3）准备不同区间的运价；
	 * 4）准备不同区间的测试数据
	 */
	public static void test001() {
		HtmsFreightBusiness freightBusiness = new HtmsFreightBusiness();
		XmlBuffer stockBuffer = new XmlBuffer();
		stockBuffer.rootStart();
		 stockBuffer.start("system").newLine();
		 stockBuffer.element("code", "SAP").newLine();//状态,S=成功
		 stockBuffer.element("account", "sap").newLine();//编码
		 stockBuffer.element("passwd", "123456").newLine();//消息
		 stockBuffer.end("system").newLine();


		 stockBuffer.start("DELIVERY_INFO").newLine();
		 stockBuffer.element("VBELN", "0081384970").newLine();//交货单号
		 stockBuffer.element("POSNR", "000010").newLine();//行项目号
		 stockBuffer.element("MATNR", "DTY").newLine();//物料号
		 stockBuffer.element("LFIMG", "7211.7").newLine();//数量
		 stockBuffer.element("MEINS", "KG").newLine();//单位
		 stockBuffer.element("ESIMT", "FALSE").newLine();//是否预估
		 stockBuffer.end("DELIVERY_INFO").newLine();
		 
		 stockBuffer.start("DELIVERY_INFO").newLine();
		 stockBuffer.element("VBELN", "0081384970").newLine();//交货单号
		 stockBuffer.element("POSNR", "000020").newLine();//行项目号
		 stockBuffer.element("MATNR", "DTY").newLine();//物料号
		 stockBuffer.element("LFIMG", "10833.6").newLine();//数量
		 stockBuffer.element("MEINS", "KG").newLine();//单位
		 stockBuffer.element("ESIMT", "FALSE").newLine();//是否预估
		 stockBuffer.end("DELIVERY_INFO").newLine();
		stockBuffer.rootEnd();
		System.out.println("-------------------- pxml -----------------------");
		System.out.println(stockBuffer);
		System.out.println("-------------------- pxml -----------------------");
		//stockBusiness.getTransferHoldStock(stockBuffer.toString());
		//freightBusiness.getFreight(stockBuffer.toString());
	}
}
