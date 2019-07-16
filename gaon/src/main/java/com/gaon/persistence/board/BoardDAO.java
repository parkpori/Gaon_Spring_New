package com.gaon.persistence.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.gaon.domain.board.BoardDTO;

public interface BoardDAO {
	// 게시글 등록
	public void createPlay(BoardDTO bDto);
	public void update(BoardDTO bDto);  // 게시글 수정
	public void delete(int bno); 		// 게시글 삭제
	public BoardDTO read(int bno);		// 상세게시글
	// 게시글 목록(페이지 나누기, 검색기능 포함)
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end);
	// 조회수 증가 처리
	public void increaseViewCnt(int bno, HttpSession session);
	// 레코드 갯수 계산
	public int countArticle(String search_option, String keyword);
	// bno, id가 같은 데이터가 있는지 체크
	public int goodCheck(int bno, String id);
	// 좋아요 감소
	public void goodDelete(int bno, String id);
	// 좋아요 증가
	public void goodAdd(int bno, String id);
	// 좋아요 개수 수정
	public void goodUpdate(int bno, int goodTotal);
	// 좋아요 총 개수 띄우기
	public int goodTotal(int bno, String id);
	// 답글을 달려고 하는 게시글의 re_step보다 큰 답글들을 re_step + 1
	public void updateStep(int ref, int re_step);
	// 답글 테이블에 등록하기
	public void answer(BoardDTO bDto);
	public void addAttach(String fullname); // 첨부파일 추가
}
