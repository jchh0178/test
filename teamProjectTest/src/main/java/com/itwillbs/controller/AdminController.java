package com.itwillbs.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.LoginDTO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RoomDTO;
import com.itwillbs.domain.ScreenDTO;
import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Inject
	private AdminService adminService;
	

	@GetMapping("/adminfaq")
    public String adminfaq() {
        return "admin/admin_faq"; 
    }
    
	// 관리자 회원 목록 페이지 로직 =============================
	
	
	// 주소 맵핑 ------------------------------
	@GetMapping("/adminmemd")
    public String adminmemd(@RequestParam("member_id") String member_id, Model model) {

        LoginDTO infoMember = adminService.infoMember(member_id);
        model.addAttribute("infoMember", infoMember);
        
        
        return "admin/admin_mem_detail"; 
    }

	// 회원 목록 가져오기 + 페이징 ------------------------
	@GetMapping("/adminmem")
    public String listMember(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, @RequestParam(value = "search", required = false) String search, Model model) {
		// PageDTO 세팅
	    PageDTO pageDTO = new PageDTO();
	    pageDTO.setPageNum(pageNum);
	    pageDTO.setSearch(search);
	    
	    int currentPage = Integer.parseInt(pageNum);
	    int pageSize = 10;
	    int startRow = (currentPage - 1) * pageSize;
	    
	    pageDTO.setCurrentPage(currentPage);
	    System.out.println("현재 페이지 : " + currentPage);
	    pageDTO.setPageSize(pageSize);
	    pageDTO.setStartRow(startRow);
	    pageDTO.setEndRow(startRow + pageSize - 1);

	    
        List<LoginDTO> listMember = adminService.listMember(pageDTO);
        int count = adminService.countMember(pageDTO);

        // 페이지 블럭 계산
        int pageBlock = 5;
        int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
        int pageCount = (int) Math.ceil((double) count / pageSize);
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) {
            endPage = pageCount;
        }

        pageDTO.setCount(count);
        pageDTO.setPageBlock(pageBlock);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setPageCount(pageCount);
        
        model.addAttribute("listMember", listMember);
        model.addAttribute("pageDTO", pageDTO);
        return "admin/admin_mem"; 
    }
	
	
	
	// 관리자 회원 목록 페이지 로직 =============================
	
	
	@GetMapping("/adminmovied")
    public String adminmovied() {
        return "admin/admin_movie_detail";
    }
	
	@GetMapping("/adminmoviei")
    public String adminmoviei() {
        return "admin/admin_movie_insert"; 
    }
	
	@GetMapping("/adminmovie")
    public String adminmovie() {
        return "admin/admin_movie"; 
    }
	
	@GetMapping("/adminnotice")
    public String adminnotice() {
        return "admin/admin_notice"; 
    }
	
	@GetMapping("/adminpayd")
    public String adminpayd() {
        return "admin/admin_pay_detail"; 
    }
	
	@GetMapping("/adminpay")
    public String adminpay() {
        return "admin/admin_pay"; 
    }
	
	@GetMapping("/adminreview")
    public String adminreview() {
        return "admin/admin_review"; 
    }
	
	// Screen (상영) 컨트롤러 모음 -----------------------------
	
	// <주소 맵핑>
	@GetMapping("/adminscreen")
	public String adminscreen(Model model) {
		
		// ----------- select박스 리스트 가져오기 ---------------
		 List<MovieDTO> movieList = adminService.listMovie();
		 List<TheaterDTO> theaterList = adminService.listTheater();
		 List<RoomDTO> roomList = adminService.listRoom();
		 List<ScreenDTO> screenList = adminService.listScreen(); // 기존 목록용

	    model.addAttribute("movieList", movieList);
	    model.addAttribute("theaterList", theaterList);
	    model.addAttribute("roomList", roomList);
	    model.addAttribute("screenList", screenList);
	    
	    
        return "admin/admin_screen"; 
    }
	
	// <상영 정보 추가>
	@PostMapping("/insertscreen")
	public String insertScreen(@RequestParam("movie_id") int movie_id, @RequestParam("theater_id") int theater_id, @RequestParam("room_id") int room_id, @RequestParam("screen_date") String dateStr,
		    @RequestParam("screen_start_time") String startStr, @RequestParam("screen_end_time") String endStr) {
		
		
		// --------- DB 넣을때 문자열 변환 ---------
		Timestamp start = Timestamp.valueOf(dateStr + " " + startStr + ":00");
	    Timestamp end = Timestamp.valueOf(dateStr + " " + endStr + ":00");

	    Date date = Date.valueOf(dateStr); // yyyy-MM-dd 형식

	    ScreenDTO screenDTO = new ScreenDTO();
	    screenDTO.setMovie_id(movie_id);
	    screenDTO.setTheater_id(theater_id);
	    screenDTO.setRoom_id(room_id);
	    screenDTO.setScreen_date(date);
	    screenDTO.setScreen_start_time(start);
	    screenDTO.setScreen_end_time(end);
		
		
	    adminService.insertScreen(screenDTO);
	    return "redirect:/admin/adminscreen"; 
	}

	// <상영 정보 리스트>
	@GetMapping("/listscreen")
	public String listScreen(Model model) {
	    List<ScreenDTO> screenList = adminService.listScreen();
	    model.addAttribute("screenList", screenList);
	    return "admin/screen_list";
	}
	
	// <상영 정보 삭제>
	@GetMapping("/admin/deletescreen")
	public String deleteScreen(@RequestParam("screen_id") int screen_id) {
	    adminService.deleteScreen(screen_id);
	    return "redirect:/admin/adminscreen";  
	}
	
	// Screen (상영) 서비스 모음 -----------------------------
	
}
