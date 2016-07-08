package com.ssy.child.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Table(name="tb_goodrest")
public class GoodRest {
		@Id
		@Column(name = "id")
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer id;
		private Integer goodId;

		private String goodSpeci;
		private Integer goodNumber;
		private Timestamp lastUpdateTime;
		private Integer lastUpdatePeople;
		
		
		
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public Integer getGoodId() {
			return goodId;
		}
		public void setGoodId(Integer goodId) {
			this.goodId = goodId;
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
		public Timestamp getLastUpdateTime() {
			return lastUpdateTime;
		}
		public void setLastUpdateTime(Timestamp lastUpdateTime) {
			this.lastUpdateTime = lastUpdateTime;
		}
		public Integer getLastUpdatePeople() {
			return lastUpdatePeople;
		}
		public void setLastUpdatePeople(Integer lastUpdatePeople) {
			this.lastUpdatePeople = lastUpdatePeople;
		}
		
		
		
		
}
