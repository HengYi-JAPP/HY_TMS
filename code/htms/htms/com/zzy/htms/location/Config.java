package com.zzy.htms.location;


/**
 * 存储车辆定位相关配置信息
 * @author zm
 *
 */
public class Config {

	private int interval ;
	
	private boolean debug;
	
	public int getInterval() {
		return interval;
	}

	public void setInterval(int interval) {
		this.interval = interval;
	}

	public boolean getDebug() {
		return debug;
	}

	public void setDebug(boolean debug) {
		this.debug = debug;
	}
	
	
	
}
