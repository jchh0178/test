package com.itwillbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.mapper.ReviewMapper;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;

    @Autowired
    private OpenAiService openAiService;

	public void insertReview(ReviewDTO reviewDTO) throws Exception {
        // ✅ 감정 분석 결과 저장
        String sentiment = openAiService.analyzeSentiment(reviewDTO.getReviewContent());
        reviewDTO.setSentiment(sentiment); // DTO에 sentiment 필드 추가해야 함
		reviewMapper.insertReview(reviewDTO);
	}

	public int deleteReview(int reviewId) {
		return reviewMapper.deleteReview(reviewId);
	}

	public void updateReview(int reviewId, String content) {
	    String sentiment;
	    try {
	        sentiment = openAiService.analyzeSentiment(content);
	    } catch (Exception e) {
	        e.printStackTrace();
	        sentiment = "error";
	    }

	    ReviewDTO reviewDTO = new ReviewDTO();
	    reviewDTO.setReviewId(reviewId);
	    reviewDTO.setReviewContent(content);
	    reviewDTO.setSentiment(sentiment);

	    reviewMapper.updateReview(reviewDTO);
	}


	public List<ReviewDTO> getReviewsByMovieId(int movieId) {
		return reviewMapper.getReviewsByMovieId(movieId);
	}

}

