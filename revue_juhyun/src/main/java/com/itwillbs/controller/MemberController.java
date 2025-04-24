
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
@RequestMapping("/member/*")
public class MemberController {

	//MemberService 객체 생성
	@Inject
	private MemberService memberService;
	
	//아이디 중복체크
	//url:'${pageContext.request.contextPath}/member/idCheck',
	//http://localhost:8080/TourWeb/member/idCheck get방식
	
	//data:{'id':$('#id_lbl').val()},
	//http://localhost:8080/TourWeb/member/idCheck?id=kim get방식
	
	//요청주소에 대한 처리 결과값을 출력하는 서비스
	//RESTful : HTTP와 URI 기반으로 자원(결과값)에 접근할 수 있도록 제공하는 애플리케이션 개발 인터페이스
	
	
	// ajax 통신 : 처리한 후 => 페이지로 이동하지 않고 => 처리결과를 리턴 (요청한 페이지로 되돌아감)
	
//	@GetMapping("idCheck")
//	@ResponseBody
//	public String idCheck(HttpServletRequest request) {
//		System.out.println("MemberController idCheck()");
//		String id = request.getParameter("id");
//	
//		MemberDTO memberDTO = memberService.infoMember(id);
//		
//		String result = "";
//		if(memberDTO != null) {
//			//아이디 있음, 아이디 중복
//			result = "아이디 중복";
//			result = "iddup";
//		}else {
//			//아이디 없음
//			result = "아이디 사용가능";
//			result = "idok";
//		}
//		
//		return result;
//		
//	} //idCheck()
	
	
	
	
	
	
	//http://localhost:8080/TourWeb/member/insert    get방식
	//=> 주소변경없이 화면으로 /WEB-INF/views/member/join.jsp 이동
	@GetMapping("insert")
	public String insert() {
		System.out.println("MemberController insert()");
		//회원가입
		
		
		
		
		return "/member/join";
	}//insert()
	
	
	//http://localhost:8080/TourWeb/member/insertPro    post방식
	@PostMapping("insertPro")
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertPro()");
		//회원가입
		System.out.println(memberDTO);
		//패키지 com.itwillbs.service 파일에 MemberService 만들기
		
		// insertMember(memberDTO) 메서드 호출
		memberService.insertMember(memberDTO);
		
		
		//주소변경하면서 /member/login 이동
		return "redirect:/member/login";
		
	}//insertPro()
	
	
	
	//http://localhost:8080/TourWeb/member/login    get방식
	//=> 주소변경없이 화면으로 /WEB-INF/views/member/login.jsp 이동
	@GetMapping("login")
	public String login() {
		System.out.println("MemberController login()");
		
		return "/member/login";
	}//login()

	
	//http://localhost:8080/TourWeb/member/loginPro     post방식
	//MemberDTO memberDTO2 = loginMember(memberDTO) 메서드 호출
	//if memberDTO2 != null , 세션에 로그인 표시 값을 저장 "id", memberDTO.getID()
	//주소 변경하면서 /board/main으로 이동
	//if memberDTO2 == null ,  member/msg.jsp 로 이동
	@PostMapping("loginPro")
	public String loginPro(MemberDTO memberDTO, HttpSession session) {
		System.out.println("MemberController loginPro()");
		
		MemberDTO memberDTO2 = memberService.loginMember(memberDTO);
		
		if(memberDTO2 != null) {
			session.setAttribute("id", memberDTO2.getId());
			return "redirect:/board/main";
		} else {
			return "/member/msg";
		}

	} //loginPro()
	
	
	//http://localhost:8080/TourWeb/member/logout    get방식
	//로그아웃 처리(세션값 초기화)
	// board/main 주소 변경하면서 이동
	@GetMapping("logout")
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		
		session.invalidate();
		
		return "redirect:/board/main";
	}//logout()
	
	
	
	
	//http://localhost:8080/TourWeb/member/update    get방식
	//=> 주소변경없이 화면으로 /WEB-INF/views/member/update.jsp 이동
	
	@GetMapping("update")
	public String update(HttpSession session, Model model) {
		System.out.println("MemberController update()");
		//세션값 가져오기 => String id 변수에 저장
		//infoMember(id) 메서드 호출
		//model에 담아서 이동 "memberDTO", memberDTO 
		String id = (String)session.getAttribute("id");

		 
		 MemberDTO memberDTO = memberService.infoMember(id);
		 if(memberDTO.getGender() == null) {
			 memberDTO.setGender("남");
		 }
		 if(memberDTO.getAgree() == null) {
			 memberDTO.setAgree("disagree");
		 }
		 
		 
		 model.addAttribute("memberDTO", memberDTO);
		
		
		return "/member/update";
	}//update()
	
	
	//MemberDTO memberDTO 받기
	//MemberDTO memberDTO2 = loginMember(memberDTO) 메서드 호출
	//if memberDTO2 != null, updateMember(memberDTO) 호출, /board/main 이동
	//memberDTO2 == null, member/msg.jsp이동
	@PostMapping("updatePro")
	public String updatePro(MemberDTO memberDTO) {
		System.out.println("MemberController updatePro()");
		MemberDTO memberDTO2 = memberService.loginMember(memberDTO);
		
		if(memberDTO2 != null) {
			memberService.updateMember(memberDTO);
			return "redirect:/board/main";
	} else {
			return "/member/msg";
		}
		
	}//updatePro()
	
	
	
	
}//클래스
