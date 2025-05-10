package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.mapper.TheaterMapper;

@Service
public class TheaterService {

	@Inject
	private TheaterMapper theaterMapper;
	
	
	public TheaterDTO detail(TheaterDTO theateDTO) {
		System.out.println("TheaterService detail()");
		
		return theaterMapper.detail(theateDTO);
	}


	public List<TheaterDTO> list() {
		System.out.println("TheaterService list()");
		
		return theaterMapper.list();
	}


	public List<TheaterDTO> list2() {
		System.out.println("TheaterService list2()");

		return theaterMapper.list2();
	}


	public TheaterDTO detail2(TheaterDTO theaterDTO) {
		System.out.println("TheaterService detail2()");

		
		return theaterMapper.detail2(theaterDTO);
	}


	public List<TheaterDTO> list3(String region) {
		System.out.println("TheaterService list3()");

		
		
		return theaterMapper.list3(region);
	}



	
	
	
	

}
