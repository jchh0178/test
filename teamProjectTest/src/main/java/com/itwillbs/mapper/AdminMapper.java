package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.RoomDTO;
import com.itwillbs.domain.ScreenDTO;
import com.itwillbs.domain.TheaterDTO;

@Mapper
public interface AdminMapper {

	public void insertScreen(ScreenDTO screenDTO);

	public List<ScreenDTO> listScreen();

	public void deleteScreen(int screen_id);

	public List<MovieDTO> listMovie();

	public List<TheaterDTO> listTheater();

	public List<RoomDTO> listRoom();
   
	
}
