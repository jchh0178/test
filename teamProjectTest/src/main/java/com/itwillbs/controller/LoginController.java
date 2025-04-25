package com.itwillbs.controller;

import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.LoginDTO;
import com.itwillbs.service.LoginService;
@Controller
@RequestMapping("/login/*")
public class LoginController {

	@Inject
	private LoginService loginService;
	
	// 메인 페이지 로직
	@GetMapping("/main")
	public String main() {
		System.out.println("LoginController main()");
		
		
		return "/main/main";  
	}
	
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
				
		
		
	}
	
	//로그인 로직 -----------------------------

	
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
	
	
	
}
