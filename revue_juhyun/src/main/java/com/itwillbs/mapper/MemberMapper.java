package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.MemberDTO;

@Mapper
public interface MemberMapper {

	//추상메서드
	public void insertMember(MemberDTO memberDTO);

	public MemberDTO loginMember(MemberDTO memberDTO);

	public MemberDTO infoMember(String id);

	public void updateMember(MemberDTO memberDTO);

	public List<MemberDTO> listMember();
		
	
	
}//인터페이스
