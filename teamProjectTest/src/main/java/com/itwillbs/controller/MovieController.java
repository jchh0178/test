package com.itwillbs.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieController {

    @Inject
    private MovieService movieService;

//    @GetMapping("/save")
//    public String saveMovies() {
//    	System.out.println("MovieController saveMovies()");
//        String today = LocalDate.now().minusDays(1).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
//        movieService.insertMoviesFromAPI(today);
//        return "redirect:/movie/main";
//    }
    
    @GetMapping("/insertMovie")
    public String insertMovie() {
    	System.out.println("MovieController insertMovie()");
    	
    	return "/admin/admin_movie_insert";
    }
    
    @GetMapping("/main")
    public String showMovies(HttpServletRequest request ,Model model) {
    	System.out.println("MovieController showMovies()");
    	
    	// 한 화면에 보여줄 글개수 설정
    	int pageSize = 5;
    	String pageNum = request.getParameter("pageNum");
    	if(pageNum == null) {
    		pageNum = "1";
    	}
    	int currentPage = Integer.parseInt(pageNum);
    	
    	PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
    	
		List<MovieDTO> movieList = movieService.getMovieList(pageDTO);
//	    for (MovieDTO dto : movieList) {
//	        System.out.println(dto.getMovieNm() + " / " + dto.getPosterUrl());
//	    }
		
//		게시판 전체 글개수
		int count = movieService.countMovie();
		
//		한 화면에 보여줄 페이지 개수
		int pageBlock = 5;
//		한 화면에 보여줄 시작페이지 번호
		int startPage = (currentPage -1)/pageBlock * pageBlock + 1;
//		한 화면에 보여줄 끝페이지 번호
		int endPage = startPage + pageBlock - 1;
//		전체 페이지 개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
//		pageDTO 저장
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("movieList", movieList);
        return "movie/movieMain";
        
//        api활용 정보 출력하는 코드
        
//        System.out.println("MovieController showMovies()");
//        String today =  LocalDate.now().minusDays(1).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
//        List<MovieDTO> movies = movieService.getBoxOffice(today); // ✅ DB 대신 API 호출
//        for (MovieDTO movie : movies) {
//            String posterUrl = movieService.getPosterUrlFromTMDB(movie.getMovieNm());
//            movie.setPosterUrl(posterUrl);
//            System.out.println(posterUrl);
//        }
//        model.addAttribute("movies", movies);
//        return "movie/main";
    }
    
    @GetMapping("/detail")
    public String showMovieDetail(@RequestParam("movieCd") String movieCd, Model model) {
        MovieDTO movie = movieService.getMovieDetail(movieCd);
        model.addAttribute("movie", movie);
        return "movie/movieDetail";
    }
    
    @GetMapping("/mbooking")
    public String booking() {
        return "movie/booking"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
    
	@GetMapping("/mreview")
    public String review() {
        return "movie/review"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
	
	@GetMapping("/mseat")
    public String seat() {
        return "movie/seat"; // → /WEB-INF/views/spring/qna/qna_main.jsp 로 연결됨!
    }
}
