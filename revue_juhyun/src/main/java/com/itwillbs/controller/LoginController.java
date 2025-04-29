package com.itwillbs.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.LoginDTO;
import com.itwillbs.service.LoginService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



@Controller
public class LoginController {
	
	@Inject
	private LoginService loginService;
	
	

	@GetMapping("/login")
    public String login() {
		System.out.println("LoginController Login()");
		
        return "login/login";  
    }
	
	@GetMapping("/idfound")
    public String idfound() {
        return "login/idFound";  
    }
	
	@GetMapping("/pwfound")
    public String passfound() {
        return "login/passFound"; 
	}
	
	@GetMapping("/register")
    public String register() {
		System.out.println("LoginController register()");
		
        return "login/register";  
    }
	
	//로그인 로직 -----------------------------
	@PostMapping("login/loginPro")
	public String loginPro(LoginDTO loginDTO, HttpSession session) {
		System.out.println("LoginController LoginPro()");
		try {
			LoginDTO loginDTO2 = loginService.login(loginDTO);
		
		
			
			if(loginDTO2 != null) {
				System.out.println("로그인 성공");
				
				session.setAttribute("id", loginDTO.getMember_id());
				return "redirect:/main";
				
			}else {
				System.out.println("로그인 실패");
				return "login";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "login";
		}
	}
	
	//회원 가입 로직 ---------------------------------------
	//회원가입 정보 전송
	@PostMapping("login/registerPro")
	public String registerPro(LoginDTO loginDTO) {
		System.out.println("LoginController registerPro()");
		System.out.println(loginDTO);

		loginService.register(loginDTO);

		return "redirect:/main";
	}
	//회원 가입 로직 ---------------------------------------
	
	
	//인증문자 발송 로직 -------------------------------------
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
	//인증문자 발송 로직 -------------------------------------
	
	
}
