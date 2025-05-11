package com.itwillbs.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.LoginDTO;
import com.itwillbs.domain.MovieDTO2;
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

	
	 public List<PayDTO> listbooking(String member_id) {
		 
        return mypageMapper.listbooking(member_id);
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


	public void updateGenre(LoginDTO loginDTO) {
		
		mypageMapper.updateGenre(loginDTO);
	}
	
	public List<String> getDistinctGenres() {
	    return mypageMapper.getDistinctGenres();
	}




	
	
	
	
}
