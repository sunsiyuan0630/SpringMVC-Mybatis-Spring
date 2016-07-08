package com.ssy.child.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="tb_goods")
public class Goods { 
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String goodName;
	private String goodId;
	private String goodSpeci;
	private Integer goodSupplier;
	private Integer people;
	private Timestamp date;
	//private String goodMemo;
	
	
	
	
	
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
	public String getGoodSpeci() {
		return goodSpeci;
	}
	public void setGoodSpeci(String goodSpeci) {
		this.goodSpeci = goodSpeci;
	}
	public Integer getGoodSupplier() {
		return goodSupplier;
	}
	public void setGoodSupplier(Integer goodSupplier) {
		this.goodSupplier = goodSupplier;
	}
	public Integer getPeople() {
		return people;
	}
	public void setPeople(Integer people) {
		this.people = people;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
	
	
}
