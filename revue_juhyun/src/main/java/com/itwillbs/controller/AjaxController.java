package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;
import com.itwillbs.service.MemberService;

//@ResponseBody  대신에
@RestController
public class AjaxController {
	
	//MemberService 객체 생성
	@Inject
	private MemberService memberService;
	@Inject
	private BoardService boardService;
	

	//아이디 중복체크(ajax 통신)
	@GetMapping("/member/idCheck")
	public String idCheck(HttpServletRequest request) {
		System.out.println("AjaxController idCheck()");
		String id = request.getParameter("id");
	
		MemberDTO memberDTO = memberService.infoMember(id);
		
		String result = "";
		if(memberDTO != null) {
			//아이디 있음, 아이디 중복
			result = "아이디 중복";
			result = "iddup";
		}else {
			//아이디 없음
			result = "아이디 사용가능";
			result = "idok";
		}
		
		return result;
		
	} //idCheck()
	
	
	
	
	//요청주소에 대한 처리 결과값을 출력하는 서비스
	//RESTful : HTTP와 URI 기반으로 자원(결과값)에 접근할 수 있도록 제공하는 애플리케이션 개발 인터페이스
	//http://localhost:8080/TourWeb/member/memberlist    
	// /member/memberlist
	@GetMapping("/member/memberlist")
	public List<MemberDTO> memberlist() {
		System.out.println("AjaxController memberlist()");
		
		List<MemberDTO> memberList = memberService.listMember();
		
		//결과값을 리턴 => json으로 변경하는 프로그램 설치 -> 자동으로 json 변경되어서 리턴
		
//		pom.xml -> json으로 변경하는 프로그램 설치
//		<!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
//			<dependency>
//			    <groupId>com.fasterxml.jackson.core</groupId>
//			    <artifactId>jackson-databind</artifactId>
//			    <version>2.15.2</version>
//			</dependency>
		
		return memberList;

		
		
	} //memberlist()
	
	
	
	@GetMapping("/board/boardlist")
	public List<BoardDTO> boardlist() {
		System.out.println("AjaxController boardlist()");
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(5);
		pageDTO.setCurrentPage(1);
		
		List<BoardDTO> boardList = boardService.listBoard(pageDTO);
		

		
		return boardList;

		
		
	} //boardList()
	
	
}//클래스
