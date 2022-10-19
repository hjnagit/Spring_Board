package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.BoardVO;

public interface BoardDAO {
	
	//글쓰기
	public void insertBoard(BoardVO vo) throws Exception;
	
	//글 전체 목록 - listAll
	public List<BoardVO> listAll() throws Exception;
	
	//글 내용
	public BoardVO getBoard(Integer bno) throws Exception;
	  
	
	
}
