package com.ssy.child.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.ssy.child.model.GoodRest;
import com.ssy.child.model.OutStorage;
import com.ssy.child.model.OutStorageResultMap;
import com.ssy.child.model.OutstorageRecord;
import com.ssy.child.mybatis.util.MyMapper;

public interface OutStorageMapper extends MyMapper<OutStorageResultMap>{
		
		public List<OutStorageResultMap> selectAllResult();
		
		public void insertOutStorage(OutStorage outStorage);
		
		public List<OutStorageResultMap> selectAllResultWithGoodName(@Param("goodName")String goodName);
		
		public List<OutStorageResultMap> selectAllResultWithGoodId(@Param("goodId")Integer goodId);
		
		public List<OutStorageResultMap> selectAllResultWithGoodNameAndGoodId(@Param("goodName") String goodName,@Param("goodId") Integer goodId);

		public List<OutstorageRecord> selectAllOutstorageRecord();





}
