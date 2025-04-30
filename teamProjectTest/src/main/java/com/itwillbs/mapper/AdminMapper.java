package com.itwillbs.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.ScreenDTO;

@Mapper
public interface AdminMapper {

	public void insertScreen(ScreenDTO screenDTO);
   
	
}
