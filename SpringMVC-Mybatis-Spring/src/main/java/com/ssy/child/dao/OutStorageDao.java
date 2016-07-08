package com.ssy.child.dao;

import java.util.List;

import com.ssy.child.model.GoodRest;
import com.ssy.child.model.OutStorage;
import com.ssy.child.model.OutstorageRecord;


public interface OutStorageDao {

	public void outputGoods(Integer id,Integer number,GoodRest goodRest);

	public void insertOutStorage(OutStorage outStorage);
	
	public List<OutstorageRecord> getOutstorageRecord(Integer pageNum,Integer pageSize);
}
