package com.itwillbs.service;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.mapper.ReviewMapper;

import java.util.List;

@Service
public class ReviewService {

    private ReviewMapper reviewMapper;


    public List<ReviewDTO> getReviewsByMovieId(int movieId) {
        return reviewMapper.getReviewsByMovieId(movieId);
    }

    public ReviewDTO getReviewById(int reviewId) {
        return reviewMapper.getReviewById(reviewId);
    }

    public void addReview(ReviewDTO reviewDTO) {
        reviewMapper.insertReview(reviewDTO);
    }

    public void updateReview(ReviewDTO reviewDTO) {
        reviewMapper.updateReview(reviewDTO);
    }

    public void deleteReview(int reviewId) {
        reviewMapper.deleteReview(reviewId);
    }
}

