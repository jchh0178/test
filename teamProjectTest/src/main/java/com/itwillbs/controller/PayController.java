package com.itwillbs.controller;

import java.sql.Timestamp;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.BoothDTO;
import com.itwillbs.domain.LoginDTO;
import com.itwillbs.domain.PayDTO;
import com.itwillbs.service.BoothService;
import com.itwillbs.service.PayService;


@Controller
@RequestMapping("/booth")
public class PayController {

	@Inject
	private PayService payService;
	
	@Inject
	private BoothService boothService;
	
	@GetMapping("/payment")
	public String payment() {
		System.out.println("PayController payment()");
		
		return "booth/payment";
	}
	
	
	// 결제 로직 ----------------------------------------------
	@GetMapping("/pay/success")
	public String paySuccess(@RequestParam String paymentKey,@RequestParam String orderId,@RequestParam String amount,Model model, HttpSession session) throws Exception {
	    
	    System.out.println("PayController paySuccess()");

	    // 토스에 결제 승인 요청 보내기
	    String secretKey = "test_sk_24xLea5zVAa4woGlewMlVQAMYNwW"; // 내 토스 시크릿키 넣음
	    String encodedKey = Base64.getEncoder().encodeToString((secretKey + ":").getBytes());

	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    headers.set("Authorization", "Basic " + encodedKey);

	    Map<String, Object> body = new HashMap<>();
	    body.put("paymentKey", paymentKey);
	    body.put("orderId", orderId); 
	    body.put("amount", Integer.parseInt(amount));

	    HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);
	    RestTemplate restTemplate = new RestTemplate();

	    try {
	        ResponseEntity<String> response = restTemplate.postForEntity("https://api.tosspayments.com/v1/payments/confirm", request, String.class);

	        String responseBody = response.getBody();
	        System.out.println("✅ 결제 승인 응답 JSON:");
	        System.out.println(responseBody);

	        // JSON 파싱해서 정보 추출
	        ObjectMapper mapper = new ObjectMapper();
	        JsonNode root = mapper.readTree(responseBody);
	        
	        String rawMethod = root.path("method").asText();
	        // 한글 깨지는거 없애봅니다 --------------------
	        String method; // 한글 계속 깨짐
	        try {
	            byte[] rawBytes = rawMethod.getBytes("ISO-8859-1");
	            method = new String(rawBytes, "UTF-8");
	        } catch (Exception e) {
	            method = rawMethod;  // 복원 실패 시 원본 유지
	        }
	        String approvedAt = root.path("approvedAt").asText();             // 승인시간
	        //String cardCompany = root.path("card").path("company").asText();  // 카드사
	        String cardCompany = root.path("card").has("company") ? root.path("card").path("company").asText() : "테스트 카드";
	        String cardNumber = root.path("card").path("number").asText();    // 카드번호
	        String approveNo = root.path("card").path("approveNo").asText();  // 승인번호
	        System.out.println("카드사: " + cardCompany);
	        System.out.println("결제수단: " + method);
	        // 정보 추출 완료 ---------------------------
	        
	        // DB에 넣어보겠습니다 -----------------------
	        LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginDTO");
	        if (loginDTO == null) {
	            System.out.println("로그인 정보 없음, 결제 불가");
	            return "redirect:/login";
	        }
	        String member_id = loginDTO.getMember_id();
	        System.out.println("세션에서 꺼낸 member_id: " + member_id);
	        
	        // (1) Timestamp로 변환
	        Timestamp payDate = Timestamp.valueOf(approvedAt.replace("T", " ").substring(0, 19));

	        // (2) DTO 생성
	        PayDTO payDTO = new PayDTO();
	        payDTO.setBooth_id((Integer) session.getAttribute("booth_id"));
	        payDTO.setMember_id(member_id);
	        payDTO.setPay_price(Integer.parseInt(amount));
	        payDTO.setPay_method(method);
	        payDTO.setPay_status("결제완료");
	        payDTO.setPay_date(payDate);
	        payDTO.setBooth_type_id((Integer) session.getAttribute("booth_type_id"));	       
	        System.out.println("booth_id: " + payDTO.getBooth_id());
	        System.out.println("member_id: " + payDTO.getMember_id());
	        System.out.println("booth_type_id: " + payDTO.getBooth_type_id());

	        // (3) insert 호출
	        payService.insertPay(payDTO);
	        
	        BoothDTO boothDTO = boothService.getBoothInfo(payDTO.getBooth_id());

	        System.out.println("포스터 URL: " + boothDTO.getPoster_url());
	        // 뷰 페이지에 보내겠습니다 -------------------
	        // payment_success.jsp로 넘길 정보 모델에 받기
	        model.addAttribute("poster", boothDTO.getPoster_url());
	        model.addAttribute("movieTitle", boothDTO.getMovie_nm());
	        model.addAttribute("theaterName", boothDTO.getTheater_name());
	        model.addAttribute("screenName", boothDTO.getRoom_name());
	        model.addAttribute("schedule", boothDTO.getBooth_date() + " " + boothDTO.getScreen_start_time());
	        model.addAttribute("seatNames", boothDTO.getSeat_name());
	        model.addAttribute("pay_price", payDTO.getPay_price());
	        model.addAttribute("orderId", orderId);
	        model.addAttribute("method", method);
	        model.addAttribute("approvedAt", approvedAt);
	        model.addAttribute("cardCompany", cardCompany);
	        model.addAttribute("cardNumber", cardNumber);
	        model.addAttribute("approveNo", approveNo);
	        model.addAttribute("message", "결제가 성공적으로 완료되었습니다!");

	        return "booth/payment_success";

	    }  catch (RestClientException e) {
	        System.out.println("❌ 결제 승인 오류 전체 로그:");
	        e.printStackTrace();  // 전체 오류 출력
	        model.addAttribute("error", "결제 승인 중 오류가 발생했습니다.");
	        return "booth/payment_fail";
	    }
	}

    @GetMapping("/pay/fail")
    public String payFail(@RequestParam String code,@RequestParam String message, Model model) {
    	System.out.println("MovieController payFail()");
        model.addAttribute("error", message);
        return "booth/payment_fail";
    }
	 // 결제 로직 --------------------------------------------

	
	
	
}
