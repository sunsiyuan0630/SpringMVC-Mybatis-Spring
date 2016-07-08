package com.ssy.child.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.ssy.child.model.GoodRest;
import com.ssy.child.model.GoodRestDetail;
import com.ssy.child.mybatis.util.MyMapper;

public interface GoodRestMapper extends MyMapper<GoodRest>{
		public List<GoodRest> selectAll();

		public List<GoodRest> selectAll(RowBounds rowBounds);
		
		public List<GoodRest> selectAllWithGoodName(String goodName);
		
		public List<GoodRest> selectAllWithGoodId(Integer goodId);
		
		
		
		public List<GoodRestDetail> selectAllWithGoodRestId(Integer id);
		
		@Update("update tb_goodrest set goodNumber = #{goodNumber} where id = #{id}")
		public void outGoodWithGoodRestId(GoodRest goodRest);

		public List<GoodRest> selectSpecGoodRestWithId(Integer id);
		
		@Select("select * from tb_goodrest g where g.goodId=#{id}")
		public GoodRest selectGoodRestWithGoodId(Integer id);
}
