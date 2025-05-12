package com.itwillbs.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.PayDTO;

@Mapper
public interface PayMapper {
   
	public void insertPay(PayDTO payDTO);
	
}
