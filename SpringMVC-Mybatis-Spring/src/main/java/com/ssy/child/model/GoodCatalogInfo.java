package com.ssy.child.model;

import java.sql.Timestamp;

public class GoodCatalogInfo {

	private Integer id;
	private String goodName;
	private String goodCode;
	private String goodSpeci;
	private String goodSupplier;
	private Integer goodSupplierId;
	private String people;
	private Timestamp date;
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
	public String getGoodCode() {
		return goodCode;
	}
	public void setGoodCode(String goodCode) {
		this.goodCode = goodCode;
	}
	public String getGoodSpeci() {
		return goodSpeci;
	}
	public void setGoodSpeci(String goodSpeci) {
		this.goodSpeci = goodSpeci;
	}
	public String getGoodSupplier() {
		return goodSupplier;
	}
	public void setGoodSupplier(String goodSupplier) {
		this.goodSupplier = goodSupplier;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public Integer getGoodSupplierId() {
		return goodSupplierId;
	}
	public void setGoodSupplierId(Integer goodSupplierId) {
		this.goodSupplierId = goodSupplierId;
	}
	
	
}
