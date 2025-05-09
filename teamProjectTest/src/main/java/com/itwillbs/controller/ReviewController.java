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
             model.addAttribute("movieDTO", movie);
            
            return "review/review";
        }
        
        // ✅ 감정 분석 결과 통계
//      Map<String, Integer> sentiment = reviewService.countSentimentByMovieId(movieId);
//      model.addAttribute("positive", sentiment.getOrDefault("positive", 0));
//      model.addAttribute("negative", sentiment.getOrDefault("negative", 0));

   }
    
    // (옵션) 특정 영화의 리뷰 목록 불러오기
    @GetMapping("/list/{movieId}")
    @ResponseBody
    public List<ReviewDTO> getReviewList(@PathVariable("movieId") int movieId) {
    	System.out.println("getReviewList" + movieId);
        return reviewService.getReviewsByMovieId(movieId);
    }
    
    // 리뷰 등록
    @PostMapping("/add")
    @ResponseBody
    public ReviewDTO addReview(@RequestBody ReviewDTO reviewDTO) {
    	System.out.println("addReview");
        reviewService.insertReview(reviewDTO);
        return reviewDTO;
    }

    // 리뷰 삭제
    @DeleteMapping("/delete/{reviewId}")
    @ResponseBody
    public ResponseEntity<?> deleteReview(@PathVariable int reviewId) {
        System.out.println(" deleteReview: reviewId=" + reviewId);
        reviewService.deleteReview(reviewId);
        return ResponseEntity.ok().build();
    }
    
    // 리뷰 수정
    @PutMapping("/edit/{reviewId}")
    @ResponseBody
    public ResponseEntity<?> editReview(@PathVariable("reviewId") int reviewId,
                                        @RequestBody Map<String, String> body) {
        System.out.println("✅ editReview() 호출됨 - reviewId: " + reviewId);
        
        String content = body.get("reviewContent");
        if (content == null || content.trim().isEmpty()) {
            return ResponseEntity.badRequest().body("내용이 없습니다.");
        }

        reviewService.updateReviewContent(reviewId, content);
        return ResponseEntity.ok().build();
    }


}
