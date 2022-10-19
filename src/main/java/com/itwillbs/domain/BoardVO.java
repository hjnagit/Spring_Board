package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

// @Data : lombok 라이브러리를 사용해서
// VO객체 안에 set/get메서드 자동 구현, toString 자동 생성(오버라이딩)
// 많은 메서드를 자동으로 생성해줌

//@Setter -> 세터만
//@Getter -> 게터만
//@ToString -> toString만
@Data
public class BoardVO {
	private Integer bno; // 그냥 카운팅 하는 것은 인트 -> 근데 오토박싱가넝이라 걍 아무거나 써라
	private String title;
	private String content;
	private String writer;
	private Integer viewcnt; // 형변환이 있을 수 있는 것을 인티저
	private Timestamp regdate;

}
