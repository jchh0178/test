package com.itwillbs.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.inject.Inject;
import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.service.TheaterService;

@Controller
@RequestMapping("/theater/*")
public class TheaterController {

	
	@Inject
	private TheaterService theaterService;
	
	@GetMapping("/thtmain")
    public String thtmain(TheaterDTO theaterDTO, Model model) {
		System.out.println("TheaterController thtmain()");

		List<TheaterDTO> list = theaterService.list(theaterDTO); 
		
		model.addAttribute("theaterList" ,list);
		
        return "theater/tht01"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/thtdetail")
    public String thtdetail(@RequestParam("name") String name , Model model) {
		
		System.out.println("TheaterController thtdetail()");
//		TheaterDTO theaterDTO = new TheaterDTO();
		
		theaterService.detail(name);
		
		
		
		
        return "theater/tht02"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
//	@PostMapping("/thtdetailPro")
//	public String thtdetailPro(
//		
//		
//		
//		
//		
//		return "redirect:/theater/tht02";
//	}
//	
	
	
	
}//class
