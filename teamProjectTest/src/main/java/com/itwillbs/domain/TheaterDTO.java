package com.itwillbs.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


//새로만든 mysql theater1 테이블에서 가져오는 값들
@ToString
@Setter
@Getter
public class TheaterDTO {

	private String brand;
	private String region;
	private String name;
	private int code;
	private String special;
	
}
