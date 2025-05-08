package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.service.MovieService;
import com.itwillbs.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;
    @Autowired
    private MovieService movieService;
    
//    /** ✅ [1] 리뷰 JSP 렌더링용 메서드 */
    @GetMapping("/review")
    public String showReviewPage(@RequestParam("movieId") int movieId, Model model) {
    	System.out.println("showReviewPage()");
    	
        MovieDTO movie = movieService.getMovieById(movieId);
        if (movie == null) {
            return "redirect:/main/main";
        }else {
            List<ReviewDTO> reviews = reviewService.getReviewsByMovieId(movieId);
            model.addAttribute("movieDTO", movie);
            model.addAttribute("reviews", reviews);
            
            return "review/review";
        }
        // ✅ 감정 분석 결과 통계
//      Map<String, Integer> sentiment = reviewService.countSentimentByMovieId(movieId);
//      model.addAttribute("positive", sentiment.getOrDefault("positive", 0));
//      model.addAttribute("negative", sentiment.getOrDefault("negative", 0));

   }
    // 리뷰 등록
    @PostMapping("/add")
    @ResponseBody
    public ReviewDTO addReview(@RequestBody ReviewDTO reviewDTO) {
        reviewService.insertReview(reviewDTO);
        return reviewDTO;
    }

    // 리뷰 삭제
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<?> deleteReview(@PathVariable int id) {
        System.out.println("\uD83D\uDDD1 삭제 요청 들어옴 id=" + id);
        reviewService.deleteReview(id);
        return ResponseEntity.ok().build();
    }

    // 리뷰 수정
    @PutMapping("/edit/{id}")
    @ResponseBody
    public ResponseEntity<?> editReview(@PathVariable int id, @RequestBody Map<String, String> body) {
        String content = body.get("reviewContent");
        reviewService.updateReviewContent(id, content);
        return ResponseEntity.ok().build();
    }

//    // (옵션) 특정 영화의 리뷰 목록 불러오기
//    @GetMapping("/list/{movieId}")
//    public List<ReviewDTO> getReviewList(@PathVariable("movieId") int movieId) {
//        return reviewService.getReviewsByMovieId(movieId);
//    }
}
