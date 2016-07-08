package com.ssy.child.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.pagehelper.PageHelper;
import com.ssy.child.dao.OutStorageDao;
import com.ssy.child.mapper.GoodRestMapper;
import com.ssy.child.mapper.OutStorageMapper;
import com.ssy.child.model.GoodRest;
import com.ssy.child.model.GoodRestDetail;
import com.ssy.child.model.OutStorage;
import com.ssy.child.model.OutStorageResultMap;
import com.ssy.child.model.OutstorageRecord;
@Repository
public class OutStorageDaoImpl implements OutStorageDao{
	@Autowired
	private SqlSessionFactory sqlSessionFactory; 
	
	@Override
	public void outputGoods(Integer id, Integer number,GoodRest goodRest) {

		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			GoodRestMapper good = sqlSession.getMapper(GoodRestMapper.class);
			goodRest.setGoodNumber(number);
			good.outGoodWithGoodRestId(goodRest);
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			sqlSession.close();
		}
	}

	@Override
	public void insertOutStorage(OutStorage outStorage) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			OutStorageMapper outStorageMapper = sqlSession.getMapper(OutStorageMapper.class);
			outStorageMapper.insertOutStorage(outStorage);
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			sqlSession.close();
		}
	}

	@Override
	public List<OutstorageRecord> getOutstorageRecord(Integer pageNum, Integer pageSize) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		 List<OutstorageRecord> list = null;
		try {
			OutStorageMapper outStorageMapper = sqlSession.getMapper(OutStorageMapper.class);
			PageHelper.startPage(pageNum,pageSize);
			list = outStorageMapper.selectAllOutstorageRecord();
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			sqlSession.close();
		}
		return list;
	}

	
}
