package com.itwillbs.controller;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



@Controller
public class LoginController {

	@GetMapping("/login")
    public String login() {
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
        return "login/register";  
    }
	
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

	
	
}
