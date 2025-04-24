package com.itwillbs.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	// BoardService 객체생성
	@Inject
	private BoardService boardService;
	
//	servlet-context.xml에 물리적 경로 가져오기
//<beans:bean id="uploadPath" class="java.lang.String">
//	<beans:constructor-arg value="D:\\Shared\\JSP\\workspace_sts\\TourWeb\\src\\main\\webapp\\resources\\upload"></beans:constructor-arg>
//</beans:bean>
	@Resource(name = "uploadPath")
	private String uploadPath;

//	http://localhost:8080/TourWeb/board/main     get방식
//	=> 주소변경없이 화면으로 /WEB-INF/views/main/main.jsp 이동
	@GetMapping("/main")
	public String main() {
		System.out.println("BoardController main()");
		
		return "/main/main";
	}//main()
	
//	http://localhost:8080/TourWeb/board/fwrite get방식
//	=> 주소변경없이 화면으로 /WEB-INF/views/notice/fwrite.jsp 이동
	@GetMapping("/fwrite")
	public String fwrite() {
		System.out.println("BoardController fwrite()");
		
		return "/notice/fwrite";
	}//fwrite()
	
	@PostMapping("/fwritePro")
	public String fwritePro(HttpServletRequest request, MultipartFile file) throws Exception {
		System.out.println("BoardController fwritePro()");
		System.out.println(file.getOriginalFilename());// 파일이름
//		file.getBytes() => 실제 파일
		// 파일 업로드 (복사)
//		1) src/main/webapp/resources/upload 폴더 만들기
//		2) pom.xml 프로그램 설치
//		commons-fileupload, commons-io, jakarta.annotation
//		3) servlet-context.xml 업로드 객체생성, 업로드 경로 지정
		
		//업로드할 파일이름 만들기 => 중복파일 없게 => 랜덤문자_파일이름
		UUID uuid = UUID.randomUUID();
		String filename = uuid.toString() + "_" + file.getOriginalFilename();
		
		// 파일 복사 원본파일 => 업로드폴더, 파일이름 
		FileCopyUtils.copy(file.getBytes(), new File(uploadPath, filename));
		
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setName(request.getParameter("name"));
		boardDTO.setSubject(request.getParameter("subject"));
		boardDTO.setContent(request.getParameter("content"));
		//file추가
		boardDTO.setFile(filename);
		
		boardService.insertBoard(boardDTO);
		
		return "redirect:/board/list";
	}//writePro()
	
	
	
	// /board/write
//	http://localhost:8080/TourWeb/board/write     get방식
//	=> 주소변경없이 화면으로 /WEB-INF/views/notice/write.jsp 이동
	@GetMapping("/write")
	public String write() {
		System.out.println("BoardController write()");
		
		return "/notice/write";
	}//write()
	
//	http://localhost:8080/TourWeb/board/writePro     post방식
//	BoardDTO boardDTO 받기
//	패키지 com.itwillbs.service, 파일이름 BoardService
//	insertBoard(boardDTO)메서드 호출
//	=> 주소변경하면서 /board/list 이동
	@PostMapping("/writePro")
	public String writePro(BoardDTO boardDTO) {
		System.out.println("BoardController writePro()");
		
		
		boardService.insertBoard(boardDTO);                               
		
		return "redirect:/board/list";
	}//writePro()
	@GetMapping("/update")
	public String update(Model model, int num) {
		System.out.println("BoardController update()");
		
		BoardDTO boardDTO = boardService.contentBoard(num);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "/notice/update";
	}
	
	@PostMapping("/updatePro")
	public String updatePro(BoardDTO boardDTO) {
		System.out.println("BoardController update()");
		
		boardService.updateBoard(boardDTO);
		
		
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/delete")
	public String delete(BoardDTO boardDTO) {
		System.out.println("BoardController update()");

		boardService.deleteBoard(boardDTO);
		
		
		return "redirect:/board/list";
	}

	
//	http://localhost:8080/TourWeb/board/list               get방식
//	http://localhost:8080/TourWeb/board/list?pageNum=7     get방식
//	=> 주소변경없이 화면으로 /WEB-INF/views/notice/notice.jsp 이동
	@GetMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		System.out.println("BoardController list()");
		//한 화면에 보여줄 글개수 설정 10개
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		//검색어 가져오기
		String search = request.getParameter("search");
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setSearch(search);
		
		List<BoardDTO> boardList = boardService.listBoard(pageDTO);
		
//		게시판 전체 글개수
//		int count = boardService.countBoard();
		//검색어 포함
		int count = boardService.countBoard(pageDTO);
		
//		한 화면에 보여줄 페이지 개수
		int pageBlock = 5;
//		한 화면에 보여줄 시작페이지 번호
		int startPage = (currentPage -1)/pageBlock * pageBlock + 1;
//		한 화면에 보여줄 끝페이지 번호
		int endPage = startPage + pageBlock - 1;
//		전체 페이지 개수 구하기
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
//		pageDTO 저장
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "/notice/notice";
	}//list()
	
//	http://localhost:8080/TourWeb/board/content?num=7     get방식
//	int num = request.,..
//	updateReadcount(num) 조회수 증가 메서드 호출
//	BoardDTO boardDTO = contentBoard(num) 메서드 호출
//	model "boardDTO",boardDTO 담아서 
//	=> 주소변경없이 화면으로 /WEB-INF/views/notice/content.jsp 이동
	@GetMapping("/content")
	public String content(HttpServletRequest request, Model model) {
		System.out.println("BoardController content()");
		int num = Integer.parseInt(request.getParameter("num"));
		boardService.updateReadcount(num);
		BoardDTO boardDTO = boardService.contentBoard(num);
		model.addAttribute("boardDTO", boardDTO);
		return "/notice/content";
	}//content()

//	http://localhost:8080/TourWeb/board/update?num=7     get방식
//  int num = 
//	BoardDTO boardDTO = contentBoard(num) 메서드 호출
//	model "boardDTO",boardDTO 담아서 
//	=> 주소변경없이 화면으로 /WEB-INF/views/notice/update.jsp 이동	
	
//	http://localhost:8080/TourWeb/board/program     get방식
//	=> 주소변경없이 화면으로 /WEB-INF/views/program/program.jsp 이동
	@GetMapping("/program")
	public String program() {
		System.out.println("BoardController program()");
		
		return "/program/program";
	}//program()
	
}//클래스
