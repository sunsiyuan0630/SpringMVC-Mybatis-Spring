package com.ssy.child.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.ssy.child.common.PublicFunction;
import com.ssy.child.dao.DbOperDao;
import com.ssy.child.dao.OutStorageDao;
import com.ssy.child.entity.OutStorageForm;
import com.ssy.child.model.GoodRest;
import com.ssy.child.model.GoodRestDetail;
import com.ssy.child.model.OutStorage;
import com.ssy.child.model.OutStorageResultMap;
import com.ssy.child.model.OutstorageRecord;
import com.ssy.child.service.OutStorageService;
@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class OutStorageServiceImpl implements OutStorageService{
	@Autowired
	private OutStorageDao outStorageDao;
	@Autowired
	private DbOperDao db;
	
	private OutStorage outStorage;
	@SuppressWarnings("finally")
	public String OutputGoods(OutStorageForm outStorageForm) {
		String back = "success";
		outStorage = new OutStorage();
		outStorage.setGoodId(outStorageForm.getGoodId());
		outStorage.setNumber(outStorageForm.getNumber());
		outStorage.setSellPrice(outStorageForm.getSellPrice());
		outStorage.setDate(outStorageForm.getDate());
		outStorage.setPeople(outStorageForm.getPeople());
		outStorage.setDesc(outStorageForm.getDesc());
		try {
			GoodRest goodRest = db.getSpecGoodRestWithId(outStorageForm.getGoodrestId());
			int afterOut = goodRest.getGoodNumber()-outStorageForm.getNumber();
			if(afterOut>=0){
				outStorageDao.outputGoods(outStorageForm.getGoodrestId(), afterOut,goodRest);
				outStorageDao.insertOutStorage(outStorage);
			}
			else back = "tooMany";
		} catch (Exception e) {
			back = "error";
		}finally {
			return back;
		}
		
	}
	@Override
	public PageInfo<OutstorageRecord> getOutstorageRecord(Integer pageNum, Integer pageSize) {
		PageInfo<OutstorageRecord> page = new PageInfo<OutstorageRecord>(outStorageDao.getOutstorageRecord(pageNum, pageSize));
		return page;
	}

}
