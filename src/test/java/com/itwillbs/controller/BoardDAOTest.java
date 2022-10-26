package com.itwillbs.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.domain.BoardVO;
import com.itwillbs.domain.PageVO;
import com.itwillbs.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class BoardDAOTest {
	

	private static final Logger log = LoggerFactory.getLogger(BoardDAOTest.class);
	
	//객체 주입//////////////////////////////////////////////////////////
	@Inject
	private BoardDAO dao; //의존관계 주입
	
	
	//객체주입 끝//////////////////////////////////////////////////////
	
	//테스트 동작하는지 확인
	//@Test
	public void 테스트확인() {
		log.info("테스트 가넝한@@@@@@@@@@@@@@@@@@@@@@");
	}
	
	
	//페이징 처리가 되는지 안되는지 테스트하기
	//@Test
	public void 페이징처리완료() {
		//DAOImpl - listPage()호출
		
		try {
			for(BoardVO vo : dao.listPage(1)) {
				log.info(vo.getBno()+" , " + vo.getTitle());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//log.info(dao.listPage(1)+"");
	}
	
	@Test
	public void pageVoObjectTest() {
		log.info("pageVoObjectTest()@@@@@@@@@@@@@@@@@@@@@@@@@@@ ");
		PageVO vo = new PageVO(); // 생성자로 설정함 1페이지 10개씩
		
		try {
			System.out.println(dao.listPage(vo)); //출력되는 것 확인가능
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
}
