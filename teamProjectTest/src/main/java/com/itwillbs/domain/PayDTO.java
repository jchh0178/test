package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class PayDTO {

	private int booth_id;
    private String member_id;
    private int pay_price;
    private String pay_method;
    private String pay_status;
    private Timestamp pay_date;
    private int booth_type_id;
	
	
	
	
}
