package com.zzy.htms.webservice.market.order;

import java.math.BigDecimal;

public class TestClass {

	public static void main(String[] args) {
		BigDecimal originalApplyTonNum= new BigDecimal(20);
		BigDecimal currentApplyTonNum= new BigDecimal(15);
		String reducedApplyTonNum =(originalApplyTonNum.subtract(currentApplyTonNum)).toString();
		System.out.println(reducedApplyTonNum);
	}
	
}
