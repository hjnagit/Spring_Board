package com.itwillbs.domain;

public class PageMakerVO {
	//페이징 처리에 관한 모든 동작 관리
	//개수 출력 + 하단 페이징 블럭
	
	private int totalCnt; // 총 글의 수
	private int startPage; //페이지 블럭 시작페이지
	private int endPage; // 페이지 블럭 끝 시작페이지
	private boolean prev; //이전
	private boolean next; //다음
	
	//private int page;
	//private int perPageNum;
	private PageVO vo; //페이지 번호, 페이지으 크기
	
	private int displayPageNum = 10; // 페이지 블럭의 크기
	
	
	public void setVo(PageVO vo) { //이미 생성된 객체 사용
		this.vo = vo;
	}
	
	public void setTotalCnt(int totalCnt) { 
		this.totalCnt = totalCnt; //DB에서 계산된 값으로 초기화
		calcData();
	}

	public void calcData() {
		System.out.println("페이징 처리 필요값 계산 하기");
		//끝페이지 계산하기
		endPage = (int)Math.ceil(vo.getPage()/(double)displayPageNum)*displayPageNum;
		//시작페이지
		startPage = (endPage - displayPageNum) + 1;
		
		//끝페이지 제어하기
		// 모든 글개수 / 페이지 사이즈 => 총 필요한 페이지 수 계산
		int tmpEndPage = (int)Math.ceil(totalCnt / (double)vo.getPerPageNum());
		
		if(endPage > tmpEndPage) {
			//실제 있는 페이지보다 많은 페이지면
			endPage = tmpEndPage;
		}
		
		//이전
		prev = (startPage == 1) ? false : true;
		//다음 
		next = (endPage * vo.getPerPageNum() >= totalCnt) ? false : true;
		
		System.out.println("페이징 처리 필요한 값 계산하기 완료");
	}//calcData()
	
	
	
	
	
	
	
	
	
	
	
	
	public int getTotalCnt() {
		return totalCnt;
	}


	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public PageVO getVo() {
		return vo;
	}



	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	@Override
	public String toString() {
		return "PageMakerVO [totalCnt=" + totalCnt + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", vo=" + vo + ", displayPageNum=" + displayPageNum + "]";
	}
	
	
}
