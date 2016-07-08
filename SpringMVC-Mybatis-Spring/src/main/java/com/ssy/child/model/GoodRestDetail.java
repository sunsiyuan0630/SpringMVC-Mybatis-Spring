package com.ssy.child.model;

public class GoodRestDetail {

	private String id;
	private String goodId;
	private String goodCode;//商品编码
	private String name;
	private String goodSpeci;
	private Integer goodNumber;
	
	
	public String getGoodCode() {
		return goodCode;
	}
	public void setGoodCode(String goodCode) {
		this.goodCode = goodCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGoodSpeci() {
		return goodSpeci;
	}
	public void setGoodSpeci(String goodSpeci) {
		this.goodSpeci = goodSpeci;
	}
	public Integer getGoodNumber() {
		return goodNumber;
	}
	public void setGoodNumber(Integer goodNumber) {
		this.goodNumber = goodNumber;
	}
	
}
