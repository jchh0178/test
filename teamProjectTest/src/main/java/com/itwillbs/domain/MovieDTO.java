package com.itwillbs.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieDTO {
    private String movieCd;
    private String movieNm;
    private String openDt;
    private int movieRank;
    private String posterUrl;
}