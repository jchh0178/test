package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller					//컨트롤러 어노테이션
@RequestMapping("/qna/*")	//맵핑 어노테이션 "/qna/" 자동으로 들어감
public class QnaController {

    @GetMapping("/qnamain")		//get 방식
    public String qnamain() {
        return "qna/qna_main"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
    
    
    
    @GetMapping("/qnawrite")	//get 방식
    public String qnawrite() {
        return "qna/qna_write"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
    
    @GetMapping("/listnotice")	//get 방식
    public String listnotice() {
        return "qna/list_notice"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
    
    @GetMapping("/listfaq")	//get 방식
    public String listfaq() {
        return "qna/list_faq"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
}
