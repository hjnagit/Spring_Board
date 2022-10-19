package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	

	private static final Logger log = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	//SqlSession객체(디비연결, mybatis, 매퍼, 자원해제)
	@Inject
	private SqlSession sqlSession;
	
	//boardMapper 가상이름 정의
	private static final String NAMESPACE = "com.itwillbs.mapper.BoardMapper";
		
	
	
	// 글쓰기
	@Override
	public void insertBoard(BoardVO vo) throws Exception {
		log.info("insertBoard 호출");
		
		//sql 실행 객체 - sqlSession객체(디비연결, mybatis, 매퍼, 자원해제)
		//글쓰기 insert수행
		int result = sqlSession.insert(NAMESPACE+".create", vo);
		
		if(result > 0)
			log.info(" 글쓰기 완료 ");
	
		
	}


	// 글 전체 목록
	@Override
	public List<BoardVO> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE+".listAll");
	}

	
	// 글 내용
	@Override
	public BoardVO getBoard(Integer bno) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".read", bno);
	}
	
	
	
	
}
