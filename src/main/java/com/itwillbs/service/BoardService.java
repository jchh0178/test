package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Inject
	private BoardMapper boardMapper;

	public void insertBoard(BoardDTO boardDTO) {
		System.out.println("BoardService insertBoard");
		// name, subject, content, file 받아 옴
		// num, readcount, rdate
		if(boardMapper.getMaxNum() == null) {
			boardDTO.setNum(1);
		}else {
			boardDTO.setNum(boardMapper.getMaxNum() + 1);
		}
		
		boardDTO.setReadcount(0);
		boardDTO.setRdate(new Timestamp(System.currentTimeMillis() + 1));
		
		boardMapper.insertBoard(boardDTO);
	}//insertBoard()

	public List<BoardDTO> listBoard(PageDTO pageDTO) {
		System.out.println("BoardService listBoard");
		// 시작하는 행번호
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		
		// 끝나는 행번호 
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		// limit #{startRow - 1}, #{pageSize}
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return boardMapper.listBoard(pageDTO);
	}//listBoard()

	public Integer countBoard(PageDTO pageDTO) {
		System.out.println("BoardService countBoard");
		
		return boardMapper.countBoard(pageDTO);
	}//countBoard()

	public void updateBoard(BoardDTO boardDTO) {
		System.out.println("BoardService updateBoard");
		
		boardMapper.updateBoard(boardDTO);
	}
	public void updateReadcount(int num) {
		System.out.println("BoardService updateReadcount");
		
		boardMapper.updateReadcount(num);
	}

	public BoardDTO contentBoard(int num) {
		System.out.println("BoardService contentBoard");
		
		return boardMapper.contentBoard(num);
	}

	public void deleteBoard(BoardDTO boardDTO) {
		System.out.println("BoardService deleteBoard");

		boardMapper.deleteBoard(boardDTO);
		
	}

}//클래스
