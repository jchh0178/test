package com.itwillbs.revue;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovieController {

	@RequestMapping("/mmain")
    public String main() {
        return "movie/main"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/mmaind")
    public String maind() {
        return "movie/main_detail"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/mbooking")
    public String booking() {
        return "movie/booking"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
    
	@RequestMapping("/mreview")
    public String review() {
        return "movie/review"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/mseat")
    public String seat() {
        return "movie/seat"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
}
