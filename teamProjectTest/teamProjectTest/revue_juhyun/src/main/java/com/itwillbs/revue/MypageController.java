package com.itwillbs.revue;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/mymain")
    public String main() {
        return "mypage/mypage_main"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/reservation")
    public String reservation() {
        return "mypage/reservation"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/history")
    public String history() {
        return "mypage/history1"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/history2")
    public String history2() {
        return "mypage/history2"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/favorite")
    public String favorite() {
        return "mypage/favorite"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/update")
    public String update1() {
        return "mypage/update1"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/update2")
    public String update2() {
        return "mypage/update2"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/updatepw")
    public String update3() {
        return "mypage/update_pw"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/payment")
    public String payment() {
        return "mypage/payment"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/inquiry")
    public String inquiry() {
        return "mypage/inquiry"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/inquirylost")
    public String inquirylost() {
        return "mypage/inquiry_lost"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/withdraw")
    public String withdraw1() {
        return "mypage/withdraw1"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/withdraw2")
    public String withdraw2() {
        return "mypage/withdraw2"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/popup1")
    public String popup1() {
        return "mypage/popup_edit_preference"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/popup2")
    public String popup2() {
        return "mypage/popup_cancel_booking"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }

	@RequestMapping("/popup3")
    public String popup3() {
        return "mypage/popup_booking_detail"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
	}
	
	@RequestMapping("/popup4")
    public String popup4() {
        return "mypage/popup_review_write"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
	}
	
	@RequestMapping("/popup5")
    public String popup5() {
        return "mypage/popup_review_edit"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
	}
	
	@RequestMapping("/popup6")
    public String popup6() {
        return "mypage/popup_delete"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
	}
	
}
