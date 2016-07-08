package com.ssy.child.service.impl;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssy.child.common.PublicFunction;
import com.ssy.child.dao.InstorageDao;
import com.ssy.child.entity.InstorageForm;
import com.ssy.child.model.Auth;
import com.ssy.child.model.Goods;
import com.ssy.child.model.Instorage;
import com.ssy.child.service.InstorageService;

@Service
public class InstorageServiceImpl implements InstorageService {
	
	@Autowired
	private InstorageDao instorageDao;

	@Override
	public String setGoodInfo(InstorageForm instorageForm) {
		// TODO Auto-generated method stub
		if (instorageForm == null) {
			return "false";
		}
		if ("".equals(instorageForm.getGoodId())
				|| "".equals(instorageForm.getGoodName())
				|| "".equals(instorageForm.getNumber())
				|| "".equals(instorageForm.getPrice())
				|| "".equals(instorageForm.getDate())) {
			return "false";
		}
		//各参数正常，更新数据库
		Goods goodEntity = PublicFunction.returnGoods(instorageForm);
		int id = instorageDao.saveGood(goodEntity);
		
		Instorage instorage = PublicFunction.returnInstorage(instorageForm);
		return "true";
		
		
	}

	@SuppressWarnings("finally")
	@Override
	public String instorageGood(Integer goodId, Integer goodNumber, Float goodPrice, Integer people, Timestamp dateInput,Auth user) {
		Instorage in = new Instorage();
		in.setGoodId(goodId);
		in.setNumber(goodNumber);
		in.setPrice(goodPrice);
		if(PublicFunction.doNull(people).equals("")){
			people=1;//无名氏
		}
		in.setPeople(people);
		in.setDate(dateInput);
		in.setMaintain_people(user.getId());
		String r = "success";
		if(PublicFunction.doNull(goodId).equals("")
				||PublicFunction.doNull(goodNumber).equals("")
				||PublicFunction.doNull(goodPrice).equals("")
				||PublicFunction.doNull(dateInput).equals("")){
			return "error";
		}else{
			try {
				instorageDao.insertInstorage(in);
				instorageDao.insertGoodRest(in);
			} catch (Exception e) {
				r = "error";
			}finally{
				return r;
			}
		}
	}

}
