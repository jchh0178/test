package com.itwillbs.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.PayDTO;
import com.itwillbs.mapper.PayMapper;

@Service
public class PayService {

	@Inject
	private PayMapper payMapper;
	
	public void insertPay(PayDTO payDTO) {
        payMapper.insertPay(payDTO);
    }
	

	
	
	
	
}
