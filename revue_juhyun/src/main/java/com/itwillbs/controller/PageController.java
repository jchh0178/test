package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/program/*")
public class PageController {

	//http://localhost:8080/TourWeb/board/program     get 방식
		//-> 주소변경없이 화면으로 /WEB-INF/views/program/program.jsp 이동
		@GetMapping("program")
		public String program() {
			System.out.println("BoardController program()");
			
			return "/program/program";
		
		}//program()
	
	
}
