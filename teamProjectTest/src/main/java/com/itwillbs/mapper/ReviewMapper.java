package com.itwillbs.mapper;

import java.util.List;
import com.itwillbs.domain.ReviewDTO;

public interface ReviewMapper {
    void insertReview(ReviewDTO reviewDTO);
    void updateReview(ReviewDTO reviewDTO);
    void deleteReview(int reviewId);
    ReviewDTO getReviewById(int reviewId);
    List<ReviewDTO> getReviewsByMovieId(int movieId);
}
