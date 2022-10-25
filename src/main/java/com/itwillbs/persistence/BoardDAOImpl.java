package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	//글 조회수 1증가
	@Override
	public void updateReadCount(Integer bno) throws Exception {
		log.info("updateReadCount(Integer bno) 호출");
		
		//sql - mapper 쿼리구문 호출
		sqlSession.update(NAMESPACE+".updateReadCnt", bno);
	}


	//글 내용 수정하기
	@Override
	public Integer updateBoard(BoardVO vo) throws Exception {
		return sqlSession.update(NAMESPACE+".updateBoard", vo);
	}

	
	//글 삭제하기
	@Override
	public Integer deleteBoard(Integer bno) throws Exception {
		return sqlSession.delete(NAMESPACE+".deleteBoard", bno);
	}

	//글 리스트 페이지
	@Override
	public List<BoardVO> listPage(Integer page) throws Exception {
		log.info("listPage(Integer page) 호출");
		if(page <= 0) {
			//제일 최신은 0임
			page = 1;
		}
		
		int pageSize = 30;
		
		//1페이지 - 0, 2 - 10, 3 - 20,....
		page = (page - 1) * pageSize;
		
		//객체 만들어서 전달하기 - Map -> 이 방법밖에 없음
		Map<String, Object> pageObj = new HashMap<String, Object>();
		pageObj.put("page", page);
		pageObj.put("pageSize", pageSize);
		
		
		return sqlSession.selectList(NAMESPACE+".listPage2", pageObj);
	}


	
	
	
	
}
