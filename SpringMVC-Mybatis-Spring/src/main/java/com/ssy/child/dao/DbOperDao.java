package com.ssy.child.dao;

import java.util.List;
import java.util.Map;

import com.ssy.child.model.GoodRest;
import com.ssy.child.model.GoodRestDetail;
import com.ssy.child.model.OutStorageResultMap;

public interface DbOperDao {

	public List<OutStorageResultMap> getPageListOfGoodRests(Integer pageNum,Integer pageSize);
	
	public List<OutStorageResultMap> getPageListOfGoodRestsWithGoodName(Integer pageNum,Integer pageSize,String goodName);
	
	public List<OutStorageResultMap> getPageListOfGoodRestsWithGoodId(Integer pageNum,Integer pageSize,Integer goodId);
	
	public List<OutStorageResultMap> getPageListOfGoodRestsWithNameAndId(Integer pageNum,Integer pageSize,String goodName,Integer goodId);
	
	public GoodRestDetail getSpecGoodRestInfoWithId(Integer id);
	
	public GoodRest getSpecGoodRestWithId(Integer id);
	
	public List<Map<String, Object>> getPageListOfInstorage(Integer pageNum,Integer pageSize);
}
