package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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

    // 리뷰 페이지를 반환 (예: /review/review?movieId=3)
//    @GetMapping("/review")
//    public String showReviewPage(@RequestParam("movieId") int movieId, Model model) {
//        List<ReviewDTO> reviews = reviewService.getReviewsByMovieId(movieId);
//        model.addAttribute("reviews", reviews);
//        
//        // 임시 영화 정보도 전달
//        Map<String, Object> movie = new HashMap<>();
//        movie.put("movieId", movieId);
//        movie.put("title", "영화 제목 예시");
//        movie.put("description", "영화 설명 예시");
//        model.addAttribute("movie", movie);
//        
//        return "review/review"; // → /WEB-INF/views/review/review.jsp
//    }
    
//    /** ✅ [1] 리뷰 JSP 렌더링용 메서드 */
    @GetMapping("/review")
    public String showReviewPage(@RequestParam("movieId") int movieId, Model model) {
    	System.out.println("showReviewPage()");
    	
        MovieDTO movie = movieService.getMovieById(movieId);
        if (movie == null) {
            return "redirect:/main/main";
        }else {
            List<ReviewDTO> reviews = reviewService.getReviewsByMovieId(movieId);
            model.addAttribute("movie", movie);
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
    public ReviewDTO addReview(@RequestBody ReviewDTO review) {
        reviewService.insertReview(review);
        return review;
    }

    // 리뷰 삭제
    @DeleteMapping("/delete/{id}")
    public void deleteReview(@PathVariable("id") int reviewId) {
        reviewService.deleteReview(reviewId);
    }

    // 리뷰 수정
    @PutMapping("/edit/{id}")
    public void updateReview(@PathVariable("id") int reviewId, @RequestBody ReviewDTO review) {
        review.setReviewId(reviewId);
        reviewService.updateReview(review);
    }
    

//    // (옵션) 특정 영화의 리뷰 목록 불러오기
//    @GetMapping("/list/{movieId}")
//    public List<ReviewDTO> getReviewList(@PathVariable("movieId") int movieId) {
//        return reviewService.getReviewsByMovieId(movieId);
//    }
}
