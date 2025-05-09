package com.itwillbs.service;


import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.BoothDTO;
import com.itwillbs.domain.ScreenDTO;
import com.itwillbs.mapper.BoothMapper;

@Service
public class BoothService {

	@Inject
	private BoothMapper boothMapper;

	public int insertBooth(String member_id, int screen_id, String seatName) {
        BoothDTO boothDTO = new BoothDTO();
        boothDTO.setMember_id(member_id);
        boothDTO.setScreen_id(screen_id);
        boothDTO.setSeat_name(seatName);
        boothDTO.setBooth_date(new Timestamp(System.currentTimeMillis()));
        boothDTO.setBooth_status("예약완료");

        boothMapper.insertBooth(boothDTO);
        return boothDTO.getBooth_id(); // 자동 증가된 booth_id 반환
    }

	public List<ScreenDTO> listScreen(String screen_date) {
		
		return boothMapper.listScreen(screen_date);
	}
	
	

	
	
	
	
}
