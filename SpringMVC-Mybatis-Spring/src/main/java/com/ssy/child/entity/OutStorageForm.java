package com.ssy.child.entity;

import java.sql.Timestamp;

public class OutStorageForm {

	private Integer goodrestId;
	private Integer goodId;
	private Integer number;
	private double sellPrice;
	private Timestamp date;
	private Integer people;
	private String desc;
	

	public Integer getGoodrestId() {
		return goodrestId;
	}
	public void setGoodrestId(Integer goodrestId) {
		this.goodrestId = goodrestId;
	}
	public Integer getGoodId() {
		return goodId;
	}
	public void setGoodId(Integer goodId) {
		this.goodId = goodId;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public double getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(double sellPrice) {
		this.sellPrice = sellPrice;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public Integer getPeople() {
		return people;
	}
	public void setPeople(Integer people) {
		this.people = people;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
	
	
	
}
