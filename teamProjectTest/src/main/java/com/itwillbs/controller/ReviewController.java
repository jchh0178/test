package com.itwillbs.controller;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

//ReviewService 인터페이스 import
import com.itwillbs.service.ReviewService;

//Review 클래스 import (보통 DTO 또는 VO)
import com.itwillbs.domain.ReviewDTO;


import java.util.List;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Inject
    private ReviewService reviewService;
	
    @GetMapping("/review")
    public String showReviewPage() {
        return "review/review"; // 이 경로는 /WEB-INF/views/review/review.jsp 를 의미함
    }
    
    

    @GetMapping("/list/{movieId}")
    public String listReviews(@PathVariable int movieId, Model model) {
        List<ReviewDTO> reviews = reviewService.getReviewsByMovieId(movieId);
        model.addAttribute("reviews", reviews);
        return "review/list";
    }

    @GetMapping("/add")
    public String showAddForm() {
        return "review/add";
    }

    @PostMapping("/add")
    public String addReview(@ModelAttribute ReviewDTO reviewDTO) {
        reviewService.addReview(reviewDTO);
        return "redirect:/review/list/" + reviewDTO.getMovieId();
    }

    @GetMapping("/edit/{reviewId}")
    public String showEditForm(@PathVariable int reviewId, Model model) {
    	ReviewDTO reviewDTO = reviewService.getReviewById(reviewId);
        model.addAttribute("ReviewDTO", reviewDTO);
        return "review/edit";
    }

    @PostMapping("/edit")
    public String editReview(@ModelAttribute ReviewDTO reviewDTO) {
        reviewService.updateReview(reviewDTO);
        return "redirect:/review/list/" + reviewDTO.getMovieId();
    }

    @GetMapping("/delete/{reviewId}")
    public String deleteReview(@PathVariable int reviewId) {
    	ReviewDTO reviewDTO = reviewService.getReviewById(reviewId);
        reviewService.deleteReview(reviewId);
        return "redirect:/review/list/" + reviewDTO.getMovieId();
    }
    
}//class
