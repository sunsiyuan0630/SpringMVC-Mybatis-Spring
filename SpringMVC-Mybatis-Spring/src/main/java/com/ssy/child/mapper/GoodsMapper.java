package com.ssy.child.mapper;


import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.ssy.child.model.Goods;
import com.ssy.child.mybatis.util.MyMapper;

public interface GoodsMapper extends MyMapper<Goods>{
	   List<Goods> selectAll();

	   List<Goods> selectAll(RowBounds rowBounds);
	   
	   Integer saveGood(Goods goodEntery);

	   List<Goods> selectGoodsByNameAndId(String goodName, String goodId);
}
