package com.itwillbs.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

public class ReviewDTO {
    private int reviewId;
    private String memberId;
    private int movieId;
    private int reviewRating;
    private String reviewContent;
    private boolean reviewSelect;
    private Timestamp reviewDate;
    private int reviewLike;
    private String reviewEmotion;  // 긍정/부정 감정 분석 결과를 저장하는 필드
    
    
	public String getReviewEmotion() {
		return reviewEmotion;
	}
	public void setReviewEmotion(String reviewEmotion) {
		this.reviewEmotion = reviewEmotion;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public int getReviewRating() {
		return reviewRating;
	}
	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public boolean isReviewSelect() {
		return reviewSelect;
	}
	public void setReviewSelect(boolean reviewSelect) {
		this.reviewSelect = reviewSelect;
	}
	public Timestamp getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Timestamp reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReviewLike() {
		return reviewLike;
	}
	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}

   
}
