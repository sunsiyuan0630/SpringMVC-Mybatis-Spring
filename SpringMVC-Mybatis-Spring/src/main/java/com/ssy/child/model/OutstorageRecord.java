package com.ssy.child.model;

import java.sql.Timestamp;

public class OutstorageRecord {

	private String goodName;
	private String goodCode;
	private String goodSupplier;
	private String goodSpeci;
	private double sellPrice;
	private Integer number;
	private Timestamp date;
	private String people;
	
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
	public String getGoodSupplier() {
		return goodSupplier;
	}
	public void setGoodSupplier(String goodSupplier) {
		this.goodSupplier = goodSupplier;
	}
	public String getGoodSpeci() {
		return goodSpeci;
	}
	public void setGoodSpeci(String goodSpeci) {
		this.goodSpeci = goodSpeci;
	}
	public double getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(double sellPrice) {
		this.sellPrice = sellPrice;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	
	
}
