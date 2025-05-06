package com.itwillbs.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.RoomDTO;
import com.itwillbs.domain.ScreenDTO;
import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.mapper.AdminMapper;

@Service
public class AdminService {

	@Inject
	private AdminMapper adminMapper;

	// Screen (상영) 서비스 모음 -----------------------------
	
	// 상영 정보 추가
	public void insertScreen(ScreenDTO screenDTO) {
		System.out.println("AdminService insertScreen()");
		
		adminMapper.insertScreen(screenDTO);
	}
	
	// 상영 정보 전체 목록 조회
    public List<ScreenDTO> listScreen() {
    	System.out.println("AdminService listScreen()");
    	
    	return adminMapper.listScreen();
    }

	public void deleteScreen(int screen_id) {
		System.out.println("AdminService deleteScreen()");
		
		adminMapper.deleteScreen(screen_id);
	}

	// select 박스 데이터 가져오기 (영화, 극장, 상영관 리스트) 
	public List<MovieDTO> listMovie() {
		System.out.println("AdminService listMovie()");
		
		return adminMapper.listMovie();
	}

	public List<TheaterDTO> listTheater() {
		System.out.println("AdminService listTheater()");
		
		return adminMapper.listTheater();
	}

	public List<RoomDTO> listRoom() {
		System.out.println("AdminService listRoom()");
		
		return adminMapper.listRoom();
	}
    
    // Screen (상영) 서비스 모음 -----------------------------
	
	

	
	
	
	
}
