package com.itwillbs.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/theater/*")
public class TheaterController {

	@GetMapping("/thtmain")
    public String thtmain() {
        return "theater/tht01"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/thtdetail")
    public String thtdetail() {
        return "theater/tht02"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	
	
    
}
