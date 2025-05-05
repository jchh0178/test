package com.itwillbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @GetMapping("/{movieId}")
    public String getReviews(@PathVariable int movieId, Model model) {
        List<ReviewDTO> reviews = reviewService.getReviewsByMovieId(movieId);
        model.addAttribute("reviews", reviews);
        model.addAttribute("movieId", movieId); // 영화 정보도 전달해야 함
        return "review/reviewList"; // JSP 경로
    }

    @PostMapping("/api/add")
    @ResponseBody
    public ResponseEntity<ReviewDTO> addReview(@RequestBody ReviewDTO reviewDTO) {
        reviewService.addReview(reviewDTO);
        return ResponseEntity.ok(reviewDTO);
    }

    @PutMapping("/api/edit/{id}")
    @ResponseBody
    public ResponseEntity<?> editReview(@PathVariable int id, @RequestBody ReviewDTO reviewDTO) {
        reviewDTO.setReviewId(id);
        reviewService.updateReview(reviewDTO);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/api/delete/{id}")
    @ResponseBody
    public ResponseEntity<?> deleteReview(@PathVariable int id) {
        reviewService.deleteReview(id);
        return ResponseEntity.ok().build();
    }
}
