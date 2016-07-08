package com.ssy.child.service;

import java.sql.Timestamp;

import com.ssy.child.entity.InstorageForm;
import com.ssy.child.model.Auth;

public interface InstorageService {

	/*public PageInfo<Goods> setGoodInfo(String goodName, Integer goodId,
			String goodSupplier, double price, String goodSpeci, int number,
			String people, Timestamp date);*/
	
	public String setGoodInfo(InstorageForm instorage);

	public String instorageGood(Integer goodId,Integer goodNumber,Float goodPrice,Integer people,Timestamp dateInput,Auth user);
}
