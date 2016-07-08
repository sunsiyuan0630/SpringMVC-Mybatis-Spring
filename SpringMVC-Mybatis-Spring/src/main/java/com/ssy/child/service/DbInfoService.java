package com.ssy.child.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.ssy.child.model.GoodRest;
import com.ssy.child.model.GoodRestDetail;
import com.ssy.child.model.OutStorageResultMap;

public interface DbInfoService {

	public PageInfo<OutStorageResultMap> getGoodRestPageInfo(Integer pageNum,Integer pageSize);
	public PageInfo<OutStorageResultMap> getGoodRestPageInfoWithParam(Integer pageNum,Integer pageSize,String goodName,Integer goodId);
	
	public GoodRestDetail getSpecGoodRestWithId(Integer id);
	
	public PageInfo<Map<String, Object>> getInstoragePageInfo(Integer pageNum,Integer pageSize);
}
