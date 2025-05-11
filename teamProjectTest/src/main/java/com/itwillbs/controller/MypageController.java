package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;

import com.itwillbs.domain.LoginDTO;
import com.itwillbs.domain.PayDTO;
import com.itwillbs.service.MypageService;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@Inject
	private MypageService mypageService;

	@GetMapping("/mymain")
    public String main(HttpSession session, Model model) {
		System.out.println("MypageController mymain()");

		
		LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginDTO");
		
		 // 로그인 안되어있으면 로그인페이지로 이동함
		if (loginDTO == null) {
	        System.out.println("세션에 로그인 정보 없음, 로그인 페이지로 이동");
	        return "redirect:/login";
	    }
		
		 String member_id = loginDTO.getMember_id();
		 System.out.println("현재 로그인 ID: " + member_id);
		 
	    // 로그인한 회원의 예매내역 가져오기
	    List<PayDTO> listBooking = mypageService.listbooking(member_id);
	    
	    System.out.println("예매내역 갯수: " + listBooking.size()); // 몇개인지 확인해보기

	    model.addAttribute("listBooking", listBooking);
		
        return "mypage/mypage_main"; 
    }
	
	// 선호 장르 업데이트 -------------------------------
	@PostMapping("/updateGenre")
	public String updateGenre(@RequestParam("genres") List<String> genres, HttpSession session) {
		System.out.println("MypageController updateGenre()");
		System.out.println("전달받은 genres : " + genres);
		
	    LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginDTO");

	    if (loginDTO != null) {
	        // 쉼표로 문자열 합치기
	        String genreStr = String.join(", ", genres);
	        loginDTO.setMember_like_genre(genreStr);
	        mypageService.updateGenre(loginDTO);
	        session.setAttribute("loginDTO", loginDTO);
	    }

	    return "redirect:/mypage/mymain";  
	}
	
	
	
	// 마이페이지 내 회원정보 수정 -----------------------------------
	
	// 비밀번호 확인 ------------------------------
	@PostMapping("/updateCheck")
	public String updateCheck(@RequestParam("password") String inputPass, @RequestParam(value = "captcha", required = false) String inputCaptcha, HttpSession session, RedirectAttributes rttr) {
		System.out.println("MypageController updateCheck()");
		
	    // 세션에서 로그인한 사용자 정보 가져오기
	    LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginDTO");
	    
	    // 나중에 인터셉터 만들면 더 좋음
	    if (loginDTO == null) {
	        System.out.println("세션에 loginDTO 없음 - 로그인 안 한 상태");
	        rttr.addFlashAttribute("msg", "로그인이 필요합니다.");
	        return "redirect:/login/login";
	    }
	    
	    
	    String member_id = loginDTO.getMember_id();
	    System.out.println("id : " + member_id);

	    // 실제 DB에서 비밀번호 가져오기
	    String actualPass = mypageService.checkPass(member_id);

	    // 실패 횟수 세션에서 꺼내기 (없으면 0)
	    Integer failCount = (Integer) session.getAttribute("failCount");
	    if (failCount == null) failCount = 0;

	    // 실패 5회 이상일 경우 보안문자 비교
	    if (failCount >= 5) {
	        String sessionCaptcha = (String) session.getAttribute("captcha");
	        if (inputCaptcha == null || sessionCaptcha == null || 
	            !sessionCaptcha.equalsIgnoreCase(inputCaptcha)) {
	            rttr.addFlashAttribute("msg", "보안문자가 일치하지 않습니다.");
	            rttr.addFlashAttribute("requireCaptcha", true);
	            return "redirect:/mypage/update";
	        }
	    }

	    // 비밀번호 비교
	    if (inputPass.equals(actualPass)) {
	        // 성공 시 실패횟수 초기화
	        session.removeAttribute("failCount");
	        return "redirect:/mypage/update2";
	    } else {
	        // 실패 시 실패횟수 증가
	        failCount++;
	        session.setAttribute("failCount", failCount);
	        rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
	        System.out.println("실패 횟수 : " + failCount);

	        // 5회 이상이면 보안문자 표시
	        if (failCount >= 5) {
	            rttr.addFlashAttribute("requireCaptcha", true);
	        }

	        return "redirect:/mypage/update";
	    }
	}
	    

	
	// 보안문자 이미지 생성 ----------------------------------
	@GetMapping("/captcha")
	public void getCaptcha(HttpSession session, HttpServletResponse response) throws Exception {
	    int width = 150;
	    int height = 50;
	    BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	    Graphics2D g2d = bufferedImage.createGraphics();

	    // 배경색
	    g2d.setColor(Color.WHITE);
	    g2d.fillRect(0, 0, width, height);

	    // 텍스트 설정
	    String captcha = UUID.randomUUID().toString().substring(0, 6);
	    session.setAttribute("captcha", captcha); // 세션에 저장

	    g2d.setFont(new Font("Arial", Font.BOLD, 28));
	    g2d.setColor(Color.BLACK);
	    g2d.drawString(captcha, 25, 35);

	    g2d.dispose();

	    // 응답 설정
	    response.setContentType("image/png");
	    ImageIO.write(bufferedImage, "png", response.getOutputStream());
	}
	
	// 프로필 사진 및 회원정보 업데이트 --------------------------
	@PostMapping("/updateProfile")
	public String updateProfile(@RequestParam("file") MultipartFile file, @RequestParam("name") String name, @RequestParam("phone") String phone, @RequestParam("gender") String gender, @RequestParam("address") String address, HttpSession session, Model model) throws Exception {
	    System.out.println("MypageController updateProfile()");

	    LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginDTO");

	    // 파일이 비어있지 않으면 업로드 진행
	    if (!file.isEmpty()) {
	        // 1. 파일명 생성: 랜덤문자 + 회원아이디 + 원본이름
	        UUID uuid = UUID.randomUUID();
	        String memberId = loginDTO.getMember_id();
	        String originalName = file.getOriginalFilename();
	        String filename = uuid.toString().substring(0, 8) + "_" + memberId + "_" + originalName;

	        // 2. 업로드 경로 (webapp/upload)
	        String uploadPath = session.getServletContext().getRealPath("/resources/upload");
	        File saveFile = new File(uploadPath, filename);

	        // 3. 파일 저장
	        FileCopyUtils.copy(file.getBytes(), saveFile);

	        // 4. DTO에 파일명 저장 후 DB 업데이트
	        loginDTO.setMember_profile(filename);
	        
	        model.addAttribute("uploadedImage", filename);
	    }
	    
	    // 수정할 정보 (이름, 전화번호, 성별, 주소) --------> if문 안에 넣으면 file 업로드 안할경우 회원정보 수정 안됨
	    loginDTO.setMember_name(name);
	    loginDTO.setMember_phone(phone);
	    loginDTO.setMember_gender(gender);
	    loginDTO.setMember_address(address);
        
        mypageService.updateProfile(loginDTO);
        
        // 5. 세션도 업데이트
        session.setAttribute("loginDTO", loginDTO);

	    return "redirect:/mypage/mymain";
	}

	// 비밀번호 변경 -----------------------------
	@GetMapping("/mypage/checkPass")
	@ResponseBody
	public String checkPass(@RequestParam("password") String password, HttpSession session) {
	    LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginDTO");
	    String actualPw = mypageService.checkPass(loginDTO.getMember_id());
	    return password.equals(actualPw) ? "OK" : "FAIL";
	}
	
	// 변경한 비밀번호 저장 ------------------------
	@PostMapping("/mypage/updatePass")
	public String updatePass(@RequestParam("currentPw") String currentPw, @RequestParam("newPw") String newPw, HttpSession session, RedirectAttributes rttr) {
	    System.out.println("MypageController updatePass()");

	    LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginDTO");
	    String member_id = loginDTO.getMember_id();

	    // 실제 비밀번호 불러오기 (암호화 안된 경우)
	    String actualPw = mypageService.checkPass(member_id);

	    if (!currentPw.equals(actualPw)) {
	        rttr.addFlashAttribute("msg", "현재 비밀번호가 일치하지 않습니다.");
	        return "redirect:/mypage/updatepw";
	    }

	    // 새 비밀번호로 업데이트
	    loginDTO.setMember_pass(newPw);
	    mypageService.updatePass(loginDTO);

	    // 세션도 업데이트
	    session.setAttribute("loginDTO", loginDTO);

	    return "redirect:/mypage/update2";  // 회원정보 수정 화면으로 이동
	}
	
	
	// 마이페이지 내 회원정보 수정 끝 -----------------------------------
	
	@GetMapping("/reservation")
    public String reservation(HttpSession session, Model model) {
		System.out.println("MypageController reservation()");
		
		LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginDTO");
		
		String member_id = loginDTO.getMember_id();
		System.out.println("현재 로그인 ID: " + member_id);
		
		List<PayDTO> listBooking = mypageService.listbooking(member_id);
		
		 model.addAttribute("listBooking", listBooking);
        return "mypage/reservation"; 
    }
	
	@GetMapping("/history")
    public String history() {
        return "mypage/history1"; 
    }
	
	@GetMapping("/history2")
    public String history2() {
        return "mypage/history2"; 
    }
	
	@GetMapping("/favorite")
    public String favorite() {
        return "mypage/favorite"; 
    }
	
	@GetMapping("/update")
    public String update1() {
        return "mypage/update1"; 
    }
	
	@GetMapping("/update2")
    public String update2() {
        return "mypage/update2"; 
    }
	
	@GetMapping("/updatepw")
    public String update3() {
        return "mypage/update_pw"; 
    }
	
	@GetMapping("/payment")
    public String payment() {
        return "mypage/payment"; 
    }
	
	@GetMapping("/inquiry")
    public String inquiry() {
        return "mypage/inquiry"; 
    }
	
	@GetMapping("/inquirylost")
    public String inquirylost() {
        return "mypage/inquiry_lost"; 
    }
	
	@GetMapping("/withdraw")
    public String withdraw1() {
        return "mypage/withdraw1"; 
    }
	
	@GetMapping("/withdraw2")
    public String withdraw2() {
        return "mypage/withdraw2"; 
    }
	
	// 영화 취향 수정 팝업창 ---------------------------
	@GetMapping("/popup1")
	public String showEditGenrePopup(HttpSession session, Model model) {
	    LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginDTO");
	    if (loginDTO == null) return "redirect:/login/login";

	    List<String> genreList = mypageService.getDistinctGenres();
	    model.addAttribute("genreList", genreList);

        return "mypage/popup_edit_preference";
    }
	
	@RequestMapping("/popup2")
    public String popup2() {
        return "mypage/popup_cancel_booking";
    }

	@GetMapping("/popup3")
    public String popup3(HttpSession session, Model model) {
		LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginDTO");
		
		String member_id = loginDTO.getMember_id();
		
		List<PayDTO> listBooking = mypageService.listbooking(member_id);
		
		 model.addAttribute("listBooking", listBooking);
		
        return "mypage/popup_booking_detail";
	}
	
	@GetMapping("/popup4")
    public String popup4() {
        return "mypage/popup_review_write";
	}
	
	@GetMapping("/popup5")
    public String popup5() {
        return "mypage/popup_review_edit";
	}
	
	@GetMapping("/popup6")
    public String popup6() {
        return "mypage/popup_delete"; 
	}
	
//	@GetMapping("/mypage/ticketPrint")
//	public String ticketPrint(@RequestParam("payId") String payId, Model model, HttpSession session) {
//	    // 예매 정보를 DB에서 조회
//	    BookingDTO booking = mypageService.getBookingInfo(payId);
//
//	    model.addAttribute("movieTitle", booking.getMovieTitle());
//	    model.addAttribute("screenTime", booking.getScreenTime());
//	    model.addAttribute("seatInfo", booking.getSeatInfo());
//	    model.addAttribute("payId", payId);
//
//	    return "mypage/ticket_print"; // /WEB-INF/views/mypage/ticket_print.jsp
//	}
	
}
