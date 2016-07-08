package com.ssy.child.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.ssy.child.entity.SupplierCatalog;
import com.ssy.child.model.GoodCatalogInfo;
import com.ssy.child.model.GoodRest;
import com.ssy.child.model.Goods;
import com.ssy.child.model.OutStorage;
import com.ssy.child.model.OutStorageResultMap;
import com.ssy.child.model.OutstorageRecord;
import com.ssy.child.model.Supplier;
import com.ssy.child.model.SupplierInfo;
import com.ssy.child.mybatis.util.MyMapper;

public interface MaintainMapper extends MyMapper<GoodCatalogInfo>{
		
		
		@Select("select s.id as supplierId,s.name as supplierName,s.address as supplierAddress,s.phone as supplierPhone,u.name as people,s.date as lastUpdateTime from tb_supplierinfo s left join tb_users u on s.people = u.id order by s.date desc")
		public List<SupplierInfo> selectSuppliersWithParam();

		@Insert("insert into tb_supplierinfo (name,address,phone,people,date) values (#{name},#{address},#{phone},#{people},#{date})")
		public void insertSupplier(Supplier supplier);

		@Delete("delete from tb_supplierinfo where id = #{id}")
		public void deleteSupplier(Integer id);
		
		@Select("select g.id as id,g.goodName as goodName,g.goodId as goodCode,g.goodSpeci as goodSpeci,s.name as goodSupplier,u.name as people,g.date as date "
				+ "from tb_goods g "
				+ "left join tb_supplierinfo s on g.goodSupplier = s.id "
				+ "left join tb_users u on g.people = u.id "
				+ "order by g.date desc")
		public List<GoodCatalogInfo> selectGoodCatalogWithParam();
		
		@Insert("insert into tb_goods (goodName,goodId,goodSpeci,goodSupplier,people,date) values(#{goodName},#{goodId},#{goodSpeci},#{goodSupplier},#{people},#{date})")
		public void insertGood(Goods goods);
		
		@Delete("delete from tb_goods where id = #{id}")
		public void deleteGood(Integer id);
		
		@Update("update tb_goods set goodName = #{goodName},goodId = #{goodId},goodSpeci = #{goodSpeci},goodSupplier = #{goodSupplier} where id = #{id}")
		public void updateGood(Goods goods);
		
		@Select("select * from tb_goods where id = #{id}")
		public List<Goods> selectSpecGoodWithId(Integer id);
		
		@Select("select t.id as supplierId,t.name as supplierName from tb_supplierinfo t")
		public List<SupplierInfo> selectAllSupplier();
		
		@Select("select t.id as id,t.goodName as goodName from tb_goods t")
		public List<GoodCatalogInfo> selectAllGood();
		
		@Select("select g.goodName as goodName,g.goodId as goodCode,s.name as supplierName,g.goodSpeci as goodSpeci,g.goodSupplier as supplierCode from tb_goods g left join tb_supplierInfo s on s.id = g.goodSupplier where g.id = #{id}")
		public List<Map<String, Object>> selectGoodById(Integer id);
		
		@Select("select g.id as id,g.goodId as goodCode from tb_goods g")
		public List<Map<String, Object>> selectAllGoodCode();
		
		@Select("select u.id as id,u.name as name from tb_users u")
		public List<Map<String, Object>> selectAllPeople();
}
