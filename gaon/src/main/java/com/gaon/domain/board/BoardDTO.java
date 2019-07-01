package com.gaon.domain.board;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardDTO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private int viewcnt;
	private int replycnt;
	private int goodcnt;
	private String id; // 작성자 아이디(tbl_member 테이블과 조인)
	private Date regdate;
	private int ref;		// 게시글 그룹
	private int re_step; 	// 그룹 내 정렬(출력) 순
	private int re_level;	// 답글 Level ex) RE: / RE:RE:
}