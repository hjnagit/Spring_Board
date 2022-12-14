package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.BoardVO;
import com.itwillbs.domain.PageVO;

public interface BoardDAO {
	
	//글쓰기
	public void insertBoard(BoardVO vo) throws Exception;
	
	//글 전체 목록 - listAll
	public List<BoardVO> listAll() throws Exception;
	
	//글 내용
	public BoardVO getBoard(Integer bno) throws Exception;
	  
	//글 조회수 1증가
	public void updateReadCount(Integer bno) throws Exception;
	
	//글 내용 수정
	public Integer updateBoard(BoardVO vo) throws Exception;
	
	//글 삭제
	public Integer deleteBoard(Integer bno) throws Exception;
	
	//글 전체 목록 - listPage(page)
	public List<BoardVO> listPage(Integer page) throws Exception;
	
	//글 전체 목록 - listPage(pageVO)
	public List<BoardVO> listPage(PageVO vo) throws Exception;

}
