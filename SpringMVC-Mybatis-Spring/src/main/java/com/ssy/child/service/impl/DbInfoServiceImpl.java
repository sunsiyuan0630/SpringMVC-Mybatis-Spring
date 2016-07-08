package com.ssy.child.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.ssy.child.common.PublicFunction;
import com.ssy.child.dao.DbOperDao;
import com.ssy.child.model.GoodRest;
import com.ssy.child.model.GoodRestDetail;
import com.ssy.child.model.OutStorageResultMap;
import com.ssy.child.service.DbInfoService;
@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class DbInfoServiceImpl implements DbInfoService{

	@Autowired
	private DbOperDao db;

	@Override
	public PageInfo<OutStorageResultMap> getGoodRestPageInfo(Integer pageNum, Integer pageSize) {
		PageInfo<OutStorageResultMap> page = new PageInfo<OutStorageResultMap>(db.getPageListOfGoodRests(pageNum, pageSize));
		return page;
	}

	@Override
	public PageInfo<OutStorageResultMap> getGoodRestPageInfoWithParam(Integer pageNum,Integer pageSize, String goodName, Integer goodId) {
		PageInfo<OutStorageResultMap> page = null;
		if((!"".equals(PublicFunction.doNull(goodName)))&&(!"".equals(PublicFunction.doNull(goodId)))){
			page = new PageInfo<OutStorageResultMap>(db.getPageListOfGoodRestsWithNameAndId(pageNum, pageSize, goodName, goodId));
		}else{
			if(!"".equals(PublicFunction.doNull(goodName))){
				page = new PageInfo<OutStorageResultMap>(db.getPageListOfGoodRestsWithGoodName(pageNum, pageSize, goodName));
			}else if(!"".equals(PublicFunction.doNull(goodId))){
				page = new PageInfo<OutStorageResultMap>(db.getPageListOfGoodRestsWithGoodId(pageNum, pageSize, goodId));
			}
		}
		
		return page;
	}

	@Override
	public GoodRestDetail getSpecGoodRestWithId(Integer id) {
		
		return db.getSpecGoodRestInfoWithId(id);
	}

	@Override
	public PageInfo<Map<String, Object>> getInstoragePageInfo(Integer pageNum, Integer pageSize) {
		PageInfo<Map<String, Object>> page = new PageInfo<Map<String, Object>>(db.getPageListOfInstorage(pageNum, pageSize));
		return page;
	}
	
}
