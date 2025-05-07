package com.itwillbs.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.LoginDTO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.PayDTO;
import com.itwillbs.domain.RoomDTO;
import com.itwillbs.domain.ScreenDTO;
import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.mapper.AdminMapper;
import com.itwillbs.mapper.MypageMapper;

@Service
public class MypageService {

	@Inject
	private MypageMapper mypageMapper;

	
	 public List<PayDTO> listMybooking(String id) {
		 
        return mypageMapper.listMybooking(id);
    }


	public void updateProfile(LoginDTO loginDTO) {

		mypageMapper.updateProfile(loginDTO);
	}


	public String checkPass(String member_id) {

		return mypageMapper.checkPass(member_id);
	}


	public void updatePass(LoginDTO loginDTO) {
		
		mypageMapper.updatePass(loginDTO);
		
	}




	
	
	
	
}
