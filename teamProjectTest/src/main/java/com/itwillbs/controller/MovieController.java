package com.itwillbs.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.domain.Movie;
import com.itwillbs.domain.MovieDTO.BoxOfficeResponse;
import com.itwillbs.service.MovieService;

@Controller
@RequestMapping("/movies")
public class MovieController {

    @Inject
    private MovieService movieService;

    // 박스오피스 데이터 저장
    @RequestMapping("/saveBoxOffice")
    public String saveBoxOffice(@RequestParam(required = false) String date) {
        if (date == null || date.isEmpty()) {
            LocalDate today = LocalDate.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
            date = today.format(formatter);
        }
        movieService.saveBoxOfficeToDB(date);
        return "redirect:/movies/main";
    }

    // 저장된 영화 목록 보여주기
    @RequestMapping("/main")
    public String showMain(Model model) {
        List<Movie> movies = movieService.getAllMovies();
        model.addAttribute("movies", movies);
        return "movie/main";
    }

	
	@RequestMapping("/mmain")
    public String main() {
        return "movie/main"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/mmaind")
    public String maind() {
        return "movie/main_detail"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/mbooking")
    public String booking() {
        return "movie/booking"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
    
	@RequestMapping("/mreview")
    public String review() {
        return "movie/review"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@RequestMapping("/mseat")
    public String seat() {
        return "movie/seat"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
}
