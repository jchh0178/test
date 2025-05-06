package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.TheaterDTO;

@Mapper
public interface TheaterMapper {

	List<TheaterDTO> list(TheaterDTO theaterDTO);

	TheaterDTO detail(String name);

	
	
}
