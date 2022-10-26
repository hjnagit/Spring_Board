package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.BoardVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	//객체 생성
	//BoardDAO 객체 주입(DI)
	@Inject
	private BoardDAO dao;

	//글쓰기
	@Override
	public void boardWrite(BoardVO vo) throws Exception {
		log.info("boardWrite(vo) 호출");
		
		//DAO - insertBoard(vo) 호출
		dao.insertBoard(vo);
	}
	
	//글 전체 목록
	@Override
	public List<BoardVO> getBoardListAll() throws Exception {
		log.info("getBoardListAll() 호출");
		log.info("DAO - listAll 호출 ");
		log.info("확이하려면 리스트 사이즈를 출력해서 확인한다");
		
		return dao.listAll();
	}
	
	//글 내용
	@Override
	public BoardVO getBoard(Integer bno) throws Exception {
		
		return dao.getBoard(bno);
	}
	
	//글 조회수 1증가
	@Override
	public void updateReadCount(Integer bno) throws Exception {
		log.info("updateReadCount(Integer bno) 호출");
		
		//DAO - updateReadCount(bno)
		dao.updateReadCount(bno);
	}
	
	//글 내용 수정하기
	@Override
	public Integer updateBoard(BoardVO vo) throws Exception {
		return dao.updateBoard(vo);
	}
	
	//글 삭제하기
	@Override
	public Integer deleteBoard(Integer bno) throws Exception {
		return dao.deleteBoard(bno);
	}

	@Override
	public List<BoardVO> listPage(PageVO vo) throws Exception {
		return dao.listPage(vo);
	}
	
	
	
	
}
