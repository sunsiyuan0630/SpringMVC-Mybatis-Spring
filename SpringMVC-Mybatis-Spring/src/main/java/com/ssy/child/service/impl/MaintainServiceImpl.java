package com.ssy.child.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.ssy.child.common.util.LikeCheckUtil;
import com.ssy.child.dao.MaintainDao;
import com.ssy.child.entity.GoodCatalog;
import com.ssy.child.entity.SupplierCatalog;
import com.ssy.child.model.Auth;
import com.ssy.child.model.GoodCatalogInfo;
import com.ssy.child.model.Goods;
import com.ssy.child.model.Supplier;
import com.ssy.child.model.SupplierInfo;
import com.ssy.child.service.MaintainService;
@Service
@Transactional(propagation=Propagation.REQUIRED,isolation=Isolation.DEFAULT)
public class MaintainServiceImpl implements MaintainService{

	@Autowired
	private MaintainDao mDAO;
	
	@Override
	public PageInfo<SupplierInfo> getSuppliersWithParam(Integer pageNum, Integer pageSize) {
		PageInfo<SupplierInfo> page = new PageInfo<SupplierInfo>(mDAO.getSuppliersWithParam(pageNum, pageSize));
		return page;
	}

	@SuppressWarnings("finally")
	@Override
	public String addSupplier(SupplierInfo supplierInfo,Auth user) {
		Supplier supplier = new Supplier();
		supplier.setName(supplierInfo.getSupplierName());
		supplier.setPeople(user.getId());
		supplier.setPhone(supplierInfo.getSupplierPhone());
		supplier.setAddress(supplierInfo.getSupplierAddress());
		supplier.setDate(new Timestamp(new Date().getTime()));
		
		String back = "success";
		try {
			mDAO.addSupplier(supplier);
		}catch(Exception e){
			back = "error";
		}finally{
			return back;
		}
		
	}

	@SuppressWarnings("finally")
	@Override
	public String delSupplier(Integer id) {
		String back = "success";
		try {
			mDAO.delSupplier(id);
		}catch(Exception e){
			back = "error";
		}finally{
			return back;
		}
	}

	@Override
	public PageInfo<GoodCatalogInfo> getGoodCatalogWithParam(Integer pageNum, Integer pageSize) {
		PageInfo<GoodCatalogInfo> page = new PageInfo<GoodCatalogInfo>(mDAO.getGoodCatalogInfo(pageNum, pageSize));
		return page;
	}

	@SuppressWarnings("finally")
	@Override
	public String addGood(GoodCatalogInfo goodCatalogInfo, Auth user) {
		Goods good = new Goods();
		good.setGoodName(goodCatalogInfo.getGoodName());
		good.setGoodId(goodCatalogInfo.getGoodCode());
		good.setGoodSpeci(goodCatalogInfo.getGoodSpeci());
		good.setGoodSupplier(goodCatalogInfo.getGoodSupplierId());
		good.setPeople(user.getId());
		good.setDate(new Timestamp(new Date().getTime()));
		String back = "success";
		try {
			mDAO.addGood(good);
		}catch(Exception e){
			back = "error";
		}finally{
			return back;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public String delGood(Integer id) {
		String back = "success";
		try {
			mDAO.delGood(id);
		}catch(Exception e){
			back = "error";
		}finally{
			return back;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public String updateGood(GoodCatalogInfo goodCatalogInfo,Auth user) {
		Goods good = new Goods();
		good.setId(goodCatalogInfo.getId());
		good.setGoodName(goodCatalogInfo.getGoodName());
		good.setGoodId(goodCatalogInfo.getGoodCode());
		good.setGoodSpeci(goodCatalogInfo.getGoodSpeci());
		good.setGoodSupplier(goodCatalogInfo.getGoodSupplierId());
		good.setPeople(user.getId());
		good.setDate(new Timestamp(new Date().getTime()));
		String back = "success";
		try {
			mDAO.updateGood(good);
		}catch(Exception e){
			back = "error";
		}finally{
			return back;
		}
	}

	@Override
	public Goods getSpecGoodWithId(Integer id) {
		return mDAO.getSpecGoodWithId(id);
	}

	@Override
	public List<SupplierCatalog> getSupplierCatalog() {
		List<SupplierInfo> suppliers = mDAO.getSupplierCatalog();
		List<SupplierCatalog> returnList = new ArrayList<>();
		for(int i=0;i<suppliers.size();i++){
			SupplierCatalog tmp = new SupplierCatalog();
			tmp.setCode(suppliers.get(i).getSupplierId());
			tmp.setName(suppliers.get(i).getSupplierName());
			tmp.setPinyin(LikeCheckUtil.getPinYin(suppliers.get(i).getSupplierName()));
			tmp.setJianpin(LikeCheckUtil.getPinYinHeadChar(suppliers.get(i).getSupplierName()));
			
			returnList.add(tmp);
		}
		return returnList;
	}

	@Override
	public List<GoodCatalog> getGoodCatalog() {
		List<GoodCatalogInfo> goods = mDAO.getGoodCatalog();
		List<GoodCatalog> returnList = new ArrayList<>();
		for(int i=0;i<goods.size();i++){
			GoodCatalog tmp = new GoodCatalog();
			tmp.setId(goods.get(i).getId());
			tmp.setName(goods.get(i).getGoodName());
			tmp.setPinyin(LikeCheckUtil.getPinYin(goods.get(i).getGoodName()));
			tmp.setJianpin(LikeCheckUtil.getPinYinHeadChar(goods.get(i).getGoodName()));
			
			returnList.add(tmp);
		}
		return returnList;
	}

	@Override
	public List<Map<String, Object>> getGoodInfoWithId(Integer id) {
		return mDAO.getGoodInfo(id);
	}

	@Override
	public List<Map<String, Object>> getGoodCodeInfo(Integer id) {
		return mDAO.getGoodCodeCatalog();
	}

	@Override
	public List<Map<String, Object>> getPeopleInfo() {
		List<Map<String, Object>> peoples = mDAO.getPeopleInfo();
		List<Map<String, Object>> returnList = new ArrayList<>();
		for(int i=0;i<peoples.size();i++){
			Map<String, Object> tmp = new HashMap<>();
			tmp.put("id", peoples.get(i).get("id"));
			tmp.put("name",peoples.get(i).get("name"));
			tmp.put("pinyin", LikeCheckUtil.getPinYin((String) peoples.get(i).get("name")));
			tmp.put("jianpin", LikeCheckUtil.getPinYinHeadChar((String) peoples.get(i).get("name")));
			
			returnList.add(tmp);
		}
		return returnList;
	}

}
