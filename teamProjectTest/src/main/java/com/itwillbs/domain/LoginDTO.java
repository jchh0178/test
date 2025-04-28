package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class LoginDTO {

	private String member_id;
	private String member_pass;
	private String member_name;
	private String member_email;
	private String member_address;
	private String member_birth;
	private Date member_date;
	private String member_phone;
	private String member_gender;
	private String member_status;
	private String member_like_genre;
	private int theater_id;
	private int iskako;
	private int isnaver;
	
	
	
	
}
