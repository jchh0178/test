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
	
//	public int getCount() {
//		return count;
//	}
//	public void setCount(int count) {
//		this.count = count;
//	}
//	public int getPageBlock() {
//		return pageBlock;
//	}
//	public void setPageBlock(int pageBlock) {
//		this.pageBlock = pageBlock;
//	}
//	public int getStartPage() {
//		return startPage;
//	}
//	public void setStartPage(int startPage) {
//		this.startPage = startPage;
//	}
//	public int getEndPage() {
//		return endPage;
//	}
//	public void setEndPage(int endPage) {
//		this.endPage = endPage;
//	}
//	public int getPageCount() {
//		return pageCount;
//	}
//	public void setPageCount(int pageCount) {
//		this.pageCount = pageCount;
//	}
//	public int getPageSize() {
//		return pageSize;
//	}
//	public void setPageSize(int pageSize) {
//		this.pageSize = pageSize;
//	}
//	public String getPageNum() {
//		return pageNum;
//	}
//	public void setPageNum(String pageNum) {
//		this.pageNum = pageNum;
//	}
//	public int getCurrentPage() {
//		return currentPage;
//	}
//	public void setCurrentPage(int currentPage) {
//		this.currentPage = currentPage;
//	}
//	public int getStartRow() {
//		return startRow;
//	}
//	public void setStartRow(int startRow) {
//		this.startRow = startRow;
//	}
//	public int getEndRow() {
//		return endRow;
//	}
//	public void setEndRow(int endRow) {
//		this.endRow = endRow;
//	}
	
	
}
