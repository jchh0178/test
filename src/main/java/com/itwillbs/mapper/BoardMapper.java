package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

@Mapper
public interface BoardMapper {

	//추상메서드
	public Integer getMaxNum();

	public void insertBoard(BoardDTO boardDTO);

	public List<BoardDTO> listBoard(PageDTO pageDTO);

	public Integer countBoard(PageDTO pageDTO);

	public void updateReadcount(int num);

	public BoardDTO contentBoard(int num);

	public void updateBoard(BoardDTO boardDTO);

	public void deleteBoard(BoardDTO boardDTO);
	
}
