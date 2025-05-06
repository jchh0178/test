package com.itwillbs.controller;

import java.sql.Date;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.LoginDTO;
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
				return "redirect:/main/main";
				
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

	//네이버 로그인 로직 -----------------------------------
		@GetMapping("/callback")
	    public String naverCallback(@RequestParam("code") String code, @RequestParam("state") String state, HttpSession session, Model model) throws Exception {
	        // 주소창에 정상적으로 값을 받아오는지를 콘솔창에서 확인 - 정상적으로 떠야함
			System.out.println("네이버로부터 받은 code: " + code);
	        System.out.println("네이버로부터 받은 state: " + state); 
	       

	        // Access Token 요청 코드 넣기
	        RestTemplate restTemplate = new RestTemplate();

	        String clientId = "F_hif7XtXFlJyphbSdxx"; //내 클라이언트 id
	        String clientSecret = "KOwsEHdDoK"; //내 클라이언트 secret

	        String tokenUrl = "https://nid.naver.com/oauth2.0/token" +
	                "?grant_type=authorization_code" +
	                "&client_id=" + clientId +
	                "&client_secret=" + clientSecret +
	                "&code=" + code +
	                "&state=" + state;

	        ResponseEntity<String> response = restTemplate.postForEntity(tokenUrl, null, String.class);
	        System.out.println("🟢 Access Token 응답 = " + response.getBody());
	        
	        // Access Token 추출해서 사용자 정보 요청
	        // JSON 문자열 파싱 (간단하게 access_token만 추출)
	        ObjectMapper objectMapper = new ObjectMapper();
	        JsonNode tokenJson = objectMapper.readTree(response.getBody());
	        String accessToken = tokenJson.get("access_token").asText();

	        // 사용자 정보 요청
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "Bearer " + accessToken);

	        HttpEntity<String> entity = new HttpEntity<>(headers);
	        ResponseEntity<String> userInfoResponse = restTemplate.exchange(
	                "https://openapi.naver.com/v1/nid/me",
	                HttpMethod.GET,
	                entity,
	                String.class
	        );

	        System.out.println("🟢 사용자 정보 응답 = " + userInfoResponse.getBody());
	        
	        // 사용자 정보 꺼내기
	        JsonNode userJson = objectMapper.readTree(userInfoResponse.getBody());
	        String id = userJson.get("response").get("id").asText();
	        String name = userJson.get("response").get("name").asText();
	        String email = userJson.get("response").get("email").asText();
	        String gender = userJson.get("response").get("gender").asText();
	        String phone = userJson.get("response").get("mobile").asText();
	        
	        
	        System.out.println("아이디: " + id);
	        System.out.println("이름: " + name);
	        System.out.println("이메일: " + email);
	        System.out.println("성별: " + gender);
	        System.out.println("전화번호: " + phone);
	        
	        
	        //회원가입 여부 확인
	        if (loginService.isExist(id)) { // DB에 네이버로 로그인한 id정보가 이미 있으면
	            session.setAttribute("member_id", id);
	            return "redirect:/main/main"; // 메인 페이지로 이동
	        } else { // 신규 사용자
	            // 추가 정보 입력을 위해 데이터를 모델에 담아서
	            model.addAttribute("id", id);
	            model.addAttribute("name", name);
	            model.addAttribute("email", email);
	            model.addAttribute("gender", gender);
	            model.addAttribute("phone", phone);

	            return "login/additionalInfo"; // 추가 정보 입력 페이지로 이동
	        }

	    }//네이버 로그인 로직 -----------------------------------
		
		//네이버 로그인 추가 정보 입력 로직 -----------------------------------
		@PostMapping("/login/additionalInfoPro")
		public String additionalInfoPro(LoginDTO loginDTO, HttpSession session) {

		    // 비번은 더미값 저장
			loginDTO.setMember_pass("NAVER_USER");
		    
		    // isnaver = true
			loginDTO.setIsnaver(true);

		    // 추가정보 + 네이버 기본정보로 회원가입
			loginService.register(loginDTO);

		    // 세션 로그인 처리
		    session.setAttribute("member_id", loginDTO.getMember_id());

		    return "redirect:/main/main"; // 메인페이지 이동
		}//네이버 로그인 추가 정보 입력 로직 -----------------------------------
	
	
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
		@PostMapping("login/registerPro")
		public String registerPro(LoginDTO loginDTO) {
			System.out.println("LoginController registerPro()");
			System.out.println(loginDTO);
			
			// 전화번호 하이픈 
			 String rawPhone = loginDTO.getMember_phone();
			    if (rawPhone != null && rawPhone.length() == 11) {
			        String formatted = rawPhone.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
			        loginDTO.setMember_phone(formatted);
			    }
		
			loginService.register(loginDTO);


		return "redirect:/main/main";
	}
//	회원 가입 로직 ---------------------------------------
	
	
	
	
	
// 회원수정 로직 ------------------------------------------
	
//이 프로젝트에 맞게 단어 수정 해야함 	
	/*
	@GetMapping("update")
	public String update(HttpSession session, Model model) {
		System.out.println("LoginController update()");

		//세션값으로 받아오기
		String id = (String)session.getAttribute("id");

		 
		LoginDTO loginDTO = loginService.info(id);
		 if(loginDTO.getMember_gender() == null) {
			 loginDTO.getMember_gender("F");
		 }
//		 if(loginDTO.getAgree() == null) {
//			 loginDTO.setAgree("disagree");
//		 }
		 
		 
		 model.addAttribute("loginDTO", loginDTO);
		
		
		return "/login/update";
	}//update()
	@PostMapping("updatePro")
	public String updatePro(LoginDTO loginDTO) {
		System.out.println("MemberController updatePro()");
		LoginDTO loginDTO2 = loginService.login(loginDTO);
		
		if(loginDTO2 != null) {
			
			loginService.update(loginDTO);
			return "redirect:/main/main";
	} else {
			return "/login/update";
		}
		
	}//updatePro()
	
	
	
	
	*/

	
// 회원수정 로직 ------------------------------------------

	
// 회원 인증번호 로직 ------------------------------------	

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

	
// 회원 인증번호 로직 ------------------------------------	
	
	
	
	
	
}
