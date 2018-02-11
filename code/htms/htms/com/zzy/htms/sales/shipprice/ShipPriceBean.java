package com.zzy.htms.sales.shipprice;

import java.io.Serializable;

import com.mobilecn.beans.AbstractBean;
import com.zzy.htms.logistic.transferprice.TransferPriceBean;

public class ShipPriceBean  extends AbstractBean  implements Serializable {
	private String priceId         ;
	private String priceType       ;
	private String freightModel    ;
	private String customerPrice   ;
	private String carrierPrice    ;
	private String customerOnePrice;
	private String carrierOnePrice ;
	private String priceUnit       ;
	private String validateDate    ;
	private String priceNotice     ;
	private String creator         ;
	private String createTime      ;
	private String modifier        ;
	private String modifyTime      ;
	private String isValidate      ;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println((new ShipPriceBean()).toBeanMap());

	}

}
