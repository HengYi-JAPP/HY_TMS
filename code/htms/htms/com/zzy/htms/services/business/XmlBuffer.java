package com.zzy.htms.services.business;

public class XmlBuffer {
	private StringBuffer xmlBuffer = new StringBuffer();
	public XmlBuffer rootStart(){
		xmlBuffer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		xmlBuffer.append("<root>"); 
		return this;
	}
	public XmlBuffer newLine(){
		xmlBuffer.append("\n");
		return this;
	}
	public XmlBuffer tab(){
		xmlBuffer.append("\t");
		return this;
	}
	public XmlBuffer tab(int count){
		for(int i=0;i<count;i++)
		xmlBuffer.append("\t");
		return this;
	}
	public void rootEnd(){
		xmlBuffer.append("</root>");
	}

	public XmlBuffer start(String name){
		xmlBuffer.append("<").append(name).append(">"); 
		return this;
	}
	public XmlBuffer end(String name){
		xmlBuffer.append("</").append(name).append(">"); 
		return this;
	}
	
	
	public XmlBuffer open(String name){
		xmlBuffer.append("<").append(name).append(" "); 
		return this;
	}
	
	public XmlBuffer attr(String name,String value){
		xmlBuffer.append(name).append("=\"").append(value).append("\" "); 
		return this;
	}
	
	public XmlBuffer close(){
		xmlBuffer.append(">"); 
		return this;
	}
	public XmlBuffer endClose(){
		xmlBuffer.append("/>"); 
		return this;
	}
	
	public XmlBuffer append(String value){
		xmlBuffer.append(value); 
		return this;
	}
	public XmlBuffer element(String name,String value){
		xmlBuffer.append("<").append(name).append(">").append(value).append("</").append(name).append(">"); 
		return this;
	}
	public XmlBuffer elementCdata(String name,String value){
		xmlBuffer.append("<").append(name).append("><![CDATA[").append(value).append("]]></").append(name).append(">"); 
		return this;
	}
	public XmlBuffer elementValue(String value){
		xmlBuffer.append(value); 
		return this;
	}
	public XmlBuffer elementCdataValue(String value){
		xmlBuffer.append("<![CDATA[").append(value).append("]]>"); 
		return this;
	}
	
	public String toString() {
		return xmlBuffer.toString();
	    }
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
