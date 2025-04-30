package com.itwillbs.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.PayDTO;
import com.itwillbs.domain.ScreenDTO;
import com.itwillbs.mapper.AdminMapper;
import com.itwillbs.mapper.PayMapper;

@Service
public class AdminService {

	@Inject
	private AdminMapper adminMapper;

	public void insertScreen(ScreenDTO screenDTO) {
		System.out.println("AdminService insertScreen()");
		
		adminMapper.insertScreen(screenDTO);
	}
	
	
	

	
	
	
	
}
