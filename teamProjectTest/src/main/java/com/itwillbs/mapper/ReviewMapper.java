package com.itwillbs.mapper;

import java.util.List;
import com.itwillbs.domain.ReviewDTO;

public interface ReviewMapper {
    List<ReviewDTO> getReviewsByMovieId(int movieId);
    ReviewDTO getReviewById(int reviewId);
    void insertReview(ReviewDTO reviewDTO);
    void updateReview(ReviewDTO reviewDTO);
    void deleteReview(int reviewId);
}