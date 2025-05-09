package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.TheaterDTO;

@Mapper
public interface TheaterMapper {

	TheaterDTO detail(TheaterDTO theateDTO);

	List<TheaterDTO> list();
	
	List<TheaterDTO> list2();

	TheaterDTO detail2(TheaterDTO theaterDTO);

	List<TheaterDTO> list3(TheaterDTO theaterDTO);


}
