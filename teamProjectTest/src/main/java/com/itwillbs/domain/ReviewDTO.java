package com.itwillbs.domain;

import java.sql.Timestamp;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Getter
@Setter
public class ReviewDTO {
    private int reviewId;
    private String memberId;
    private int movieId;
    private float reviewRating;
    private String reviewContent;
    private boolean reviewSelect;
    private Timestamp reviewDate;
    private int reviewLike;
	private String Sentiment;
}