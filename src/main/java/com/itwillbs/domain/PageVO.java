package com.itwillbs.domain;

import lombok.Data;

//페이징 처리에 필요한 정보를 관리하는 객체
//원하는 개수만큼 보여주는 기능

public class PageVO {
	private int page; //페이지
	private int perPageNum; //페이지 크기
	
	public PageVO() {
		//페이징 처리의 정보가 없을 때 (기본값)
		this.page = 1;
		this.perPageNum = 10;
	}
	
	
	
	
	public synchronized void setPage(int page) {
		//0보다 작거나 같은 페이지 정보 호출
//		if(page <= 0) {
			//0보다 작은페이지는 없으니까
//			this.page = 1;
//		}else {
//			this.page = page;
//		}
		//이러한 로직을 더 권장
		//반복문의 횟수나 제어를 줄여야한다 - 성능에 비효율
		if(page <= 0) {
			//0보다 작은페이지는 없으니까
			this.page = 1;
			return;
		}
			
		this.page = page;
	}
	
	public synchronized void setPerPageNum(int perPageNum) {
		//한번에 보여줄 페이지수
		if(perPageNum < 10 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	
	
	
	public synchronized int getPage() {
		return page;
	}
	
	public synchronized int getPerPageNum() {
		return perPageNum;
	}
	
	//매퍼의 pageStart요소 사용하기 위해서
	//mapper의 # { pageStart } 해당 요소를 위한 메서드
	//이것을 주석처리하면 문제가 생김
	//=> pageStart의 게터가 없다고 오류!!
	public int getPageStart() {
		//페이지는 0부터 시작이니까 앞에서 처리해주었던 것을 여기서 처리
		return (this.page - 1) * perPageNum;
	}
	
	
	@Override
	public String toString() {
		return "PageVO [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
	
}
