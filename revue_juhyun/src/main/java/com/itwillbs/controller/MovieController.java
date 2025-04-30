package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MovieController {

	@GetMapping("/mmain")
    public String main() {
        return "movie/main"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/mmaind")
    public String maind() {
        return "movie/main_detail"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/mbooking")
    public String booking() {
        return "movie/booking"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
    
	@GetMapping("/mreview")
    public String review() {
        return "movie/review"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/mseat")
    public String seat() {
        return "movie/seat"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
}
