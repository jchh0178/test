package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.service.TheaterService;

@Controller
@RequestMapping("/theater/*")
public class TheaterController {

	
	@Inject
	private TheaterService theaterService;
	
	@GetMapping("/thtmain")
    public String thtmain(Model model) {
		System.out.println("TheaterController thtmain()");
		
		List<TheaterDTO> theaterList = theaterService.list(); 
	
		model.addAttribute("theaterList" ,theaterList);
//		
        return "theater/tht01"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/thtdetail")
    public String thtdetail(TheaterDTO theateDTO , Model model) {
		System.out.println("TheaterController thtdetail()");
		
		
		TheaterDTO theaterDTO2 = theaterService.detail(theateDTO);
		List<TheaterDTO> list2 = theaterService.list2(); 
		
		
		
		model.addAttribute("theaterDTO",theaterDTO2);
		model.addAttribute( "list2" ,list2);
		
        return "theater/tht02"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	@GetMapping("/thtdetail2")
    public String thtdetail2(TheaterDTO theaterDTO , Model model) {
		System.out.println("TheaterController thtdetail2()");
		
		TheaterDTO theaterDTO2 = theaterService.detail2(theaterDTO);
		
		return "redirect:/theater/tht02";
		
	}
	
	
	@GetMapping("/screen")
    public String screen() {
        return "theater/screen"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	
}//class
