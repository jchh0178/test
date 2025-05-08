package com.itwillbs.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class PageDTO {
	
	private int pageSize;
	private String pageNum;
	private int currentPage;
	private int startRow;
	private int endRow;	
	private int count;
	private int pageBlock;
	private int endPage;
	private int startPage;
	private int pageCount;
	private String search;
	
	
	
}
