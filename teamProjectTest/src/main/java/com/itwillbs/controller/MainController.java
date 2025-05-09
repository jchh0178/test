package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.MovieService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Inject
	private MovieService movieService;
	
    @GetMapping("/main")
    public String main(Model model) {
    	System.out.println("LoginController main()");
		// 한 화면에 보여줄 글개수 설정
    	int pageSize = 4;
    	int currentPage = Integer.parseInt("1");
    	
    	PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum("1");
		pageDTO.setCurrentPage(currentPage);
    	
		List<MovieDTO> movieList = movieService.getMovieList(pageDTO);
		
		model.addAttribute("movieList", movieList);
		
		return "/main/main";  

    }
}
