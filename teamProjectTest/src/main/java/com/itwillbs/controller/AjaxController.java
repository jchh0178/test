package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.service.MovieService;
import com.itwillbs.service.TheaterService;

@RestController
public class AjaxController {

	@Inject
	private MovieService movieService;
	
	@Inject
	private TheaterService theaterService;

	
	@GetMapping("theater/ajaxList")
	public List<TheaterDTO> ajaxList(@RequestParam("theater_region") String region ,TheaterDTO theaterDTO, Model model) {
		System.out.println("AjaxController ajaxList()");
		System.out.println("비교할 값" + theaterDTO);
		
		
		List<TheaterDTO> list = theaterService.list3(region); 
		System.out.println("가져온 값" + list);

		
		
		return list;
		
	}
	
	
	
	@GetMapping("theater/movieList")
	public List<MovieDTO> movieList(){
		System.out.println("AjaxController movieList()");

		List<MovieDTO> movie = movieService.getMovieList2();
		System.out.println(movie);
		
		return movie;
	}
}
