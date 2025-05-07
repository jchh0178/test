package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.LoginDTO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.PayDTO;
import com.itwillbs.domain.RoomDTO;
import com.itwillbs.domain.ScreenDTO;
import com.itwillbs.domain.TheaterDTO;

@Mapper
public interface MypageMapper {

	public List<PayDTO> listMybooking(String id);

	public void updateProfile(LoginDTO loginDTO);

	public String checkPass(String member_id);

	public void updatePass(LoginDTO loginDTO);


	
   
	
}
