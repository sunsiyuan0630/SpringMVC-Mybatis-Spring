package com.ssy.child.dao;

import java.util.List;
import java.util.Map;

import com.ssy.child.model.GoodCatalogInfo;
import com.ssy.child.model.Goods;
import com.ssy.child.model.Supplier;
import com.ssy.child.model.SupplierInfo;

public interface MaintainDao {

	public List<SupplierInfo> getSuppliersWithParam(Integer pageNum, Integer pageSize);
	
	public void addSupplier(Supplier supplier);
	
	public void delSupplier(Integer id);
	
	public List<GoodCatalogInfo> getGoodCatalogInfo(Integer pageNum,Integer pageSize);
	
	public void addGood(Goods goods);
	
	public void delGood(Integer id);
	
	public void updateGood(Goods goods);
	
	public Goods getSpecGoodWithId(Integer id);
	
	public List<SupplierInfo> getSupplierCatalog();
	
	public List<GoodCatalogInfo> getGoodCatalog();
	
	public List<Map<String, Object>> getGoodCodeCatalog();
	
	public List<Map<String, Object>> getGoodInfo(Integer id);
	
	public List<Map<String, Object>> getPeopleInfo();
}
