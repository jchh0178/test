package com.itwillbs.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MovieDTO {
	private int movie_id;
    private String movie_cd;
    private String movie_nm;
    private String open_dt;
    private int movie_rank;
    private String poster_url;
    
   
}