
package com.itwillbs.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class MovieDTO {
	private int movieId;
	private String title;
    private String movieCd;
    private String movieNm;
    private String openDt;
    private int rank;
    private String posterUrl;
    
    // 영화 상세정보 추가
    private String movieNmEn;
    private String prdtYear;
    private String prdtStatNm;
    private String nationNm;
    private String genreNm;
    private String showTm;
    private String directors;
    private String actors;
    private String actorRoles;
    private String watchGradeNm;
    private String showType;
    private String audits;
    private String summary;

}



