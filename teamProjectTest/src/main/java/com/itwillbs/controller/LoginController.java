package com.itwillbs.controller;

import java.sql.Date;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.LoginDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.LoginService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
@Controller
@RequestMapping("/login/*")
public class LoginController {

	@Inject
	private LoginService loginService;
	
	
	
	//로그인 로직 -----------------------------
	@GetMapping("/login")
    public String login() {
		System.out.println("LoginController Login()");
		
		
		return "login/login";  
    }
	
	@PostMapping("/loginPro")
	public String loginPro(LoginDTO loginDTO, HttpSession session) {
		System.out.println("LoginController LoginPro()");
		try {
			LoginDTO loginDTO2 = loginService.login(loginDTO);
		
		
			
			if(loginDTO2 != null) {
				System.out.println("로그인 성공");
				
				session.setAttribute("id", loginDTO.getMember_id());
				return "redirect:/login/main";
				
			}else {
				System.out.println("로그인 실패");
				return "login/login";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "login/login";
		}
				
//		session.invalidate();		로그아웃할때 사용할 세션 삭제
		
	}
	
	//로그인 로직 -----------------------------

	
	//로그아웃 로직 -----------------------------------
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		
		session.invalidate();
		
		return "redirect:/main/main";
	}//logout()
	
	//로그아웃 로직 -----------------------------------

	@GetMapping("/idfound")
    public String idfound() {
        return "login/idFound";  
    }
	
	@GetMapping("/pwfound")
    public String passfound() {
        return "login/passFound"; 
	}
	
	
	
//	회원 가입 로직 ---------------------------------------
	
	//회원가입 페이지
	@GetMapping("/register")
    public String register() {
		System.out.println("LoginController register()");
     
		return "login/register";  
    }
	
//	 회원가입 정보 전송
	@PostMapping("/registerPro")
	public String registerPro(LoginDTO loginDTO) {
		System.out.println("LoginController registerPro()");
		System.out.println(loginDTO);

		loginService.register(loginDTO);

		return "redirect:/login/main";
	}
//	회원 가입 로직 ---------------------------------------
	
	
	
	
	
// 회원수정 로직 ------------------------------------------
	
//이 프로젝트에 맞게 단어 수정 해야함 	
	
	/*
	@GetMapping("update")
	public String update(HttpSession session, Model model) {
		System.out.println("MemberController update()");
		//세션값 가져오기 => String id 변수에 저장
		//infoMember(id) 메서드 호출
		//model에 담아서 이동 "memberDTO", memberDTO 
		String id = (String)session.getAttribute("id");

		 
		LoginDTO loginDTO = loginService.info(id);
		 if(loginDTO.getMember_gender() == null) {
			 loginDTO.getMember_gender("남");
		 }
//		 if(loginDTO.getAgree() == null) {
//			 loginDTO.setAgree("disagree");
//		 }
		 
		 
		 model.addAttribute("loginDTO", loginDTO);
		
		
		return "/login/update";
	}//update()
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
	
	
	
	
	
*/

	
// 회원수정 로직 ------------------------------------------

	
// 회원 인증번호 로직 ------------------------------------	
//	/*
	@PostMapping("/sendSMS")
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String phone) {
	    String authCode = String.format("%06d", new java.util.Random().nextInt(999999));

	    String apiKey = "NCSGKXVLWBRP43Z9";
	    String apiSecret = "BJXTCNKPGMFCFSKMS4NZPZ7C8OHC85CS";
	    String sender = "01087616452";

	    Message coolsms = new Message(apiKey, apiSecret);

	    HashMap<String, String> params = new HashMap<>();
	    params.put("to", phone);
	    params.put("from", sender);
	    params.put("type", "SMS");
	    params.put("text", "[ReVue 회원가입] 인증번호 [" + authCode + "] 를 입력해주세요.");
	    params.put("app_version", "REVUE 1.0");

	    try {
	        JSONObject result = coolsms.send(params);
	        System.out.println("CoolSMS 응답: " + result.toJSONString());
	    } catch (CoolsmsException e) {
	        System.out.println("문자 전송 오류: " + e.getMessage());
	        System.out.println("에러코드: " + e.getCode());
	        return "error";
	    }

	    return authCode;
	}

	
	
//	*/
	
// 회원 인증번호 로직 ------------------------------------	

	
	
	
	
	
	
	
	
	
	
	
	
}
