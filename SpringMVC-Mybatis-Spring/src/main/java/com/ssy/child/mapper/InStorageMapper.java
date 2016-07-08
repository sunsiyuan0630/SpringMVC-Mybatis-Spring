package com.ssy.child.mapper;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.ssy.child.model.GoodCatalogInfo;
import com.ssy.child.model.Instorage;
import com.ssy.child.mybatis.util.MyMapper;

public interface InStorageMapper extends MyMapper<GoodCatalogInfo> {
	
	@Select("select g.goodName as goodName,g.goodId as goodCode,s.name as supplierName,i.price as price,g.goodSpeci as goodSpeci,i.number as number,"
			+ "i.date as date,u.name as people "
			+ " from tb_instorage i "
			+ " left join tb_goods g  on g.id = i.goodId "
			+ " left join tb_supplierinfo s on s.id = g.goodSupplier"
			+ " left join tb_users u on u.id = i.people"
			+ " order by i.date desc")
	public List<Map<String, Object>> selectSuppliersWithParam();
	
	@Insert("insert into tb_instorage(goodId,number,price,date,people,maintain_people) "
			+ "values(#{goodId},#{number},#{price},#{date},#{people},#{maintain_people})")
	public void insertIntoStorage(Instorage instorage);
}
