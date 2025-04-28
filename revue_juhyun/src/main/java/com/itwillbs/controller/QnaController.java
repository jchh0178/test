package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QnaController {

	@GetMapping("/qnamain")
    public String qnamain() {
        return "qna/qna_main"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
    
    
    
	@GetMapping("/qnawrite")
    public String qnawrite() {
        return "qna/qna_write"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
    
	@GetMapping("/listnotice")
    public String listnotice() {
        return "qna/list_notice"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
    
	@GetMapping("/listfaq")
    public String listfaq() {
        return "qna/list_faq"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
}
