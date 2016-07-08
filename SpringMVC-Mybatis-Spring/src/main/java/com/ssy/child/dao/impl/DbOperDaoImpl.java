package com.ssy.child.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.pagehelper.PageHelper;
import com.ssy.child.dao.DbOperDao;
import com.ssy.child.mapper.GoodRestMapper;
import com.ssy.child.mapper.InStorageMapper;
import com.ssy.child.mapper.OutStorageMapper;
import com.ssy.child.model.GoodRest;
import com.ssy.child.model.GoodRestDetail;
import com.ssy.child.model.OutStorageResultMap;
import com.sun.org.apache.xerces.internal.parsers.IntegratedParserConfiguration;
@Repository
public class DbOperDaoImpl  implements DbOperDao{
 
	@Autowired
	private SqlSessionFactory sqlSessionFactory;  
//	private static SqlSession sqlSession = MybatisHelper.getSqlSession();
	@Override
	public List<OutStorageResultMap> getPageListOfGoodRests(Integer pageNum,Integer pageSize) {
//		SqlSession sqlSession = MybatisHelper.getSqlSession();
		OutStorageMapper goodRest = sqlSessionFactory.openSession().getMapper(OutStorageMapper.class);

	     PageHelper.startPage(pageNum,pageSize);
	     List<OutStorageResultMap> list = goodRest.selectAllResult();
		return list;
	}

	@Override
	public List<OutStorageResultMap> getPageListOfGoodRestsWithGoodName(Integer pageNum,Integer pageSize, String goodName) {
//		SqlSession sqlSession = MybatisHelper.getSqlSession();
		OutStorageMapper goodRest = sqlSessionFactory.openSession().getMapper(OutStorageMapper.class);

	     PageHelper.startPage(pageNum,pageSize);
	     List<OutStorageResultMap> list = goodRest.selectAllResultWithGoodName(goodName);

		return list;
	}

	@Override
	public List<OutStorageResultMap> getPageListOfGoodRestsWithGoodId(Integer pageNum,Integer pageSize, Integer goodId) {
//		SqlSession sqlSession = MybatisHelper.getSqlSession();
		OutStorageMapper goodRest = sqlSessionFactory.openSession().getMapper(OutStorageMapper.class);

	     PageHelper.startPage(pageNum,pageSize);
	     List<OutStorageResultMap> list = goodRest.selectAllResultWithGoodId(goodId);
		return list;
	}

	@Override
	public List<OutStorageResultMap> getPageListOfGoodRestsWithNameAndId(Integer pageNum, Integer pageSize, String goodName, Integer goodId) {
//		SqlSession sqlSession = MybatisHelper.getSqlSession();
		OutStorageMapper goodRest = sqlSessionFactory.openSession().getMapper(OutStorageMapper.class);

		
	     PageHelper.startPage(pageNum,pageSize);
	     List<OutStorageResultMap> list = goodRest.selectAllResultWithGoodNameAndGoodId(goodName,goodId);
		return list;
	}

	@Override
	public GoodRestDetail getSpecGoodRestInfoWithId(Integer id) {
//		SqlSession sqlSession = MybatisHelper.getSqlSession();
		GoodRestMapper goodRest = sqlSessionFactory.openSession().getMapper(GoodRestMapper.class);

	    List<GoodRestDetail> list = goodRest.selectAllWithGoodRestId(id);
	    
		return list.get(0);
	}

	@Override
	public GoodRest getSpecGoodRestWithId(Integer id) {
		GoodRestMapper goodRest = sqlSessionFactory.openSession().getMapper(GoodRestMapper.class);

	    List<GoodRest> list = goodRest.selectSpecGoodRestWithId(id);
	    
		return list.get(0);
	}

	@Override
	public List<Map<String, Object>> getPageListOfInstorage(Integer pageNum, Integer pageSize) {
		InStorageMapper inStorageMapper = sqlSessionFactory.openSession().getMapper(InStorageMapper.class);
		
		PageHelper.startPage(pageNum,pageSize);
		List<Map<String,Object>> list = inStorageMapper.selectSuppliersWithParam();
		return list;
	}
	
	
}
