package com.itwillbs.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.LoginDTO;

@Mapper
public interface LoginMapper {

	public LoginDTO login(LoginDTO loginDTO);

	public void register(LoginDTO loginDTO);

	public int isExist(String member_id);

	public LoginDTO getMember(String id);
	
	public LoginDTO getMember(String id);

	

}
