package com.gaon.persistence.board;

import java.util.List;

import com.gaon.domain.board.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(int bno);	 // 댓글 목록
	public void create(ReplyDTO rDto);		 // 댓글 등록
	public void delete(ReplyDTO rDto);	   	 // 댓글 삭제
	public void updateAdd(ReplyDTO rDto);	 // 댓글 카운트
	public void updateDelete(ReplyDTO rDto); // 댓글 카운트
}
