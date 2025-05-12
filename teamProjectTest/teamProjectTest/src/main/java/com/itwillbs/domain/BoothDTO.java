package com.itwillbs.domain;


import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class BoothDTO {

    private int booth_id;
    private String member_id;
    private int screen_id;
    private String seat_name;
    private Timestamp booth_date;
    private String booth_status;

    private String poster_url;
    private String movie_nm;
    private String theater_name;
    private String room_name;
    private String screen_start_time;

}
