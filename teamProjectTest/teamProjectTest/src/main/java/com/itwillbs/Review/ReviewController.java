package com.itwillbs.teamProjectTest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	  @Autowired
	    private ReviewService reviewService;

	    // 리뷰 페이지 출력
	    @GetMapping("/review")
	    public String showReviewPage(Model model) {
	        List<Review> reviews = reviewService.getReviews("영화1");
	        model.addAttribute("reviews", reviews);
	        return "movieReview";
	    }

	    // 리뷰 작성 (AJAX)
	    @PostMapping("/api/submitReview")
	    @ResponseBody
	    public Review submitReviewAjax(@RequestBody Map<String, Object> payload) {
	        String username = (String) payload.get("username");
	        int rating = (int) payload.get("rating");
	        String comment = (String) payload.get("comment");

	        Review review = new Review();
	        review.setMovieTitle("영화1");
	        review.setUsername(username);
	        review.setRating(rating);
	        review.setComment(comment);

	        reviewService.saveReview(review);
	        return review; // JSON 반환
	    }

	    // 리뷰 삭제 (AJAX)
	    @DeleteMapping("/api/deleteReview/{id}")
	    @ResponseBody
	    public ResponseEntity<Void> deleteReview(@PathVariable int id) {
	        reviewService.deleteReview(id);
	        return ResponseEntity.ok().build();
	    }

	    // 리뷰 수정 (AJAX)
	    @PutMapping("/api/editReview/{id}")
	    @ResponseBody
	    public ResponseEntity<Void> editReview(@PathVariable int id, @RequestBody Map<String, Object> payload) {
	        String newComment = (String) payload.get("comment");
	        reviewService.updateReview(id, newComment);
	        return ResponseEntity.ok().build();
	    }
	    
	    import OpenAI from "openai";
	    const client = new OpenAI();

	    const response = await client.responses.create({
	        model: "gpt-4.1",
	        input: "Write a one-sentence bedtime story about a unicorn.",
	    });

	    console.log(response.output_text);

}//class
