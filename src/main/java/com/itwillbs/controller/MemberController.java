package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping("/login/*")
public class MemberController {
	
//	MemberService 객체생성
	@Inject
	private MemberService memberService;

	@GetMapping("/register")
	public String register() {
		System.out.println("MemberController register()");
		
		return "/login/register";
	}//register()
	
//	http://localhost:8080/TourWeb/member/insertPro     post방식
	@PostMapping("/registerPro")
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController registerPro()");
		//회원가입
		System.out.println(memberDTO);
		// 패키지 com.itwillbs.service 파일이름 MemberService
		
		// insertMember(memberDTO) 메서드 호출
		memberService.insertMember(memberDTO);
		
		//주소변경하면서 /member/login 이동
		return "redirect:/login/login";
	}//insertPro()
	
	
//	http://localhost:8080/TourWeb/member/login     get방식
//	=> 주소변경없이 화면으로 /WEB-INF/views/member/login.jsp 이동
	@GetMapping("/login")
	public String login() {
		System.out.println("MemberController login()");
		
		return "/login/login";
	}//login()
	
//	http://localhost:8080/TourWeb/member/loginPro     post방식
//	MemberDTO memberDTO2 = loginMember(memberDTO) 메서드 호출
//	if memberDTO2 != null,세션에 로그인 표시값을 저장 "id",memberDTO.getId(),/board/main이동
//	memberDTO2 == null, member/msg.jsp 이동
	@PostMapping("/loginPro")
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		
		MemberDTO memberDTO2 = memberService.loginMember(memberDTO);
		if(memberDTO2 != null) {
			//아이디 비밀번호 일치
			//로그인 성공 => 로그인 표시값을 세션에 저장
			session.setAttribute("id", memberDTO.getId());
			// /board/main 주소변경하면서 이동
			return "redirect:/login/main";
		}else {
			//아이디 비밀번호 틀림
			//member/msg.jsp 주소변경없이 이동
			return "/login/login";
		}
	}//loginPro()
	
//	http://localhost:8080/TourWeb/member/logout    get방식
//	로그아웃 처리 (세션값 초기화)
//	=> /board/main 주소변경하면서 이동
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		
		session.invalidate();
		
		return "redirect:/board/main";
	}//logout()
	
	
//	http://localhost:8080/TourWeb/member/update     get방식
//	=> 주소변경없이 화면으로 /WEB-INF/views/member/update.jsp 이동
	@GetMapping("/update")
	public String update(HttpSession session, Model model) {
		System.out.println("MemberController update()");
		// 세션값 가져오기 => String id 변수에 저장
		String id = (String)session.getAttribute("id");
		// MemberDTO memberDTO = infoMember(id) 메서드 호출
		MemberDTO memberDTO = memberService.infoMember(id);
		if(memberDTO.getGender() == null) {
			memberDTO.setGender("남");
		}
		if(memberDTO.getAgree() == null) {
			memberDTO.setAgree("disagree");
		}
		// model에 담아서 이동 "memberDTO",memberDTO
		model.addAttribute("memberDTO", memberDTO);
		return "/member/update";
	}//update()
	
//	http://localhost:8080/TourWeb/member/updatePro     post방식
//	MemberDTO memberDTO 받기
//	MemberDTO memberDTO2 = loginMember(memberDTO) 메서드 호출
//	if memberDTO2 != null, updateMember(memberDTO) 호출,/board/main이동
//	memberDTO2 == null, member/msg.jsp 이동
	@PostMapping("/updatePro")
	public String updatePro(MemberDTO memberDTO) {
		System.out.println("MemberController updatePro()");
		MemberDTO memberDTO2 = memberService.loginMember(memberDTO);
		if(memberDTO2 != null) {
			memberService.updateMember(memberDTO);
			
			return "redirect:/board/main";
		}else {
			return "/member/msg";
		}
		
	}//updatePro()
	
}//클래스

