package com.ssy.child.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Table(name="tb_instorage")
public class Instorage {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int goodId;
	private int number;
	private double price;
	private Timestamp date;
	private Integer people;
	private Integer maintain_people;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getGoodId() {
		return goodId;
	}
	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
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
	public Integer getMaintain_people() {
		return maintain_people;
	}
	public void setMaintain_people(Integer maintain_people) {
		this.maintain_people = maintain_people;
	}
	
	
	
	
	
}
