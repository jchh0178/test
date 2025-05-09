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
    
	
	
}
