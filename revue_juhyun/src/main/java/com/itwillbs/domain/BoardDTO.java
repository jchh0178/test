package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class BoardDTO {

	
	//게시판 내용 저장할 변수 선언(num, name, subject, content, rdate, readcount)
	private int num;
	private String name;
	private String subject;
	private String content;
	private Timestamp rdate;
	private int readcount;
	private String file;
	
//	public int getNum() {
//		return num;
//	}
//	public void setNum(int num) {
//		this.num = num;
//	}
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	public String getSubject() {
//		return subject;
//	}
//	public void setSubject(String subject) {
//		this.subject = subject;
//	}
//	public String getContent() {
//		return content;
//	}
//	public void setContent(String content) {
//		this.content = content;
//	}
//	public Timestamp getRdate() {
//		return rdate;
//	}
//	public void setRdate(Timestamp rdate) {
//		this.rdate = rdate;
//	}
//	public int getReadcount() {
//		return readcount;
//	}
//	public void setReadcount(int readcount) {
//		this.readcount = readcount;
//	}
	

	
}
