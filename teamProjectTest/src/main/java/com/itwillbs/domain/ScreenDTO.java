package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class ScreenDTO {

	private int screen_id;
    private int movie_id;
    private int theater_id;
    private int room_id;
    private Date screen_date;
    private Timestamp screen_start_time;
    private Timestamp screen_end_time;
    
    // join용 필드
    private String movie_nm;
    private String theater_name;
    private String room_name;
	
	
}
