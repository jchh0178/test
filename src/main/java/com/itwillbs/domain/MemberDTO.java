package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//p38 롬복 (Lombok) 라이브러리 설치
//https://projectlombok.org/download
//다운로드 Download 1.18.38  => lombok.jar
//cmd
//cd Downloads
//java -jar lombok.jar

//pom.xml
//<!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
//<dependency>
//<groupId>org.projectlombok</groupId>
//<artifactId>lombok</artifactId>
//<version>1.18.38</version>
//<scope>provided</scope>
//</dependency>

//p64 Lombok 관련 어노테이션
//@Setter
//@Getter
//@ToString
//@Data
//@Log4j

// 회원관련 데이터를 저장해서 전달
@Setter
@Getter
@ToString
public class MemberDTO {
//	객체지향개념 특징 : 데이터 은닉(캡슐화)
//	멤버변수 : 외부에 접근 못하게 막아줌(데이터 은닉, 접근 제어자 private)
	private String id;
	private String passwd;
	private String name;
	
	private String phone;
	private String email;
	private String gender;
	private String agree;
	private String content;
	private Timestamp rdate;
	

//	//	alt shift s => shift s
//
//	@Override
//public String toString() {
//	return "MemberDTO [id=" + id + ", passwd=" + passwd + ", name=" + name + ", phone=" + phone + ", email=" + email
//			+ ", gender=" + gender + ", agree=" + agree + ", content=" + content + ", rdate=" + rdate + "]";
//}	
//	
////	생성자()
////	메서드() : 외부에서 멤버변수를 접근 할 수 있게 setter, getter 메서드 정의
////	alt shift s => r	
//	
//public String getPhone() {
//		return phone;
//	}
//
//
//
//
//
//	public void setPhone(String phone) {
//		this.phone = phone;
//	}
//
//
//	public String getEmail() {
//		return email;
//	}
//
//
//	public void setEmail(String email) {
//		this.email = email;
//	}
//
//
//	public String getGender() {
//		return gender;
//	}
//
//
//	public void setGender(String gender) {
//		this.gender = gender;
//	}
//
//
//	public String getAgree() {
//		return agree;
//	}
//
//
//	public void setAgree(String agree) {
//		this.agree = agree;
//	}
//
//
//	public String getContent() {
//		return content;
//	}
//
//
//	public void setContent(String content) {
//		this.content = content;
//	}
//
//
//	public Timestamp getRdate() {
//		return rdate;
//	}
//
//
//	public void setRdate(Timestamp rdate) {
//		this.rdate = rdate;
//	}
//
//
//	public String getId() {
//		return id;
//	}
//	public void setId(String id) {
//		this.id = id;
//	}
//	public String getPasswd() {
//		return passwd;
//	}
//	public void setPasswd(String passwd) {
//		this.passwd = passwd;
//	}
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	


	
	
}
