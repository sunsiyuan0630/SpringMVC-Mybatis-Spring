package com.ssy.child.mapper;

import org.apache.ibatis.annotations.Select;

import com.ssy.child.model.Auth;
import com.ssy.child.mybatis.util.MyMapper;

public interface LoginMapper extends MyMapper<Auth>{
	
	@Select("select * from tb_users u where u.username=#{username} and u.password=#{password}")
	public Auth selectUser(Auth auth);
}
