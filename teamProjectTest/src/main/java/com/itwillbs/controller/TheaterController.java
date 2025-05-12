package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.service.MovieService;
import com.itwillbs.service.TheaterService;

@Controller
@RequestMapping("/theater/*")
public class TheaterController {

	@Inject
	private MovieService movieService;	
	@Inject
	private TheaterService theaterService;
	
	@GetMapping("/thtmain")
    public String thtmain(Model model) {
		System.out.println("TheaterController thtmain()");
		
		List<TheaterDTO> theaterList = theaterService.list(); 
//		List<MovieDTO> movieList = 
		
		System.out.println("");
		
		model.addAttribute("theaterList" ,theaterList);
//		model.addAttribute("movieList" ,movieList);
//		
        return "theater/tht01"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	
	//없어도 됨
//	@GetMapping("/thtdetail")
//    public String thtdetail(TheaterDTO theateDTO , Model model) {
//		System.out.println("TheaterController thtdetail()");
//		
//		
//		TheaterDTO theaterDTO2 = theaterService.detail(theateDTO);
//		List<TheaterDTO> list2 = theaterService.list2(); 
//		
//		
//		
//		model.addAttribute("theaterDTO",theaterDTO2);
//		model.addAttribute( "list2" ,list2);
//		
//        return "theater/tht02"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
//    }
//	@GetMapping("/thtdetail2")
//    public String thtdetail2(TheaterDTO theaterDTO , Model model) {
//		System.out.println("TheaterController thtdetail2()");
//		
//		TheaterDTO theaterDTO2 = theaterService.detail2(theaterDTO);
//		
//		return "redirect:/theater/tht02";
//		
//	}
	
	
	@GetMapping("/screen")
    public String screen() {
        return "theater/screen"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	
}//class
