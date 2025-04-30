package com.itwillbs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

@Mapper
public interface BoardMapper {

	public void insertBoard(BoardDTO boardDTO);

	public Integer getMaxNum();

	public List<BoardDTO> listBoard(PageDTO pageDTO);

	public Integer countBoard(PageDTO pageDTO);

	public BoardDTO contentBoard(int num);

	public void updateReadcount(int num);

	public void updateBoard(BoardDTO boardDTO);

	public void deleteBoard(int num);

	
	

}
