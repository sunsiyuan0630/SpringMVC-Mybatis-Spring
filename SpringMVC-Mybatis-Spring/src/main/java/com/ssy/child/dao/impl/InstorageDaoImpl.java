package com.ssy.child.dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssy.child.dao.InstorageDao;
import com.ssy.child.mapper.GoodRestMapper;
import com.ssy.child.mapper.GoodsMapper;
import com.ssy.child.mapper.InStorageMapper;
import com.ssy.child.model.GoodRest;
import com.ssy.child.model.Goods;
import com.ssy.child.model.Instorage;
import com.ssy.child.mybatishelper.MybatisHelper;

@Repository
public class InstorageDaoImpl implements InstorageDao {
	@Autowired
	private SqlSessionFactory sqlSessionFactory; 
	
	@Override
	public Integer saveGood(Goods goodEntity){
		//商品入库，返回主键
		SqlSession sqlSession = MybatisHelper.getSqlSession();
		int id = 0;
		try{
			GoodsMapper goodMapper = sqlSession.getMapper(GoodsMapper.class);
			goodMapper.saveGood(goodEntity);
			sqlSession.commit();
		}finally{
			sqlSession.close();
		}
		id = goodEntity.getId();
		return id;
	
	}

	@Override
	public Integer saveInstorage(Instorage instorage) {
		return 0;
	}

	@Override
	public List<Goods> selectGoodsByNameAndId(String goodName, String goodId) {
		SqlSession sqlSession = MybatisHelper.getSqlSession();
		List<Goods> listGoods = null;
		try{
			GoodsMapper goodMapper = sqlSession.getMapper(GoodsMapper.class);
			listGoods = goodMapper.selectGoodsByNameAndId(goodName,goodId);
		}finally{
			sqlSession.close();
		}
		return listGoods;
		
	}

	@Override
	public void insertInstorage(Instorage instorage) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		InStorageMapper inStorageMapper = sqlSession.getMapper(InStorageMapper.class);
		
		try {
			inStorageMapper.insertIntoStorage(instorage);
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println(e);
		}finally{
			sqlSession.close();
		}
	}

	@Override
	public void insertGoodRest(Instorage instorage) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		GoodRestMapper goodRestMapper = sqlSession.getMapper(GoodRestMapper.class);
		try {
			GoodRest goodRest = goodRestMapper.selectGoodRestWithGoodId(instorage.getGoodId());
			int before = goodRest.getGoodNumber();
			int after = before + instorage.getNumber();
			goodRest.setGoodNumber(after);
			goodRestMapper.outGoodWithGoodRestId(goodRest);
			sqlSession.commit();
		} catch (Exception e) {
			System.out.println(e);
		}
		finally{
			sqlSession.close();
		}
	}

}
