package com.ssy.child.dao;

import java.util.List;

import com.ssy.child.model.Goods;
import com.ssy.child.model.Instorage;


public interface InstorageDao {
	
	public Integer saveGood(Goods goodEntity);
	
	public List<Goods> selectGoodsByNameAndId(String goodName,String goodId);

	public Integer saveInstorage(Instorage instorage);	
	
	public void insertInstorage(Instorage instorage);
	
	public void insertGoodRest(Instorage instorage);
}
