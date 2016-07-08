package com.ssy.child.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.ssy.child.entity.GoodCatalog;
import com.ssy.child.entity.SupplierCatalog;
import com.ssy.child.model.Auth;
import com.ssy.child.model.GoodCatalogInfo;
import com.ssy.child.model.GoodRestDetail;
import com.ssy.child.model.Goods;
import com.ssy.child.model.SupplierInfo;

public interface MaintainService {

	public PageInfo<SupplierInfo> getSuppliersWithParam(Integer pageNum,Integer pageSize);
	
	public String addSupplier(SupplierInfo supplierInfo,Auth user);
	
	public String delSupplier(Integer id);
	
	public PageInfo<GoodCatalogInfo> getGoodCatalogWithParam(Integer pageNum,Integer pageSize);
	
	public String addGood(GoodCatalogInfo goodCatalogInfo,Auth user);
	
	public String delGood(Integer id);
	
	public String updateGood(GoodCatalogInfo goodCatalogInfo,Auth user);
	
	public Goods getSpecGoodWithId(Integer id);
	
	public List<SupplierCatalog> getSupplierCatalog();
	
	public List<GoodCatalog> getGoodCatalog();
	
	public List<Map<String, Object>> getGoodInfoWithId(Integer id);
	
	public List<Map<String, Object>> getGoodCodeInfo(Integer id);
	
	public List<Map<String, Object>> getPeopleInfo();
}
