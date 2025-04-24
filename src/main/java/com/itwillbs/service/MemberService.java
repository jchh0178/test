package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.mapper.MemberMapper;

@Service
public class MemberService {
	
//	MemberMapper 객체생성
	@Inject
	private MemberMapper memberMapper;

	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberService insertMember()");
//		패키지 com.itwillbs.mapper 파일이름 MemberMapper 인터페이스
		memberDTO.setRdate(new Timestamp(System.currentTimeMillis()));
		if(memberDTO.getAgree() == null) {
			memberDTO.setAgree("disagree");
		}
		
		memberMapper.insertMember(memberDTO);
	}//insertMember()

	public MemberDTO loginMember(MemberDTO memberDTO) {
		System.out.println("MemberService loginMember()");
		
		return memberMapper.loginMember(memberDTO);
	}//loginMember()

	public MemberDTO infoMember(String id) {
		System.out.println("MemberService infoMember()");
		
		return memberMapper.infoMember(id);
	}//infoMember()

	public void updateMember(MemberDTO memberDTO) {
		System.out.println("MemberService infoMember()");
		
		memberMapper.updateMember(memberDTO);
	}

	public List<MemberDTO> listMember() {
		System.out.println("MemberService listMember()");
		
		return memberMapper.listMember();
	}

}//클래스
