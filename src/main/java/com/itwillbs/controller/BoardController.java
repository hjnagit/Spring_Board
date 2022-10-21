package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.BoardVO;
import com.itwillbs.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log 
			= LoggerFactory.getLogger(BoardController.class);
	
	//객체생성
	//서비스 객체 필요(의존적)
	@Inject
	private BoardService service;
	
	
	
	// http://localhost:8088/controller/board/test
//	@RequestMapping("/test")
//	public void test() {
//		log.info("@@@@@@@@@@@@@@@@@@@ 실행 완.");
//	}
	
	// http://localhost:8088/board/regist
	//글쓰기 - GET -> 글쓰기 폼페이지로 이동하기
	@RequestMapping(value="/regist", method = RequestMethod.GET)
	public void registerGET() throws Exception{
		log.info("registerGET() 호출");
		log.info("/board/regist (get) -> /board/regist.jsp");
	}
	 
	//글쓰기 - POST
	@RequestMapping(value="/regist", method = RequestMethod.POST)
	public String registerPOST(BoardVO vo, RedirectAttributes rttr) throws Exception{
		log.info("registerPOST() 호출");
		
		//여기서 하는 일
		// 1. 한글 처리 - 필터사용 - 생략
		// 2. 전달된 정보 저장 - BoardVO로 받기
		log.info(vo + "");
		
		// 3. 글쓰기 동작 - 서비스 
		service.boardWrite(vo);
		
		log.info(" 글쓰기 완료 !");
		
		//model.addAttribute("msg", "OK");
		//RedirectAttributes 객체 => redirect 이동 시 사용가능!!!
		rttr.addFlashAttribute("msg", "OK");
		
		// 4. 페이지 이동(리스트)
		
		//return "/board/success";
		
		// 페이지 이동(리스트) 화면, 주소 모두 변경
		//redirect:/board/listAll => 여기는 공백 사용금지
		//return "redirect:/board/listAll?msg=OK";
		return "redirect:/board/listAll";
	}
	
	
	// http://localhost:8088/board/listAll
	//게시판 리스트 -> get
	//주소창에 주소를 치고 엔터를 쳐서 움직이는 것은 모두 get방식이다
	@RequestMapping(value="/listAll", method = RequestMethod.GET)
	public void listAllGET(@ModelAttribute("msg") String msg, Model model, HttpSession session) throws Exception{
		log.info("listAllGET() 호출");
		
		// listAll페이지로 이동하는 방법은 2가지
		// 1. 글쓰기 -> 리스트 : 여기에서 정보를 전달하자 - 주소를 통해 listAll?msg=OK
		// 모델을 통행 주소의 값을 받아오기 @ModelAttribute("msg") String msg
		log.info("msg확인 : " + msg);
		// 이 값을 연결된 뷰에서도 확인해보기
		// 이 기능을 하는 모델 - Model model
		model.addAttribute("msg", msg);
		// 연결된 뷰에서 출력하기 ${msg}
		
		// 2. 리스트로 그냥 이동
		
		// 글 목록 데이터
		List<BoardVO> boardList = service.getBoardListAll();
		//데이터를 전달할 때 model을 사용한다!!
		model.addAttribute("boardList", boardList);
		
		//세션객체(HttpSession session) - isUpdate 정보 전달
		//HttpSession session -> 이 메서드가 실행 될 때 세션 정보는 가져와라! 라는 뜻
		//isUpdate라는 것을 false로 넘겨라
		session.setAttribute("isUpdate", false);
		
		
		log.info("/board/listAll (get) -> /board/listAll.jsp");
	}
	
	// http://localhost:8088/board/read?bno=12
	//글 본문 보기 - GET
	@RequestMapping(value="/read", method = RequestMethod.GET)
	public void readGET(HttpSession session, @RequestParam("bno") int bno, Model model /* @ModelAttribute("bno") int bno */) throws Exception{
		log.info("readGET() 호출");
		
		// 전달 정보 저장 - bno 방법 2개
		// 1. 주소줄의 정보 저장하기 - @ModelAttribute("bno") int bno
		// 이렇게 받아와서 사용가능
		
		// 2. 다른 방법으로 데이터 저장하기 - @RequestParam("bno") int bno
		// 이것도 정보 받아와서 잘 써진다
		// bno는 이 방법을 사용하자
		log.info(bno + " --------------bno");
		
		
		//조회수 제어하기---------------------------------------------
		//조회수 1올리고 그 다음 제어
		
		//이 값을 list(listAllGET)에서 넘겨주기 - 세션으로
		//boolean isUpdate = false;
		//세션으로 넘어온 값 확인
		log.info("############################isUpdate : " + session.getAttribute("isUpdate"));
		boolean isUpdate = (boolean)session.getAttribute("isUpdate");
		//isUpdate로 제어하기
		//isUpdate == false   ====    !isUpdate
		//단항 연산이 제일 빠르다 !isUpdate 이렇게 사용하도록 하자
		if(!isUpdate) {
			// 서비스 - 조회수 업데이트 updateReadCount(bno)
			service.updateReadCount(bno);
			log.info("조회수 1증가!!!띠용");
			//조회수 1올리고 그 다음에는 올라가지 않게
			//글을 새로고침해서 올라가지 않음
			session.setAttribute("isUpdate", true);
		}
		
		
		// 서비스로 데이터 꺼내오기
		BoardVO vo = service.getBoard(bno);
		model.addAttribute("vo", vo);
		log.info(vo + "");
		
		log.info("/board/read -> /board/read.jsp");
		
	}
	
	
	//글 수정하기 - GET(기존의 정보 조회 출력 + 수정할 정보 입력)
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("bno") int bno, Model model) throws Exception{
		
		//전달 정보 저장 - bno
		//@RequestParam("bno") int bno
		//@RequestParam("bno") 이것을 생략해도 된다
		//BoardVO vo 이렇게도 받으니까
		//하지만 명시를 해주는 것이 더 정확하니까 적든지 말든지
		
		//서비스 - 게시판글 정보를 가져오는 메서드
		//BoardVO vo = service.getBoard(bno);
		
		//연결된 뷰로 전달
		model.addAttribute("vo", service.getBoard(bno));
		
		//페이지 이동(출력) /board/modify.jsp
	}
	
	
	//글 수정하기 - POST(수정할 데이터 처리)
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO vo, RedirectAttributes rttr) throws Exception{
		
		//전달 정보 저장
		log.info("################################" + vo);
		
		//서비스 - 글 정보 수정
		int cnt = service.updateBoard(vo);
		
		if(cnt == 1) {
			//수정 성공 시 /listAll 페이지 이동
			rttr.addFlashAttribute("msgUpdate", "OK");
			return "redirect:/board/listAll";
		} else {
			//수정 실패 시
			//예외처리
			//new NullPointerException(); 시켜서 확인하는 것
			return "/board/modify?bno="+vo.getBno();
		}
		
	}
	
	
	//글 삭제하기
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception{
		//전달 정보 저장
		
		//서비스 - 글 삭제
		service.deleteBoard(bno);
		
		log.info("글 삭제 완료");
		rttr.addFlashAttribute("msgDelete", "OK");
		
		return "redirect:/board/listAll";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
