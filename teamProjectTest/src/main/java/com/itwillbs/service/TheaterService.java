package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.google.inject.Inject;
import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.mapper.TheaterMapper;

@Service
public class TheaterService {

	@Inject
	private TheaterMapper theaterMapper;
	
	
	public TheaterDTO detail(String name) {
		System.out.println("TheaterService detail()");
		
		return theaterMapper.detail(name);
	}


	public List<TheaterDTO> list(TheaterDTO theaterDTO) {
		
		
		return theaterMapper.list(theaterDTO);
	}

	
	
	
	

}
