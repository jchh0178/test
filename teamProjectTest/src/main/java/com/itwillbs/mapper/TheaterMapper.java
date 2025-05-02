package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.TheaterDTO;

@Mapper
public class TheaterMapper {


	public interface Theater1Mapper {
	    List<TheaterDTO> getTheaterList(); // 극장 목록 가져오기
	}
	
}
