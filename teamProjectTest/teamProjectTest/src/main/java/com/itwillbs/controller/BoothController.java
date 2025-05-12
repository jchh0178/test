package com.itwillbs.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.LoginDTO;
import com.itwillbs.domain.MovieDTO2;
import com.itwillbs.domain.ScreenDTO;
import com.itwillbs.domain.TheaterDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.BoothService;


@Controller
@RequestMapping("/booth")
public class BoothController {

   @Inject
   private BoothService boothService;
   
   @Inject
   private AdminService adminService;
   
   @GetMapping("/booking")
    public String booking(Model model) {
      List<MovieDTO2> movies = adminService.listMovie();
       List<TheaterDTO> theaters = adminService.listTheater();
       
       //지역별 극장 나누기
       List<String> regions = theaters.stream()
                .map(TheaterDTO::getTheater_region)
                .distinct()
                .collect(Collectors.toList());
       
       model.addAttribute("movies", movies);
       model.addAttribute("theaters", theaters);
       model.addAttribute("regions", regions);
       
        return "booth/booking2"; 
    }
   
   @GetMapping("/schedules")
   @ResponseBody
   public List<ScreenDTO> listScreen(@RequestParam String screen_date) {
      
       return boothService.listScreen(screen_date);  // screen_date 기준 조회
   }
    
   @PostMapping("/confirm")
   public String bookingConfirm(@RequestParam int screen_id, @RequestParam String seats, HttpSession session, Model model) {
       System.out.println("BoothController bookingConfirm");

       LoginDTO loginDTO = (LoginDTO) session.getAttribute("loginDTO");

       if (loginDTO == null) {
           System.out.println("로그인 정보 없음, 예약 불가");
           return "redirect:/login";
       }

       String member_id = loginDTO.getMember_id();
       System.out.println("세션에 저장된 member_id : " + member_id);

       int booth_id = boothService.insertBooth(member_id, screen_id, seats);

       session.setAttribute("booth_id", booth_id);
       session.setAttribute("booth_type_id", 1);

       // 고객 이름 모델에 추가
       model.addAttribute("customerName", loginDTO.getMember_name());
       
       MovieDTO2 movieDTO = boothService.getMovieByScreenId(screen_id);
       System.out.println(movieDTO);
       System.out.println("포스터 URL: " + movieDTO.getPoster_url());
       model.addAttribute("poster", movieDTO.getPoster_url());

       return "booth/confirm";  
   }
   
   @GetMapping("/seat")
    public String seat() {
        return "booth/seat";
    }
}