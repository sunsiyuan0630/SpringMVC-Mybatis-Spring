package com.ssy.child.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.pagehelper.PageHelper;
import com.ssy.child.dao.MaintainDao;
import com.ssy.child.entity.SupplierCatalog;
import com.ssy.child.mapper.GoodRestMapper;
import com.ssy.child.mapper.MaintainMapper;
import com.ssy.child.model.GoodCatalogInfo;
import com.ssy.child.model.GoodRestDetail;
import com.ssy.child.model.Goods;
import com.ssy.child.model.Supplier;
import com.ssy.child.model.SupplierInfo;
@Repository
public class MaintainDaoImpl implements MaintainDao{
	@Autowired
	private SqlSessionFactory sqlSessionFactory; 
	@Override
	public List<SupplierInfo> getSuppliersWithParam(Integer pageNum, Integer pageSize) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		 List<SupplierInfo> list = null;
		try {
			MaintainMapper maintainMapper = sqlSession.getMapper(MaintainMapper.class);
			PageHelper.startPage(pageNum,pageSize);
			list = maintainMapper.selectSuppliersWithParam();
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			sqlSession.close();
		}
		return list;
	}
	@Override
	public void addSupplier(Supplier supplier) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			MaintainMapper maintainMapper = sqlSession.getMapper(MaintainMapper.class);
			maintainMapper.insertSupplier(supplier);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	@Override
	public void delSupplier(Integer id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			MaintainMapper maintainMapper = sqlSession.getMapper(MaintainMapper.class);
			maintainMapper.deleteSupplier(id);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	@Override
	public List<GoodCatalogInfo> getGoodCatalogInfo(Integer pageNum, Integer pageSize) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		 List<GoodCatalogInfo> list = null;
		try {
			MaintainMapper maintainMapper = sqlSession.getMapper(MaintainMapper.class);
			PageHelper.startPage(pageNum,pageSize);
			list = maintainMapper.selectGoodCatalogWithParam();
		} catch (Exception e) {
			System.out.println(e);
		}finally {
			sqlSession.close();
		}
		return list;
	}
	@Override
	public void addGood(Goods goods) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			MaintainMapper maintainMapper = sqlSession.getMapper(MaintainMapper.class);
			maintainMapper.insertGood(goods);
			sqlSession.commit();
		} catch(Exception e){
			System.out.println(e);
		}
		finally {
			sqlSession.close();
		}
	}
	@Override
	public void delGood(Integer id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			MaintainMapper maintainMapper = sqlSession.getMapper(MaintainMapper.class);
			maintainMapper.deleteGood(id);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	@Override
	public void updateGood(Goods goods) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			MaintainMapper maintainMapper = sqlSession.getMapper(MaintainMapper.class);
			maintainMapper.updateGood(goods);
			sqlSession.commit();
		} catch(Exception e){
			System.out.println(e);
		}finally {
			sqlSession.close();
		}
	}
	@Override
	public Goods getSpecGoodWithId(Integer id) {
		MaintainMapper maintainMapper = sqlSessionFactory.openSession().getMapper(MaintainMapper.class);

	    List<Goods> list = maintainMapper.selectSpecGoodWithId(id);
	    
		return list.get(0);
	}
	@Override
	public List<SupplierInfo> getSupplierCatalog() {
		MaintainMapper maintainMapper = sqlSessionFactory.openSession().getMapper(MaintainMapper.class);
		
		List<SupplierInfo> list  = maintainMapper.selectAllSupplier();
		return list;
	}
	@Override
	public List<GoodCatalogInfo> getGoodCatalog() {
		MaintainMapper maintainMapper = sqlSessionFactory.openSession().getMapper(MaintainMapper.class);
		
		List<GoodCatalogInfo> list  = maintainMapper.selectAllGood();
		return list;
	}
	@Override
	public List<Map<String, Object>> getGoodInfo(Integer id) {
		MaintainMapper maintainMapper = sqlSessionFactory.openSession().getMapper(MaintainMapper.class);
		
		List<Map<String, Object>> list  = maintainMapper.selectGoodById(id);
		
		return list;
	}
	@Override
	public List<Map<String, Object>> getGoodCodeCatalog() {
		MaintainMapper maintainMapper = sqlSessionFactory.openSession().getMapper(MaintainMapper.class);
		
		List<Map<String, Object>> list  = maintainMapper.selectAllGoodCode();
		return list;
	}
	@Override
	public List<Map<String, Object>> getPeopleInfo() {
		MaintainMapper maintainMapper = sqlSessionFactory.openSession().getMapper(MaintainMapper.class);
		
		List<Map<String, Object>> list  = maintainMapper.selectAllPeople();
		return list;	
	}

}
