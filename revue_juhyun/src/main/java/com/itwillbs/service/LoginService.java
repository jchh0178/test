package com.itwillbs.service;

import java.sql.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.LoginDTO;
import com.itwillbs.mapper.LoginMapper;

@Service
public class LoginService {

	@Inject
	private LoginMapper loginMapper;
	
	public LoginDTO login(LoginDTO loginDTO) {
		System.out.println("LoginService Login()");
		
		
		return loginMapper.login(loginDTO);
	}

	public void register(LoginDTO loginDTO) {
		System.out.println("LoginService register()");
		
		loginDTO.setMember_date(new Date(System.currentTimeMillis()));

		loginMapper.register(loginDTO);
		
	}
	
	public boolean isExist(String member_id) {
	    return loginMapper.isExist(member_id) > 0;
	}

	
	
	
	
}
