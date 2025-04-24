package com.itwillbs.revue;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TheaterController {

	@RequestMapping("/thtmain")
    public String thtmain() {
        return "theater/tht01"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/thtdetail")
    public String thtdetail() {
        return "theater/tht02"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
}
