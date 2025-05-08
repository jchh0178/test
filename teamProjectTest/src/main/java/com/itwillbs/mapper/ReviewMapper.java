package com.itwillbs.mapper;

import java.util.List;


import com.itwillbs.domain.ReviewDTO;

public interface ReviewMapper {
    void insertReview(ReviewDTO review);
    void deleteReview(int reviewId);
    void updateReview(ReviewDTO review);
//    Map<String, Integer> countSentimentByMovieId(int movieId);
    List<ReviewDTO> getReviewsByMovieId(int movieId);
}

