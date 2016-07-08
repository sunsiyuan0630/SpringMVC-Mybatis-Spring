package com.ssy.child.model;

import java.sql.Timestamp;

public class OutStorageResultMap {

	private Integer id;
	private String goodName;
	private String goodId;
	private String goodSupplier;
	private Integer goodNumber;
	private Timestamp lastUpdateTime;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getGoodSupplier() {
		return goodSupplier;
	}
	public void setGoodSupplier(String goodSupplier) {
		this.goodSupplier = goodSupplier;
	}
	public Integer getGoodNumber() {
		return goodNumber;
	}
	public void setGoodNumber(Integer goodNumber) {
		this.goodNumber = goodNumber;
	}
	public Timestamp getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Timestamp lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	
	
	
}
