package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.ScreenDTO;
import com.itwillbs.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Inject
	private AdminService adminService;
	
	@GetMapping("/adminfaq")
    public String adminfaq() {
        return "admin/admin_faq"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
    
	@GetMapping("/adminmemd")
    public String adminmemd() {
        return "admin/admin_mem_detail"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }

	@GetMapping("/adminmem")
    public String adminmem() {
        return "admin/admin_mem"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/adminmovied")
    public String adminmovied() {
        return "admin/admin_movie_detail"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/adminmoviei")
    public String adminmoviei() {
        return "admin/admin_movie_insert"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/adminmovie")
    public String adminmovie() {
        return "admin/admin_movie"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/adminnotice")
    public String adminnotice() {
        return "admin/admin_notice"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/adminpayd")
    public String adminpayd() {
        return "admin/admin_pay_detail"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/adminpay")
    public String adminpay() {
        return "admin/admin_pay"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/adminreview")
    public String adminreview() {
        return "admin/admin_review"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/adminscreen")
    public String adminscreen() {
        return "admin/admin_screen"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@PostMapping("/screenAddPro")
	public String insertScreen(ScreenDTO screenDTO) {
	    adminService.insertScreen(screenDTO);
	    return "redirect:/admin/admin_screen"; // 다시 목록으로 리다이렉트
	}
	
	
}
