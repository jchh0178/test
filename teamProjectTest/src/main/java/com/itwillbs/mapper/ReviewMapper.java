package com.itwillbs.mapper;

import java.util.List;


import com.itwillbs.domain.ReviewDTO;

public interface ReviewMapper {
    void insertReview(ReviewDTO reviewDTO);
    int deleteReview(int reviewId);
    void updateReview(ReviewDTO reviewDTO);
    void updateReviewContent(ReviewDTO reviewDTO);
//    Map<String, Integer> countSentimentByMovieId(int movieId);
    List<ReviewDTO> getReviewsByMovieId(int movieId);
}

