package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.LoginDTO;
import com.itwillbs.domain.PayDTO;

@Mapper
public interface MypageMapper {

	public List<PayDTO> listbooking(String member_id);

	public void updateProfile(LoginDTO loginDTO);

	public String checkPass(String member_id);

	public void updatePass(LoginDTO loginDTO);

	public void updateGenre(LoginDTO loginDTO);

	public List<String> getDistinctGenres();


	
   
	
}
