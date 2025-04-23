package com.itwillbs.revue;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class AdminController {

	@RequestMapping("/adminfaq")
    public String adminfaq() {
        return "admin/admin_faq"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/adminmemd")
    public String adminmemd() {
        return "admin/admin_mem_detail"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/adminmem")
    public String adminmem() {
        return "admin/admin_mem"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/adminmovied")
    public String adminmovied() {
        return "admin/admin_movie_detail"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/adminmoviei")
    public String adminmoviei() {
        return "admin/admin_movie_insert"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/adminmovie")
    public String adminmovie() {
        return "admin/admin_movie"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/adminnotice")
    public String adminnotice() {
        return "admin/admin_notice"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/adminpayd")
    public String adminpayd() {
        return "admin/admin_pay_detail"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/adminpay")
    public String adminpay() {
        return "admin/admin_pay"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/adminreview")
    public String adminreview() {
        return "admin/admin_review"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	
	
}
