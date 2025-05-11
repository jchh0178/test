package com.itwillbs.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class PageDTO {
	
	private int pageSize;
	private String pageNum;
	private int currentPage;
	
	private int startRow;
	private int endRow;
	
	// 전체 글 개수
	private int count;
	// 한 화면에 보여줄 페이지 개수
	private int pageBlock;
	// 한 화면에서 보여줄 시작하는 페이지 번호
	private int startPage;
	// 한 화면에서 보여줄 끝나는 페이지 번호
	private int endPage;
	// 전체 페이지 개수
	private int pageCount;
	
	//검색어
	private String search;
	
}
