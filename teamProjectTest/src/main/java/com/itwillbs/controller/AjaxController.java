package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.service.TheaterService;

@RestController
public class AjaxController {

	
	@Inject
	private TheaterService theaterService;
	
	@GetMapping("theater/ajaxList")
	public List<TheaterDTO> ajaxList(TheaterDTO theaterDTO, Model model) {
		
		List<TheaterDTO> list = theaterService.list3(theaterDTO); 

		
		
		return list;
		
	}
}
