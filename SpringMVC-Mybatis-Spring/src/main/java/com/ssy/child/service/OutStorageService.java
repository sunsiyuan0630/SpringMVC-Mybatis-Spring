package com.ssy.child.service;

import com.github.pagehelper.PageInfo;
import com.ssy.child.entity.OutStorageForm;
import com.ssy.child.model.OutstorageRecord;

public interface OutStorageService {
	
	public String OutputGoods(OutStorageForm outStorageForm);
	
	public PageInfo<OutstorageRecord> getOutstorageRecord(Integer pageNum,Integer pageSize);
}
